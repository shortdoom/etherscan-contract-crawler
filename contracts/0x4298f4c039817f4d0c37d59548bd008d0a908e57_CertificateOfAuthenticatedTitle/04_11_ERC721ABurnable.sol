// SPDX-License-Identifier: MIT
// ERC721A Contracts v4.2.2
// Creator: Chiru Labs

pragma solidity 0.8.13;

import "./IERC721ABurnable.sol";
import "./ERC721A.sol";

/**
 * @title ERC721ABurnable.
 *
 * @dev ERC721A token that can be irreversibly burned (destroyed).
 */
abstract contract ERC721ABurnable is ERC721A, IERC721ABurnable {
    /**
     * @dev Burns `tokenId`. See {ERC721A-_burn}.
     *
     * Requirements:
     *
     * - The caller must own `tokenId` or be an approved operator.
     */
    function burn(uint256 tokenId) public virtual override {
        _burn(tokenId, true);
    }
}