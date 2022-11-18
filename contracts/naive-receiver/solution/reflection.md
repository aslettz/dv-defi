The lending pool does not require that the address that calls `flashLoan` is the
same as the address receiving the loan. This means that I can just initiate a 
loan on behalf of the naive receiver 10 times to drain the funds entirely (since
the fee is 1 ether).

In order to get it done in a single transaction, I could deploy a 
contract that automatically initiates those loans for me all together in a 
single transaction. The only issue with this solution is that it uses a while 
loop which could cause the transaction to run out of gas if the receiver has a
significant amount of ether we need to drain.