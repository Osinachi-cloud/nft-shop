//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;


import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";


contract NFT is ERC721URIStorage {
    // auto-increment for each token
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    address contractAddress;

    // runs only if ERC721 method runs
      constructor(address marketplaceAddress) ERC721("Partnerverse Tokens", "PNVT"){
       contractAddress = marketplaceAddress;
    }
    function createToken(string memory tokenURI) public returns(uint){
        _tokenIds.increment();  
        uint256 newItemId = _tokenIds.current();


        _mint(msg.sender, newItemId); //mint the token, msg.sender == the address
        _setTokenURI(newItemId, tokenURI); //generate the URI
        setApprovalForAll(contractAddress, true); //grant transaction permission to marketplace

        return newItemId;
    }


}