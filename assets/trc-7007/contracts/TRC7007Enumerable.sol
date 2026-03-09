// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./TRC7007Zkml.sol";
import "./ITRC7007Enumerable.sol";

/**
 * @dev Implementation of the {ITRC7007Enumerable} interface.
 */
abstract contract TRC7007Enumerable is TRC7007Zkml, ITRC7007Enumerable {
    /**
     * @dev See {ITRC7007Enumerable-tokenId}.
     */
    mapping(uint256 => string) public prompt;


    /**
     * @dev See {ITRC7007Enumerable-prompt}.
     */
    mapping(bytes => uint256) public tokenId;

    /**
     * @dev See {ITRC165-supportsInterface}.
     */
    function supportsInterface(
        bytes4 interfaceId
    ) public view virtual override(ITRC165, TRC7007Zkml) returns (bool) {
        return
            interfaceId == type(ITRC7007Enumerable).interfaceId ||
            super.supportsInterface(interfaceId);
    }
    
    function mint(
        address to,
        bytes calldata prompt_,
        bytes calldata aigcData,
        string calldata uri,
        bytes calldata proof
    ) public virtual override returns (uint256 tokenId_) {
        tokenId_ = TRC7007Zkml.mint(to, prompt_, aigcData, uri, proof);
        prompt[tokenId_] = string(prompt_);
        tokenId[prompt_] = tokenId_;
    }
}

contract MockTRC7007Enumerable is TRC7007Enumerable {
    constructor(
        string memory name_,
        string memory symbol_,
        address verifier_
    ) TRC7007Zkml(name_, symbol_, verifier_) {}
} 