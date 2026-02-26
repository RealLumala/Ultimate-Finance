use ultimate_finance::strategy::Strategy;

#[test]
fn test_strategy_yield() {

    let mut strategy = Strategy::deploy();

    strategy.deploy_capital(100);
    strategy.simulate_yield(50);

    let deployed = strategy.deployed();

    assert(deployed == 150, 'Yield failed');
}