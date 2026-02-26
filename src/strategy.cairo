#[starknet::contract]
mod Strategy {

    #[storage]
    struct Storage {
        deployed_capital: u256,
    }

    #[external]
    fn deploy_capital(ref self: ContractState, amount: u256) {
        let current = self.deployed_capital.read();
        self.deployed_capital.write(current + amount);
    }

    #[external]
    fn simulate_yield(ref self: ContractState, yield_amount: u256) {
        let current = self.deployed_capital.read();
        self.deployed_capital.write(current + yield_amount);
    }

    #[external]
    fn return_profit(ref self: ContractState) -> u256 {
        let capital = self.deployed_capital.read();
        self.deployed_capital.write(0);
        capital
    }

    #[view]
    fn deployed(self: @ContractState) -> u256 {
        self.deployed_capital.read()
    }
}