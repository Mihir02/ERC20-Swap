# ERC20 Swap

## Introduction

This project is a smart contract for swapping ERC20 tokens, implementing the following interface:

```solidity
interface ERC20Swapper {
    /// @dev swaps the `msg.value` Ether to at least `minAmount` of tokens in `address`, or reverts
    /// @param token The address of ERC-20 token to swap
    /// @param minAmount The minimum amount of tokens transferred to msg.sender
    /// @return The actual amount of transferred tokens
    function swapEtherToToken(address token, uint minAmount) public payable returns (uint);
}
```

## Getting Started

To get started with this project, follow these steps:

1. Clone the repository.
2. Install the necessary dependencies.
3. Compile the smart contract.
4. Deploy the smart contract.

## View The Deployed & Verified Contract

The smart contract has been deployed to the Sepolia testnet and can be viewed on Etherscan [here](https://sepolia.etherscan.io/address/0xdb13331431c402cff33bc46dbb68cafae92c443c#code).

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
