// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Basic} from "./Basic.sol";

contract MultiDeployment {
    uint256 public test;

    constructor(uint256 _test) {
        test = _test;
        bytes32 salt = keccak256("test2");
        new Basic(4);
        new Basic{salt: salt}(3);
    }

    function testFactoryDeployment() external {
        bytes32 salt = keccak256("test2");
        new Basic(10);
        new Basic{salt: salt}(11);
    }
}
