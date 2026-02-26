#[starknet::contract]
mod ZKProof {

    #[storage]
    struct Storage {
        last_assets: u256,
        last_deployed: u256,
    }

    #[external]
    fn submit_state(ref self: ContractState, assets: u256, deployed: u256) {
        self.last_assets.write(assets);
        self.last_deployed.write(deployed);
    }

    #[view]
    fn is_solvent(self: @ContractState) -> bool {
        let assets = self.last_assets.read();
        let deployed = self.last_deployed.read();
        assets >= deployed
    }
}