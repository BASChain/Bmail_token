pragma solidity >= 0.6;

import "./IERC20.sol";
// SPDX-License-Identifier: MIT

interface IStamp is IERC20{

    function iconUrl() external view returns (string memory);
    function issuer() external view returns (address);
    function claim(address from, uint256 credit, uint256 epoch, bytes calldata signature) external;
    function transferIssuer(address newIssuer) external;
    function active(uint256 amount) external;
    function activeBalanceOf(address user) external view returns(uint256 balance, uint256 activedSum, uint256 epoch);

    event Active(
        address indexed from,
        uint256 amount
    );

    event TransferIssuer(
        address indexed oldIssuer,
        address indexed newIssuer
    );

    event Claim(
        address indexed from,
        address indexed to,
        uint256 epoch,
        uint256 credit
    );
}