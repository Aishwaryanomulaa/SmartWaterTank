# Smart Water Tank Controller

## Project Overview
The Smart Water Tank Controller is a digital RTL design that controls a water pump based on tank level inputs and safety conditions.

## Inputs
- `clk` - Clock signal
- `rst` - Active-high reset
- `low_level` - Indicates a low water level
- `high_level` - Indicates a full tank
- `dry_run` - Dry-run fault indicator
- `motor_fault` - Motor fault indicator

## Outputs
- `pump_enable` - Enables the pump when pumping is permitted
- `tank_full` - Indicates the high-level input

## Controller States
- IDLE
- PUMPING
- FAULT

## Verification
The RTL testbench passed six checks covering reset, pump start, tank-full stop, dry-run fault, motor fault, and safe recovery.

Generic Yosys synthesis completed successfully.

## Physical Design
OpenLane was used with the Sky130A platform. GDS layout files were generated and saved in the `gds/` directory.

**Known limitation:** The OpenLane run did not complete all verification checks. Magic reported illegal overlaps during SPICE extraction, and the flow did not confirm successful final DRC/LVS verification. The generated GDS files should therefore be treated as unverified layout artifacts, not a clean sign-off result.

## Project Structure
- `rtl/` - RTL source code
- `tb/` - Testbench
- `reports/` - Synthesis, timing, routing, and extraction reports
- `screenshots/` - Design and waveform screenshots
- `gds/` - Generated GDS layout files
