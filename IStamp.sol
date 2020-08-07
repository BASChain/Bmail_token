pragma solidity >= 0.6;

import "./IERC20.sol";
// SPDX-License-Identifier: MIT

interface IStamp is IERC20{

    function iconUrl() external view returns (string memory);
    function issuer() external view returns (address);
    function claim(address from, uint credit, bytes calldata signature) external;
    function transferIssuer(address newIssuer) external;
    function active(uint amount) external;

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
        uint256 credit
    );
}