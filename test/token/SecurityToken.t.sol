// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {SecurityToken} from "../../src/tokens/SecurityToken.sol";

contract SecurityTokenTest is Test {
    SecurityToken public token;
    address public owner;
    address public alice;
    address public bob;

    function setUp() public {
        owner = address(this);
        alice = address(0x1);
        bob = address(0x2);

        // Deploy token
        token = new SecurityToken("Security Token", "STKN", owner);

        // Add alice and bob to identity registry
        token.addToIdentityRegistry(alice);
        token.addToIdentityRegistry(bob);

        // Mint initial tokens to alice
        token.mint(alice, 1000);
    }

    function testInitialSetup() public {
        assertEq(token.name(), "Security Token");
        assertEq(token.symbol(), "STKN");
        assertEq(token.balanceOf(alice), 1000);
    }

    function testTransferBetweenVerifiedAddresses() public {
        vm.prank(alice);
        token.transfer(bob, 500);
        assertEq(token.balanceOf(alice), 500);
        assertEq(token.balanceOf(bob), 500);
    }

    function testFailTransferToUnverifiedAddress() public {
        address unverified = address(0x3);
        vm.prank(alice);
        token.transfer(unverified, 500);
    }

    function testFailTransferWhenFrozen() public {
        token.freezeTransfers();
        vm.prank(alice);
        token.transfer(bob, 500);
    }

    function testIdentityRegistryManagement() public {
        address charlie = address(0x4);
        assertFalse(token.identityRegistry(charlie));

        token.addToIdentityRegistry(charlie);
        assertTrue(token.identityRegistry(charlie));

        token.removeFromIdentityRegistry(charlie);
        assertFalse(token.identityRegistry(charlie));
    }
}
