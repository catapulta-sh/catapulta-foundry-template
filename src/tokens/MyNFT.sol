// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "../../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {ERC721Enumerable} from "../../lib/openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {Ownable} from "../../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
import {Strings} from "../../lib/openzeppelin-contracts/contracts/utils/Strings.sol";

/// @notice EXAMPLE, DO NOT USE THIS CONTRACT IN PRODUCTION
contract MyNFT is ERC721, ERC721Enumerable, Ownable {
    using Strings for uint256;

    uint256 private _nextTokenId;
    uint256 public mintPrice = 0.01 ether;
    string public baseTokenURI;

    constructor(string memory name, string memory symbol, string memory initialBaseURI)
        ERC721(name, symbol)
        Ownable(msg.sender)
    {
        baseTokenURI = initialBaseURI;
    }

    function mint() public payable {
        require(msg.value >= mintPrice, "Insufficient payment");
        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender, tokenId);
    }

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        payable(owner()).transfer(balance);
    }

    function setMintPrice(uint256 _mintPrice) public onlyOwner {
        mintPrice = _mintPrice;
    }

    function setBaseURI(string memory _newBaseURI) public onlyOwner {
        baseTokenURI = _newBaseURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseTokenURI;
    }

    // Override required functions
    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value) internal override(ERC721, ERC721Enumerable) {
        super._increaseBalance(account, value);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721Enumerable) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}
