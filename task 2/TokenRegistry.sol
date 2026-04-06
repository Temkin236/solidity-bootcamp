// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract TokenRegistry {
    // Define a struct to represent a token
    struct Token {
        string name;
        string symbol;
        address owner;
        bool isActive;
    }

    // Mapping to store tokens by a unique ID
    mapping(uint256 => Token) public tokens;

    // Array to track all registered token IDs
    uint256[] public tokenIds;

    // Auto-increment ID
    uint256 private nextId = 1;

    // Event when a new token is registered
    event TokenRegistered(uint256 indexed id, string name, string symbol, address owner);

    // Register a new token
    function registerToken(string memory name, string memory symbol) public {
        require(bytes(name).length > 0, "Token name cannot be empty");
        require(bytes(symbol).length > 0, "Token symbol cannot be empty");

        uint256 id = nextId;
        tokens[id] = Token(name, symbol, msg.sender, true);
        tokenIds.push(id);

        emit TokenRegistered(id, name, symbol, msg.sender);

        nextId++;
    }

    // Deactivate a token (only owner can do this)
    function deactivateToken(uint256 id) public {
        Token storage token = tokens[id];
        require(msg.sender == token.owner, "Only the owner can deactivate this token");
        require(token.isActive, "Token is already inactive");

        token.isActive = false;
    }

    // Get all info about a token
    function getToken(uint256 id) public view returns (string memory, string memory, address, bool) {
        Token storage token = tokens[id];
        return (token.name, token.symbol, token.owner, token.isActive);
    }

    // Get all registered token IDs
    function getAllTokenIds() public view returns (uint256[] memory) {
        return tokenIds;
    }
}