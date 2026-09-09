# 3d-nand-tcad

**Optimization of GIDL-Assisted Erase Operation in 3D NAND Flash Memory**

TCAD-based numerical modeling, calibration, and parametric optimization of Gate-Induced Drain Leakage (GIDL) mechanisms in 3D Charge-Trap NAND flash memory strings using Synopsys Sentaurus.

## Overview

3D NAND flash memory has become a pivotal technology in modern data storage systems due to its scalability and high-density capabilities. Optimizing its performance requires a deep understanding of device characteristics and mechanisms such as Gate Induced Drain Leakage (GIDL), which plays a critical role in various operations. This project investigates the dependence of GIDL on key parameters in a NAND memory string to provide insights for performance enhancement.
Initially, a NAND memory string was simulated based on a reference design from IEEE literature, followed by the simulation of its ID–VGS characteristics to validate the memory string’s operational behavior. The study then focused on analyzing the GIDL phenomenon, exploring its dependence on parameters such as BL plug doping concentration, Gate metal selection, Trap charge concentration, and Fixed charge concentration, Oxide layer thickness. The simulations showed how these parameters affect GIDL behavior, providing important insights for improving device performance and reliability.
These findings lay the groundwork for further investigations into employing GIDL-assisted mechanisms, such as erase operations, to improve erase efficiency and reliability in 3D NAND Flash Memory.

## Device Architecture & Simulation Specifications

The modeled string consists of an 8-wordline (8-WL) cylindrical vertical NAND structure with select gates (DSL, SSL) and dummy cells:
<img width="506" height="364" alt="image" src="https://github.com/user-attachments/assets/08f206ce-1a20-4d7e-9a6f-57ceccfc85c0" />

<img width="739" height="226" alt="image" src="https://github.com/user-attachments/assets/8c35d4de-bc79-410e-8004-b248c711b247" />

## 📂 Project Structure

```text
sd-nand-tcad/
├── docs/
│   ├── nand_string_schematic.png     # String cross-section and cell layout
│   ├── id_vgs_calibration.png        # Experimental vs TCAD calibrated curves
│   └── report.pdf                    # Full BTP project report
├── tcad_simulations/
│   ├── sde/
│   │   └── nand_string_geo.scm       # Sentaurus Structure Editor 2D/3D geometry scripts
│   ├── sdevice/
│   │   ├── id_vgs_baseline.cmd       # Transfer curve calibration setup
│   │   ├── gidl_btbt_sweep.cmd       # BTBT activation & bias sweep
│   │   ├── workfunction_sweep.cmd    # Gate metal work function comparison
│   │   ├── doping_var_sweep.cmd      # BL plug doping variation deck
│   │   └── tox_sweep.cmd             # Tunnel oxide thickness sensitivity deck
│   └── inspect/
│       └── extract_profiles.ins      # Curve extraction and hole density export scripts
├── plots/                            # Extracted raw CSV data and Origin/Matplotlib plots
└── README.md
