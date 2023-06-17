
// File: @openzeppelin/contracts/utils/math/SafeMath.sol


// OpenZeppelin Contracts (last updated v4.6.0) (utils/math/SafeMath.sol)

pragma solidity ^0.8.0;

// CAUTION
// This version of SafeMath should only be used with Solidity 0.8 or later,
// because it relies on the compiler's built in overflow checks.

/**
 * @dev Wrappers over Solidity's arithmetic operations.
 *
 * NOTE: `SafeMath` is generally not needed starting with Solidity 0.8, since the compiler
 * now has built in overflow checking.
 */
library SafeMath {
    /**
     * @dev Returns the addition of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryAdd(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            uint256 c = a + b;
            if (c < a) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function trySub(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b > a) return (false, 0);
            return (true, a - b);
        }
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, with an overflow flag.
     *
     * _Available since v3.4._
     */
    function tryMul(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            // Gas optimization: this is cheaper than requiring 'a' not being zero, but the
            // benefit is lost if 'b' is also tested.
            // See: https://github.com/OpenZeppelin/openzeppelin-contracts/pull/522
            if (a == 0) return (true, 0);
            uint256 c = a * b;
            if (c / a != b) return (false, 0);
            return (true, c);
        }
    }

    /**
     * @dev Returns the division of two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryDiv(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a / b);
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers, with a division by zero flag.
     *
     * _Available since v3.4._
     */
    function tryMod(uint256 a, uint256 b) internal pure returns (bool, uint256) {
        unchecked {
            if (b == 0) return (false, 0);
            return (true, a % b);
        }
    }

    /**
     * @dev Returns the addition of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `+` operator.
     *
     * Requirements:
     *
     * - Addition cannot overflow.
     */
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
        return a + b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting on
     * overflow (when the result is negative).
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
        return a - b;
    }

    /**
     * @dev Returns the multiplication of two unsigned integers, reverting on
     * overflow.
     *
     * Counterpart to Solidity's `*` operator.
     *
     * Requirements:
     *
     * - Multiplication cannot overflow.
     */
    function mul(uint256 a, uint256 b) internal pure returns (uint256) {
        return a * b;
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator.
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(uint256 a, uint256 b) internal pure returns (uint256) {
        return a / b;
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting when dividing by zero.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(uint256 a, uint256 b) internal pure returns (uint256) {
        return a % b;
    }

    /**
     * @dev Returns the subtraction of two unsigned integers, reverting with custom message on
     * overflow (when the result is negative).
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {trySub}.
     *
     * Counterpart to Solidity's `-` operator.
     *
     * Requirements:
     *
     * - Subtraction cannot overflow.
     */
    function sub(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b <= a, errorMessage);
            return a - b;
        }
    }

    /**
     * @dev Returns the integer division of two unsigned integers, reverting with custom message on
     * division by zero. The result is rounded towards zero.
     *
     * Counterpart to Solidity's `/` operator. Note: this function uses a
     * `revert` opcode (which leaves remaining gas untouched) while Solidity
     * uses an invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function div(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a / b;
        }
    }

    /**
     * @dev Returns the remainder of dividing two unsigned integers. (unsigned integer modulo),
     * reverting with custom message when dividing by zero.
     *
     * CAUTION: This function is deprecated because it requires allocating memory for the error
     * message unnecessarily. For custom revert reasons use {tryMod}.
     *
     * Counterpart to Solidity's `%` operator. This function uses a `revert`
     * opcode (which leaves remaining gas untouched) while Solidity uses an
     * invalid opcode to revert (consuming all remaining gas).
     *
     * Requirements:
     *
     * - The divisor cannot be zero.
     */
    function mod(
        uint256 a,
        uint256 b,
        string memory errorMessage
    ) internal pure returns (uint256) {
        unchecked {
            require(b > 0, errorMessage);
            return a % b;
        }
    }
}

// File: @openzeppelin/contracts/utils/Context.sol


// OpenZeppelin Contracts v4.4.1 (utils/Context.sol)

pragma solidity ^0.8.0;

/**
 * @dev Provides information about the current execution context, including the
 * sender of the transaction and its data. While these are generally available
 * via msg.sender and msg.data, they should not be accessed in such a direct
 * manner, since when dealing with meta-transactions the account sending and
 * paying for execution may not be the actual sender (as far as an application
 * is concerned).
 *
 * This contract is only required for intermediate, library-like contracts.
 */
abstract contract Context {
    function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }
}

// File: @openzeppelin/contracts/access/Ownable.sol


// OpenZeppelin Contracts (last updated v4.7.0) (access/Ownable.sol)

pragma solidity ^0.8.0;


/**
 * @dev Contract module which provides a basic access control mechanism, where
 * there is an account (an owner) that can be granted exclusive access to
 * specific functions.
 *
 * By default, the owner account will be the one that deploys the contract. This
 * can later be changed with {transferOwnership}.
 *
 * This module is used through inheritance. It will make available the modifier
 * `onlyOwner`, which can be applied to your functions to restrict their use to
 * the owner.
 */
