use ultimate_finance::vault::Vault;
use ultimate_finance::strategy::Strategy;
use ultimate_finance::zk_proof::ZKProof;

#[test]
fn test_full_flow() {

    let strategy = Strategy::deploy();
    let zk = ZKProof::deploy();

    let mut vault = Vault::deploy(strategy.contract_address, zk.contract_address);

    vault.deposit(100);

    vault.deploy_to_strategy(100);

    strategy.simulate_yield(20);

    vault.harvest();

    let assets = vault.vault_assets();

    assert(assets == 120, 'Lifecycle failed');
}