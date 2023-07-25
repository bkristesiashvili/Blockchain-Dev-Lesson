// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract HelloBlockchain {
    uint256 sum;

    constructor(){
        sum = 0;
    }

    function calculateSum(uint256 _a, uint256 _b) public returns(uint256){
        uint256 sumItself = _a + _b;

        sum = sumItself;

        return sumItself;
    }

    function getSum()public view returns(uint256){
        return sum;
    }
}