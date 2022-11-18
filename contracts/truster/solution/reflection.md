I think the key here is that it blindly calls a function on any given contract 
address we send it. We can easily just approve our attacker address access to 
the erc20 tokens owned by the pool in that function, but that would still 
require two transactions. One to the lending pool (which approves the attacker)
and one to the ERC20 contract to actually make the transfer. I'll work on this
solution and think about optimizing it for a single transaction after that.

The solution was similar to last time: Bundling all the logic into a custom
contract method to make it a single transaction. It is also good to note that we
don't actually have to borrow anything from the pool in order to make it call
whatever contract/function we want.