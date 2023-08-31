// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import {Library} from './Library.sol';

contract Basic {
  uint256 internal data;

  constructor(uint256 _data) {
    data = _data;
  }

  function getData() external view returns (uint256) {
    return data;
  }

  function test() external pure returns (string memory) {
    return 'THIS IS A TEST';
  }

  function sum(uint256 a, uint256 b) external pure returns (uint256) {
    return Library.add(a, b);
  }
}
