# Sui Move Calculator

A simple calculator implementation in Sui Move that demonstrates package dependencies and modular design. This project consists of two packages: `operations` (provides basic math operations) and `calculate` (uses operations to perform calculations).

## Project Structure

```
sui-move-calculator/
├── operations/          # Package providing basic math operations
│   ├── Move.toml      # Operations package configuration
│   └── sources/
│       └── op_module.move    # Math operations module (add, subtract, multiply, divide)
├── calculate/         # Package using operations for calculations
│   ├── Move.toml      # Calculate package configuration with operations dependency
│   └── sources/
│       └── calculate_module.move    # Main calculator module
└── tests/             # Test files for both packages
```

## How It Works

### 1. Operations Package (`operations/`)

The `operations` package provides basic mathematical operations:

- **Module**: `op_module.move`
- **Functions**: `add_fn`, `subtract_fn`, `multiply_fn`, `divide_fn`, `error_fn`
- **Purpose**: Contains the core math logic that can be reused by other packages

### 2. Calculate Package (`calculate/`)

The `calculate` package imports the operations package and provides a unified calculator interface:

- **Module**: `calculate_module.move`
- **Dependency**: Imports `operations` package via local path in `Move.toml`
- **Function**: `calculate_fn(a: u64, operation: String, b: u64)`
- **Returns**: `CalculationResult` struct with operation type, message, and result

### 3. Package Dependencies

The `calculate` package imports `operations` using local dependency in its `Move.toml`:

```toml
[dependencies]
operations = {local = "../operations"}
```

### 4. Test Implementation

Both packages include test modules:

- `calculate/tests/calculate_module_tests.move`: Tests all calculator operations
- `operations/tests/operations_tests.move`: Basic test structure (currently commented)

## Installation and Setup

### Prerequisites

- Sui CLI installed and configured
- Move compiler available

### Build Commands

1. **Build the operations package** (build this first since it's a dependency):

```bash
cd operations
sui move build
```

2. **Build the calculate package**:

```bash
cd calculate
sui move build
```

### Testing Commands

1. **Test the operations package**:

```bash
cd operations
sui move test
```

2. **Test the calculate package**:

```bash
cd calculate
sui move test
```

3. **Run all tests from root**:

```bash
# Test operations
cd operations && sui move test && cd ..

# Test calculate
cd calculate && sui move test && cd ..
```

## Usage Example

The calculator supports four basic operations:

- Addition: `+`
- Subtraction: `-`
- Multiplication: `*`
- Division: `/`

Example function call:

```move
let result = calculate_fn(10, b"+".to_string(), 5);
// Returns: CalculationResult { operation: "Addition", message: "Success ✅", result: 15 }
```

## Development Notes

- The project uses Sui Move 2024.beta edition
- Operations are performed on `u64` integers
- Error handling returns a result with "Error ❌" message for invalid operations
- All operations include success/failure status messages

## License

This project is open source and available under the MIT License.
