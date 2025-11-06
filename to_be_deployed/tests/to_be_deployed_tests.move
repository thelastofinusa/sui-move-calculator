#[test_only]
module to_be_deployed::to_be_deployed_module_tests;

use std::debug;
use std::string::String;
use to_be_deployed::to_be_deployed_module;

#[test]
fun test_add_fn() {
    let a: u64 = 2;
    let op: String = b"+".to_string();
    let b: u64 = 2;

    debug::print(&to_be_deployed_module::calculate(a, op, b))
}

#[test]
fun test_subtract_fn() {
    let a: u64 = 2;
    let op: String = b"-".to_string();
    let b: u64 = 2;

    debug::print(&to_be_deployed_module::calculate(a, op, b))
}

#[test]
fun test_multiply_fn() {
    let a: u64 = 2;
    let op: String = b"*".to_string();
    let b: u64 = 2;

    debug::print(&to_be_deployed_module::calculate(a, op, b))
}

#[test]
fun test_divide_fn() {
    let a: u64 = 2;
    let op: String = b"/".to_string();
    let b: u64 = 2;

    debug::print(&to_be_deployed_module::calculate(a, op, b))
}

#[test]
fun test_invalid_operation_fn() {
    let a: u64 = 2;
    let op: String = b"**".to_string();
    let b: u64 = 2;

    debug::print(&to_be_deployed_module::calculate(a, op, b))
}
