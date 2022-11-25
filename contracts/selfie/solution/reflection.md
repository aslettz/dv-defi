This is the first challenge with a governance token, which is pretty neat.
Hopefully I can use what I learned about snapshots from the previous challenge
to tackle this one easily.

I think the key here is that the selfie pool does flashloans of the same token 
used for governance voting. So, I can get a flashloan, propose an action to drain
funds to the attacker, then execute that action.

I coded up that idea but am now getting an error from ERC20Snapshot saying the 
snapshot id I'm trying to read is 0. I had to manually call snapshot() on the 
token to record my balance, apparently. Now I'm getting an error saying "Cannot
execute this action".

It seems I need to manually do another time step in the test file before I can 
call execute action on the governance token.

With that, this challenge is done!