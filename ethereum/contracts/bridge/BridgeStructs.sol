// contracts/Structs.sol
// SPDX-License-Identifier: Apache 2

pragma solidity ^0.8.0;

contract BridgeStructs {
  struct Transfer {
    // PayloadID uint8 = 1
    uint8 payloadID;
    // Amount being transferred (big-endian uint256)
    uint256 amount;
    // Address of the token. Left-zero-padded if shorter than 32 bytes
    bytes32 tokenAddress;
    // Chain ID of the token
    uint16 tokenChain;
    // Address of the recipient. Left-zero-padded if shorter than 32 bytes
    bytes32 to;
    // Chain ID of the recipient
    uint16 toChain;
    // Amount of tokens (big-endian uint256) that the user is willing to pay as relayer fee. Must be <= Amount.
    uint256 fee;
  }

  struct AssetMeta {
    // PayloadID uint8 = 2
    uint8 payloadID;
    // Address of the token. Left-zero-padded if shorter than 32 bytes
    bytes32 tokenAddress;
    // Chain ID of the token
    uint16 tokenChain;
    // Number of decimals of the token (big-endian uint256)
    uint8 decimals;
    // Symbol of the token (UTF-8)
    bytes32 symbol;
    // Name of the token (UTF-8)
    bytes32 name;
  }

  struct RegisterChain {
    // Governance Header
    // module: "TokenBridge" left-padded
    bytes32 module;
    // governance action: 1
    uint8 action;
    // governance paket chain id: this or 0
    uint16 chainId;
    // Chain ID
    uint16 emitterChainID;
    // Emitter address. Left-zero-padded if shorter than 32 bytes
    bytes32 emitterAddress;
  }

  struct UpgradeContract {
    // Governance Header
    // module: "TokenBridge" left-padded
    bytes32 module;
    // governance action: 2
    uint8 action;
    // governance paket chain id
    uint16 chainId;
    // Address of the new contract
    bytes32 newContract;
  }

  struct GenericAction {
    // PayloadID uint8 = 4
    // uint8 payloadID;

    // orig chain id
    uint8 originChainId;
    // dst chain type (0 = EVM, 1 = Sol, 2 = Polka, ...)
    uint8 dstChainType;
    // dst chain id (for EVMs)
    uint8 dstChainId;
    // custom payload, len = bytes300
    bytes payload;
  }
}
