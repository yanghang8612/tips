// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/utils/introspection/ITRC165.sol";
import "@openzeppelin/contracts/token/TRC721/ITRC721.sol";

/**
 * @dev Required interface of an TRC7007 compliant contract.
 */
interface ITRC7007 is ITRC165, ITRC721 {
    /**
     * @dev Emitted when AI Generated Content (AIGC) data is added to token at `tokenId`.
     */
    event AigcData(
        uint256 indexed tokenId,
        bytes indexed prompt,
        bytes aigcData,
        bytes proof
    );

    /**
     * @dev Add AIGC data to token at `tokenId` given `prompt`, `aigcData` and `proof`.
     *
     * Optional:
     * - `proof` should not include `aigcData` to save gas.
     * - verify(`prompt`, `aigcData`, `proof`) should return true for zkML scenario.
     */
    function addAigcData(
        uint256 tokenId,
        bytes calldata prompt,
        bytes calldata aigcData,
        bytes calldata proof
    ) external;

    /**
     * @dev Verify the `prompt`, `aigcData` and `proof`.
     */
    function verify(
        bytes calldata prompt,
        bytes calldata aigcData,
        bytes calldata proof
    ) external view returns (bool success);
}
