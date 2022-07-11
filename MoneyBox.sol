// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;


contract MoneyBox
{

    mapping (address => uint256) private balances;


    function topUpBalance() public payable
    {
        balances[msg.sender] += msg.value;
    }

    function capitalizationOfContract() external view returns(uint)
    {
        return address(this).balance;
    }

    function showBalance() public view returns(uint256)
    {
        return balances[msg.sender];
    }

    modifier amountOfMoney(uint _amount)
    {
        require(balances[msg.sender] - _amount >= 0, "Insufficient funds");
        _;
    }

    function withdrawFunds(uint _amount) public payable amountOfMoney(_amount)
    {
        balances[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }

}

