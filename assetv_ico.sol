// AssetV ICO 

// version of the compiler
// SPDX-License-Identifier: UNLICENSED

pragma solidity >=0.4.21 <0.9.0;

contract assetv_ico {

    //total number of AssetV coins
    uint public max_assetv = 100000;

    //value of AssetV against USD
    uint public usd_to_assetv = 1000;

    //total number of assetv bought by the investors
    uint public total_assetv_bought =0;

    // mapping from investor's address to its equity in assetv to USD
    mapping (address => uint) equity_assetv;
    mapping (address => uint) equity_usd;

    //check if investor can buy assetv through modifier
    modifier check_max(uint usd_invested){
        require((usd_invested*usd_to_assetv + total_assetv_bought) <= max_assetv); 
        _;
    }

    //Getting the equity of assetv of the investor 
    function equity_in_assetv(address investor) external view returns (uint) {
        return equity_assetv[investor];
    }

    //Getting the equity of USD of the investor 
    function equity_in_usd(address investor) external view returns (uint) {
        return equity_usd[investor];
    }

    //buy assetv
    function buy_assetv(address investor, uint usd_invested) external //this is the function
    check_max(usd_invested) {   //modifier checks whether the investor can buy AssetV without exceeding the total supply 
        uint assetv_bought= usd_invested*usd_to_assetv; //This line calculates how many AssetV tokens the investor will receive
        equity_assetv[investor] +=assetv_bought; // Adds the bought tokens to the investor’s existing balance 
        equity_usd[investor] += usd_invested; //updating investor's total equity 
        total_assetv_bought += assetv_bought; //updating total assetV bought 
    }

    //selling assetv
    function sell_assetv(address investor, uint assetv_sold) external {     
        equity_assetv[investor] -=assetv_sold; 
        equity_usd[investor] = equity_assetv[investor] / 1000; 
        total_assetv_bought -= assetv_sold; 
    }
}