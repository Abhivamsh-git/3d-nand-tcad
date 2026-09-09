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

## Device Calibration & Results
The initial step involved calibrating the ID-VGS curve of the simulated structure using the reference research paper. This ensured that the simulated results aligned with the experimental data reported in the paper by tuning parameters such as mobility, fixed and trapped charge concentrations at interface, establishing a baseline for further analysis.
<img width="612" height="481" alt="image" src="https://github.com/user-attachments/assets/d30f321f-ca31-424f-83d3-aa621cc9a3b4" />

### Parametric Sensitivity on GIDL & Hole Density
BTBT Model Validation
Gate Work Function
BL Plug Doping Concentration
Tunnel Oxide Thickness
Fixed & Trap Charge Modulation

## Future Scope
The current simulations have been conducted using a crystalline silicon channel, future work will focus on extending the study to polycrystalline silicon (poly-Si) channels. This transition is crucial for enhancing the practicality and real-world relevance of the results, as poly-Si is commonly used in actual 3D NAND flash memory fabrication. Future simulations will involve analyzing the impact of grain boundaries and grain-assisted trap states inherent to poly-Si, and studying their influence on GIDL behavior. This will include varying grain size, grain boundary distribution, and associated trap densities to better understand their effect on critical device parameters and optimize erase operations under realistic structural conditions.
Additionally, future studies will aim to analyze the optimal operating conditions for the erase operation of the NAND string. By simulating different biasing schemes and structural variations, the goal will be to minimize GIDL-induced degradation while ensuring efficient GIDL-assisted erase functionality. This will contribute to a more robust understanding of device behavior under realistic manufacturing conditions and help in optimizing the reliability and performance of future NAND flash technologies.

## References
S. Aritome, NAND Flash Memory Technologies, 1st ed. John Wiley & Sons, 2016.

D. Son, J. Park, and H. Shin, "Investigation and compact modeling of hot-carrier injection for read disturbance in 3-D NAND flash memory," IEEE TED, vol. 67, no. 7, 2020.

W.-S. Cho et al., "Highly reliable vertical NAND technology with biconcave shaped storage layer and leakage controllable offset structure," VLSI Technology, 2010.

Y. Kim and S. Kim, "A process-aware compact model for GIDL-assisted erase optimization of 3-D V-NAND flash memory," IEEE TED, vol. 70, no. 4, 2023.

D. Lee and T.-J. K. Liu, "SiGe/Si heterojunction drain transistor for faster 3D NAND flash memory erase," IEEE IMW, 2024.

## 📂 Project Structure

```text
3d-nand-tcad/
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
