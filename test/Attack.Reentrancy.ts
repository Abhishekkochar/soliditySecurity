import { ethers } from "hardhat";
import { Reentrancy, AttackReentrancy } from "../typechain-types";

describe("Attack reentrancy", ()=>{
    let reentrancyContract: Reentrancy;
    let attackContract: AttackReentrancy;
    beforeEach(async()=>{
        // List of accounts
        const accounts = await ethers.provider.listAccounts();
        const arbitrarySignerOne = await ethers.getSigner(accounts[1]);
        const arbitrarySignerTwo = await ethers.getSigner(accounts[2]);
        // Deploying vulnerable contract
        const reentrancy = await ethers.getContractFactory("Reentrancy");
        reentrancyContract = await reentrancy.deploy()
        // Deploying attack contract
        const attack = await ethers.getContractFactory("AttackReentrancy");
        attackContract = await attack.deploy(reentrancyContract.address);
    })

    it("Attacking the vulnerable contract", async()=>{

    })
})