// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import {DSTest} from "ds-test/test.sol";
import {Utilities} from "./utils/Utilities.sol";
import {console} from "./utils/Console.sol";
import {Vm} from "forge-std/Vm.sol";
import {Contract} from "../Contract.sol";

contract ContractTest is DSTest {
    Vm internal immutable vm = Vm(HEVM_ADDRESS);

    Utilities internal utils;
    address[] internal addresses;
    address[] internal addresses5k;
    Contract public c = new Contract();

    function setUp() public {
        utils = new Utilities();
        addresses = utils.createAddresses(10000);
        addresses5k = utils.createAddresses(5000);
    }

    function testMintOneThousand() public {
        for (uint256 i = 0; i < 1000; i++) {
            c.mint(addresses[i], 1, 1, "");
        }
    }

    function testMintFiveThousand() public {
        for (uint256 i = 0; i < 5000; i++) {
            c.mint(addresses[i], 1, 1, "");
        }
    }

    function testMintTenThousand() public {
        for (uint256 i = 0; i < 10000; i++) {
            c.mint(addresses[i], 1, 1, "");
        }
    }

    function testBatch5k() public {
        c.batchMintRewrite1Each(addresses5k, 1);
    }

    function testBatch10k() public {
        c.batchMintRewrite1Each(addresses, 1);
    }
}
