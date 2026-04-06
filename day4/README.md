# Solidity Bootcamp - Day 4: Bank Contract Testing with Foundry

This project demonstrates writing and testing a simple Bank smart contract using **Foundry**.

## Contract: Bank.sol
- `deposit()` – allows users to send ETH
- `withdraw(uint amount)` – withdraw ETH
- `getBalance(address user)` – view balance

## Tests: Bank.t.sol
Using Foundry's `forge-std/Test.sol` to verify:

- User can deposit ETH
- User can withdraw ETH
- Cannot withdraw more than balance
- Balance updates correctly after operations
- Revert works properly

## Setup & Run Tests

1. Install Foundry ([Setup instructions](https://t.me/c/3652512330/167/205))
2. Build the contract:
```bash
forge build