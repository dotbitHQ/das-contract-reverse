// SPDX-License-Identifier: MIT
pragma solidity ^0.8.2;

import {Address} from "@openzeppelin/contracts/utils/Address.sol";

import {Initializable} from "@openzeppelin/contracts/proxy/utils/Initializable.sol";


interface IOwner {
	function owner() external returns (address);
	function getOwner() external returns (address);
	function admin() external returns (address);
}

contract ReverseLogic is Initializable {
	mapping(address => string) public names;
	address[] public addressIndices;
	event ReverseNameChanged(address addr, string name);

	function initialize(string memory _name) external initializer {
		names[address(this)] = _name;
		emit ReverseNameChanged(address(this), _name);
	}

	function setReverseName(string memory name, address addr)
		external
	{
		require(msg.sender != addr, "sender should not be itself");
		address owner = address(0);
		try IOwner(addr).owner() {
			owner = IOwner(addr).owner();
			require(owner == msg.sender, "need owner to set reverse");
		} catch {
			try IOwner(addr).getOwner() {
				owner = IOwner(addr).getOwner();
				require(owner == msg.sender, "need getOwner to set reverse");
			} catch {
				try IOwner(addr).admin() {
					owner = IOwner(addr).admin();
					require(owner == msg.sender, "need admin to set reverse");
				} catch {}
			}
		}
		require(
			owner != address(0),
			"only allow owner to set reverse name"
		);

		setReverseNameInternal(name, addr);
	}

	function setReverseNameInternal(string memory _name, address _addr)
		internal
	{
		require(Address.isContract(_addr), "EOA addr not allowed.");
		if (bytes(names[_addr]).length == 0) {
			addressIndices.push(_addr);
		}
		names[_addr] = _name;
		emit ReverseNameChanged(_addr, _name);
	}

	function getTotalCount() external view returns (uint256) {
		return addressIndices.length;
	}

}
