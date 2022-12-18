This one is interesting. It seems like web server's response message will be the
security hole we need to hack the exchange. I'm not yet sure what the response
is, but I'm thinking it could give us a clue as to one of the oracle's private
keys or something. If that's the case, we could set the NFT price to be extremely
cheap, buy one, set the price to be the exchange's balance, then sell it back.

I know there are 3 oracles, and the http response I got from the server has 352
non-whitespace characters or 176 bytes of data. Since a private key is 32 byte 
It doesn't seem too likely that this is the private key of anything, but maybe 
it's still leaking some information about a private key... 

I wanted to see if this was the calldata that a trusted source would send to the
oracle contract, so I attempted to decode it here:
https://apoorvlathey.com/eth-calldata-decoder/ but it didn't seem to work.
So now I need to figure out what that response really is.

----

I tried some hashing and converting to see if anything seemed to line up (look 
at previous commits to see my attempt). It was at this point that I knew I was 
onto something but was a little stuck. A surface level google search gave me a 
tip to look at the hex blobs as ascii strings and then decode them from there.
I'll try that and see if it helps us in our search for the private key. Note 
that we need the private key of at least 2 trusted sources in order to corrupt
the median price.

Still working in this challenge.