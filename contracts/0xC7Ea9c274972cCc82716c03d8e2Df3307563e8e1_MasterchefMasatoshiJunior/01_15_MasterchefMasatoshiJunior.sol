// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/utils/cryptography/ECDSA.sol";
import "./IReverseRegistrar.sol";
import "./ERC721.sol";

/**
 * @title MasterchefMasatoshi
 * NFT + DAO = NEW META
 * Vitalik, remove contract size limit pls
 */
contract MasterchefMasatoshiJunior is ERC721, Ownable {
  using ECDSA for bytes32;
  string public PROVENANCE;
  bool provenanceSet;

  uint256 public mintPrice;
  uint256 public maxPossibleSupply;
  uint256 public allowListMintPrice;
  uint256 public maxAllowedMints;

  address public immutable currency;
  address immutable wrappedNativeCoinAddress;
  address payable immutable omakasea;

  address private signerAddress;
  bool public paused;

  address immutable ENSReverseRegistrar = 0x084b1c3C81545d370f3634392De611CaaBFf8148;

  enum MintStatus {
    Idle,
    AllowList,
    Public,
    Finished
  }

  MintStatus public mintStatus = MintStatus.Idle;

  mapping (address => uint256) totalMintsPerAddress;

  constructor(
      string memory _name,
      string memory _symbol,
      uint256 _maxPossibleSupply,
      uint256 _mintPrice,
      uint256 _allowListMintPrice,
      uint256 _maxAllowedMints,
      address _signerAddress,
      address payable _omakasea,
      address _currency,
      address _wrappedNativeCoinAddress
  ) ERC721(_name, _symbol, _maxAllowedMints) {
    maxPossibleSupply = _maxPossibleSupply;
    mintPrice = _mintPrice;
    allowListMintPrice = _allowListMintPrice;
    maxAllowedMints = _maxAllowedMints;
    signerAddress = _signerAddress;
    omakasea = _omakasea;
    currency = _currency;
    wrappedNativeCoinAddress = _wrappedNativeCoinAddress;
  }

  function flipPaused() external onlyOwner {
    paused = !paused;
  }

  function setProvenanceHash(string memory provenanceHash) public onlyOwner {
    require(!provenanceSet);
    PROVENANCE = provenanceHash;
    provenanceSet = true;
  }

  function setBaseURI(string memory baseURI) public onlyOwner {
    _setBaseURI(baseURI);
  }
  
  function changeMintStatus(MintStatus _status) external onlyOwner {
    require(_status != MintStatus.Idle);
    mintStatus = _status;
  }

  function mintAllowList(
    bytes32 messageHash,
    bytes calldata signature,
    uint amount
  ) public payable {
    require(mintStatus == MintStatus.AllowList && !paused, "s");
    require(totalSupply() + amount <= maxPossibleSupply, "m");
    require(hashMessage(msg.sender, address(this)) == messageHash, "i");
    require(verifyAddressSigner(messageHash, signature), "f");
    require(totalMintsPerAddress[msg.sender] + amount <= maxAllowedMints, "l");

    uint mintAmount = allowListMintPrice * amount;
    uint omakaseaFee = mintAmount * 25 / 1000;

    if (currency == wrappedNativeCoinAddress) {
        require(mintAmount <= msg.value, "a");
        // 2.5% Omakasea Fee
        omakasea.transfer(omakaseaFee);
    } else {
        IERC20 _currency = IERC20(currency);
        // 2.5% Omakasea Fee
        _currency.transferFrom(msg.sender, omakasea, omakaseaFee);    
        _currency.transferFrom(msg.sender, address(this), mintAmount - omakaseaFee);    
    }

    totalMintsPerAddress[msg.sender] = totalMintsPerAddress[msg.sender] + amount;
    _safeMint(msg.sender, amount);
  }

  function mintPublic(uint amount) public payable {
    require(mintStatus == MintStatus.Public && !paused, "s");
    require(totalSupply() + amount <= maxPossibleSupply, "m");
    require(totalMintsPerAddress[msg.sender] + amount <= maxAllowedMints, "l");

    uint mintAmount = mintPrice * amount;
    uint omakaseaFee = mintAmount * 25 / 1000;

    if (currency == wrappedNativeCoinAddress) {
        require(mintPrice * amount <= msg.value, "a");
        // 2.5% Omakasea Fee
        omakasea.transfer(omakaseaFee);
    } else {
        IERC20 _currency = IERC20(currency);
        // 2.5% Omakasea Fee
        _currency.transferFrom(msg.sender, omakasea, omakaseaFee);  
        _currency.transferFrom(msg.sender, address(this), amount * mintPrice);    
    }

    totalMintsPerAddress[msg.sender] = totalMintsPerAddress[msg.sender] + amount;
    _safeMint(msg.sender, amount);

    if (totalSupply() == maxPossibleSupply) {
      mintStatus = MintStatus.Finished;
    }
  }

  function addReverseENSRecord(string memory name) external onlyOwner{
    IReverseRegistrar(ENSReverseRegistrar).setName(name);
  }

  receive() external payable {
    mintPublic(msg.value / mintPrice);
  }

  function verifyAddressSigner(bytes32 messageHash, bytes memory signature) private view returns (bool) {
    return signerAddress == messageHash.toEthSignedMessageHash().recover(signature);
  }

  function hashMessage(address sender, address thisContract) public pure returns (bytes32) {
    return keccak256(abi.encodePacked(sender, thisContract));
  }

  function withdraw() external onlyOwner() {
    payable(msg.sender).transfer(address(this).balance);
  }

  function withdrawTokens(address tokenAddress) external onlyOwner() {
    IERC20(tokenAddress).transfer(msg.sender, IERC20(tokenAddress).balanceOf(address(this)));
  }
}

// The High Table