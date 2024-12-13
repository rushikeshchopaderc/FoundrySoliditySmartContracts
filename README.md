# FoundrySoliditySmartContracts
Smart Contracts in Foundry Framework
REMEMBER: Never save yoir private key to vscode while working with forge

In Foundry, Precompiled Binaries refer to pre-built, optimized, and tested versions of the toolchain’s components, specifically:
Forge: a Rust-based Ethereum Virtual Machine (EVM) implementation
Cast: a Rust-based Ethereum JSON-RPC client
Anvil: a Rust-based Ethereum blockchain simulator. Similar to ganache. Used to test the smart contracts. Has some fake accounts with some balance (10000 ETH) and the private keys. It also has an RPC.
Chisel: a Rust-based Ethereum test framework

Installing Foundry: 
Step 1: Go to https://book.getfoundry.sh/ and run the given command on terminal $curl -L https://foundry.paradigm.xyz | bash
Step 2: Activate the terminal using this command $source /Users/rushi/.zshenv    
Step 3: Type command in the terminal to install all the 4 precompiled binaries $foundryup
Step 4: Initiate the git repo using this: $forge init
If there is some file present, then use $forge init --force . to download forcefully to the PWD.
Step 5: Install the VS code extensions for Solidity and toml.

Compiling the Code with foundry
$ forge compile

Deploying a contract to local blockchain using anvil
Step 1: Add your local RPC network to Metamask. Metamask-> Settings->
Step 2: Add the RPC to it. Also add the chain id for anvil as 31337. set current currency to ETH and leave the blockchain explorer field empty as local blockchain does not have a blockchain explorer.

Deploying a smart contract to a local blockchin using forge
REMEMBER: Never save yoir private key to vscode while working with forge. Its bad to have it in shell/bash history.
Step 1:

