
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// import {SimpleStorage, SimpleStorage2} from "./SimpleStorage.sol";
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    // SimpleStorage public mysimplestorage // Contract view variablename

    SimpleStorage[] public listOfSimpleStorageContracts; //List to track of all the contracts

    function createSimpleStorageContract() public {
        SimpleStorage simpleStorageContractVariable = new SimpleStorage();
        // SimpleStorage simpleStorage = new SimpleStorage(); // new keyword to deploy the contract
        listOfSimpleStorageContracts.push(simpleStorageContractVariable);
    }

    function sfStore(uint256 _simpleStorageIndex,uint256 _simpleStorageNumber) public { 
        //Function to interact with store
        // Address
        // ABI( Application Binary Interface) to interact with other contract
        //Compiler knows ABI
        // SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).store(_simpleStorageNumber);
        listOfSimpleStorageContracts[_simpleStorageIndex].store(_simpleStorageNumber);
        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // mySimpleStorage.store(_simpleStorageNumber);
    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256) {
        //funtion to retrievev or get the value
        // return SimpleStorage(address(simpleStorageArray[_simpleStorageIndex])).retrieve();
        return listOfSimpleStorageContracts[_simpleStorageIndex].retrieve();
        // SimpleStorage mySimpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        // return mySimpleStorage.retrieve();
    }
}
