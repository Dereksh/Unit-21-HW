pragma solidity ^0.5.5;

import "./Puppercoin.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/Crowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/emission/MintedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/CappedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/validation/TimedCrowdsale.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/crowdsale/distribution/RefundablePostDeliveryCrowdsale.sol";


contract PupperCoinCrowdsale is Crowdsale, MintedCrowdsale, CappedCrowdsale, TimedCrowdsale, RefundablePostDeliveryCrowdsale {


    constructor(
        uint rate,
        PupperCoin token,  
        address payable wallet,
        uint goal, 
        uint open,
        uint close,
        uint cap

    )
        
    Crowdsale(rate, wallet, token)
    TimedCrowdsale(now, now + 24 weeks)
    CappedCrowdsale(cap)
    RefundableCrowdsale(goal)
       
        public
    {
       
    }
}

contract PupperCoinSaleDeployer {

    address public token_sale_address;
    address public token_address;


    constructor(
        string memory name,
        string memory symbol

    )
        public
    {
    
        PupperCoin token = new PupperCoin(name, symbol, 0);
        token_address = address(token);

        
        token.addMinter(token_sale_address);
        token.renounceMinter();
    }
}