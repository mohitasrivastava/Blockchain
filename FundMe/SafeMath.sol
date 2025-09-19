// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract SafeMath{
    uint public bigNumber = 255;    // checked

    function add() public {
        // bigNumber = bigNumber +1 ;  for below 0.8 version 
        unchecked  {bigNumber = bigNumber +1 ;}  // unchecked taked to previous version of solidity and allowsto add 
  // unchecked is gas efficient
    }
}