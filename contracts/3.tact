import "@stdlib/deploy";

/*
TASK 3 - Dex contract 
  Create a simple Jetton dex contract that trades one pair of tokens A and B.
  The price of tokens depends on the amount of tokens that smartcontract has.
  So, if smartcontract has 10 tokens A and 2 tokens B, then after sending 1 token B you will receive 5 tokens A.
  
  If the user will pool don't have enough tokens to trade
  (for example, someone will send 99999 B tokens and dex pool has only 10 of tokens A),
  then return sent ("B" in our example) tokens back to the user.

  Implement a getter that will give the number of tokens in the pool and
  one more to get the price of token A or token B.
  
  Note
  Admin can add token A and token B just by sending them to smartcontract (we need to set the initial supply for the pool).
*/

message(0x7362d09c) TokenNotification {
    queryId: Int as uint64;
    amount: Int as coins;
    from: Address;
    forwardPayload: Slice as remaining;
}

message(0xf8a7ea5) TokenTransfer {
    queryId: Int as uint64;
    amount: Int as coins;
    destination: Address;
    responseDestination: Address?;
    customPayload: Cell?;
    forwardTonAmount: Int as coins;
    forwardPayload: Slice as remaining;
}

contract Task3 with Deployable {
  owner: Address;
  a: Int;
  b: Int;
  jAddressA: Address;
  jAddressB: Address;
  decimal: Int;

  init(admin: Address, newJAddressA: Address, newJAddressB: Address) {
    self.owner = admin;
    self.jAddressA = newJAddressA;
    self.jAddressB = newJAddressB;
    self.a = 0;
    self.b = 0;
    self.decimal = 1000000000;
  }

  receive(msg: TokenNotification) {
  } 
  
  get fun price(token: Address): Int { 
  }
  
  get fun balance(token: Address): Int { 
  }
}
