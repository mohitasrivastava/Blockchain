//Get fund from user
//Withdraw Fund
//Sent a minimum Funding value
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

// Note: The AggregatorV3Interface might be at a different location
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";
import {PriceConverter} from "./PriceConverter.sol";

//Gas saving
//adding constant // constant capital cariablename so to know it is constant
// imuutable // owner replace to i_owner to know immutable
//error handling in if statement despite addig strring to revert
error NotOwner();

contract FundMe {
    //Allow user to send $ as Metamask Wallet has money , Contract can also have also hold money
    //Have a min $ sent
    //How do we sent ETH to this contract
    using PriceConverter for uint256; //attaching priceconverter Library to uint256

    mapping(address => uint256) public addressToAmountFunded;
    address[] public funders; //to track who and what amount is sending

    // // Could we make this constant?  /* hint: no! We should make it immutable! */
    // address public /* immutable */ i_owner;  // save gas immutable can be added to one time global variable
    address public i_owner;
    uint256 public constant MINIMUM_USD = 5 * 10 ** 18; // constant save gas fee

    constructor() {
        i_owner = msg.sender;
    }

    function fund() public payable {
        //payable keyword looks red in UI needs to send token
        // require(getConversionRate(msg.value)> 1e18, "Doesn't send enough ETH"); //1e18 = 1ETH = 1 * 10**18
        require(
            msg.value.getConversionRate() >= MINIMUM_USD,
            "You need to spend more ETH!"
        );
        // require(PriceConverter.getConversionRate(msg.value) >= MINIMUM_USD, "You need to spend more ETH!");
        addressToAmountFunded[msg.sender] += msg.value; //address value
        funders.push(msg.sender);
        // require is to add a check(checker) add return if fails
        //     ABi
        //     address
    }

    function getVersion() public view returns (uint256) {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(
            0x694AA1769357215DE4FAC081bf1f309aDC325306
        );
        return priceFeed.version();
    }

    modifier onlyOwner() {
        // require(msg.sender == owner, "Nota owner");
        if (msg.sender != i_owner) revert NotOwner(); //saves gas
        _; // other part of function will exeute
    }

    function withdraw() public onlyOwner {
        // to withdraw the money
        // require(msg.sender == owner, "Must be owner") ;
        // for(/* startingindex, ending index, stepamount */)
        for (
            uint256 funderIndex = 0;
            funderIndex < funders.length;
            funderIndex++
        ) {
            address funder = funders[funderIndex]; // address bcz we get ffunders address
            addressToAmountFunded[funder] = 0; //setting funder amount to 0 to reset the array
        }
        //Reset the array
        funders = new address[](0); //new keyword to rest the funders array
        //Actually withdraw the money different ways
        //transfer, send , call
        //msg.sender has address datatype // payable(msg.sender) payable address dayatype
        (bool callSuccess, ) = payable(msg.sender).call{
            value: address(this).balance
        }(""); // and returns two varible
        require(callSuccess, "Call failed");

        //     // transfer ==> automatically revert if fails and 2300 gas
        //     payable(msg.sender).transfer(address(this).balance);// this refers to whole contract
        //     // typecast from address type to payble type

        //     // send return bool and add require to revert and 2300 gas
        //     bool sendSuccess = payable(msg.sender).send(address(this).balance);
        //     require(sendSuccess, "Send failed");

        //     // call returns bool forward all gas or set gas returns bool
        //     //call calls the function  and return two data bool and data
        //     (bool callSuccess, bytes memory datareturned) = payable(msg.sender).call{value: address(this).balance}(""); // and returns two varible
        //  require(callSuccess, "Call failed");
    }

    fallback() external payable {
        //if some data is send
        fund();
        // result = 1 ;
    }

    receive() external payable {
        // if accidently don't use fund function
        // result = 2;
        fund(); //rolls to fund function
    }
}

// Red payable need to send eth
//yellow state change gas fee
//blue read view no gas fee
// Concepts to cover yet
// 1. Enum
// 2. Events
// 3. Try / Catch
// 4. Function Selector
// 5. abi.encode / decode
// 6. Hash with keccak256
// 7. Yul / Assembly
