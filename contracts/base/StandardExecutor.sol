// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {IStandardExecutor, Execution} from "../interface/IStandardExecutor.sol";
import {EntryPointManager} from "./EntryPointManager.sol";

abstract contract StandardExecutor is IStandardExecutor, EntryPointManager {
    function execute(address target, uint256 value, bytes calldata data)
        external
        payable
        virtual
        override
        onlyEntryPoint
    {
        revert("Not implemented");
    }

    function executeBatch(Execution[] calldata executions) external payable virtual override onlyEntryPoint {
        revert("Not implemented");
    }
}