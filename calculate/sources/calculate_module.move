/// Module: calculate
module calculate::calculate_module;

use operations::op_module;
use std::string::String;

public struct CalculationResult has drop {
    operation: String,
    message: String,
    result: u64,
}

public fun calculate_fn(a: u64, operation: String, b: u64): CalculationResult {
    if (operation == b"+".to_string()) {
        CalculationResult {
            operation: b"Addition".to_string(),
            message: b"Success ✅".to_string(),
            result: op_module::add_fn(a, b),
        }
    } else if (operation == b"-".to_string()) {
        CalculationResult {
            operation: b"Subtraction".to_string(),
            message: b"Success ✅".to_string(),
            result: op_module::subtract_fn(a, b),
        }
    } else if (operation == b"*".to_string()) {
        CalculationResult {
            operation: b"Multiplication".to_string(),
            message: b"Success ✅".to_string(),
            result: op_module::multiply_fn(a, b),
        }
    } else if (operation == b"/".to_string()) {
        CalculationResult {
            operation: b"Division".to_string(),
            message: b"Success ✅".to_string(),
            result: op_module::divide_fn(a, b),
        }
    } else {
        CalculationResult {
            message: b"Error ❌".to_string(),
            operation: op_module::error_fn(),
            result: 0,
        }
    }
}