abstract contract Ownable is Context {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    /**
     * @dev Initializes the contract setting the deployer as the initial owner.
     */
    constructor() {
        _transferOwnership(_msgSender());
    }

    /**
     * @dev Throws if called by any account other than the owner.
     */
    modifier onlyOwner() {
        _checkOwner();
        _;
    }

    /**
     * @dev Returns the address of the current owner.
     */
    function owner() public view virtual returns (address) {
        return _owner;
    }

    /**
     * @dev Throws if the sender is not the owner.
     */
    function _checkOwner() internal view virtual {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
    }

    /**
     * @dev Leaves the contract without owner. It will not be possible to call
     * `onlyOwner` functions anymore. Can only be called by the current owner.
     *
     * NOTE: Renouncing ownership will leave the contract without an owner,
     * thereby removing any functionality that is only available to the owner.
     */
    function renounceOwnership() public virtual onlyOwner {
        _transferOwnership(address(0));
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Can only be called by the current owner.
     */
    function transferOwnership(address newOwner) public virtual onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    /**
     * @dev Transfers ownership of the contract to a new account (`newOwner`).
     * Internal function without access restriction.
     */
    function _transferOwnership(address newOwner) internal virtual {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }
}

// File: @openzeppelin/contracts/security/ReentrancyGuard.sol


// OpenZeppelin Contracts (last updated v4.8.0) (security/ReentrancyGuard.sol)

pragma solidity ^0.8.0;

/**
 * @dev Contract module that helps prevent reentrant calls to a function.
 *
 * Inheriting from `ReentrancyGuard` will make the {nonReentrant} modifier
 * available, which can be applied to functions to make sure there are no nested
 * (reentrant) calls to them.
 *
 * Note that because there is a single `nonReentrant` guard, functions marked as
 * `nonReentrant` may not call one another. This can be worked around by making
 * those functions `private`, and then adding `external` `nonReentrant` entry
 * points to them.
 *
 * TIP: If you would like to learn more about reentrancy and alternative ways
 * to protect against it, check out our blog post
 * https://blog.openzeppelin.com/reentrancy-after-istanbul/[Reentrancy After Istanbul].
 */
abstract contract ReentrancyGuard {
    // Booleans are more expensive than uint256 or any type that takes up a full
    // word because each write operation emits an extra SLOAD to first read the
    // slot's contents, replace the bits taken up by the boolean, and then write
    // back. This is the compiler's defense against contract upgrades and
    // pointer aliasing, and it cannot be disabled.

    // The values being non-zero value makes deployment a bit more expensive,
    // but in exchange the refund on every call to nonReentrant will be lower in
    // amount. Since refunds are capped to a percentage of the total
    // transaction's gas, it is best to keep them low in cases like this one, to
    // increase the likelihood of the full refund coming into effect.
    uint256 private constant _NOT_ENTERED = 1;
    uint256 private constant _ENTERED = 2;

    uint256 private _status;

    constructor() {
        _status = _NOT_ENTERED;
    }

    /**
     * @dev Prevents a contract from calling itself, directly or indirectly.
     * Calling a `nonReentrant` function from another `nonReentrant`
     * function is not supported. It is possible to prevent this from happening
     * by making the `nonReentrant` function external, and making it call a
     * `private` function that does the actual work.
     */
    modifier nonReentrant() {
        _nonReentrantBefore();
        _;
        _nonReentrantAfter();
    }

    function _nonReentrantBefore() private {
        // On the first call to nonReentrant, _status will be _NOT_ENTERED
        require(_status != _ENTERED, "ReentrancyGuard: reentrant call");

        // Any calls to nonReentrant after this point will fail
        _status = _ENTERED;
    }

    function _nonReentrantAfter() private {
        // By storing the original value once again, a refund is triggered (see
        // https://eips.ethereum.org/EIPS/eip-2200)
        _status = _NOT_ENTERED;
    }
}

// File: @openzeppelin/contracts/token/ERC20/IERC20.sol


// OpenZeppelin Contracts (last updated v4.6.0) (token/ERC20/IERC20.sol)

pragma solidity ^0.8.0;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IERC20 {
    /**
     * @dev Emitted when `value` tokens are moved from one account (`from`) to
     * another (`to`).
     *
     * Note that `value` may be zero.
     */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /**
     * @dev Emitted when the allowance of a `spender` for an `owner` is set by
     * a call to {approve}. `value` is the new allowance.
     */
    event Approval(address indexed owner, address indexed spender, uint256 value);

    /**
     * @dev Returns the amount of tokens in existence.
     */
    function totalSupply() external view returns (uint256);

    /**
     * @dev Returns the amount of tokens owned by `account`.
     */
    function balanceOf(address account) external view returns (uint256);

    /**
     * @dev Moves `amount` tokens from the caller's account to `to`.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transfer(address to, uint256 amount) external returns (bool);

    /**
     * @dev Returns the remaining number of tokens that `spender` will be
     * allowed to spend on behalf of `owner` through {transferFrom}. This is
     * zero by default.
     *
     * This value changes when {approve} or {transferFrom} are called.
     */
    function allowance(address owner, address spender) external view returns (uint256);

    /**
     * @dev Sets `amount` as the allowance of `spender` over the caller's tokens.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * IMPORTANT: Beware that changing an allowance with this method brings the risk
     * that someone may use both the old and the new allowance by unfortunate
     * transaction ordering. One possible solution to mitigate this race
     * condition is to first reduce the spender's allowance to 0 and set the
     * desired value afterwards:
     * https://github.com/ethereum/EIPs/issues/20#issuecomment-263524729
     *
     * Emits an {Approval} event.
     */
    function approve(address spender, uint256 amount) external returns (bool);

    /**
     * @dev Moves `amount` tokens from `from` to `to` using the
     * allowance mechanism. `amount` is then deducted from the caller's
     * allowance.
     *
     * Returns a boolean value indicating whether the operation succeeded.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) external returns (bool);
}

// File: contracts/ZipDAO.sol


pragma solidity 0.8.17;


contract ZipDAO is Ownable, ReentrancyGuard {

    using SafeMath for uint256;

    /* ================= Token info  ================= */

    IERC20 zic;
    uint256 public zicTotalSupply;


    /* ================= Category info  ================= */

    uint8[] catIds;

    struct Category {
        string title;
        uint256 shareOfTotalSup; // Multiplied by 100  ex: 1.5 --> 150
    }

    // CategoryID => Category Struct
    mapping(uint256 => Category) categories;


    /* ================= Release info  ================= */

    uint256 releaseStep = 30 days;  // seconds, minutes, hours, days, weeks, years
    uint256 scheduleStartTime;

    // CategoryID => releaseSchedules Array
    mapping(uint256 => uint256[24]) releaseSchedules;


    /* ================= Beneficiary info  ================= */

    address[] beneficiaryAdrs;

    struct Beneficiary {
        uint256 catId;
        uint256 shareOfCategory;    // Multiplied by 100  ex: 1.5 --> 150
        uint256 withdrawn;          // How many tokens, this Beneficiary has took out of account, until now.
    }

    // BeneficiaryAddress => Beneficiary Struct
    mapping(address => Beneficiary) beneficiaries;


    /* ================= Vote info  ================= */

    address[] voterAdrs;
    
    struct Voter {
        address voterAdr;
        uint256 voterWeight;
        bool isVoter;
    }

    // VoterAddress => Voter Struct
    mapping(address => Voter) voters;

    enum Vote { Pending, Yes, No } 

    // votes[Voter][Beneficiary][Slot] -> Vote
    mapping(address => mapping(address => mapping (uint256 => Vote))) votes;
    
    // slotConfirms[beneficiaryAdr] -> Confirmations[24]
    // slotConfirms includes the aggregate votes based on the weight of voters
    // if(slotConfirms[beneficiary] > 50) --> beneficiary can withdraw released tokens of i'th slot
    mapping(address => uint256[24]) slotConfirms;


    /* ================= Modifiers  ================= */

    modifier onlyBeneficiaries() {
        require(beneficiaries[msg.sender].catId != 0, "You are not a beneficiary.");
        _;
    }

    modifier onlyVoter() {
        require(voters[msg.sender].isVoter, "You are not a Voter");
        _;
    }


    /* ================= Events  ================= */

    event LogReceiveEth(address indexed sender, uint256 indexed amount);
    event LogWithdrawEther(address indexed owner, uint256 indexed amount);
    event LogWithdrawToken(address indexed beneficiaryAdr, uint256 indexed amount);
    event LogConfirm(address indexed voter, address indexed beneficiary, uint256 slot, Vote v);


    /* ================= onlyOwner functions    ================= */

    function addCategory(uint8 _catId, string memory _catTitle, uint16 _share) external onlyOwner {
        require(_catId > 0, "Category ID has to be greater than zero");
        require(_share > 0, "Share has to be greater than zero");
        
        require(keccak256(abi.encode(_catTitle)) != keccak256(abi.encode("")), "Category title has to be nonempty");

        catIds.push(_catId);
        categories[_catId] = Category({title: _catTitle, shareOfTotalSup: _share});
    }

    function addSchedule(uint8 _catId, uint8[24] memory _schedule) external onlyOwner {
        require(_catId > 0, "Category ID has to be greater than zero");
        releaseSchedules[_catId] = _schedule;
    }

    function addBeneficiary(uint8 _catId, address _beneficiary, uint16 _shareOfCategory) external onlyOwner {
        require(_catId > 0, "Category ID has to be greater than zero");
        require(_shareOfCategory > 0, "Share amount has to be greater than zero");
        require(_beneficiary != address(0), "The Beneficiary address cannot be zero");
        require(beneficiaries[_beneficiary].catId == 0, "The beneficiary has added already");

        beneficiaryAdrs.push(_beneficiary);
        beneficiaries[_beneficiary] = Beneficiary({catId: _catId, shareOfCategory: _shareOfCategory, withdrawn: 0});
    }

    function addVoter(address _newVoter, uint256 _voterWeight) external onlyOwner {
        require(_newVoter != address(0), "The voter address cannot be zero");
        require(_voterWeight != 0, "The vote weight cannot be zero");

        voterAdrs.push(_newVoter);
        voters[_newVoter] = Voter({
            voterAdr: _newVoter, 
            voterWeight: _voterWeight,
            isVoter: true
        });
    }

    function start(address _zicTokenAdr) external onlyOwner {
        require(_zicTokenAdr != address(0), "The token's address cannot be zero");

        zic = IERC20(_zicTokenAdr);
        zicTotalSupply = zic.totalSupply();

        zic.transferFrom(msg.sender, address(this), zic.balanceOf(msg.sender));
        scheduleStartTime = block.timestamp;
    }

    // Allows the contract owner to withdraw the ETH from the contract
    function withdrawEthers() external onlyOwner {
        payable(msg.sender).transfer(address(this).balance);
        emit LogWithdrawEther(msg.sender, address(this).balance);
    }


    /* ================= onlyVoter functions    ================= */

    // voters can vote for a beneficiary to be able to withdraw released tokens
    function confirm(address _beneficiary, uint256 _slot, uint256 _vote) external onlyVoter {

        Vote v = Vote(_vote);

        require(_beneficiary != address(0), "The Beneficiary address cannot be zero");

        require(_slot >= 0 && _slot < 24, "The selected slot of locktime schedule is not valid");

        // A release-slot can be confirmed only if 
        // the block timestamp reached just the end of that or left it behind.
        require(_slot < getCurrentSlot(),"It isn't reached the time to confirm this slot");

        require(v == Vote.Yes || v == Vote.No, "The proposed vote is not valid");

        require(votes[msg.sender][_beneficiary][_slot] == Vote.Pending, 
        "Voter already have submitted a vote for this release slot of the beneficiary");

        votes[msg.sender][_beneficiary][_slot] = v;

        if (v == Vote.Yes) {
            slotConfirms[_beneficiary][_slot] += voters[msg.sender].voterWeight;
        }

        emit LogConfirm(msg.sender, _beneficiary, _slot, v);
    }


    /* ================= External functions    ================= */

    // Beneficiary call this function to withdraw released tokens.
    function withdrawTokens(uint256 _amount) external onlyBeneficiaries nonReentrant returns (bool)  {

        require(_amount > 0, "amount has to be grater than zero");

        address beneficiaryAdr = msg.sender;

        // get amount of tokens that can be withdraw
        (,,,,uint256 canwithdraw) = getAvailableTokens(beneficiaryAdr);

        require(canwithdraw >= _amount, "You have not enough released and confirmed tokens");

        // Update the beneficiary information
        uint256 preWithdrawn = beneficiaries[beneficiaryAdr].withdrawn;
        uint256 curWithdrawn = preWithdrawn.add(_amount);
        beneficiaries[beneficiaryAdr].withdrawn = curWithdrawn;

        // Transfer released tokens to the beneficiary
        zic.transfer(beneficiaryAdr, _amount);

        emit LogWithdrawToken(beneficiaryAdr, _amount);
        return true;
    }


    /* ================= get functions    ================= */

    function getCatID(uint _idx) public view returns(uint8) {
        return catIds[_idx];
    }

    function getCategory(uint _catID) public view returns(string memory, uint256) {
        Category storage cat = categories[_catID];
        return (cat.title, cat.shareOfTotalSup);
    }

    function getBeneficiaryAdr(uint _idx) public view returns(address) {
        return beneficiaryAdrs[_idx];
    }

    function getBeneficiary(address _beneficiaryAdr) public view returns(uint256, uint256, uint256) {
        Beneficiary storage ben = beneficiaries[_beneficiaryAdr];
        return (ben.catId, ben.shareOfCategory, ben.withdrawn);
    }

    function geVoterAdr(uint _idx) public view returns(address) {
        return voterAdrs[_idx];
    }

    function getVoter(address _voterAdr) public view returns(address, uint256, bool) {
        Voter storage voter = voters[_voterAdr];
        return (voter.voterAdr, voter.voterWeight, voter.isVoter);
    }

    function getVote(address _voterAdr, address _beneficiaryAdr, uint256 _slot) public view returns(Vote) {
        return votes[_voterAdr][_beneficiaryAdr][_slot];
    }

    function getSlotConfirms(address _beneficiaryAdr) public view returns(uint256[24] memory) {
        return slotConfirms[_beneficiaryAdr];
    }

    function getDaoStartTime() public view returns (uint256) {
        return scheduleStartTime;
    }

    function getReleaseStep() public view returns (uint256) {
        return releaseStep;
    }

    function getReleaseSchedules(uint256 _releaseIdx) public view returns(uint256[24] memory) {
        return releaseSchedules[_releaseIdx];
    }

    function getCurrentSlot() public view returns (uint256) {
        require(scheduleStartTime != 0, "Scheduling has not started yet");
        return (block.timestamp.sub(scheduleStartTime)).div(releaseStep);
    }

    // Get the amount of tokens that beneficiary can withdraw now, base on release schedule of the category.

    function getAvailableTokens(address _beneficiary) public view returns ( 
        uint256 beneficiaryTotalTokens,
        uint256 beneficiaryReleasedTokens,
        uint256 confirmedTokens,
        uint256 withdrawn,
        uint256 canwithdraw
    ) {
        
        require(scheduleStartTime != 0, "Scheduling has not started yet");
        require(_beneficiary != address(0), "The Beneficiary address cannot be zero");

        uint256 catId = beneficiaries[_beneficiary].catId; 
        uint256 categoryShareOfTotalSup = categories[catId].shareOfTotalSup;
        uint256 beneficiaryShareOfCategory = beneficiaries[_beneficiary].shareOfCategory; 
        uint256 categoryTotalTokens = (categoryShareOfTotalSup.mul(zicTotalSupply)).div(10000);
        beneficiaryTotalTokens = (beneficiaryShareOfCategory.mul(categoryTotalTokens)).div(10000);

        // get the current slot
        uint256 curSlot  = getCurrentSlot() > 24 ? 24 : getCurrentSlot();

        for(uint i; i < curSlot; i++) {

            uint256 slotReleasedTokens = (releaseSchedules[catId][i].mul(beneficiaryTotalTokens)).div(100);

            // Released tokens
            beneficiaryReleasedTokens = beneficiaryReleasedTokens.add(slotReleasedTokens);

            // user can withdraw just tokens that released and confirmed
            if(slotConfirms[_beneficiary][i] > 50) {
                confirmedTokens = confirmedTokens.add(slotReleasedTokens);
            }
        }

        // How many tokens, this Beneficiary has took out of account, until now.
        withdrawn = beneficiaries[_beneficiary].withdrawn;
        
        // How many tokens, this Beneficiary can withdraw
        if(catId == 1 || catId == 2) {
            // Core-Team and Advisors
            canwithdraw = confirmedTokens.sub(withdrawn);
        }
        else {
            // Other Beneficiaries
            canwithdraw = beneficiaryReleasedTokens.sub(withdrawn);
        }
    }


    /* ================= other functions  ================= */

    // To accept ETHs transferrd by low-level-calls
    receive() external payable {
        emit LogReceiveEth(msg.sender, msg.value);
    }

    fallback() external payable {
        emit LogReceiveEth(msg.sender, msg.value);
    }
}


/*
    1. Core Team               - EOA : tokens can be claimed and withdrawn by EOA                   - after confirmation inside DAO
    2. Advisors                - EOA : tokens can be claimed and withdrawn by EOA                   - after confirmation inside DAO

    3. Staking Reward          - CA  : tokens can be claimed and withdrawn by `Staking`             - NO confirmation inside DAO - Claim will be developed inside Staking

    4. Treasury                - EOA : tokens can be claimed and withdrawn by EOA                   - NO confirmation inside DAO

    5. Marketing & Development - CA  : tokens can be claimed and withdrawn with MultiSigWallet      - NO confirmation inside DAO - Claim and Confirmation will be developed inside MultiSigWallet
    6. Play to Earn            - CA  : tokens can be claimed and withdrawn with MultiSigWallet      - NO confirmation inside DAO - Claim and Confirmation will be developed inside MultiSigWallet
    7. Ecosystem Fund          - CA  : tokens can be claimed and withdrawn with MultiSigWallet      - NO confirmation inside DAO - Claim and Confirmation will be developed inside MultiSigWallet

    8. Seed sale               - EOA : owner can send tokens from DAO to investor                   - NO confirmation inside DAO - TomeLock  will be developed inside token
    9. Private sale            - EOA : owner can send tokens from DAO to investor                   - NO confirmation inside DAO - TomeLock  will be developed inside token
    10. Presale                - EOA : owner can send tokens from DAO to investor                   - NO confirmation inside DAO - TomeLock  will be developed inside token

    11. Public sale            - EOA : owner can send tokens from DAO to Exchange Address (like gate)
*/
// File: contracts/ZipStaking.sol


pragma solidity 0.8.17;

contract ZipStaking is ReentrancyGuard {

    ZipDAO dao;
    uint256 timeUnits = 1 days; // minutes;


    /* ================= Investor Info  ================= */

    struct Investor {
        uint256 depositTimestamp;   // The time that the deposit happened
        uint256 depositBalance;     // How much Token is deposited into the contract
        uint256 pendingReward;      // Remained Reward Tokens that user can withdraw
        uint256 withdrawnReward;    // How many rewards tokens, this Investor has accrued of contract, until now.
    }


    /* ================= Plan Info  ================= */

    uint256 public latestPlanId;
    uint256[] public planIds;

    struct Plan {
        uint256 stakingStartTime;    // timestamp
        uint256 stakingDuration;     // seconds
        uint256 stakingDeadline;     // timestamp

        uint256 rewardRate;          // 10 ~ 10%
        uint256 rewardRatePerToken;  // interest payout rate for each deposited Token in every second     

        uint256 totalPendingRewards; // total rewards that should be paid to investors
        uint256 totalPaidRewards;    // total rewards that has been paid to investors, until now
        uint256 totalDeposits;       // total tokens that investors has been deposited, until now

        uint256 maxReward;           // maxReward = maxDeposit * rewardRate / 100
        uint256 maxDeposit;          // maxDeposit = maxReward * 100 / rewardRate; 

        IERC20 stakingToken;
        IERC20 rewardToken;

        // Investor Addresses
        address[] investorAdrs;

        // Investor Address => Investor Struct
        mapping(address => Investor) investors;
    }

    mapping(uint256 => Plan) plans;


    /* ================= Events  ================= */

    event LogDepositToken(uint256 indexed planId, address indexed investor, uint256 amount); 
    event LogWithdrawToken(uint256 indexed planId, address indexed investor, uint256 amount);
    event LogWithdrawReward(uint256 indexed planId, address indexed investor, uint256 amount);
    event LogReceiveEth(address indexed sender, uint256 amount);
    event LogWithdrawEther(address indexed owner, uint256 amount);
    event LogNewPlanStarted(uint256 indexed planId, uint256 stakingDays, uint256 rewardRate);
    event LogGetRewardTokensFromDAO(uint256 indexed planId, uint256 amount);
    event LogAddRewardTokens(address indexed owner, uint256 planId, uint256 amount);
    event LogWithdrawRestReward(uint256 indexed planId, address indexed owner, address indexed treasuryAdr, uint256 amount);


    constructor(address payable _daoAdr) {
        require(_daoAdr != address(0), "The dao address cannot be zero");
        dao = ZipDAO(_daoAdr);
    }


    /* ================= Modifiers  ================= */

    modifier onlyOwner {
        require(msg.sender == getOwner(), "Only Owner");
        _;
    }

    modifier onlyInvestor() {
        require(plans[latestPlanId].investors[msg.sender].depositTimestamp != 0, "You are not an Investor");
        _;
    }

    modifier stakingDeadlineReached(bool _required) {
        uint256 timeRemaining = getStakingTimeLeft();
        if(_required) {
            require(timeRemaining == 0, "Staking Deadline is not reached yet");
        } else {
            require(timeRemaining > 0, "Staking Deadline has been reached");
        }
        _;
    }

    modifier hasDeposit(bool _required) {
        uint depositTimestamp = plans[latestPlanId].investors[msg.sender].depositTimestamp;
        if(_required) {
            require(depositTimestamp != 0, "You have not any deposit");
        } else {
            require(depositTimestamp == 0, "You have a deposit");
        }
        _;
    }

    modifier planExists(uint256 _planId) {
        require(_planId > 0 && _planId <= latestPlanId, "Plan does not exist");
        _;
    }

    modifier canStartNewPlan() {
        require(block.timestamp > plans[latestPlanId].stakingDeadline, "new Plan have to start after latest plan");
        _;
    }


    /* ================= Owner functions   ================= */

    function startNewPlan(
        uint256 _rewardRate, 
        uint256 _stakingDays,
        uint256 _maxReward,
        address _stakingToken, 
        address _rewardToken
    ) external  onlyOwner canStartNewPlan {
        latestPlanId++;
        planIds.push(latestPlanId);

        setContractAddresses(_stakingToken, _rewardToken);
        setStakingTimes(_stakingDays);
        setRewardAndDepositMaxValues(_maxReward, _rewardRate);
        setRewardRatePerToken();
        claimRewardTokensFromDAO();

        emit LogNewPlanStarted(latestPlanId, _stakingDays, _rewardRate);
    }

    function setContractAddresses(address _stakingToken, address _rewardToken) internal {
        require(_stakingToken != address(0), "The stake token's address cannot be zero");
        require(_rewardToken != address(0), "The reward token's address cannot be zero");

        Plan storage plan = plans[latestPlanId];
        plan.stakingToken = IERC20(_stakingToken);
        plan.rewardToken = IERC20(_rewardToken);
    }

    // get _stakingDuration in seconds and set stakingStartTime and stakingDeadline as timestamp
    function setStakingTimes(uint _stakingDays) internal {
        Plan storage plan = plans[latestPlanId];
        plan.stakingStartTime = block.timestamp;            // timestamp
        plan.stakingDuration = _stakingDays * timeUnits;    // seconds
        plan.stakingDeadline = plan.stakingStartTime + plan.stakingDuration; // timestamp
    }

    function setRewardAndDepositMaxValues(uint _maxReward, uint _rewardRate) internal {
        Plan storage plan = plans[latestPlanId];
        plan.rewardRate = _rewardRate;     // reward Rate for staking duration - ex. 10 ~ 10%
        plan.maxReward = _maxReward;
        plan.maxDeposit = plan.maxReward * 100 / plan.rewardRate;
    }

    function setRewardRatePerToken() internal {
        Plan storage plan = plans[latestPlanId];
        plan.rewardRatePerToken = (plan.rewardRate * 1e18) / (plan.stakingDuration * 100);
    }

    function updateRewardAndDepositMaxValues(uint _AddRewardAmount) internal {
        Plan storage plan = plans[latestPlanId];
        plan.maxReward += _AddRewardAmount;
        plan.maxDeposit = plan.maxReward * 100 / plan.rewardRate;
    }

    // Staking Contract get Reward-Tokens from DAO.
    // First, be sure that your required amount has been released for staking.
    function claimRewardTokensFromDAO() internal nonReentrant {
        Plan storage plan = plans[latestPlanId];
        dao.withdrawTokens(plan.maxReward);

        emit LogGetRewardTokensFromDAO(latestPlanId, plan.maxReward);
    }

    // Treasury-Owner can add more Reward tokens.
    function addRewardTokens(uint256 _amount) external stakingDeadlineReached(false) nonReentrant {
        Plan storage plan = plans[latestPlanId];

        uint allowance = plan.rewardToken.allowance(msg.sender, address(this));
        require(allowance >= _amount , "Staking insufficient allowance.");

        updateRewardAndDepositMaxValues(_amount);
        plan.rewardToken.transferFrom(msg.sender, address(this), _amount);

        emit LogAddRewardTokens(msg.sender, latestPlanId, _amount);
    }

    // Allows the contract owner (deployer) to withdraw the ETH from the contract
    function withdrawRestEthers(address _target) external onlyOwner nonReentrant {
        uint EthAmount = address(this).balance;
        require(EthAmount > 0, "You have no Eth balance to withdraw!");

        // Transfer ETH via call
        (bool sent,) = _target.call{value: EthAmount}("");
        require(sent, "withdrawal failed.");

        emit LogWithdrawEther(msg.sender, address(this).balance);
    }

    // Owner can send remained RewardTokens to Treasury-Owner from plans that its dedline reached.
    function withdrawRestRewardTokens(uint _planId, address _treasuryAdr) external onlyOwner nonReentrant {
        require(block.timestamp > plans[_planId].stakingDeadline, "Staking plan doesn't reached deadline!");

        uint canWithdraw = getRestRewardTokensAmount(_planId);
        require(canWithdraw > 0, "There are not any remained Reward Tokens!");

        Plan storage plan = plans[_planId];
        plan.rewardToken.transfer(_treasuryAdr, canWithdraw);

        emit LogWithdrawRestReward(_planId, msg.sender, _treasuryAdr, canWithdraw);
    }


    /* ================= Investor functions  ================= */

    function deposit(uint256 _amount) external stakingDeadlineReached(false) hasDeposit(false) nonReentrant {
        Plan storage plan = plans[latestPlanId];

        // control how many tokens new user can deposit, With regards to the reward Token's Limitation.
        uint depositLimitaion = plan.maxDeposit - plan.totalDeposits;
        require(_amount <= depositLimitaion, "deposit amount is greater than limitaion");

        uint allowance = plan.stakingToken.allowance(msg.sender, address(this));
        require(allowance >= _amount , "Staking insufficient allowance.");

        uint256 userTotalReward = getUserTotalReward(_amount);

        plan.totalPendingRewards += userTotalReward;
        plan.totalDeposits += _amount;

        plan.investors[msg.sender] = Investor({
            depositTimestamp: block.timestamp, 
            depositBalance: _amount, 
            pendingReward: userTotalReward,
            withdrawnReward: 0
        });
        plan.investorAdrs.push(msg.sender);

        plan.stakingToken.transferFrom(msg.sender, address(this), _amount);

        emit LogDepositToken(latestPlanId, msg.sender, _amount); 
    }

    // Anytime, user can get their accrued reward tokens from last plan 
    function getReward() public onlyInvestor nonReentrant {
        uint256 canWithdraw = getUserCanWithdrawRewards(msg.sender);
        require(canWithdraw > 0, "You have withdraw all earned reward tokens already!");

        Plan storage plan = plans[latestPlanId];
        address investor = msg.sender;

        plan.totalPendingRewards -= canWithdraw;
        plan.totalPaidRewards += canWithdraw;

        plan.investors[investor].pendingReward -= canWithdraw;
        plan.investors[investor].withdrawnReward += canWithdraw;

        plan.rewardToken.transfer(investor, canWithdraw);

        emit LogWithdrawReward(latestPlanId, investor, canWithdraw);
    }

    // After deadline, user can Withdraw their principle balance from the plan
    function withdrawPrincipalBalance(uint _planId) public planExists(_planId) onlyInvestor nonReentrant {
        address investor = msg.sender;
        Plan storage plan = plans[_planId];
        uint principleBalance = plan.investors[investor].depositBalance;

        require(block.timestamp > plan.stakingDeadline, "Staking plan doesn't reach deadline!");
        require(principleBalance != 0, "Principle Balances is Zero.");

        plan.investors[investor].depositBalance = 0;

        plan.stakingToken.transfer(investor, principleBalance);

        emit LogWithdrawToken(_planId, investor, principleBalance);
    }

    // After deadline, user can Withdraw their reward tokens from the plan
    function withdrawReward(uint _planId) public planExists(_planId) onlyInvestor nonReentrant {
        address investor = msg.sender;
        Plan storage plan = plans[_planId];
        uint pendingReward = plan.investors[investor].pendingReward;

        require(block.timestamp > plan.stakingDeadline, "Staking plan doesn't reach deadline!");
        require(pendingReward != 0, "Pending Reward is Zero.");

        plan.totalPendingRewards -= pendingReward;
        plan.totalPaidRewards += pendingReward;

        plan.investors[investor].pendingReward -= pendingReward;
        plan.investors[investor].withdrawnReward += pendingReward;

        plan.rewardToken.transfer(investor, pendingReward);

        emit LogWithdrawReward(_planId, investor, pendingReward);
    }

    // exit from closed plan
    function exitPlan(uint _planId) external planExists(_planId) onlyInvestor {
        withdrawPrincipalBalance(_planId);
        withdrawReward(_planId);
    }


    /* ================= get functions ================= */

    function getStakingTimeLeft() public view returns (uint256) {
        Plan storage plan = plans[latestPlanId];
        if(block.timestamp >= plan.stakingDeadline) {
            return (0);
        } else {
            return (plan.stakingDeadline - block.timestamp);
        }
    }

    function getUserDepositBalance(address _investor) public view returns (uint256) {
        Plan storage plan = plans[latestPlanId];
        return plan.investors[_investor].depositBalance;
    }

    function getUserElapsedDepositTime(address _investor) public view returns (uint256) {
        Plan storage plan = plans[latestPlanId];
        return (block.timestamp - plan.investors[_investor].depositTimestamp);
    }

    function getUserWithdrawnReward(address _investor) public view returns (uint256) {
        Plan storage plan = plans[latestPlanId];
        return plan.investors[_investor].withdrawnReward;
    }

    function getUserTotalReward(uint256 _depositAmount) internal view returns (uint256 totalReward) {
        Plan storage plan = plans[latestPlanId];
        totalReward = ( plan.rewardRatePerToken * getStakingTimeLeft() * _depositAmount ) / 1e18;
    }
    
    function getUserCanWithdrawRewards(address _investor) public view returns (uint256 canWithdraw) {
        Plan storage plan = plans[latestPlanId];
        uint256 totalEarnedReward =  ( plan.rewardRatePerToken * getUserElapsedDepositTime(_investor) * getUserDepositBalance(_investor) ) / 1e18;
        canWithdraw = totalEarnedReward - getUserWithdrawnReward(_investor);
    }

    function getInvestorCount(uint _planId) public view returns(uint) {
        return plans[_planId].investorAdrs.length;
    }

    function getInvestorAddress(uint _planId, uint _idx) public view returns(address) {
        return plans[_planId].investorAdrs[_idx];
    }

    function getInvestorInfo(uint _planId, address _invAdr) public view returns(uint, uint, uint, uint) {
        Investor storage investor = plans[_planId].investors[_invAdr];
        return (
            investor.depositTimestamp,   // The time that the deposit happened
            investor.depositBalance,     // How much Token is deposited into the contract
            investor.pendingReward,      // Remained Reward Tokens that user can withdraw
            investor.withdrawnReward     // How many rewards tokens, this Investor has accrued, until now.
        );
    }

    function getPlansCount() public view returns(uint) {
        return planIds.length;
    }

    function getPlanInfo(uint _planId) public view returns(
        uint stakingStartTime, 
        uint stakingDuration,
        uint stakingDeadline, 
        uint rewardRate, 
        uint rewardRatePerToken, 
        uint totalPendingRewards, 
        uint totalPaidRewards, 
        uint totalDeposits, 
        uint maxReward, 
        uint maxDeposit
    ) {
        Plan storage plan = plans[_planId];
        return (
            plan.stakingStartTime,    // timestamp
            plan.stakingDuration,     // seconds
            plan.stakingDeadline,     // timestamp
            plan.rewardRate,          // 10 ~ 10%
            plan.rewardRatePerToken,  // interest payout rate for each deposited Token in every second     
            plan.totalPendingRewards, // total rewards that should be paid to investors
            plan.totalPaidRewards,    // total rewards that has been paid to investors, until now
            plan.totalDeposits,       // total tokens that investors has been deposited, until now
            plan.maxReward,           // maxReward = maxDeposit * rewardRate / 100
            plan.maxDeposit           // maxDeposit = maxReward * 100 / rewardRate; 
        );
    }

    function getPlanTokenAddresses(uint _planId) public view returns(
        address stakingToken, 
        address rewardToken
    ) {
        Plan storage plan = plans[_planId];
        return (
            address(plan.stakingToken), 
            address(plan.rewardToken)
        );
    }

    function getRestRewardTokensAmount(uint _planId) public view onlyOwner returns(uint) {
        Plan storage plan = plans[_planId];
        uint256 rewardTokenBalance = plan.rewardToken.balanceOf(address(this));
        uint totalPendingRewards = plan.totalPendingRewards;
        return (rewardTokenBalance - totalPendingRewards);
    }

    function getOwner() public view returns(address) {
        return dao.owner();
    }


    /* ================= other functions  ================= */
    
    receive() external payable {
        emit LogReceiveEth(msg.sender, msg.value);
    }

}