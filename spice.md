 ## 1. AC Linear Macromodel of the 741 operational amplifier
 
 ```
 * Subcircuit for 741 opamp
.subckt opamp741 1 2 3
* +in (=1) -in (=2) out (=3)
rin 1 2 2meg
rout 6 3 75
e 4 0 1 2 100k
rbw 4 5 0.5meg
cbw 5 0 31.85nf
eout 6 0 5 0 1
.ends opamp741
 
 ```
This subcircuit models the 741 opamp with resistors, capacitors and dependent voltage sources. The specs of the opams are as follows:
Input resistance=2 MegaOhm,
Output resistance=75 Ohm,
Open loop gain=1E5 (100 dB)
Gain-bandwith product of 1MHz or a bandwidth of 10 Hz.
This is a linear model and hence does not model slewing of the operational amplifier.


## 2. Diode Model: 1N4148


 ```
 .model D1N4148 D (IS=0.1PA, RS=16 CJO=2PF TT=12N BV=100 IBV=0.1PA)
 ```

## 3. NPN Transistors
 
1N2222A NPN Transistor

```
.model Q2N2222A NPN (IS=14.34F  XTI=3  EG=1.11  VAF= 74.03  BF=255.9  
+NE=1.307  ISE=14.34F  IKF=.2847  XTB=1.5  BR=6.092  NC=2  ISC=0  IKR=0  
+RC=1  CJC=7.306P  MJC=.3416  VJC=.75  FC=.5  CJE=22.01P  MJE=.377  
+VJE=.75  TR=46.91N  TF=411.1P  ITF=.6  VTF=1.7  XTF=3  RB=10)
 ```

 2N696 NPN Transistor

 ```
.model Q2N696 NPN (IS=14.34F  XTI=3  EG=1.11  VAF= 74.03  BF=65.62  
+NE=1.208  ISE=19.48F  IKF=.2385  XTB=1.5  BR=9.715  NC=2  ISC=0  IKR=0  
+RC=1  CJC=9.393P MJC=.3416  VJC=.75  FC=.5  CJE=22.01P  MJE=.377  
+VJE=.75  TR=58.98N  TF=408.8P  ITF=.6  VTF=1.7  XTF=3  RB = 10)
 ```
 Note: A continuation sign + has been added at the beginning of a new line in the model statements.
 
 ## 4. MOSIS SPICE model parameters
 
 NMOS
 
 ```
 .MODEL CMOSN NMOS LEVEL=3 PHI=0.600000 TOX=2.1200E-08 XJ=0.200000U   
+TPG=1 VTO=0.7860 DELTA=6.9670E-01 LD=1.6470E-07 KP=9.6379E-05
+UO=591.7 THETA=8.1220E-02 RSH=8.5450E+01 GAMMA=0.5863
+NSUB=2.7470E+16 NFS=1.98E+12 VMAX=1.7330E+05 ETA=4.3680E-02
+KAPPA=1.3960E-01 CGDO=4.0241E-10 CGSO=4.0241E-10
+CGBO=3.6144E-10 CJ=3.8541E-04 MJ=1.1854 CJSW=1.3940E-10
+MJSW=0.125195 PB=0.800000
 ```
 
 PMOS 
 ```
 .MODEL CMOSP PMOS LEVEL=3 PHI=0.600000 TOX=2.1200E-08 XJ=0.200000U 
+TPG=-1 VTO=-0.9056 DELTA=1.5200E+00 LD=2.2000E-08 KP=2.9352E-05
+UO=180.2 THETA=1.2480E-01 RSH=1.0470E+02 GAMMA=0.4863
+NSUB=1.8900E+16 NFS=3.46E+12 VMAX=3.7320E+05 ETA=1.6410E-01
+KAPPA=9.6940E+00 CGDO=5.3752E-11 CGSO=5.3752E-11
+CGBO=3.3650E-10 CJ=4.8447E-04 MJ=0.5027 CJSW=1.6457E-10
+MJSW=0.217168 PB=0.850000
 ```
 
 Note: A continuation sign + has been added at the beginning of a new line in the model statements.


  
