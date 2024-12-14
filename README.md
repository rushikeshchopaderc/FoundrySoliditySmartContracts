# FoundrySoliditySmartContracts
Smart Contracts in Foundry Framework
Important Notes: 
1) Never save your private key to vscode while working with forge.
2) Get your testETH for Sepolia Network from infura. This is the official tieup of metamask with ethereum foundation. Open a metamask developer account, connect to metamask, login to infura and then paste the address where you want to receive the SepoliaETH. Link: https://docs.metamask.io/developer-tools/faucet/ 
3) Additional resources: Base Documnetation of foundry commands: https://docs.base.org/tutorials/deploy-with-foundry/ 

In Foundry, Precompiled Binaries refer to pre-built, optimized, and tested versions of the toolchain’s components, specifically:
Forge: a Rust-based Ethereum Virtual Machine (EVM) implementation. It can also depoly smart contracts.
Cast: a Rust-based Ethereum JSON-RPC client. This has commands like cast wallet, cast send, cast call, etc. Also used to interact with the smart contracts.
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


############# PART 1: Compiling the Code with foundry #############
%forge compile
OR
% forge build

############# PART 2: Deploying the Smart Contract with A) Command line and B) Writing Scripts ##################
Deploying a contract to local blockchain using anvil - Ganache was used priorly, but it is deprecated. So foundry-anvil is the best resource for testing the smart contracts. Anvil is basically the javascript virtual environment for testing, It provides some dummy accounts with fake ether balance. To work with anvil, you need to Make a localhost on metamask. Follow these steps.
Step 1: Add your local RPC network to Metamask(Looks like an IP: 127.0.0.1:8545). Metamask-> Account-> select a network-> Add a custom Network
Step 2: Add the RPC to it. Also add the chain id for anvil as 31337. set current currency to ETH and leave the blockchain explorer field empty as local blockchain does not have a blockchain explorer.
Step 3: Copy paste one of the account that you can see on the terminal for anvil and make a new metamask account for the same. You will see 10000 testETH there.

A) Command line: Deploying a smart contract to a local blockchin using forge
REMEMBER: Never save your private key to vscode while working with forge. Its bad to have it in shell/bash history. Never enter it in the text format. It can be hacked very easily. Multimillion doller companies have gone barkrupt because of this.

Step 1: type the command %forge create ContractName --interactive (If it throws error, this might be because of the rpc is not right. OR you want to deploy to any other blockchain instead of foundry. In such situation add this argument to the above command --rpc-url http://127.0.0.1:8545)
Note: If you have multiple files with similar name follow this full command to deploy $forge create src/SimpleStorage.sol:SimpleStorage --interactive
Step 2: Enter the private key that you have obtained from the dummy account on anvil and enter. The contract will be deployed. You won't be able to see the logs though.


B) Writing Scripts(Better way- has more features):Deploying a smart contract using Anvil:
You need to write the tests and deployment script as well along with the smart contracts.
Step 1: Make a solidity script for deploying in the script folder. Naming convention : YOUR-DEPLOYMENT-CONTRACT.s.sol

Step 2: Use command line to compile the deployment script % forge script script/YOUR-DEPLOYMENT-CONTRACT.s.sol
If the rpc url is not defined, the smart contract is deployed to the local anvil chain by default. To deploy to other testnets, you need to use this command 
% forge script script/YOUR-DEPLOYMENT-CONTRACT.s.sol --rpc-url http://127.0.0.1:8545 (This is anvil url, you can pass in any other rpc url. This is a simulation deployment. This will make a broadcast folder in the parent folder which maintains all logs of deployment)

Step 3: Instead of simulation, you can also broadcast the smart contract to acutal blockchain using this command 
% forge script script/YOUR-DEPLOYMENT-CONTRACT.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --private key "YOUR-PRIVATE-KEY"
Note: 
- This is not a good practise to write the private key in the terminal. Though this is not a good practice when it comes to actual mainnet deployment purposes. 
1) Once you create this .env file, mention it in the .gitignore file. 
2) After that run the command to add the environment variables to the terminal -> $source .env
3) Finally run this command 
$forge script script/YOUR-DEPLOYMENT-CONTRACT.s.sol --rpc-url RPC_URL --broadcast --private key PRIVATE_KEY
- For real money, We mask the .env file with a password, so that the private key is also encrypted. We will either use a keystore file with a password OR use --interactive keyword in the command line. Alternatively Use DApp tools like Ethsign. MUST DO: READ and Sign the pledge to use the private key safely. It is present in the github repo of cyfrin/foundry-full-course-cu
-USE A SEPERATE BRAND NEW METAMASK FOR TESTING AND DEPLOYMENT TO AVOID SECURITY COMPROMISES. YOU CAN USE ANOTHER BROWSER PROFILE ACCOUNT AND DOWNLOAD AND USE IT THERE FOR ALL THE DEVELOPMENT PURPOSES.
-UPDATE: ERC-2335 is a new protocol to encrypt the private key into a json format. you can access it like this
% forge script script/OUR-DEPLOYMENT-CONTRACT.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --account defaultKey --sender "defalultKey_ADDRESS"
To get defaultKey_ADDRESS, use the Foundry "cast" binary. Type command in the terminal(Use Mac Terminal and not the VSCode terminal, there might be some bug which could compromise the whole project.) 
$cast wallet import defaultKey --interactive
Then paste the private key into it. Also create a password for this defaultKey file. REMEMBER THIS PASSWORD. Once the password is pasted you will get an address to the defaultKey file(0xf39fd6e51aad88f6f4ce6ab8827279cfffb92266). ENTER THIS ADDRESS WHILE USING 'forge script' command. 
use command to view all the keystores in .foundry/keystores present in foundry->  $cast wallet list OR $cd .foundry/keystores followed by ls
Use to delete the zsh history: %history -p

