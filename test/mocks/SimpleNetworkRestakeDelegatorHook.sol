// SPDX-License-Identifier: MIT
pragma solidity 0.8.25;

import {INetworkRestakeDelegator} from "src/interfaces/delegator/INetworkRestakeDelegator.sol";
import {IDelegatorHook} from "src/interfaces/delegator/IDelegatorHook.sol";

contract SimpleNetworkRestakeDelegatorHook is IDelegatorHook {
    uint256 counter;

    function onSlash(address network, address operator, uint256, uint48) external {
        ++counter;
        if (counter == 2) {
            INetworkRestakeDelegator(msg.sender).setOperatorNetworkShares(network, operator, 0);
        }
    }
}
