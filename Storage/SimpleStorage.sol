// EVM
//Ethereum, Poygon, ZKsync, Arbitrum, Optimism --Layer2 EVM
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

// pragma solidity ^0.8.0;
// pragma solidity >=0.8.0 <0.9.0;

contract SimpleStorage {  //contract are like class in javascript or in oops
//Basic Types Boolean, uint, int, address, bytes
//uint256 by default 256 bits which is a max size, uint8, 16 etc.. is a positive integer
//int is a both positive and negative number
//bytes32 favoriteBytes32 = "cat";
    uint256 myFavoriteNumber;  // by defult initialized as 0 if no value is given and storage memory or Datalocation asoutside of function and inside contract
    //Type visibility nameofvariable
    //By default set to internal if nothing is given
     //private means only thisContract can view or current contract
     //public means anyone can view externally and internally
     //external means outside the contract can view and only for function not for variable
     //internal means only this Contract and the COntract imported or child contract can view

    struct Person {   //struct user defined datatype
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;     //way to declare array or list
    Person[] public listOfPeople;  //Dynamic array
    // Person[3] public listOfPeople; //Static array
    //OR
    // Person public pat = Person(16, "Pat");  //way to initiaze value to struct
    // Person public maraya = Person(19, "John");
    //Person should be initialize both left and right
    
    mapping(string => uint256) public nameToFavoriteNumber;  //Mapping are like dictionary in python
   // mapkey value pair despite looping over a list
    function store(uint256 _favoriteNumber) public virtual {  
        myFavoriteNumber = _favoriteNumber;   // change state, updating state send transaction
        //retrieve() //here u need to pay for calling retrieve function 
        }
    
    //view, pure read function doesn't need to spend gas. u have to only pay if you call inside the gas calling funct or state changing function
    function retrieve() public view returns (uint256) { 
        return myFavoriteNumber;    //view read state from blockchain, doesn't allow modify state
    }

    // function retriever() public pure returns (uint256) {
    //     return 7;    //pure is read but doesn't allow to read from Blockchain or State
    // }
    //calldata, memory, storage
    //calldata is for external function call only and temporary storage and can't be modified and execute only once
    //memory is temporary storage and execute only once and can be modified
    //storage is permanent storage that can be modified andgiven to permanent storage only
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        // Person memory newPerson = Person(_favoriteNumber, _name); //create newPerson and add it to ListofPeople
        // listOfPeople.push(newPerson);
        //OR
        listOfPeople.push(Person(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
    // function addPerson(string calldata _name, uint256 _favoriteNumber) public {
    //     _name = "john";  // can't modify wrong
    //     listOfPeople.push(Person(_favoriteNumber, _name));
        
    // }

    //Array, Struct, Mapping are special types in Solidity needs to be given memory DaltaLocation
    //Strings are arrayof Bytes . So, memory or calldata should be given
}

//In solidity srings are array of bytes(dynamic array), so everytime we working with string we need to give memory or calldata
//to tell compiler where to store the data in Storage or memory
contract SimpleStorage2 {}

contract SimpleStorage3 {}

contract SimpleStorage4 {}