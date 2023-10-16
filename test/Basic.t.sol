// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Trebuchet.sol";

contract TestTrebuchet is Test {
    Trebuchet c;

    function setUp() public {
        c = new Trebuchet(1);
    }

    function testData() public {
        assertEq(c.getAttackDamage(), 1);
    }
}
