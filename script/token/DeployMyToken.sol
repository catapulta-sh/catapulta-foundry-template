// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {MyToken} from "../../src/tokens/MyToken.sol";

contract DeployMyToken is Script {
    function run() public returns (MyToken) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);
        MyToken token = new MyToken(1000000 * 10 ** 18);
        vm.stopBroadcast();

        return token;
    }
}
