// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "./ZipDAO.sol";

contract ZipMultiSigWallet is ReentrancyGuard {

    uint256 public WalletCatID;
    uint public immutable requiredConfirms = 3;

    IERC20 token;
    ZipDAO dao;


    /* ================= Voter Info  ================= */

    struct Voter {
        address adr;
        uint weight;
    }
    // VoterAddress => Voter
    mapping(address => Voter) voters;
    address[] voterKeys;


    /* ================= Proposal Info  ================= */

    struct Proposal {
        address to;
        uint256 amount;
        uint256 confirmations;
        uint256 proposalID;
        bool executed;
    }
    // proposalID => Proposal
    mapping(uint => Proposal) proposals;
    uint256[] proposalKeys;

    // proposalID => voter => bool
    mapping(uint => mapping(address => bool)) isConfirmed;


    /* ================= Events  ================= */

    event LogReceiveEth(address indexed sender, uint256 indexed amount);
    event ProposalSubmited(uint256 indexed ProposalID, address indexed to, uint256 indexed amount);
    event ProposalConfirmed(uint256 indexed ProposalID, address indexed voter);
    event ProposalExecuted(uint256 indexed ProposalID);


    /* ================= Modifiers  ================= */

    modifier onlyOwner{
        require(msg.sender == dao.owner(), "Only Owner");
        _;
    }

    modifier onlyVoter() {
        require(voters[msg.sender].weight != 0, "Only voter");
        _;
    }

    modifier proposalExists(uint _proposalID) {
        require(proposals[_proposalID].proposalID != 0, "proposal doesn't exist");
        _;
    }

    modifier notExecuted(uint _proposalID) {
        require(!proposals[_proposalID].executed, "proposal already executed");
        _;
    }

    modifier notConfirmed(uint _proposalID) {
        require(!isConfirmed[_proposalID][msg.sender], "you already confirmed this proposal");
        _;
    }

    constructor(
        uint256 _catID,
        address _zicTokenAdr, 
        address payable _daoAdr,
        address _voter1, 
        address _voter2
    ) {
        WalletCatID = _catID;

        token = IERC20(_zicTokenAdr);
        dao = ZipDAO(_daoAdr);

        addVoters(dao.owner(), 2);
        addVoters(_voter1, 1);
        addVoters(_voter2, 1);
    }

    // 1. Add the voters.
    function addVoters(address _voterAdr, uint256 _weight) internal {
        require(_voterAdr != address(0), "invalid address");
        require(voters[_voterAdr].weight == 0, "voter exists");
        require(_weight != 0, "weight should be >0");

        voters[_voterAdr] = Voter(_voterAdr, _weight);
        voterKeys.push(_voterAdr);
    }

    // 2. Owner claim relesed tokens from DAO. 
    function claimReleasedTokens(uint256 _amount) external onlyOwner nonReentrant {
        dao.withdrawTokens(_amount);
    }

    // 3. Owner submit the proposal.
    function submitProposal(address _to, uint _amount) external onlyOwner {

        require(_to != address(0), "invalid target address");
        require(_amount <= token.balanceOf(address(this)), "insufficient token amount");

        uint _newProposalID = getLastProposalID() + 1;

        proposals[_newProposalID] = 
            Proposal({
                to: _to,
                amount: _amount,
                confirmations: 0,
                proposalID: _newProposalID,
                executed: false
            });
        proposalKeys.push(_newProposalID);

        emit ProposalSubmited(_newProposalID, _to, _amount);
    }

    // 4. voters confirm the proposal
    function confirmProposal(uint _proposalID) public onlyVoter proposalExists(_proposalID) notExecuted(_proposalID) notConfirmed(_proposalID) {
        Proposal storage proposal = proposals[_proposalID];
        proposal.confirmations += voters[msg.sender].weight;
        isConfirmed[_proposalID][msg.sender] = true;
        
        emit ProposalConfirmed(_proposalID, msg.sender);
    }

    // 5. Owner execute the confirmed proposal
    function executeProposal(uint _proposalID) public onlyOwner nonReentrant proposalExists(_proposalID) notExecuted(_proposalID) {
        Proposal storage proposal = proposals[_proposalID];
        require(proposal.confirmations == requiredConfirms, "proposal is not confirmed");

        proposal.executed = true;
        token.transfer(proposal.to, proposal.amount);

        emit ProposalExecuted(_proposalID);
    }


    /* ================= get functions  ================= */

    function getLastProposalID() public view returns (uint lasProposalID) {
        uint submittedProposals = proposalKeys.length;
        if(submittedProposals == 0)
            lasProposalID = 0;
        else
            lasProposalID = proposalKeys[submittedProposals-1];
    }

    function getVoterAdr(uint _idx) public view returns(address) {
        return voterKeys[_idx];
    }

    function getVoter(address _voterAdr) public view returns (address, uint) {
        require(_voterAdr != address(0), "invalid voter address");

        return (voters[_voterAdr].adr, voters[_voterAdr].weight);
    }

    function getProposalID(uint _idx) public view returns(uint) {
        return proposalKeys[_idx];
    }

    function getProposal(uint proposalID) public view returns (
        address, uint, uint, uint, bool
    ) {
        require(proposalID <= proposalKeys.length, "invalid proposal_ID");

        Proposal storage p = proposals[proposalID];
        return (
            p.to, 
            p.amount, 
            p.confirmations,
            p.proposalID,
            p.executed
        );
    }

    function getConfirmed(uint _proposalID, address _voterAdr) public view returns(bool) {
        return isConfirmed[_proposalID][_voterAdr];
    }

    function getTokenBalance(address account) public view returns (uint) {
        return token.balanceOf(account);
    }


    /* ================= other functions  ================= */

    receive() external payable {
        emit LogReceiveEth(msg.sender, msg.value);
    }
}