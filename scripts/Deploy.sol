// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script} from "forge-std/Script.sol";
import {BatteringRam} from "../src/BatteringRam.sol";
import {Catapult} from "../src/Catapult.sol";
import {Trebuchet} from "../src/Trebuchet.sol";

contract DeploySiege is Script {
    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        new BatteringRam(50);
        new Catapult(100);
        new Trebuchet(200);

        vm.stopBroadcast();
    }
}
