pragma solidity ^0.4.0;

import "github.com/ethereum/solidity/std/mortal.sol";

contract SimpleWallet is mortal {
    mapping(address => Permission) myAddressMapping;

    struct Permission {
        bool isAllowed;
        uint maxTransferAmount;
    }

    function addAddressToSendersList(address permitted, uint maxTransferAmount) {
        myAddressMapping[permitted] = Permission(true, maxTransferAmount);
    }

    function sendFunds(address reciever, uint amountInWei) {
        if (myAddressMapping[msg.sender].isAllowed) {
            if (myAddressMapping[msg.sender].maxTransferAmount <= amountInWei) {
                bool isSuccessful = receiver.send(amountInWei);
                if (!isSuccessful) {
                    throw;
                }
            }
        }
    }

    function () payable {
        
    }
}