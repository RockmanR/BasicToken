pragma solidity ^0.4.19;

import "./a3_1_ERC20Basic.sol";
import "./a3_2_SafeMath.sol";

contract BasicToken is ERC20Basic {
    using SafeMath for uint256;
    
    mapping (address => uint256) balances;
    
    uint256 totalSupply_;
    
    function BasicToken() public {
        //totalSupply_ = _totalSupply;
        //balances[msg.sender] = _totalSupply;
        totalSupply_ = 100;
        balances[msg.sender] = totalSupply_;
    }
    
    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }
    
    function balanceOf(address _who) public view returns (uint256) {
        return balances[_who];
    }
    
    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_value <= balances[msg.sender]);
        require(_to != address(0));
        
        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}
