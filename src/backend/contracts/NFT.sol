// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721URIStorage, Ownable {
    uint256 public tokenCount;

    constructor() ERC721("First NFT", "FIRST") {}

    function mint(string memory _tokenURI, uint256 bulkSize)
        external
        onlyOwner
        returns (bool)
    {
        _setTokenURI(tokenCount, _tokenURI);
        for (uint256 i = 1; i <= bulkSize; i++) {
            tokenCount++;
            _safeMint(msg.sender, tokenCount);
            _setTokenURI(tokenCount, _tokenURI);
        }
        return true;
    }
}
