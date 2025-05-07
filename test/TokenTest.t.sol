// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {DeployToken} from "script/DeployToken.s.sol";
import {Token} from "src/Token.sol";

contract TokenTest is Test {
    Token public token;
    DeployToken public deployer;

    address kelechi = makeAddr("kelechi"); // kelechi can also be seen as the user
    address ebubechi = makeAddr("ebubechi"); // ebubechi can also be seen as the spender

    uint256 constant STARTING_BALANCE = 100 ether;

    function setUp() public {
        deployer = new DeployToken();
        token = deployer.run();

        vm.prank(msg.sender);
        token.transfer(kelechi, STARTING_BALANCE);
    }

    function testKelechiBalance() public view {
        assertEq(token.balanceOf(kelechi), STARTING_BALANCE);
    }

    function testKelechiTransferAndEbubechiRecieve() public {
        uint256 transferAmount = 10 ether;

        vm.prank(kelechi);
        token.transfer(ebubechi, transferAmount);

        assertEq(token.balanceOf(ebubechi), transferAmount);
        assertEq(token.balanceOf(kelechi), STARTING_BALANCE - transferAmount);
    }

    function testTransferFailsIfKelechiTransfersMoreThanBalance() public {
        uint256 transferAmount = STARTING_BALANCE + 1 ether;

        vm.prank(kelechi);
        vm.expectRevert();
        token.transfer(ebubechi, transferAmount);
    }

    function testAllowanceWorks() public {
        uint256 initialAllowance = 10 ether;
        uint256 transferAmount = 5 ether;

        vm.prank(kelechi);
        token.approve(ebubechi, initialAllowance);

        vm.prank(ebubechi);
        token.transferFrom(kelechi, ebubechi, transferAmount);
        token.allowance(kelechi, ebubechi);

        assertEq(token.balanceOf(ebubechi), transferAmount);
        assertEq(token.balanceOf(kelechi), STARTING_BALANCE - transferAmount);
        assertEq(
            token.allowance(kelechi, ebubechi),
            initialAllowance - transferAmount
        );
    }
}
