// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {Authority} from "./Authority.sol";
import {IOwnerManager} from "../interface/IOwnerManager.sol";
import {AccountStorage} from "../utils/AccountStorage.sol";
import {Bytes32LinkedList} from "../utils/Bytes32LinkedList.sol";

abstract contract OwnerManager is IOwnerManager, Authority {
    using Bytes32LinkedList for mapping(bytes32 => bytes32);

    /**
     * @notice Helper function to get the owner mapping from account storage
     * @return owners Mapping of current owners
     */
    function _ownerMapping() private view returns (mapping(bytes32 => bytes32) storage owners) {
        owners = AccountStorage.layout().owners;
    }

    /**
     * @notice Checks if the provided owner is a current owner
     * @param owner Address in bytes32 format to check
     * @return true if provided owner is a current owner, false otherwise
     */
    function _isOwner(bytes32 owner) internal view virtual returns (bool) {
        return _ownerMapping().isExist(owner);
    }

    /**
     * @notice External function to check if the provided owner is a current owner
     * @param owner Address in bytes32 format to check
     * @return true if provided owner is a current owner, false otherwise
     */
    function isOwner(bytes32 owner) external view virtual override returns (bool) {
        return _isOwner(owner);
    }

    function addOwner(bytes32 owner) external virtual override onlySelfOrModule {
        revert("Not implemented");
    }

    function removeOwner(bytes32 owner) external virtual override onlySelfOrModule {
        revert("Not implemented");
    }

    function resetOwner(bytes32 newOwner) external virtual override onlySelfOrModule {
        revert("Not implemented");
    }

    function listOwner() external view virtual override returns (bytes32[] memory owners) {
        revert("Not implemented");
    }
}
