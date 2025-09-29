https://www.youtube.com/watch?v=fNMfMxGxeag
## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

- **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
- **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
- **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
- **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

forge --version
### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
/* important links 
https://sepolia.etherscan.io/
https://www.quicknode.com/docs/ethereum/eth_sendRawTransaction
https://ethereum.org/developers/docs/transactions/

*/

''''forge compile or forge build '''  to run

anvil for fake accounts blockchain
OR

ganache for blockchain

forge --version
forge init
forge init --force . (if incase already exist foundry)

//Deploy contract
forge --help
forge create --help
forge build
forge compile
forge create SimpleStorage --interactive
forge script script/DeploySimpleStorage.s.sol   //automatically deploy to temporary blockchainn
forge create src/SimpleStorage --rpc-url http://127.0.0.1:8545 --interactive 
forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545   //deploy the contract
forge script script/DeploySimpleStorage.s.sol --rpc-url http://127.0.0.1:8545 --broadcast --private-key  0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80   --onchain deploy
history -c  // to remove history from terminal
cast --to-base 0xb296a dec
cast --help
npx thirdweb deploy -k nrp7sFcg9uaXWSLUl3F82_au5hY-Rlt3WBJvL6DUckw0IHpVS5KZFcLOZaIIESzcQday7NsguXn-1lBlTTkKsg
cast send --help   /// It is like yellow button in store
//to interact with contract in commandline
'' cast send 0x5FbDB2315678afecb367f032d93F642f64180aa3 "store(uint256)" 123 --rpc-url http://127.0.0.1:8545 --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 ''   //to send value from terminal

//This is to store value set

cast call --help // This is like Blue button in Store Transaction
cast call 0x5FbDB2315678afecb367f032d93F642f64180aa3 "retrieve()"
cast --to-base 0x000000000000000000000000000000000000000000000000000000000000007b dec

//run.latest.json in broadcast for latest run
source .env  // to upload .env file
echo $PRIVATE_KEY


// To deploy on Real Testnet Alchemy
source .env
forge script script/DeploySimpleStorage.s.sol --rpc-url $Sepolia_RPC_URL --private-key $PRIVATE_KEY --broadcast
