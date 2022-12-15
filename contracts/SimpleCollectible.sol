// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract SimpleCollectible is ERC721URIStorage {
    using Counters for Counters.Counter;

    Counters.Counter private _tokenIds;
    uint256 public tokenCounter;

    constructor() public ERC721("Dogie", "DOG") {}

    function createCollectible(string memory tokenURI) public returns (uint256){
        uint256 tokenCounter = _tokenIds.current();
        _safeMint(msg.sender, tokenCounter);
        _setTokenURI(tokenCounter, tokenURI);
        _tokenIds.increment();
        return tokenCounter;
    }
}