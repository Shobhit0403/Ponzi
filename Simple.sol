// SPDX-License-Identifier: MIT
pragma solidity ^0.8.11;


contract SimplePonzi {
    address public currentInvestor;
    uint256 public currentInvestment = 0;

    fallback() external payable {
        uint256 minimumInvestment = (currentInvestment * 11) / 10;

        require(msg.value > minimumInvestment);

        address previousInvestor = currentInvestor;
        currentInvestor = msg.sender;
        currentInvestment = msg.value;

        payable(previousInvestor).transfer(msg.value);
    }
}
