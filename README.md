# FoundrySoliditySmartContracts
Smart Contracts in Foundry Framework
Important Notes: 
1) Never save your private key to vscode while working with forge.
2) Get your testETH for Sepolia Network from infura. This is the official tieup of metamask with ethereum foundation. Open a metamask developer account, connect to metamask, login to infura and then paste the address where you want to receive the SepoliaETH.

In Foundry, Precompiled Binaries refer to pre-built, optimized, and tested versions of the toolchain’s components, specifically:
Forge: a Rust-based Ethereum Virtual Machine (EVM) implementation. It can also depoly smart contracts.
Cast: a Rust-based Ethereum JSON-RPC client
Anvil: a Rust-based Ethereum blockchain simulator. Similar to ganache. Used to test the smart contracts. Has some fake accounts with some balance (10000 ETH) and the private keys. It also has an RPC.
Chisel: a Rust-based Ethereum test framework

Installing Foundry: 
#Step 1: Go to https://book.getfoundry.sh/ and run the given command on terminal $curl -L https://foundry.paradigm.xyz | bash
#Step 2: Activate the terminal using this command $source /Users/rushi/.zshenv    
#Step 3: Type command in the terminal to install all the 4 precompiled binaries $foundryup
#Step 4: Initiate the git repo using this: $forge init
If there is some file present, then use $forge init --force . to download forcefully to the PWD.
Folders formed from above command and their use:
scripts folder- write scripts for deploying the smart contract
scr folder- contains all the smart contracts
tests folder- contains all the test cases.
#Step 5: Install the VS code extensions for Solidity and toml.

Compiling the Code with foundry
$ forge compile

Deploying a contract to local blockchain using anvil - Ganache was used priorly, but it is deprecated. So foundry-anvil is the best resource for testing the smart contracts. Anvil is basically the javascript virtual environment for testing, It provides some dummy accounts with fake ether balance. To work with anvil, you need to Make a localhost on metamask. Follow these steps.
Step 1: Add your local RPC network to Metamask(Looks like an IP: 127.0.0.1:8545). Metamask-> Account-> select a network-> Add a custom Network
Step 2: Add the RPC to it. Also add the chain id for anvil as 31337. set current currency to ETH and leave the blockchain explorer field empty as local blockchain does not have a blockchain explorer.
Step 3: Copy paste one of the account that you can see on the terminal for anvil and make a new metamask account for the same. You will see 10000 testETH there.

Deploying a smart contract to a local blockchin using forge
REMEMBER: Never save your private key to vscode while working with forge. Its bad to have it in shell/bash history. Never enter it in the text format. It can be hacked very easily. Multimillion doller companies have gone barkrupt because of this.
Step 1: type the command $forge create ContractName --interactive (If it throws error, this might be because of the rpc is not right. OR you want to deploy to any other blockchain instead of foundry. In such situation add this argument to the above command --rpc-url http://127.0.0.1:8545)
Step 2: Enter the private key that you have obtained from the dummy account on anvil and enter. The contract will be deployed. You won't be able to see the logs though.

Deploying a smart contract using Anvil:
You need to write the tests and deployment script as well along with the smart contracts.
Step 1: Make a solidity script for deploying in the script folder. Naming convention : YOUR-DEPLOYMENT-CONTRACT.s.sol
Step 2: Use command line to compile the deployment script $ forge script script/YOUR-DEPLOYMENT-CONTRACT.s.sol
If the rpc url is not defined, the smart contract is deployed to the local anvil chain by default. To deploy to other testnets, you need to use this command





