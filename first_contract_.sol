//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


contract MoneyBox
{

    mapping (address => uint256) private balance;

    function getBalance() public view returns(uint256)
    {
        return balance[msg.sender];
    }

    function topUpBalance() public payable
    {
        balance[msg.sender] += msg.value;
    }

    function withdrawAmount() public payable
    {
        if (balance[msg.sender] - msg.value >= 0)
        {
            balance[msg.sender] -= msg.value;
            payable(msg.sender).transfer(msg.value);
        }
        else
        {
            revert("Amount is larger than the balance!");
        }
    }
}