// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "./Bank.sol";

contract BankTest is Test {
    Bank bank;
    address user = address(0x123);

    function setUp() public {
        bank = new Bank();
        // give user some ETH for testing
        vm.deal(user, 10 ether);
    }

    function testDeposit() public {
        vm.prank(user);
        bank.deposit{value: 1 ether}();
        assertEq(bank.getBalance(user), 1 ether);
    }

    function testWithdraw() public {
        vm.prank(user);
        bank.deposit{value: 2 ether}();

        vm.prank(user);
        bank.withdraw(1 ether);

        assertEq(bank.getBalance(user), 1 ether);
    }

    function testCannotWithdrawMoreThanBalance() public {
        vm.prank(user);
        bank.deposit{value: 1 ether}();

        vm.prank(user);
        vm.expectRevert("Insufficient balance");
        bank.withdraw(2 ether);
    }

    function testBalanceUpdatesCorrectly() public {
        vm.prank(user);
        bank.deposit{value: 3 ether}();

        vm.prank(user);
        bank.withdraw(2 ether);

        assertEq(bank.getBalance(user), 1 ether);
    }
}
