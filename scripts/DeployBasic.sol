// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {MultiDeployment} from "../src/MultiDeployment.sol";
import {Basic} from "../src/Basic.sol";

contract Deploy is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        new Basic(1);

        MultiDeployment test = new MultiDeployment(5);

        test.testFactoryDeployment();

        vm.stopBroadcast();
    }
}
