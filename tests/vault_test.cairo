use ultimate_finance::vault::Vault;
use ultimate_finance::strategy::Strategy;
use ultimate_finance::zk_proof::ZKProof;

#[test]
fn test_vault_deposit() {

    let strategy = Strategy::deploy();
    let zk = ZKProof::deploy();

    let mut vault = Vault::deploy(strategy.contract_address, zk.contract_address);

    vault.deposit(100);

    let assets = vault.vault_assets();

    assert(assets == 100, 'Deposit failed');
}