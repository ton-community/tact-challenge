import "@stdlib/deploy";

/*
  TASK 1 - Counter contract 
  Implement counter contract that will have 2 opcodes ('Add' / 'Subtract'),
  which add or subtract the sent number (int32) with the number that stored in the state.
  Also, its needed to implement one getter with name "counter" to get the number from the store.
*/

message Add {
  queryId: Int as uint64;
  number: Int as uint32;
}

message Subtract {
  queryId: Int as uint64;
  number: Int as uint32;
}

contract Task1 with Deployable {
    counter: Int as int32;

    init() {
      self.counter = 0;
    }

    receive(msg: Add) {
    }
    
    receive(msg: Subtract) {
    }

    get fun counter(): Int {
    }
}

