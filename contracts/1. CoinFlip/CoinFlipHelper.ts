import { expect } from "chai";
import { ethers } from "hardhat";

const helper = async (victim: any, attacker: any) => {
    for (let index = 0; index < 10; index++) {
        await attacker.hackContract();
    }
};

export default helper;
