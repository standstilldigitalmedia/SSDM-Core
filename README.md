# Standstill Core

Core utilities for Godot 4.x addons by Standstill Digital Media.

## Overview

Standstill Core provides shared classes used by [Dingus](https://github.com/standstilldigitalmedia/dingus) and [Buttered Sausage](https://github.com/standstilldigitalmedia/buttered-sausage). Install this addon first if you're using either of those projects.

## Installation

1. Download or clone this repository
2. Copy the `addons/SSDMCore` folder into your project's `addons/` directory
3. No plugin activation required - classes are available globally via `class_name`

## Classes

### SSDMSeverity

Severity levels for categorizing operation results and messages.

```gdscript
enum Level {
    SUCCESS,  # Operation completed successfully
    INFO,     # Informational message
    WARNING,  # Warning - operation succeeded with caveats
    ERROR     # Error - operation failed
}
```

### SSDMResult

A result object implementing the Result pattern for fluent error handling. Encapsulates operation outcomes with message, data, error code, and severity.

#### Creating Results

```gdscript
# Static constructors
var result = SSDMResult.success("File saved successfully", saved_data)
var result = SSDMResult.failure("Could not open file", null, ERR_FILE_NOT_FOUND)
var result = SSDMResult.warning("File saved with warnings")
var result = SSDMResult.info("Processing started")
```

#### Builder Pattern

Chain methods to accumulate details:

```gdscript
var result = SSDMResult.success("Batch operation complete")
    .with_info("Processed 10 files")
    .with_warning("2 files were skipped")
    .with_error("1 file failed to save", ERR_FILE_CANT_WRITE)
```

#### State Conversion

Convert between result states while preserving accumulated details:

```gdscript
var result = SSDMResult.success("Starting operation")
    .with_info("Step 1 complete")
    .with_info("Step 2 complete")
    .to_failure("Step 3 failed", ERR_INVALID_DATA)
```

#### Merging Results

Combine results from nested operations:

```gdscript
func process_all() -> SSDMResult:
    var result = SSDMResult.success("All items processed")

    for item in items:
        var item_result = process_item(item)
        if not item_result.is_success():
            result.merge_from(item_result, false)  # Keep our message, add their details

    if result.has_details():
        result.to_warning("Completed with issues")

    return result
```

#### Checking Results

```gdscript
if result.is_success():
    print(result.data)
else:
    print("Error: ", result.message)
    for detail in result.details:
        print("  - ", detail.message)
```

## Integration with Other Addons

- **Dingus**: Requires Standstill Core. Uses SSDMResult for resource manager operations.
- **Buttered Sausage**: Optional. Can display SSDMResult objects as animated message panels via `ButteredSausageDisplay.populate_from_result(result)`.

## License

CC0 1.0 Universal (CC0 1.0) Public Domain Dedication - See LICENSE file for details.
