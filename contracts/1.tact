import "@stdlib/deploy";

/*
  TASK 1 - Counter 
  Implement counter contract that will have 2 opcodes ('Add' / 'Subtract'),
  which add or subtract the received number (int32) with the number that is stored in the state (and store the result back in the state).
  You also need to implement one getter with name "counter" to get the current number from the state.
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
