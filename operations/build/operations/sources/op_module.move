/// Module: operations
module operations::op_module;

use std::string::String;

public fun add_fn(a: u64, b: u64): u64 {
    a + b
}

public fun subtract_fn(a: u64, b: u64): u64 {
    a - b
}

public fun multiply_fn(a: u64, b: u64): u64 {
    a * b
}

public fun divide_fn(a: u64, b: u64): u64 {
    a / b
}

public fun error_fn(): String {
    b"Invalid operation".to_string()
}
