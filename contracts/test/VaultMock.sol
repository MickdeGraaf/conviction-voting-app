pragma solidity ^0.4.24;


import "openzeppelin-solidity/contracts/token/ERC20/IERC20.sol";


contract VaultMock {

    function transfer(address _token, address _to, uint256 _value) external {
        require(_value > 0, "transfer zero value error");

        if (_token == address(0)) {
            require(_to.send(_value), "send reverted");
        } else {
            require(IERC20(_token).transfer(_to, _value), "token transfer reverted");
        }
    }

    function balance(address _token) public view returns (uint256) {
        if (_token == address(0)) {
            return address(this).balance;
        } else {
            return IERC20(_token).balanceOf(address(this));
        }
    }
}