// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.20;

import "forge-std/Test.sol";

import "src/Trebuchet.sol";

contract TestTrebuchet is Test {
    Trebuchet c;

    function setUp() public {
        c = new Trebuchet(1, address(this));
    }

    function testGetDamage() public {
        assertEq(c.getAttackDamage(), 1);
    }
}
