// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {MyToken} from "../../src/tokens/MyToken.sol";

contract MyTokenTest is Test {
    MyToken public token;
    address public owner = address(1);
    address public user = address(2);
    uint256 public constant INITIAL_SUPPLY = 1000000 * 10 ** 18;

    function setUp() public {
        vm.startPrank(owner);
        token = new MyToken(INITIAL_SUPPLY);
        vm.stopPrank();
    }

    function testInitialSupply() public {
        assertEq(token.totalSupply(), INITIAL_SUPPLY);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY);
    }

    function testTransfer() public {
        uint256 amount = 1000 * 10 ** 18;
        vm.prank(owner);
        token.transfer(user, amount);
        assertEq(token.balanceOf(user), amount);
        assertEq(token.balanceOf(owner), INITIAL_SUPPLY - amount);
    }

    function testFailTransferInsufficientBalance() public {
        vm.prank(owner);
        token.transfer(user, INITIAL_SUPPLY + 1);
    }
}
