// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract JustAnotherNFT is ERC721, Pausable, Ownable, ERC721Burnable {
    using Counters for Counters.Counter;
    
    Counters.Counter private _tokenIdCounter;
    IERC20 private _token;
    uint256 NFTcost = 1000 * 10**18; 

    constructor() ERC721("JustAnotherNFT", "JANFT") {}

    // constructor(IERC20 token) ERC721("JustAnotherNFT", "JANFT") {
    //     _token = token;
    // }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://justanother/";
    }

    function safeMint(address to) public onlyOwner {
        address sender = _msgSender();

        require(NFTcost >= _token.balanceOf(sender));
        _token.transferFrom(sender, address(this), NFTcost);

        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }
}