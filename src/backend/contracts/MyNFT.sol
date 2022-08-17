// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract MyNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("My NFT", "MYNFTCTRCT") {}

    function totalSupply() public view returns (uint256) {
        return _tokenIds.current();
    }

    function mintItem(string memory tokenURI, uint256 bulkSize)
        public
        onlyOwner
        returns (bool)
    {
        for (uint256 i = 1; i <= bulkSize; i++) {
            _tokenIds.increment();
            uint256 newItemId = _tokenIds.current();
            _safeMint(msg.sender, newItemId);
            _setTokenURI(newItemId, tokenURI);
        }
        return true;
    }
}
