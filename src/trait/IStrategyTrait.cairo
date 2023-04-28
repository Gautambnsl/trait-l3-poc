use starknet::ContractAddress;

#[derive(Copy, Drop)]
struct Object{
    loan_id : u128,
    dest_add : ContractAddress,
}

trait IStrategyTrait<T>{
    fn new(id : u128, dest_add : ContractAddress) -> T;
    fn do(self: T) -> felt252;
}

impl JediSwapStrategyTrait of IStrategyTrait::<Object>{
	fn new(id : u128, _dest_add : ContractAddress) -> Object {
        Object{
            loan_id : id,
            dest_add:_dest_add,
         }
    }
    fn do(self : Object)-> felt252{
       100
    }
} 




#[contract]
mod SwapStrategy {
    use super::Object;
    use starknet::ContractAddress;
    use super::IStrategyTrait;
    use super::JediSwapStrategyTrait;
    use root::Temp::MyswapSwapStrategyTrait;


    struct Storage{
        value : felt252,
    }

	fn get_strategy(integration: felt252, loan_id: u128, dest_add :ContractAddress) -> Object {
            if(integration!=11){
			let jediObject : Object = JediSwapStrategyTrait::new(loan_id,dest_add);
			return jediObject;
            }else{
                let myswapObject : Object  = MyswapSwapStrategyTrait::new(loan_id,dest_add);
                return myswapObject;
            }
	}

    #[external]
	fn swap(integration: felt252, loan_id: u128, dest_add :ContractAddress)  {
		let strat = get_strategy(integration,loan_id,dest_add);
		let x = strat.do();
        value::write(x);
	}
}










