// SPDX-License-Identifier: MIT

/*
    $WHO AM I?

    In the hype of N, you will find,
    A word of power. Path aligned.

    Bois of the moon, degen at heart
    A word of Hope, the key does start

    Their brains are big but body smol
    A word of belief, it stands them tall

    Into the void, you must not go
    A word of darkness, will be on show

    The final word, does not appear
    Use your mind, shed not a tear

    Think long and hard the solution is clear
    Enter the key, have no fear.

    Telegram: https://t.me/** YOUR ANSWER **

*/

pragma solidity 0.8.7;

import "./Interfaces/uniswap/IUniswapV2Factory.sol";
import "./Interfaces/uniswap/IUniswapV2Pair.sol";
import "./Interfaces/uniswap/IUniswapV2Router02.sol";

import "./openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract WhoAmI is ERC20, Ownable {
    // Tight packing variables to save blockspace
    IUniswapV2Router02 private _uniswapV2Router;
    address private _uniswapV2Pair;    

    bool private _swapping;
    bool public limitsInEffect;
    bool private _isTradingActive;

    uint256 private _startAt;
    uint256 private _deadBlocks;
    
    uint256 public maxTxAmount;
    uint256 public maxWallet;

    uint256 public swapTokensAtAmount;

    uint256 private _buyMarketingFee;
    uint256 private _buyLiquidityFee;

    uint256 private _sellMarketingFee;
    uint256 private _sellLiquidityFee;

    uint256 private _tokensForMarketing;
    uint256 private _tokensForLiquidity;

    // exlcude from fees and max transaction amount
    mapping(address => bool) private _isExcludedFromFees;
    mapping(address => bool) private _isExcludedMaxTxAmount;
    mapping(address => bool) private automatedMarketMakerPairs;
    // blacklist snipers
    mapping(address => bool) public blacklist;
    
    // Events
    event ExcludeFromFees(address indexed account, bool isExcluded);
    event SetAutomatedMarketMakerPair(address indexed pair, bool indexed value);
    event FeeWalletUpdated(
        address indexed newWallet,
        address indexed oldWallet
    );
    event SwapAndLiquify(
        uint256 tokensSwapped,
        uint256 ethReceived,
        uint256 tokensIntoLiquidity
    );
    event SwapBack ();

    constructor() ERC20("Who Am I", "WAMI") {
        _uniswapV2Router = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);        
        _uniswapV2Pair = address(0);

        // Total supply 100,000,000,000
        uint256 totalSupply = 1e11 * 1e18;

        // Set default fees
        _buyMarketingFee = 10; // 1%
        _buyLiquidityFee = 20; // 2%

        _sellMarketingFee = 10; // 1%
        _sellLiquidityFee = 20; // 2%

        // Set fees for buy and sell side
        _buyFees = _buyMarketingFee + _buyLiquidityFee;
        _sellFees = _sellMarketingFee + _sellLiquidityFee;

        // Disable trading
        _isTradingActive = false;
        _startAt = 0;
        _deadBlocks = 5;
        limitsInEffect = true;

        // Set default limits
        maxTxAmount = (totalSupply * 25) / 1000; // 2.5% of total supply
        maxWallet = (totalSupply * 40) / 1000; // 4% of total supply

        // Set default fee wallet 
        _feeWallet = address(owner());

        // Set auto lp limit
        swapTokensAtAmount = (totalSupply * 30) / 10000;

        // exclude from paying fees or having max transaction amount
        excludeFromFees(owner(), true);
        excludeFromFees(address(this), true);
        excludeFromFees(address(0xdead), true);

        excludeFromMaxTransaction(owner(), true);
        excludeFromMaxTransaction(address(this), true);
        excludeFromMaxTransaction(address(0xdead), true);

        // Mint the initial supply to the contract.
        _totalSupply += ++totalSupply;
        unchecked {
            // Overflow not possible: balance + amount is at most totalSupply + amount, which is checked above.
            _balances[owner()] += totalSupply;
        }
        emit Transfer(address(0), owner(), totalSupply);

    }

    function createPair() external onlyOwner {
        require(_uniswapV2Pair == address(0), "Pair already created");
        // Create pair
        _uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
            .createPair(address(this), _uniswapV2Router.WETH());
        // Store the pair            
        _setAutomatedMarketMakerPair(address(_uniswapV2Pair), true);
    }

    function addLiquidity() external onlyOwner {        
        require(_uniswapV2Pair == address(0), "Pair already created");

        // Create pair
        _uniswapV2Pair = IUniswapV2Factory(_uniswapV2Router.factory())
            .createPair(address(this), _uniswapV2Router.WETH());
        // Store the pair            
        _setAutomatedMarketMakerPair(address(_uniswapV2Pair), true);
        // Add liquidity
        _addLiquidity(balanceOf(address(this)), address(this).balance);
    }

    function openTrading(uint256 deadblocks) external onlyOwner {
        require(!_isTradingActive, "Trade is already open");

        _isTradingActive = true;
        _deadBlocks = deadblocks;
        _startAt = block.number;
    }

    function removeLimits() external onlyOwner {
        limitsInEffect = false;
    }

    function updateLimits(uint256 _maxTxAmount, uint256 _maxWallet) external onlyOwner {
        require(limitsInEffect, "Cannot change at this stage");
        // Max TX amount cannot be less than 0.1%
        require(_maxTxAmount > ((totalSupply() * 1) / 1000), "Max TX is too low");
        // Max wallet cannot be less than 1%
        require(_maxWallet > ((totalSupply() * 10) / 1000), "Max wallet is too low");

        maxTxAmount = _maxTxAmount;
        maxWallet = _maxWallet;
    }

    function removeFromBlacklist(address account) external onlyOwner {
        require(blacklist[account] == true, "Account is not in the blacklist");
        blacklist[account] = false;
    }

    // change the minimum amount of tokens to sell from fees
    function updateSwapTokensAtAmount(uint256 newAmount)
        external
        onlyOwner
        returns (bool)
    {
        require(
            newAmount >= (totalSupply() * 1) / 100000,
            "Swap amount cannot be lower than 0.001% total supply."
        );
        require(
            newAmount <= (totalSupply() * 5) / 1000,
            "Swap amount cannot be higher than 0.5% total supply."
        );
        swapTokensAtAmount = newAmount;
        return true;
    }

    function updateFees(uint256 buyMarketingFee, uint256 buyLiquidityFee, uint256 sellMarketingFee, uint256 sellLiquidityFee)
        external
        onlyOwner
    {
        _buyMarketingFee = buyMarketingFee;
        _buyLiquidityFee = buyLiquidityFee;

        _sellMarketingFee = sellMarketingFee;
        _sellLiquidityFee = sellLiquidityFee;

        _buyFees = _buyMarketingFee + _buyLiquidityFee;
        _sellFees = _sellMarketingFee + _sellLiquidityFee;

        require(_buyFees <= 100, "Must keep fees at 10% or less");
        require(_sellFees <= 100, "Must keep fees at 10% or less");
    }

    function excludeFromFees(address account, bool excluded) public onlyOwner {
        _isExcludedFromFees[account] = excluded;
        emit ExcludeFromFees(account, excluded);
    }

    function excludeFromMaxTransaction(address account, bool excluded)
        public
        onlyOwner
    {
        _isExcludedMaxTxAmount[account] = excluded;
    }

    function _setAutomatedMarketMakerPair(address pair, bool value) private {
        automatedMarketMakerPairs[pair] = value;

        emit SetAutomatedMarketMakerPair(pair, value);
    }

    function updateFeeWallet(address newWallet) external onlyOwner {
        emit FeeWalletUpdated(newWallet, _feeWallet);
        _feeWallet = newWallet;
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal override {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");
        require(!blacklist[from], "ERC20: transfer from blacklisted account");
        require(amount > 0, "ERC20: amount must be greater than 0");

        if (!(_isExcludedFromFees[from] || _isExcludedFromFees[to])) require(_isTradingActive, "Trading is not active");
        
        uint256 totalTokensForSwap = _tokensForLiquidity + _tokensForMarketing;
        bool canSwap = totalTokensForSwap >= swapTokensAtAmount;
        if (
            canSwap &&
            !_swapping &&
            !automatedMarketMakerPairs[from] &&
            !_isExcludedFromFees[from] &&
            !_isExcludedFromFees[to]
        ) {
            _swapping = true;
            swapBack();
            _swapping = false;
        }

        bool takeFee = !_swapping;

        // if any account belongs to _isExcludedFromFee account then remove the fee
        if (_isExcludedFromFees[from] || _isExcludedFromFees[to]) {
            takeFee = false;
        }
        
        if (
            (!_isExcludedMaxTxAmount[from] && !_isExcludedMaxTxAmount[to]) &&
            (limitsInEffect && takeFee)
        ) {
            require(
                amount <= maxTxAmount,
                "Max transaction amount exceeded"
            );
            if (automatedMarketMakerPairs[from]) {
                require(
                    (amount + balanceOf(to)) <= maxWallet,
                    "Max wallet amount exceeded"
                );
            }
        }

        uint256 fees = 0;
        // only take fees on buys/sells, do not take on wallet transfers
        if (takeFee) {
            // when buy
            if (automatedMarketMakerPairs[from]) {
            //if (automatedMarketMakerPairs[from] && notContract(from)) {
                if ((block.number < _startAt + _deadBlocks)) {
                    blacklist[to] = true;
                }
                fees = (amount * _buyFees) / 1000;

                _tokensForLiquidity += (fees * _buyLiquidityFee) / _buyFees;
                _tokensForMarketing += (fees * _buyMarketingFee) / _buyFees;
            } 
            // when sell
            else if (automatedMarketMakerPairs[to]) {
                fees = (amount * _sellFees) / 1000;

                _tokensForLiquidity += (fees * _sellLiquidityFee) / _sellFees;
                _tokensForMarketing += (fees * _sellMarketingFee) / _sellFees;
            }

            if (fees > 0) {
                super._transfer(from, address(this), fees);
            }
            amount = amount - fees;
        }

        super._transfer(from, to, amount);
    }

    function _swapTokensForEth(uint256 tokenAmount) private {
        // generate the uniswap pair path of token -> weth
        address[] memory path = new address[](2);
        path[0] = address(this);
        path[1] = _uniswapV2Router.WETH();

        _approve(address(this), address(_uniswapV2Router), tokenAmount);

        // make the swap
        _uniswapV2Router.swapExactTokensForETHSupportingFeeOnTransferTokens(
            tokenAmount,
            0, // accept any amount of ETH
            path,
            address(this),
            block.timestamp
        );
    }

    function _addLiquidity(uint256 tokenAmount, uint256 ethAmount) private {
        // approve token transfer to cover all possible scenarios
        _approve(address(this), address(_uniswapV2Router), tokenAmount);

        // add the liquidity
        _uniswapV2Router.addLiquidityETH{value: ethAmount}(
            address(this),
            tokenAmount,
            0, // slippage is unavoidable
            0, // slippage is unavoidable
            owner(),
            block.timestamp
        );
    }

    function swapBack() private {
        uint256 contractBalance = balanceOf(address(this));
        uint256 totalTokensToSwap = _tokensForLiquidity + _tokensForMarketing;

        if (contractBalance == 0 || totalTokensToSwap == 0) return;
        if (contractBalance > swapTokensAtAmount) {
            contractBalance = swapTokensAtAmount;
        }
        emit SwapBack();

        uint256 liquidityTokens = (contractBalance * _tokensForLiquidity) /
            totalTokensToSwap /
            2;
        uint256 amountToSwapForETH = totalTokensToSwap - liquidityTokens;

        uint256 initialETHBalance = address(this).balance;

        _swapTokensForEth(amountToSwapForETH);

        uint256 ethBalance = address(this).balance - initialETHBalance;
        uint256 ethForMarketing = (ethBalance * _tokensForMarketing) /
            totalTokensToSwap;
        uint256 ethForLiquidity = ethBalance - ethForMarketing;

        _tokensForLiquidity = 0;
        _tokensForMarketing = 0;

        payable(_feeWallet).transfer(ethForMarketing);

        if (liquidityTokens > 0 && ethForLiquidity > 0) {
            _addLiquidity(liquidityTokens, ethForLiquidity);
            emit SwapAndLiquify(
                amountToSwapForETH,
                ethForLiquidity,
                _tokensForLiquidity
            );
        }
    }

    function forceSwap() external {
        swapBack();
    }

    function forceSend() external {
        payable(_feeWallet).transfer(address(this).balance);
    }

    receive() external payable {}
}