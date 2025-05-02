// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";

import {Lottery} from "../../src/course/Lottery.sol";

contract DeployLottery is Script {
    function run() external {
        vm.broadcast();
        Lottery lottery = new Lottery();
        console.log("Lottery deployed at:", address(lottery));
    }
}