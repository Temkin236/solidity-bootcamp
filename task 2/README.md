# Solidity Bootcamp - Day 2: Token Registry

This project demonstrates a simple **Token Registry** smart contract in Solidity.

## Features

- Register tokens with a **name** and **symbol**
- Auto-increment token IDs
- Track all registered token IDs
- Deactivate a token (only by the owner)
- Prevent empty names or symbols
- Emits an event on registration

## Usage

1. Deploy `TokenRegistry.sol` on Remix or your preferred Ethereum environment.
2. Call `registerToken("MyToken", "MTK")` to register a new token.
3. Call `getToken(id)` to fetch token details.
4. Call `deactivateToken(id)` to deactivate your token.
5. Call `getAllTokenIds()` to get a list of all token IDs.

---
