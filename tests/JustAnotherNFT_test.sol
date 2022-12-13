// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol";
import "../contracts/JustAnotherNFT.sol";

contract JustAnotherNFTTest {

    JustAnotherNFT s;
    function beforeAll () public {
        s = new JustAnotherNFT();
    }

    function testTokenNameAndSymbol () public {
        Assert.equal(s.name(), "JustAnotherNFT", "token name did not match");
        Assert.equal(s.symbol(), "JANFT", "token symbol did not match");
    }
}