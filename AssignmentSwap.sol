// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import "./IUniswapV2Router02.sol";

error Unauthorised();
error Redundant();

contract ERC20Swapper {

  IUniswapV2Router02 public uniswapRouter;
  address public owner;

  event TokenSwapped(address indexed token, address indexed user, uint ethAmount, uint tokenAmount);

  constructor(address _uniswapRouter) {
    owner = msg.sender;
    uniswapRouter = IUniswapV2Router02(_uniswapRouter);
  }

  modifier onlyOwner() {
        if(msg.sender != owner) revert Unauthorised();
        _;
    }

  // For Upgradeability
  function updateRouterAddress(address _newRouter) external onlyOwner{
    if(_newRouter == address(uniswapRouter)) revert Redundant();
    uniswapRouter = IUniswapV2Router02(_newRouter);
  }

  // Swap Implementation
  function swapEtherToToken(address token, uint minAmount) external payable returns (uint256 amount) {
    address[] memory path = new address[](2);
    path[0] = uniswapRouter.WETH();
    path[1] = token;

    amount = uniswapRouter.swapExactETHForTokens{value: msg.value}(
      minAmount,
      path,
      msg.sender,
      block.timestamp
    )[1];
  }

}