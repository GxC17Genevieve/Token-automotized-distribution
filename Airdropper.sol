pragma solidity ^0.4.15;

    /****************************************************************
     * 
     ****************************************************************/

contract Airdropper {

    address admin;
    address owner;

    // Mapping to store balances
    mapping(address => mapping(address => uint256)) public balances;

    // Constructor function with main constants and variables  
    function Airdropper() {
      admin = msg.sender;
      owner = msg.sender;
    }

    // Modifier for authorized calls
    modifier onlyAdmin() {
        if ( msg.sender != owner && msg.sender != admin ) revert();
        _;
    }

    // Set balance (MAIN FUNCTION)
    function setBalance (address _token , address _address , uint256 _amount) onlyAdmin {
        balances[_token][_address] = _amount;
    }

    // ADMIN FUNCTIONS (to change owner or admin)

    // This function can be called only by owner
    function changeOwner(address _newOwner) returns(bool) {
        if (msg.sender != owner) revert();
        owner = _newOwner;
        return true;
    }

    // This function can be called by owner or admin
    function changeAdmin(address _newAdmin) onlyAdmin returns(bool) {
        admin = _newAdmin;
        return true;
    }
}

