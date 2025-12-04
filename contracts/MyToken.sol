// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract MyToken {
    string public name = "My Learning Token";  
    string public symbol = "MLT";              
    uint8 public decimals = 18;                
    uint256 public totalSupply;                
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    constructor(uint256 initialSupply) {
        totalSupply = initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }
    function _transfer(address from, address to, uint256 value) internal {
        require(to != address(0), "Cannot transfer to zero address");
        require(balanceOf[from] >= value, "Not enough balance");
        balanceOf[from] -= value;
        balanceOf[to] += value;

        emit Transfer(from, to, value);
    }
    function transfer(address to, uint256 value) public returns (bool) {
        _transfer(msg.sender, to, value);
        return true;
    }
    function approve(address spender, uint256 value) public returns (bool) {
        require(spender != address(0), "ERC20: approve to the zero address");
        allowance[msg.sender][spender] = value;
        emit Approval(msg.sender, spender, value);
        return true;
    }
    function transferFrom(address from, address to, uint256 value)
        public
        returns (bool)
    {
        require(allowance[from][msg.sender] >= value, "Allowance too low");
        allowance[from][msg.sender] -= value;
        _transfer(from, to, value);
        return true;
    }
}
