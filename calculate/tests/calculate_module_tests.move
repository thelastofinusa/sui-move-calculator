#[test_only]
module calculate::calculate_module_tests;

use calculate::calculate_module;
use std::debug;

#[test]
fun test_calculate_for_addition() {
    let res = calculate_module::calculate_fn(4, b"+".to_string(), 2);
    debug::print(&res);
}

#[test]
fun test_calculate_for_subtraction() {
    let res = calculate_module::calculate_fn(4, b"-".to_string(), 2);
    debug::print(&res);
}

#[test]
fun test_calculate_for_multiplication() {
    let res = calculate_module::calculate_fn(4, b"*".to_string(), 2);
    debug::print(&res);
}

#[test]
fun test_calculate_for_division() {
    let res = calculate_module::calculate_fn(4, b"/".to_string(), 2);
    debug::print(&res);
}

#[test]
fun test_calculate_fail() {
    let res = calculate_module::calculate_fn(4, b">".to_string(), 2);
    debug::print(&res);
}