### Maximum parameters

NMOS

```
 .MODEL CMOSN NMOS LEVEL=3
PHI=0.600000 TOX=2.1500E-08 XJ=0.200000U +TPG=1 VTO=0.8063
DELTA=9.4090E-01 LD=1.3540E-07 KP=1.0877E-04 +UO=680.4
THETA=8.3620E-02 RSH=109.3 GAMMA=0.5487 +NSUB=2.3180E+16 NFS=1.98E+12
VMAX=1.8700E+05 ETA=5.5740E-02 +KAPPA=5.9210E-02 CGDO=3.2469E-10
CGSO=3.2469E-10 +CGBO=3.7124E-10 CJ=3.1786E-04 MJ=1.0148
CJSW=1.3284E-10 +MJSW=0.119521 PB=0.800000 
```

PMOS

```
 .MODEL CMOSP PMOS LEVEL=3 PHI=0.600000
TOX=2.1500E-08 XJ=0.200000U +TPG=-1VTO=-0.9403 DELTA=8.5790E-01
LD=1.1650E-09 KP=3.4276E-05 +UO=214.4 THETA=1.4010E-01 RSH=122.2
GAMMA=0.5615 +NSUB=2.4270E+16 NFS=3.46E+12 VMAX=3.9310E+05
ETA=1.5670E-01 +KAPPA=9.9990E+00 CGDO=2.7937E-12 CGSO=2.7937E-12
+CGBO=3.5981E-10 CJ=4.5952E-04 MJ=0.4845 CJSW=2.7917E-10
+MJSW=0.365250 PB=0.850000 
```

### Minimum parameters

NMOS

```
 .MODEL CMOSN NMOS LEVEL=3
PHI=0.600000 TOX=2.0500E-08 XJ=0.200000U +TPG=1 VTO=0.8147
DELTA=3.0170E-05 LD=1.7540E-07 KP=8.9765E-05 +UO=532.9
THETA=9.0470E-02 RSH=1.5870E+01 GAMMA=0.6654 +NSUB=3.7840E+16
NFS=5.5000E+12 VMAX=1.7140E+05 ETA=6.4550E-02 +KAPPA=5.6190E-02
CGDO=4.4318E-10 CGSO=4.4318E-10 +CGBO=3.2044E-10 CJ=3.1786E-04
MJ=1.0148 CJSW=1.3284E-10 +MJSW=0.119521 PB=0.800000 
```

PMOS

```
 .MODEL CMOSP PMOS LEVEL=3 PHI=0.600000
TOX=2.0500E-08 XJ=0.200000U +TPG=-1 VTO=-0.9189 DELTA=2.3190E+00
LD=1.0440E-08 KP=3.3521E-05 + UO=199.0 THETA=1.7940E-01 RSH=25.0000
GAMMA=0.4124 +NSUB=1.4540E+16 NFS=5.0000E+12 VMAX=5.4640E+05
ETA=2.1090E-01 + KAPPA=9.3670E+00 CGDO=2.6379E-11 CGSO=2.6379E-11 +
CGBO=2.8996E-10 CJ=4.6135E-04 MJ=0.4831 CJSW=1.8681E-10 +
MJSW=0.315030 PB=0.850000 
```

Parameters of the last MOSIS runs as well as process specifications for the HP1.2 um nwell process with linear capacitor option (CMOS34) can be obtained directly from MOSIS (HP 1.2um CMOS34). One can also obtain information about other IC processes offered through MOSIS.

## 5. N Channel JFET: 2N5459

```
.MODEL J2N5459 NJF (IS=1N VT0=-4 BETA=0.5M  
+ LAMBDA=2.40E-3 CGD=5.85PF CGD=3.49PF)
```
