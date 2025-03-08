// AssetV ICO 

// version of the compiler
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
    function equity_in_assetv(address investor) external constant returns (uint) {
        return equity_assetv[investor];
    }

    //Getting the equity of USD of the investor 
    function equity_in_usd(address investor) external constant returns (uint) {
        return equity_usd[investor];
    }
}
