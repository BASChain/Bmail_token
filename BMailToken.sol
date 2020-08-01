pragma solidity >=0.6;

import "./ERC20.sol";

contract BMailToken is ERC20{

    string  public constant  name = "BlockChain Mail Token";
    string  public constant  symbol = "BMT";
    uint8   public constant  decimals = 18;
    uint256 public constant INITIAL_SUPPLY = 4.2e8  * (10 ** uint256(decimals));

    constructor() public{
        _mint(msg.sender, INITIAL_SUPPLY);
    }
}