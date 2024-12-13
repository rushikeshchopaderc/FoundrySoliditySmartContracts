// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

// Importing some interfaces via external imports
import {Script} from "../lib/forge-std/src/Script.sol";
import {SimpleStorage} from "../src/SimpleStorage.sol";

// Remember that this contract name should be differnt from the src/SimpleStorage.sol contract name. Otherwise you will get an error.
contract DeploySimpleStorage is Script{ // This is class inheritance from script.
    function run() external returns(SimpleStorage){
        // vm is a cheetcode that can only be used in foundry.
        vm.startBroadcast(); // Anything inside the startBroadcast() and stopBroadcast() functions will be sent to the rpc to broadcast to the blockchain.
        SimpleStorage simpleStorage = new SimpleStorage();
        vm.stopBroadcast();
        return simpleStorage; // Returns a smart contract which has been broadcasted.
    }
}