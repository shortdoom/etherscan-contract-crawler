// SPDX-License-Identifier: MIT

pragma solidity 0.8.4;

import "./EIP712Base.sol";
import "@openzeppelin/contracts/utils/Address.sol";

/**
@title Interface to enable MetaTransactions
 */
contract EIP712MetaTransaction is EIP712Base {
    using Address for address;

    bytes32 private constant META_TRANSACTION_TYPEHASH =
    // solium-disable-next-line
    keccak256(bytes("MetaTransaction(uint256 nonce,address from,bytes functionSignature)"));

    event MetaTransactionExecuted(address indexed _userAddress, address payable indexed _relayerAddress, bytes _functionSignature);

    mapping(address => uint256) public nonces;

    /**
     @dev Meta transaction structure.
     @dev No point of including value field here as if user is doing value transfer then he has the funds to pay for gas
     @dev He should call the desired function directly in that case.
     */
    struct MetaTransaction {
        uint256 nonce;
        address from;
        bytes functionSignature;
    }

    /**
    @notice Executes a MetaTransaction
    @param _userAddress The address of the user
    @param _functionSignature The signature of the function
    @param _sigR ECDSA signature
    @param _sigS ECDS signature
    @param _sigV Recovery ID signature
     */
    function executeMetaTransaction(
        address _userAddress,
        bytes memory _functionSignature,
        bytes32 _sigR,
        bytes32 _sigS,
        uint8 _sigV
    ) external payable returns (bytes memory) {
        MetaTransaction memory metaTx = MetaTransaction(nonces[_userAddress], _userAddress, _functionSignature);

        require(
            verify(_userAddress, metaTx, _sigR, _sigS, _sigV),
            "EIP712MetaTransaction: Signer and signature do not match"
        );

        // increase nonce for user (to avoid re-use)
        nonces[_userAddress]++;

        emit MetaTransactionExecuted(_userAddress, payable(msg.sender), _functionSignature);

        // Append userAddress and relayer address at the end to extract it from calling context
        bytes memory returnData = address(this).functionCall(abi.encodePacked(_functionSignature, _userAddress));

        return returnData;
    }

    /**
    @notice Hashes a meta transaction
    @param _metaTx The MetaTransaction struct
    @return bytes Representing the hashed meta transaction
     */
    function hashMetaTransaction(MetaTransaction memory _metaTx) internal pure returns (bytes32) {
        return
        keccak256(
            abi.encode(META_TRANSACTION_TYPEHASH, _metaTx.nonce, _metaTx.from, keccak256(_metaTx.functionSignature))
        );
    }

    /**
    @notice Returns the message sender of a transaction, not the relayer
    @return sender Representing the message sender
     */
    function msgSender() internal view returns (address payable sender) {
        if (msg.sender == address(this)) {
            bytes memory array = msg.data;
            uint256 index = msg.data.length;

            // solium-disable-next-line
            assembly {
            // Load the 32 bytes word from memory with the address on the lower 20 bytes, and mask those.
                sender := and(mload(add(array, index)), 0xffffffffffffffffffffffffffffffffffffffff)
            }
        } else {
            sender = payable(msg.sender);
        }

        return sender;
    }

    /**
    @notice Gets the nonce of a particular address
    @param _user Address of the user
    @return uint256 Representing the nonce of a particular address
     */
    function getNonce(address _user) public view returns (uint256) {
        return nonces[_user];
    }

    /**
    @notice Verifies the meta transaction being executed
    @param _signer Address of transaction's signer
    @param _metaTx The MetaTransaction struct
    @param _sigR ECDSA signature
    @param _sigS ECDS signature
    @param _sigV Recovery ID signature
    @return bool Representing whether or not the transaction is valid
     */
    function verify(
        address _signer,
        MetaTransaction memory _metaTx,
        bytes32 _sigR,
        bytes32 _sigS,
        uint8 _sigV
    ) internal view returns (bool) {
        require(_signer != address(0), "NativeMetaTransaction: INVALID_SIGNER");
        return _signer == ecrecover(toTypedMessageHash(hashMetaTransaction(_metaTx)), _sigV, _sigR, _sigS);
    }
}