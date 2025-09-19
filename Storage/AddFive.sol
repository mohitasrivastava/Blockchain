// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";
//Inherited child contract

contract AddFiveStorage is SimpleStorage {   //is means to inherit from SimpleStorge(parent)
    //overriding needs two keyword override and virtual in parent class
    function store(uint256 _favoriteNumber) public override {
        myFavoriteNumber = _favoriteNumber + 5;
    }
    function SayHello() public pure returns(string memory){
        return "Helo";
    }
}