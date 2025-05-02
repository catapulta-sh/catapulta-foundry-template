// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";

import {Lottery} from "../../src/course/Lottery.sol";

contract LotteryTest is Test {
    Lottery public lottery;
    address owner;
    address alice;
    address bob;

    function setUp() public {
        lottery = new Lottery();
        owner = address(this);
        alice = makeAddr("alice");
        bob = makeAddr("bob");
        vm.deal(alice, 1 ether);
        vm.deal(bob, 1 ether);
    }

    function testEnterLottery() public {
        vm.prank(alice);
        lottery.enter{value: 0.001 ether}();

        assertEq(lottery.getPlayers().length, 1);
        assertEq(lottery.getPlayers()[0], alice);
    }

    function testPickWinner() public {
        // Enter players
        vm.prank(alice);
        lottery.enter{value: 0.001 ether}();
        vm.prank(bob);
        lottery.enter{value: 0.001 ether}();

        // Pick winner
        lottery.pickWinner();

        // Check lottery was reset
        assertEq(lottery.getPlayers().length, 0);
    }
}
