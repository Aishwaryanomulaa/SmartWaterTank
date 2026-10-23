# Smart Water Tank Controller

## 1. Project Overview

The **Smart Water Tank Controller** is a digital RTL design that controls a water pump based on water-level inputs and safety conditions. The controller starts pumping when the tank level is low, stops when the tank is full, and disables pumping when a fault condition is detected.

The project demonstrates digital design using Verilog HDL, functional verification through simulation, logic synthesis using Yosys, and physical design using OpenLane with the Sky130A standard-cell platform.

## 2. Objectives

- Design a digital water tank pump controller using Verilog HDL.
- Control pump operation based on water-level inputs.
- Detect dry-run and motor-fault conditions.
- Verify controller behavior using a testbench.
- Perform logic synthesis using Yosys.
- Implement the design through the OpenLane physical-design flow.
- Generate GDS layout output and document the implementation results.

## 3. Inputs and Outputs

### Inputs

| Signal | Description |
|---|---|
| `clk` | Clock signal |
| `rst` | Active-high reset |
| `low_level` | Indicates that the water level is low |
| `high_level` | Indicates that the tank is full |
| `dry_run` | Indicates a dry-run fault condition |
| `motor_fault` | Indicates a motor fault condition |

### Outputs

| Signal | Description |
|---|---|
| `pump_enable` | Enables the pump when pumping is permitted |
| `tank_full` | Indicates that the high-level input is active |

## 4. Controller States

The controller uses three logical states:

- **IDLE:** The controller is not actively pumping.
- **PUMPING:** The pump is enabled when the water level and safety conditions permit operation.
- **FAULT:** Pumping is disabled when a fault condition is detected.

The controller uses the input signals and its internal state to determine the appropriate pump-control output.

## 5. Functional Verification

A Verilog testbench was used to verify the controller's behavior.

The testbench passed six checks:

1. Reset behavior
2. Pump start when the water level is low
3. Pump stop when the tank is full
4. Dry-run fault handling
5. Motor-fault handling
6. Safe recovery after a fault condition

These checks validate the expected behavior of the RTL under the tested conditions.

## 6. Logic Synthesis

Generic logic synthesis was performed using **Yosys**.

The synthesis process translated the Verilog RTL into a gate-level representation. The synthesis run completed successfully, and the design was prepared for the physical-design flow.

## 7. Physical Design

Physical implementation was performed using **OpenLane** with the **Sky130A / `sky130_fd_sc_hd`** standard-cell platform.

The latest run used for documentation is:

`23-10_12-36`

The OpenLane flow completed without fatal errors.

### Reported verification results

The final summary for this run reported:

- Zero TritonRoute DRC violations
- Zero Magic DRC violations
- Zero antenna violations
- Zero LVS errors
- Zero CVC errors

The LVS report stated that there were no net, device, pin, or property mismatches.

GDS layout output was generated and saved with the associated reports and screenshots.

### Timing status

The inspected synthesis-stage timing report contained timing paths with positive slack, including a reported slack of **4.39 ns** for the displayed maximum-delay path from `motor_fault` to `pump_enable`.

However, the available post-resizer timing-path report stated that no paths were found, and the FastRoute timing report was empty. Therefore, complete post-route timing closure has **not been confirmed**.

The reported physical-verification results and the timing limitations should be considered separately.

## 8. Project Directory Structure

```text
SmartWaterTank/
├── rtl/
│   └── water_tank_controller.v
├── tb/
│   └── water_tank_controller_tb.v
├── gds/
├── reports/
├── screenshots/
└── physical_design/
    └── run_23-10_12-36/
        ├── gds/
        │   └── water_tank_controller.gds
        ├── reports/
        │   ├── final_summary_report.csv
        │   ├── 2-opensta.min_max.rpt
        │   ├── 10-opensta_post_resizer_wns.rpt
        │   ├── 18-fastroute.timing.rpt
        │   ├── 21-tritonRoute.drc
        │   ├── 24-opensta_spef.timing.rpt
        │   └── 39-magic.drc
        └── screenshots/
            ├── water_tank_controller.placement.def.png
            ├── water_tank_controller.cts.def.png
            └── water_tank_controller.gds.png
```

*Note: The directory tree shows the expected main project files and documented artifacts. Actual filenames may vary slightly depending on the files present in the repository.*

## 9. Tools and Technologies

- **Verilog HDL** — RTL design
- **Icarus Verilog** — RTL simulation
- **GTKWave** — Waveform viewing
- **Yosys** — Logic synthesis
- **OpenLane** — RTL-to-GDS physical-design flow
- **Sky130A / `sky130_fd_sc_hd`** — Standard-cell platform
- **Magic** — Layout and physical-verification tools
- **Git and GitHub** — Version control and project documentation

## 10. Project Outcome

The Smart Water Tank Controller demonstrates the design and verification of a digital pump-control system using RTL. Functional simulation and generic synthesis completed successfully. The latest documented OpenLane run generated GDS layout output and reported zero violations in the listed Magic DRC, TritonRoute, antenna, LVS, and CVC checks.

Post-route timing closure remains unconfirmed because the available detailed post-resizer and routing timing reports did not provide usable timing paths.

## 11. Future Improvements

- Investigate why the post-resizer and routing timing-path reports are empty.
- Complete and document post-route static timing analysis.
- Extend testbench coverage for additional input combinations and corner cases.
- Improve design documentation with RTL, waveform, placement, clock-tree synthesis, and final-layout screenshots.
- Explore further optimization of area, timing, and power.

## 12. Repository

**GitHub:** [SmartWaterTank — Aishwaryanomulaa](https://github.com/Aishwaryanomulaa/SmartWaterTank)

