use starknet::ContractAddress;
#[contract]
mod borrow{
    use starknet::ContractAddress;
    use super::ISwapDispatcherTrait;
    use super::ISwapLibraryDispatcher;
    use starknet::ClassHash;
    use starknet::ContractAddressZeroable;
    struct Storage{
        jediAdd : ContractAddress,
        myswapAdd : ContractAddress,
        value : felt252,
    }

    #[view]
    fn getValue() -> felt252{
        value::read()
    }

    #[external]
    fn spend_loan(hash : ClassHash) { 
        let dest_add : ContractAddress= ContractAddressZeroable::zero();
        let integration = 10; // 10 for jedi and 11 for myswap
        let loan_id = 0_u128;
        ISwapLibraryDispatcher{class_hash : hash }.swap(integration,loan_id, dest_add);
    }
    #[external]
    fn abc(hash : ClassHash) { 
        value::write(1);
    }
}

#[abi]
trait ISwap{
    fn swap(integration : felt252, loan_id : u128, dest_add : ContractAddress);
}



