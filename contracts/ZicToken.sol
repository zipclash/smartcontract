// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ZicToken is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("ZipClash", "ZIC") {
        _mint(owner(), 2_000_000_000 * 10 ** decimals());
    }
}