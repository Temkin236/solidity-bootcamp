# Solidity Bootcamp - Day 3: Inheritance & Libraries

This project demonstrates two important concepts in Solidity:

## Task 1: Inheritance
- Base contract: `Animal`
- Child contracts: `Dog` and `Cat`
- Virtual function `speak()` in `Animal` is overridden in child contracts
- Example usage:
```solidity
Dog dog = new Dog();
dog.speak(); // "Bark"

Cat cat = new Cat();
cat.speak(); // "Meow"