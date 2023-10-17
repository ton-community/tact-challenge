import "@stdlib/deploy";

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
      self.counter = self.counter + msg.number;
    }
    
    receive(msg: Subtract) {
      self.counter = self.counter - msg.number;
    }

    get fun counter(): Int {
      return self.counter;
    }
}
