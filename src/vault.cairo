#[starknet::contract]
mod Vault {

    use starknet::ContractAddress;

    #[storage]
    struct Storage {
        total_assets: u256,
        total_shares: u256,
        shares: LegacyMap<ContractAddress, u256>,

        strategy: ContractAddress,
        zk_module: ContractAddress,
    }

    #[constructor]
    fn constructor(
        ref self: ContractState,
        strategy: ContractAddress,
        zk_module: ContractAddress
    ) {
        self.strategy.write(strategy);
        self.zk_module.write(zk_module);
    }

    #[external]
    fn deposit(ref self: ContractState, amount: u256) {

        let caller = starknet::get_caller_address();

        let total_assets = self.total_assets.read();
        let total_shares = self.total_shares.read();

        let shares_to_mint = if total_shares == 0 {
            amount
        } else {
            amount * total_shares / total_assets
        };

        let user_shares = self.shares.read(caller);

        self.shares.write(caller, user_shares + shares_to_mint);

        self.total_assets.write(total_assets + amount);
        self.total_shares.write(total_shares + shares_to_mint);
    }

    #[external]
    fn withdraw(ref self: ContractState, share_amount: u256) {

        let caller = starknet::get_caller_address();

        let user_shares = self.shares.read(caller);
        assert(user_shares >= share_amount, 'Not enough shares');

        let total_assets = self.total_assets.read();
        let total_shares = self.total_shares.read();

        let btc_to_return = share_amount * total_assets / total_shares;

        self.shares.write(caller, user_shares - share_amount);
        self.total_assets.write(total_assets - btc_to_return);
        self.total_shares.write(total_shares - share_amount);
    }

    #[external]
    fn deploy_to_strategy(ref self: ContractState, amount: u256) {

        let total_assets = self.total_assets.read();
        assert(total_assets >= amount, 'Insufficient');

        let strategy = self.strategy.read();

        self.total_assets.write(total_assets - amount);

        StrategyDispatcher { contract_address: strategy }
            .deploy_capital(amount);
    }

    #[external]
    fn harvest(ref self: ContractState) {

        let strategy = self.strategy.read();

        let profit = StrategyDispatcher { contract_address: strategy }
            .return_profit();

        let total_assets = self.total_assets.read();
        self.total_assets.write(total_assets + profit);

        let zk = self.zk_module.read();

        ZKProofDispatcher { contract_address: zk }
            .submit_state(
                self.total_assets.read(),
                StrategyDispatcher { contract_address: strategy }.deployed()
            );
    }

    #[view]
    fn vault_assets(self: @ContractState) -> u256 {
        self.total_assets.read()
    }

    #[view]
    fn share_balance(self: @ContractState, user: ContractAddress) -> u256 {
        self.shares.read(user)
    }

    #[view]
    fn share_price(self: @ContractState) -> u256 {

        let assets = self.total_assets.read();
        let shares = self.total_shares.read();

        if shares == 0 {
            return 100000000;
        }

        assets * 100000000 / shares
    }
}