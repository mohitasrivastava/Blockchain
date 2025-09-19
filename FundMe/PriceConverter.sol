// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol"; 
//Or do npm i @chainlink/contract
// Why is this a library and not abstract?
// Why not an interface?
library PriceConverter {  // U don't have to pay in library and and it doesn't change state. state variable are internal
    // We could make this public, but then we'd have to deploy it
    function getPrice() internal view returns (uint256) {
        // Sepolia ETH / USD Address
        // https://docs.chain.link/data-feeds/price-feeds/addresses
        //We need Address and ABI to interact 
        // 0x5f4eC3Df9cbd43714FE2740f5E3616155c5b8419
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        // ETH/USD rate in 18 digit
        // Price of ETH in terms of USD  //20.00000000 8 digit deimal
        return uint256(answer * 10000000000); //Typeconversion  
    }

    // 1000000000
    function getConversionRate(uint256 ethAmount) internal view returns (uint256) {
        //minvalue in terms uf USD min. amount to bes send
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1000000000000000000;
        // the actual ETH/USD conversion rate, after adjusting the extra 0s.
        return ethAmountInUsd;
    }
}