Step 4: The terminal will show the address of the deployed contract address along with other important details like hash, gas fees, etc. 
(== Return ==
0: contract SimpleStorage 0x7FA9385bE102ac3EAc297483Dd6233D62b3e1496).
If it is a contract on some testnet/mainnet, you can view it on the blockchain explorer as well.

Additional tips: you can use this Foundry cast command from its 'cast' precompiled binary to convert hexadecimal to decimal number for reading smart contract values for gas etc. 
$cast --to-base 0x10 dec

C) Deploying to TestNet (Sepolia) using Alchemy:
Step 1: Create a new app on Alchemy and add it's RPC to Metamask.
 My RPC URL from Alchemy Sepolia Network on ethereum chain looks like this: https://eth-sepolia.g.alchemy.com/v2/k4r3l8SlLldMh1mWvRAezMErwoWJReX9  
 
Step 2: Add the private key of the metamask account in a seperate keystore file. Note: If you are unable to deploy and getting gas overload error, try recreating the keystore file.
% cast wallet import SepoliaTestnetKey --interactive
The Address to keystore file is 0x9340c3c9ab2d739d03962cbe5b47950a352795ba

Step 3: Use the command to deploy to the testnet ()
 % forge script script/YOUR-DEPLOYMENT-CONTRACT.s.sol --rpc-url https://eth-sepolia.g.alchemy.com/v2/ALCHEMY_API_KEY --broadcast --account "KEYSTORE_FILENAME" --sender "KEYSTORE_FILENAME_ADDRESS"
e.g. 
% forge script script/DeploySimpleStorage.s.sol --rpc-url https://eth-sepolia.g.alchemy.com/v2/k4r3l8SlLldMh1mWvRAezMErwoWJReX9 --broadcast --account SepoliaTestnetKey --sender 0x9340c3c9ab2d739d03962cbe5b47950a352795ba
The contract address obtained after this step is important. Will be used to interact with the smart contract in the future. 
Contract address in this case: 0x5555Bf39421aF005BAE126E39BcdbC8257b6eF35

############# PART 3: Interacting with the Smart Contract with A) Command line and B) Writing Scripts ##################

A) Command line: Using foundry cast binary to interact with the smart contract
- To sign and punlish transaction(used for nonpayable and payable functions) % cast send 
- to perform a call on an account without publishing a transaction(used for pure and view functions) % cast call 
- To get the balance of the account in wei % cast balance
- to get the EIP-1967 admin account % cast admin
- to get the base fee of the block % cast base-fee
- To get the Ethereum chain-id % cast chain-id
- To get the gas price % cast gas-price
- To get the gas limit % cast gas-limit
- To get the nonce of the account % cast nonce
- To get the contract creation code from etherscan/ other RPC % cast creation-code
- To get the gas estimate of a transaction % cast estimate
- To get the decimal representation of the hex value % cast --to-base
- To get information about the transaction % cast tx

1) To send the transaction/ call a payable/nonpayable function, use
% cast send "CONTRACT-ADDRESS" "FUNCTION-NAME(ARGUMENTS)" "VALUES-FOR-ARGUMENTS" "RPC_URL" --keystore "KEYSTORE_PATH"
e.g. % cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "store(uint256)" 34 --rpc-url http://127.0.0.1:8545 --keystore /Users/rushi/.foundry/keystores/defaultKey 
OR 
% cast send "CONTRACT-ADDRESS" "FUNCTION-NAME(ARGUMENTS)" "VALUES-FOR-ARGUMENTS" "RPC_URL" --account "keystore_filename"
e.g. % cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "store(uint256)" 34 --rpc-url http://127.0.0.1:8545 --account defaultKey

Optionally, you can augument --password argument in the same line to avoid the pop up line to enter the password. But it is better not to do so for visibility purposes.

2) To call a view function, use
% cast call "CONTRACT-ADDRESS" "FUNCTION-NAME(ARGUMENTS)" 
e.g. % cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "retrieve()"
OR
e.g. % cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "retrieve()" --rpc-url http://127.0.0.1:8545 --account defaultKey

B) Writing Scripts:



############# PART 4: Testing the Smart Contract with A) Command line and B) Writing Scripts ##################
Testing a smart contract using Anvil:





