# Smart Water Tank Controller — RTL to GDS

## 1. Project Overview

The **Smart Water Tank Controller** is a digital design project developed using Verilog HDL. It implements a controller that manages water-pump operation according to tank-level signals and safety conditions.

The design was taken through RTL simulation, logic synthesis, and physical-design implementation using the SkyWater SKY130 platform and OpenLane.

The project demonstrates the RTL-to-GDS design flow used in digital VLSI design.

## 2. Objectives

- Design a digital water-tank controller using Verilog HDL.
- Control pump operation using low-level and high-level sensor inputs.
- Include dry-run and motor-fault safety conditions.
- Verify controller behaviour using a testbench.
- Perform logic synthesis and physical-design implementation.
- Generate a GDS layout and examine implementation reports.

## 3. Functional Description

The controller uses three logical states:

- **IDLE:** The pump is not actively pumping.
- **PUMPING:** The controller enables the pump when pumping is required and permitted.
- **FAULT:** The controller disables normal pumping when a supported fault condition is detected.

The controller receives sensor and fault signals as digital inputs and produces pump-control and tank-status outputs.

### Inputs

| Signal | Description |
|---|---|
| `clk` | Clock input |
| `rst` | Active-high reset |
| `low_level` | Indicates a low tank-water level |
| `high_level` | Indicates the high-level or full-tank condition |
| `dry_run` | Indicates a dry-run fault |
| `motor_fault` | Indicates a motor fault |

### Outputs

| Signal | Description |
|---|---|
| `pump_enable` | Controls whether pump operation is enabled |
| `tank_full` | Indicates the high-level input condition |

This project implements the digital control logic. It is not a physical water tank or an IoT monitoring system.

## 4. Tools and Technologies

- **Verilog HDL:** RTL design
- **RTL simulation:** Functional verification using a testbench
- **Yosys:** Logic synthesis
- **OpenLane:** RTL-to-GDS physical-design flow
- **OpenROAD:** Physical-design implementation and routing tools
- **SKY130A:** Standard-cell technology platform
- **Magic / KLayout:** Layout viewing and related physical-design tools
- **GitHub:** Source-code and project-artifact management

## 5. Design and Implementation Flow

The project follows these stages:

1. RTL design using Verilog HDL.
2. Testbench development and functional simulation.
3. Logic synthesis using Yosys.
4. Floorplanning and placement.
5. Clock-tree synthesis (CTS).
6. Global and detailed routing.
7. Layout generation in GDS format.
8. Review of physical-verification and timing reports.

## 6. Verification and Results

### Functional verification

The testbench passed six checks:

1. Reset behaviour.
2. Pump activation when the tank level is low.
3. Pump deactivation when the tank reaches the high-level condition.
4. Dry-run fault handling.
5. Motor-fault handling.
6. Safe recovery after a fault condition is cleared.

### Synthesis

Generic Yosys synthesis completed successfully. The design was mapped to standard cells for physical-design implementation.

### Physical design

OpenLane completed the recorded run `23-10_12-36` and generated GDS layout files.

The recorded results for this run included:

- Zero Magic DRC violations.
- Zero LVS net, device, pin, and property mismatches.
- Zero reported antenna violations.
- Zero reported CVC violations.

These statements refer to the recorded run and its available reports.

### Timing analysis

Timing paths with positive slack were observed in the available reports. However, complete post-route timing closure has not been conclusively established because some timing reports were empty or reported that no paths were found.

Therefore, the design's functional simulation and reported physical checks should be distinguished from full post-route timing sign-off.

## 7. Repository Structure

```text
SmartWaterTank/
├── rtl/
│   └── water_tank_controller.v
├── tb/
├── reports/
├── screenshots/
├── gds/
├── physical_design/
│   └── run_23-10_12-36/
├── .gitignore
├── README.md
└── water_tank.vcd
```

- `rtl/` — Original Verilog RTL source.
- `tb/` — Testbench files for functional verification.
- `reports/` — Synthesis, timing, routing, and verification reports.
- `screenshots/` — Screenshots of simulation and implementation results.
- `gds/` — Generated GDS layout files.
- `physical_design/run_23-10_12-36/` — OpenLane run artifacts.
- `water_tank.vcd` — Waveform file, if opened using a compatible waveform viewer.

## 8. Running the Project

### Step 1: Clone the repository

```bash
git clone https://github.com/Aishwaryanomulaa/SmartWaterTank.git
cd SmartWaterTank
```

### Step 2: Inspect the RTL source

Open `rtl/water_tank_controller.v` in a text editor or Verilog-compatible IDE.

### Step 3: Run functional simulation

Use a Verilog simulator such as Icarus Verilog with the source file and the testbench available in `tb/`. Use the testbench's actual filename when compiling and running the simulation.

### Step 4: Inspect the waveform

Open the generated VCD file in GTKWave or another compatible waveform viewer to inspect the signals over time.

### Step 5: Review the physical-design results

Inspect the reports, screenshots, and GDS files included in the repository. The OpenLane flow requires a compatible Linux/Docker environment and a configured SKY130A PDK.

## 9. Applications

The controller demonstrates digital logic concepts that are relevant to:

- Automated water-pump control.
- Sensor-based control systems.
- Fault-aware digital controllers.
- Finite-state machines.
- RTL design and VLSI physical-design education.

The implementation is a digital design prototype; real-world deployment would require appropriate sensors, pump-driving hardware, electrical protection, and system-level validation.

## 10. Future Improvements

- Extend verification with additional corner cases.
- Improve timing constraints and confirm complete post-route timing analysis.
- Add more comprehensive automated regression tests.
- Evaluate the controller under additional operating conditions.
- Integrate the digital controller with suitable external hardware in a future version.

## 11. Conclusion

The Smart Water Tank Controller demonstrates the development of a Verilog-based sequential digital controller and its implementation through an RTL-to-GDS flow. Functional simulation passed the six planned checks, synthesis completed, and the recorded OpenLane run generated a GDS layout with the reported physical-verification results. Further timing verification would be required before claiming complete post-route timing closure.

## 12. Repository

**GitHub:** https://github.com/Aishwaryanomulaa/SmartWaterTank
