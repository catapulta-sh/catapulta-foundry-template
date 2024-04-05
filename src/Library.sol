// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

library Library {
  function add(uint256 a, uint256 b) external pure returns (uint256) {
    return a + b;
  }

  function getConstant() external pure returns (uint256) {
    return 1;
  }
}
