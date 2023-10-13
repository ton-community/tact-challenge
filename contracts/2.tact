import "@stdlib/deploy";

/*
  TASK 2 - Proxy contract 
  Create a contract that forwards all messages sent and toncoins received 
  to the admin contract (the address will be set in init_store).
  Transaction from proxy contract to admin contract should contain
    - Address of the ueser who sent the transaction (should be stored in the body cell).
    - Original message that proxy smart contract received from the user (should be stored in the first ref in the outcoming body).
  Also, if admin contract rejects the message (Bounced / opcode 0x44), then you need to send all TONs back to the user.
  The user address will be given in bounced message body as "sender".
*/

message(0x44) Bounced {
  queryId: Int as uint64;
  sender: Address;
}

contract Task2 with Deployable {
  admin: Address;

  init(admin: Address) {
    self.admin = admin;
  }
  
  receive(msg: Bounced) {
  }

  receive(msg: Slice) {
  }
}

