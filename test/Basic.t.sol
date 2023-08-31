// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

import "src/Basic.sol";

contract TestContract is Test {
    Basic c;

    function setUp() public {
        c = new Basic(1);
    }

    function testBar() public {
        assertEq(uint256(1), uint256(1), "ok");
    }

    function testData() public {
        assertEq(c.getData(), 1);
    }
}
