// SPDX-License-Identifier: Unlicense
pragma solidity >=0.8.0;

import "solmate/tokens/ERC1155.sol";
import "openzeppelin-contracts/contracts/access/Ownable.sol";

contract Contract is ERC1155, Ownable {
    constructor() ERC1155() {}

    // function mint(
    //     address to,
    //     uint256 id,
    //     uint256 amount,
    //     bytes memory data
    // ) public onlyOwner {
    //     ERC1155._mint(to, id, amount, data);
    // }

    // function batchMint(
    //     address to,
    //     uint256[] memory ids,
    //     uint256[] memory amounts,
    //     bytes memory data
    // ) external onlyOwner {
    //     ERC1155._batchMint(to, ids, amounts, data);
    // }

    // optimized batch mint rewrite
    function batchMint(address[] memory recipients, uint256 id)
        external
        onlyOwner
    {
        uint256 amount = recipients.length;
        for (uint256 i = 0; i < amount; i++) {
            unchecked {
                balanceOf[recipients[i]][id]++;
            }
            emit TransferSingle(msg.sender, address(0), recipients[i], id, 1);
        }
    }

    function uri(uint256 id) public view override returns (string memory) {
        return "URI";
    }

    // function testMintOneThousand() public onlyOwner {
    //     for (uint160 i = 0; i < 1000; i++) {
    //         mint(address(i), 1, 1, "");
    //     }
    // }
}
