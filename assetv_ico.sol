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
    

}
