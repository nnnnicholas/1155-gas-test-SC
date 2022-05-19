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
    address[] internal addresses400;
    address[] internal addresses1k;
    address[] internal addresses5k;
    address[] internal addresses10k;
    // address[][] internal addressRanges;
    Contract public c = new Contract();

    function setUp() public {
        utils = new Utilities();
        addresses400 = utils.createAddresses(400);
        addresses1k = utils.createAddresses(1000);
        addresses10k = utils.createAddresses(10000);
        // addresses5k = utils.createAddresses(5000);
        // for (uint256 i = 0; i < 10; i++) {
        // addressRanges[4] = utils.createAddresses(100);
        // }
    }

    // function testMintOneThousand() public {
    //     for (uint256 i = 0; i < 1000; i++) {
    //         c.mint(addresses[i], 1, 1, "");
    //     }
    // }

    // function testMintFiveThousand() public {
    //     for (uint256 i = 0; i < 5000; i++) {
    //         c.mint(addresses[i], 1, 1, "");
    //     }
    // }

    // function testMintTenThousand() public {
    //     for (uint256 i = 0; i < 10000; i++) {
    //         c.mint(addresses[i], 1, 1, "");
    //     }
    // }

    // function testBatch5k() public {
    //     c.batchMintRewrite1Each(addresses5k, 1);
    // }

    // function testBatch10k() public {
    //     c.batchMintRewrite1Each(addresses, 1);
    // }

    // WORKS
    function testBatch10k() public {
        console.log(addresses10k.length);
        c.batchMint(addresses10k, 1);
        // for (uint256 i = 0; i < addresses10k.length; i++) {
        //     assert(c.balanceOf(addresses10k[i], 1) == 1);
        // }
    }

    function test400() public {
        console.log(addresses400.length);
        c.batchMint(addresses400, 1); // drop
        for (uint256 i = 0; i < addresses400.length; i++) {
            assert(c.balanceOf(addresses400[i], 1) == 1); // verify dropped
        }
    }

    // function test25BatchesOf400() public {
    //     console.log(addresses400.length);
    //     for (uint256 i = 0; i < 25; i++) {
    //         c.batchMint(addresses400, 1); // drop
    //     }
    //     for (uint256 i = 0; i < addresses400.length; i++) {
    //         assert(c.balanceOf(addresses400[i], 1) == 25); // verify dropped
    //     }
    // }
}
