The challenge description seems to hint that I can use a flash loan to get the
maximum rewards. I'm not super familiar with snapshots, so this challenge is the
most difficult for me so far. 

My naive assumption is that I can just get a flashloan, deposit millions of DVT,
get the snapshot taken at that point, and then withdraw them later. Without 
understanding much about snapshots and how the pool uses them, this is my best 
guess so far.

Currently my solution is not triggering a new round in the rewarder pool 
contract. I need the _recordSnapshot() method to get called which means
this needs to be true:

`block.timestamp >= lastRecordedSnapshotTimestamp + REWARDS_ROUND_MIN_DURATION;`

I wonder if I'm supposed to call

`await ethers.provider.send("evm_increaseTime", [5 * 24 * 60 * 60]); // 5 days`

in order to trigger a new round. The rules aren't too clear on that though.

Hopefully it's allowed because that's how I got it to work.
