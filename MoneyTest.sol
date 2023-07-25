// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract MoneyReceiver {
    uint256 totalAmount; //all money received 
    uint256 totalSenders; //the total number of senders
    address owner;
    uint256 ethereums = 1 ether;

    modifier onlyOwner(){
        require(msg.sender == owner,"You are not the owner of this SC!");
        _;
    }

    modifier onlyLargeAmounts(){
        require(msg.value >= 10 gwei,"You need to send at least 10 gwei.");
        _;
    }
    
    constructor(){
        totalAmount = 0;
        totalSenders = 0;
        owner = msg.sender;
    }

    function receiveMoney() external payable onlyLargeAmounts onlyLargeAmounts onlyLargeAmounts returns(address){
        require(msg.sender != owner,"Owners cannot send money.");
        
        uint256 amountReceived = msg.value;
        address senderAddress = msg.sender;

        totalAmount += amountReceived;
        totalSenders++;

        return senderAddress;
    }

    function getAmount() public view returns(uint256){
        return totalAmount;
    }

    function getSenderCount() public view onlyOwner returns(uint256){
        return totalSenders;
    }

    function getOwner() public view onlyOwner returns(address){
        return owner;
    }

    function getEthereums() external view onlyOwner returns(uint256){
        return ethereums;
    }

    // The foolowing function will trigger compiler error because of 'external'
    // function getGetEthereums() public view onlyOwner returns(uint256){
    //     return getEthereums();
    // }

}
