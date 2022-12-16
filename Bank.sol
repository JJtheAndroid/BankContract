// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Bank is ReentrancyGuard {



//this line will create a mapping for the accounts
mapping(address=> uint) public accounts;



//this line will deposit ETH and update the account
function Deposit () public payable {
    accounts[msg.sender] += msg.value;
}

//this line will allow the user to withdraw his/her money. It also prevent Re-Entrancy attacks 
//by implenting OpenZepplin extension  
function withdraw(uint amount)public payable nonReentrant {
    require (accounts[msg.sender] >= amount, "You do not have enough money in your account");
    accounts[msg.sender] -= amount;
    //this line allows the user to withdraw their money 
    payable(msg.sender).transfer(amount);


}


//this line will show the overall balance 
function Getbalance() public view returns (uint){
    return address(this).balance;
}


//this line will show the balance of the msg.sender's account 
function GetUserBalance() public view returns (uint){
    return accounts[msg.sender];



}





}
