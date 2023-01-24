// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract Reentrancy{
    mapping(address => uint256) public balances;
    function deposit() payable public{
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint256 _amount) public{
        require(balances[msg.sender]>= _amount);
        (bool sent,) = msg.sender.call{value:_amount}("");
        require(sent, "Transcation Failed");
        balances[msg.sender] -= _amount; 
    }

    function getBalance() public returns(uint256){
        return address(this).balance;
    }
}