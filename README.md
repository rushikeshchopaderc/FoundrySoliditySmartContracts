# FoundrySoliditySmartContracts
Smart Contracts in Foundry Framework

In Foundry, Precompiled Binaries refer to pre-built, optimized, and tested versions of the toolchain’s components, specifically:
Forge: a Rust-based Ethereum Virtual Machine (EVM) implementation
Cast: a Rust-based Ethereum JSON-RPC client
Anvil: a Rust-based Ethereum blockchain simulator
Chisel: a Rust-based Ethereum test framework

Installing Foundry: 
Step 1: Go to https://book.getfoundry.sh/ and run the given command on terminal $curl -L https://foundry.paradigm.xyz | bash
Step 2: Activate the terminal using this command $source /Users/rushi/.zshenv    
Step 3: Type command in the terminal to install all the 4 precompiled binaries $foundryup
Step 4: Initiate the git repo using this: $forge init
If there is some file present, then use $forge init --force . to download forcefully to the PWD.

