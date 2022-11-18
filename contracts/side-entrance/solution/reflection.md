Right off the bat, I know I'll need to deploy a contract that implements the
`IFlashLoanEtherReceiver` interface with some malicious logic inside the 
`execute` method. I also noticed pretty early on that this contract does not use
automatic reentrancy guards; perhaps I could do a reentrancy attack.
I turned my attention to the balances mapping. Something about it seems weird 
since it is not used at all for the flashloan process. 
My plan is to get a flashloan of the entire contract balance, deposit it back 
into the contract to increase my balance entry and then withdraw my entire 
balance. This should drain everything and won't get reverted since the deposit
function will update the current balance of the contract.