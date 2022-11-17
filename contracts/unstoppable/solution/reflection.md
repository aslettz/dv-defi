Looking at the Lender contract I could tell the exploit would take advantage of
this line:
        assert(poolBalance == balanceBefore);
All I had to do was get the poolBalance to mismatch from the actual ERC20 token
balance of the lender and the contract would be shut down. I initially attempted
doing this in a malicious Receiver contract before noticing the Reentrancy 
guard. Then I realized the solution would be way simpler by just transfering 
some tokens to the contract outside of the deposit method.