pragma solidity >=0.6;

import "./Stamp.sol";

contract BasStamp is Stamp{
    string  public constant  name = "BlockChain Stamp";
    string  public constant  symbol = "BMS";

    uint256 public constant INITIAL_SUPPLY = 4.2e8;

    constructor(string memory icon) Stamp(icon) public{
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}

