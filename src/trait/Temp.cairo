use starknet::ContractAddress;

use root::IStrategyTrait::Object;

trait IStrategyTrait<T>{
    fn new(id : u128, dest_add : ContractAddress) -> T;
    fn do(self: T) -> felt252;
}


impl MyswapSwapStrategyTrait of IStrategyTrait::<Object>{
	fn new(id : u128, _dest_add : ContractAddress) -> Object {
        Object{
            loan_id : id,
            dest_add:_dest_add,
         }
    }
    fn do(self : Object) ->felt252{
        1000
    }
} 