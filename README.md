# My ERC-20 Token – My Learning Token (MLT)

This repository contains a simple ERC-20 style token built on an Ethereum test network for learning purposes.

## Token Details
- **Name:** My Learning Token
- **Symbol:** MLT
- **Decimals:** 18
- **Initial Supply:** "1000000000000000000" tokens  
  (internally multiplied by 10^18 and minted to the deployer address)

## Tools Used
- **Remix IDE** – to write, compile, and deploy the Solidity smart contract
- **MetaMask** – to manage accounts and sign transactions on the testnet
- **Sepolia** – Ethereum test network funded via a faucet

## What I Implemented
- Basic ERC-20 state variables (name, symbol, decimals, totalSupply)
- Balance tracking with balanceOf
- Allowances using allowance[owner][spender]
- transfer for direct token transfers
- approve for giving spending permission
- transferFrom for delegated transfers using the approved allowance
- Events Transfer and Approval for transparency

## How I Tested
1. Deployed the contract on Sepolia using Remix and MetaMask.
2. Verified totalSupply, decimals, and my own balanceOf.
3. Sent tokens between accounts using transfer.
4. Used approve to set an allowance.
5. Successfully called transferFrom to move tokens from the owner to another account and confirmed balances and updated allowance.
6. Collected screenshots for each important step (stored in /screenshots).

## Biggest Challenge & How I Solved It
My biggest challenge was getting transferFrom to work. I kept getting “gas estimation failed” because the allowance did not match the caller address and amount.  
I fixed this by carefully checking allowance(from, spender), understanding how msg.sender is used in transferFrom, and then approving the correct address with the correct 18-decimal amount.

## Security Practice I Learned
The most important security practice I learned was to keep my wallet recovery seed phrase completely private and stored offline.  
I also got used to double-checking contract addresses, function inputs, and gas details in MetaMask before confirming any transaction.

## My Understanding of Gas Fees
A gas fee is a small amount of cryptocurrency paid to the network for processing a transaction.  
It rewards validators/miners for executing my smart contract code and helps prevent spam by making large numbers of transactions expensive.

## Screenshots
All screenshots of compilation, deployment, transfers, approvals, and delegated transfers are available in the screenshots/ folder.
