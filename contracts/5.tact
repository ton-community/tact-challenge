import "@stdlib/deploy";

/*
  TASK 5 - NFT random swap 
  The smartcontract contains a bunch of different NFTs.
  A user brings his NFT and sends it to the smartcontract, with 2.1TON (2 for admin's profit, 0.1 for gas) in attachment (as fee for swap).
  The smartcontract randomly chooses some nft from the already available nfts and gives it to user in exchange for the brought nft.
  Admin address can deposit NFTs without swap logic. 
  Admin can withdrawal all NFTs + all TONs that was collected from users as fees.
  Implement getter that will show NFT addresses on the balance of smartcontract.
  Implement getter that will show amount of fees collected.

  All in all, smartcontract should have this logic:
  Transactions
  * AdminWithdrawalFees 
   - sc should check that sender is admin / otherwise throw "Insufficient privelegies"
   - sc should send all collected fees to admin exept 0.1tons
  * AdminWithdrawalAllNFTs
   - sc should send max 100 nfts in one batch
   - sc should check that incoming tx tons value will be enougth for nft withdrawal (ton("1") + self.total * ton("0.08")) thorw "Insufficent funds" otherwise
   - sc should check that sender is admin, throw "Invalid sender" otherwise
   - sc should send nft one by one to admin 
  * OwnershipAssigned 
   - if prevOwner is owner (admin) address, then add nft to collection
   - if value of ton attached is les then 2.1 TON then stop execution and return nft back
   - randomly select nft to send from all nfts that smartcontract have
   - send selected nft to sender with all remaining balance (exept of admin profit / collected fees from this and other swaps)
  
  Getters
  * fees
   - return how much collected fees is available to withdrawal for admin (all fees - 0.1ton)
  * nfts
   - should return dict of stored nfts with nft ids as keys and nfts address as values 
*/

message AdminWithdrawalFees {
  queryId: Int as uint64;
}

message AdminWithdrawalAllNFTs {
  queryId: Int as uint64;
}

message AdminFetchFees {
  queryId: Int as uint64;
}

message(0x05138d91) OwnershipAssigned {
    queryId: Int as uint64;
    prevOwner: Address;
    forwardPayload: Slice as remaining; 
}

message(0x5fcc3d14) Transfer { 
    queryId: Int as uint64;            
    newOwner: Address; 
    responseDestination: Address; 
    customPayload: Cell?; 
    forwardAmount: Int as coins; 
    forwardPayload: Slice as remaining; 
}

contract Task5 with Deployable {
  seed: Int as uint128;
  owner: Address;
  
  init(seed: Int, owner: Address) {
    self.owner = owner;
    self.seed = seed;
  }

  receive(msg: OwnershipAssigned) {
  }

  receive(msg: AdminWithdrawalFees) {
  }

  receive(msg: AdminWithdrawalAllNFTs) {
  }

  get fun fees(): Int { 
  }
  
  get fun nfts(): map<Int as uint16, Address> { 
  }
}
