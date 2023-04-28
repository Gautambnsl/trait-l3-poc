use result::ResultTrait;
use array::ArrayTrait;
#[test]
fn run(){
    let class_hash2 = declare('temp').unwrap();
    let class_hash = declare('borrow').unwrap();
    assert(class_hash != 0, 'class_hash != 0');
    let prepare_result = prepare(class_hash, ArrayTrait::new()).unwrap();
    assert(prepare_result.contract_address != 0, 'deployed contract_address != 0');
    assert(prepare_result.class_hash != 0, 'deployed class_hash != 0');
    let prepared_contract = PreparedContract {
        contract_address: prepare_result.contract_address,
        class_hash: prepare_result.class_hash,
        constructor_calldata: prepare_result.constructor_calldata
    };
    let deployed_contract_address = deploy(prepared_contract).unwrap();
    assert(deployed_contract_address != 0, 'deployed_contract_address != 0');

    let mut calldata = ArrayTrait::<felt252>::new();
    calldata.append(class_hash2);
    invoke(deployed_contract_address, 'spend_loan', calldata ).unwrap();
    let return_data = call(deployed_contract_address, 'getValue',ArrayTrait::new() ).unwrap();
    assert(1==2,*return_data.at(0_u32));
    // assert(1==1,'err');
}