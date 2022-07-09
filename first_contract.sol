//SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


contract MoneyBox
{
    address owner;
    mapping (address => uint256) private balance;

    constructor()
    {
        owner = msg.sender;
    }

    function getBalance() public view returns(uint256)
    {
        return balance[msg.sender];
    }

    function topUpBalance(uint256 _amount) public payable
    {
        balance[msg.sender] += _amount;
    }

    function withdrawAmount(uint256 _amount) public payable
    {
        if (balance[msg.sender] - _amount > 0)
        {
            balance[msg.sender] -= _amount;
        }
        else
        {
            revert("Amount is larger than the balance!");
        }
    }
}