pragma solidity >=0.6;

import "./owned.sol";
import "./safemath.sol";
import "./BasStamp.sol";
import "./DomainView.sol";

contract StampManager is owned{
    using SafeMath for uint256;
    BMailToken public stampToken;
    DomainView public domView;

    mapping(bytes32=>uint) public MailServicePrice;

    constructor(address tokenAddr, address domainView) public{
        stampToken = BMailToken(tokenAddr);
        domView =  DomainView(domainView);
    }

    function setServicePrice(bytes32 domainHash, uint servicePrice) public{
        require(domView.IsOwner(msg.sender, domainHash));
        MailServicePrice[domainHash] = servicePrice;
    }
}