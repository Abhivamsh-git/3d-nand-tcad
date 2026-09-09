
Electrode{
{name="dsl" voltage=0.0}
{name="ssl" voltage=0.0}
{name="bl" voltage=0.0}
{name="sl" voltage=0.0}
{name="wl0" voltage=0.0}
{name="wl1" voltage=0.0}
{name="wl2" voltage=0.0}
{name="wl3" voltage=0.0}
{name="wl4" voltage=0.0}
{name="wl5" voltage=0.0}
{name="wl6" voltage=0.0}
{name="wl7" voltage=0.0 WorkFunction=4.8}
}

File{
Grid="@tdr@"
Plot="@tdrdat@"
Current="@plot@"
Output="@log@"
parameter="sdevice.par"
}

Physics (MaterialInterface="Si3N4/SiO2") {
Charge (Uniform Conc=1e+12) #0.7e+12
}

Physics (MaterialInterface="Silicon/SiO2") {
Traps (
(Donor Uniform fromMidBandGap Conc=2e+12 EnergyMid=-0.28 EnergySig=0.56)
(Acceptor Uniform fromMidBandGap Conc=2e+12 EnergyMid=0.28 EnergySig=0.56)
)
Charge (Uniform Conc=1e+12)
}

Physics{
Temperature=300
Mobility(
ConstantMobility
#DopingDependence 
HighFieldSaturation
Enormal
)
EffectiveIntrinsicDensity( OldSlotboom )
Recombination( Band2Band )
Recombination( SRH(DopingDependence ) )
Hydrodynamic(eTemperature)
eQuantumPotential
}


Math {
Cylindrical(yAxis=0.0)
Iterations=15
Digits=5
Avalderivatives
Iterations=20
Notdamped=100
Method= Blocked
SubMethod= ParDiSo
ErRef(electron)=1e8
ErRef(hole)=1e8
Transient=BE
RefDens_eGradQuasiFermi_ElectricField= 1e16
RefDens_hGradQuasiFermi_ElectricField= 1e16
-PlotLoadable
}

Plot{
eDensity hDensity
eCurrent hCurrent
TotalCurrent/Vector eCurrent/Vector hCurrent/Vector
eMobility hMobility
eVelocity hVelocity
eEnormal hEnormal
ElectricField/Vector Potential SpaceCharge
eQuasiFermi hQuasiFermi
Potential Doping SpaceCharge
SRH Auger
SRHRecombination
AvalancheGeneration
DonorConcentration AcceptorConcentration
Doping
eGradQuasiFermi/Vector hGradQuasiFermi/Vector
eEparallel hEparalllel
BandGap
BandGapNarrowing
Affinity
ConductionBand ValenceBand
eQuantumPotential
}

Solve {
*-creating initial guess:
Coupled ( Iterations= 100){ Poisson eQuantumPotential }
Coupled { Poisson eQuantumPotential Electron Hole }
*-vg sweep
Quasistationary(
InitialStep= 1e-3 Increment= 1.01
MinStep= 1e-13 MaxStep= 2.5
Goal { Name= "dsl" Voltage=-1.0 }
){ Coupled { Poisson eQuantumPotential Electron Hole } }
*-ramp to drain to vd
Quasistationary(
InitialStep= 1e-3
MinStep= 1e-13 MaxStep= 0.5
Goal { Name= "bl" Voltage=8}
){ Coupled { Poisson eQuantumPotential Electron Hole } }
}

