// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script} from "forge-std/Script.sol";
import {Trebuchet} from "../src/Trebuchet.sol";

contract DeployTrebuchet is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        new Trebuchet(200);

        vm.stopBroadcast();
    }
}
