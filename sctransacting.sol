// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Sender {
    uint256 num = 10;

    event DataReturned(bool success, bytes data);
    receive() external payable {}

    // .transfer - high-level (tx will be terminated in case of failure); it cascades exceptions; only sends 2300 gas!!!
   function transferCrypto(address payable _receiverAddr, uint256 _amount) public {
       _receiverAddr.transfer(_amount);
   }

    //.send - lo level (returns a boolean result, tx is NOT terminated); only sends 2300 gas
   function sendCrypto(address payable _receiverAddr, uint256 _amount) public returns(bool){
       bool success = _receiverAddr.send(_amount);

       if(success){       }
       else {       }

       return success;
   }

    // .call - low level (returns boolean upon success/failure)
   function callSc(address payable _receiverAddr , uint256 _amount) public {
       (bool success, bytes memory data) = 
                            _receiverAddr.call("");//abi.encodeWithSignature("incrementNum()"));
        
        emit DataReturned(success, data);
   }

    // .delegatecall - executes a remote function in the CURRENT SC context
   function delegatecallSc(address payable _receiverAddr) public {
       (bool success, ) = _receiverAddr.delegatecall(abi.encodeWithSignature("incrementNum()"));
   }

    function getNum()public view returns(uint256){
        return num;
    }

    //cascades exceptions
    function namedCall(address payable _address) public {
        Receiver receiverinstance = Receiver(_address);
        receiverinstance.incrementNum();
    }
   
}

contract Receiver {

    uint256 num = 10;

    event TxContext(uint256 gasAmount, uint256 amount);
    event MoneyReceived(uint256 _amount, address _senderAddr);

    fallback() external payable {
            emit TxContext(gasleft(),msg.value);
    }

    function incrementNum() public {
            num++;
    }

    function receiveData(uint256 _num) public payable returns(uint256){
        
        emit TxContext(gasleft(),msg.value);

        return _num*3;
    }

   

    function getNum()public view returns(uint256){
        return num;
    }
}