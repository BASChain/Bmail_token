
import "./owned.sol";
import "./safemath.sol";
import "./BMailToken.sol";

contract StampManager is owned{
    using SafeMath for uint256;
    BMailToken public stampToken;
    constructor(address tokenAddr) public{
        stampToken = BMailToken(tokenAddr);
    }
}