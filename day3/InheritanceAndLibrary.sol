// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// -----------------------------
// Task 1: Inheritance
// -----------------------------

// Base contract
contract Animal {
    // Virtual function to allow override in child contracts
    function speak() public pure virtual returns (string memory) {
        return "Some sound";
    }
}

// Child contract Dog
contract Dog is Animal {
    function speak() public pure override returns (string memory) {
        return "Bark";
    }
}

// Child contract Cat
contract Cat is Animal {
    function speak() public pure override returns (string memory) {
        return "Meow";
    }
}

// -----------------------------
// Task 2: Library
// -----------------------------

library MathLib {
    function sub(uint a, uint b) internal pure returns (uint) {
        require(b <= a, "Underflow");
        return a - b;
    }

    function multiply(uint a, uint b) internal pure returns (uint) {
        return a * b;
    }
}

// Contract using the library
contract Calculator {
    using MathLib for uint;

    function subtract(uint a, uint b) public pure returns (uint) {
        return a.sub(b);
    }

    function multiply(uint a, uint b) public pure returns (uint) {
        return a.multiply(b);
    }
}