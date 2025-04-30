# <h1 align="center"> Catapulta.sh Foundry Template</h1>
Template repository for getting started quickly with [Catapulta.sh](https://catapulta.sh/docs) smart contracts development platform for Foundry projects.



## Getting Started - Dev Container
Get onboarded faster using Docker with a developer environment ready to build and deploy Solidity smart contracts:
- Click here to open a Solidity environment in Cursor:
  - [![Dev Container - Cursor](https://img.shields.io/static/v1?label=Dev%20Container&logo=docker&message=Open%20in%20Cursor&color=black&style=for-the-badge)](https://tinyurl.com/25msv9bd)  


- Click here to open a Solidity environment in VSCode:
  - [![Dev Container - Vscode](https://img.shields.io/static/v1?label=Dev%20Container&message=Open%20in%20VSCode&color=blue&logo=docker&style=for-the-badge)](https://vscode.dev/redirect?url=vscode://ms-vscode-remote.remote-containers/cloneInVolume?url=https://github.com/catapulta-sh/catapulta-foundry-template)



Once your IDE loads the Dev Container, proceed to [Deploy your first contract with Catapulta](#deploy-your-first-contract-with-catapulta) section.


## Getting Started - Git

Requirements

- [Git](https://gist.github.com/derhuerst/1b15ff4652a867391f03)
- [Node.js](https://gist.github.com/d2s/372b5943bce17b964a79)
- [Foundry](https://book.getfoundry.sh/)

Click "Use this template" on [GitHub](https://github.com/catapulta-sh/catapulta-foundry-template) to get started quickly.

You can also git clone this repository and enter to the repository directory:

```
git clone https://github.com/catapulta-sh/catapulta-foundry-template
cd catapulta-foundry-template
```

## Deploy your first smart contracts with Catapulta

1. Install forge dependencies

```
forge install
```

2. Install catapulta via `npm`

```
npm i -g catapulta
```

3. Deploy smart contracts in Base Sepolia testnet with Catapulta, using `--sponsor` flag to request testnet gas for free.

```
catapulta script script/Deploy.s.sol --network baseSepolia --sponsor
```

> This tool will automatically create a new encrypted account named `CATAPULTA_DEPLOYER` via Foundry `cast wallet import` if you don't provide any keystore account via `--account` param.

The command will build and proceed to broadcast your deployment script to the desired network without RPC configs.
```
# Output:
Catapulta.sh 🏏 Forge script deployment (0.4.1)
================================================
Project name: Ghost Deployments
Project URL: https://catapulta.sh/project/6116272a59b37a3a4a7afb55
Deployment UUID: 592a91ad-57c8-42c6-b37e-2af0e170f31a

📀 Building artifacts...

🗜  Compressing artifacts...

📤 Uploading artifacts to the Catapulta DB...

✅ Artifacts uploaded successfully.

📡 Broadcasting deployments to Catapulta Gateway RPC:

📜 Running Foundry script: forge script scripts/DeployBasic.sol --broadcast

[...]

✅ Deployment successfully broadcasted

- Etherscan verification request sent. Check the dashboard for keeping track of verifications. If contracts are not verified in 10 minutes, contact support at Discord.

💾 Artifacts stored at:
- https://users-artifacts.s3.eu-west-1.amazonaws.com/595a911d-57c8-42c6-b37e-2af0e170f31a-deployment-artifacts/artifacts.zip

📸 Check your deployment report at:
 - https://catapulta.sh/project/6416272a59b37a3a4a7afb55/op/595a91ad-57c8-42c6-b37e-2af0e170f31a
```

4. Check the deployment report at the Catapulta UI, and enjoy automated block explorer verification in Etherscan, Blockscout and Sourcify without any extra configs.

<img src="https://catapulta.sh/img/report.png" style="max-width: 800px; width: 100%;">

### Other useful commands

Import older deployments in Catapulta and trigger verification in block explorers:
```
catapulta import broadcast/[Deploy.s.sol]/[Chain ID]/run-latest.json
```

Create or view your deployer wallet address:
```
catapulta wallet
```

Sign in and open the Catapulta dashboard UI:
```
catapulta login
```

## Development

This project uses [Foundry](https://getfoundry.sh) and [Catapulta](https://catapulta.sh/docs).
