// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract BBSEToken is ERC20 {
  // Minter state variable
  address public minter;

  /**
  * @dev Calls the ERC20 constructor with {name} and {symbol} values.
  * Sets the minter as the contract deployer.
  */
  constructor() public payable ERC20("BBSE TOKEN", "BBSE") {
    // TODO: Complete the constructor
    minter = msg.sender;
  }

  /**
  * @dev Passes the minter role to another address.
  * The minter role can only be passed by the current minter.
  * @param _minter address of the new minter
  */
  function passMinterRole(address _minter) public {
    // TODO: Complete the function
    require(msg.sender == minter, "Error: Only the current minter can pass the minter role.");
    minter = _minter;
  }


  /**
  * @dev Mints new tokens by calling the _mint function.
  * Only the minter can mint new tokens.
  * @param account address of receiver of the tokens
  * @param amount amount of the tokens to be issued
  */
  function mint(address account, uint256 amount) public {
    // TODO: Complete the function
    require(msg.sender == minter, "Only the current minter can mint new tokens.");
    _mint(account, amount);
  }
}
