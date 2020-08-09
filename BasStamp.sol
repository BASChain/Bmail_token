pragma solidity >=0.6;

import "./Stamp.sol";
// SPDX-License-Identifier: MIT

contract BasStamp is Stamp{
    string  public constant  name = "BlockChain Stamp";
    string  public constant  symbol = "BMS";
    uint8   public constant  decimals = 0;

    uint256 public constant INITIAL_SUPPLY = 4.2e8;

    constructor(string memory icon) Stamp(icon) public{
        _mint(msg.sender, INITIAL_SUPPLY);
    }

    function basicSetting() public view returns(address i, string memory n, string memory s, string memory icon){
        return (issuer(), name, symbol, iconUrl());
    }
}

