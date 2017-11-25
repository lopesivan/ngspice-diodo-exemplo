Lab 4, Supplemental Exercise, ECE 3410
***************************
* By Chris Winstead
* boost converter circuit
***************************

* Include the model file:
.include ../lab_parts.md

* Switching parameters:
.param T=200n
.param D=0.75

* switch model:
.model switch sw(Ron=25, Roff=100000, Vt=0.001, Vh=0.0001)


* The input is 10V DC
Vin nin 0 DC 4V

* The switch control voltage is a high-frequency pulse waveform
Vswitch nphi 0 PULSE(0 1 0 1n 1n 'D*T' 'T')

* Boost converter circuit:
* Inductor:
L1 nin nx 100u

* Diode and load capacitor
D1 nx   nout D1N914
CL nout 0    10u

* Switch instance:
S1 nx 0 nphi 0 switch

.control
tran 50u 5m
plot v(nout)
.endc
.end


