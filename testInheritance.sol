// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract A {
    uint256 internal number = 10;
    address internal owner = msg.sender;

}

contract B is A {

    function getNum() public view returns(uint256){
        return number;
    }
}

// contract A{

//     address owner;

//     constructor(){
//         owner = msg.sender;
//     }

//     modifier onlyOwner(){
//         require(msg.sender == owner, "access denied");
//         _;
//     }
// }

// contract B is A{

//     function getOwner()public view onlyOwner returns(address){
//         return  owner;
//     }
// }


contract C is B {
    
}

//FORGET ABOUT THIS; JUST KNOW IT IS POSSIBLE ;)
contract D is A, B, C {

}