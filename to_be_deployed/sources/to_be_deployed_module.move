/// Module: to_be_deployed
module to_be_deployed::to_be_deployed_module;

use std::string::String;

public struct ResultStruct has drop {
    message: String,
    operation: String,
    a: u64,
    b: u64,
    result: u64,
}

fun add_fn(a: u64, b: u64): u64 {
    return a + b
}

fun subtract_fn(a: u64, b: u64): u64 {
    return a - b
}

fun multiply_fn(a: u64, b: u64): u64 {
    return a * b
}

fun divide_fn(a: u64, b: u64): u64 {
    return a / b
}

fun invalid_operation_fn(): String {
    return b"Invalid operation, please try from the supported operations".to_string()
}

public fun return_operations_fn(): String {
    return b"Supported operations are: +, -, *, /".to_string()
}

public fun calculate(a: u64, operation: String, b: u64): ResultStruct {
    if (operation == b"+".to_string()) {
        ResultStruct {
            a: a,
            b: b,
            result: add_fn(a, b),
            operation: b"+".to_string(),
            message: b"Success ✅".to_string(),
        }
    } else if (operation == b"-".to_string()) {
        ResultStruct {
            a: a,
            b: b,
            result: subtract_fn(a, b),
            operation: b"-".to_string(),
            message: b"Success ✅".to_string(),
        }
    } else if (operation == b"*".to_string()) {
        ResultStruct {
            a: a,
            b: b,
            result: multiply_fn(a, b),
            operation: b"*".to_string(),
            message: b"Success ✅".to_string(),
        }
    } else if (operation == b"/".to_string()) {
        ResultStruct {
            a: a,
            b: b,
            result: divide_fn(a, b),
            operation: b"/".to_string(),
            message: b"Success ✅".to_string(),
        }
    } else {
        ResultStruct {
            a: 0,
            b: 0,
            result: 0,
            operation: b"Error ❌".to_string(),
            message: invalid_operation_fn(),
        }
    }
}
