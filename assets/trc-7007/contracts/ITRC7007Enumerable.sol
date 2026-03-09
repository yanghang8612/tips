// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./ITRC7007.sol";

/**
 * @title TRC7007 Token Standard, optional enumeration extension
 */
interface ITRC7007Enumerable is ITRC7007 {
    /**
     * @dev Returns the token ID given `prompt`.
     */
    function tokenId(bytes calldata prompt) external view returns (uint256);

    /**
     * @dev Returns the prompt given `tokenId`.
     */
    function prompt(uint256 tokenId) external view returns (string calldata);
}
