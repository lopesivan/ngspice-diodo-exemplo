* Boost converter simulation

* Generic diode model:
.model diode d(Is=2.0298e-15, n=1)

* switch model:
.model switch sw(Ron=5, Roff=100000, Vt=0.001, Vh=0.0001)


* The input is 10V DC
Vin 1 0 DC 20V

* The switch control voltage is a high-frequency pulse waveform
Vswitch 4 0 PULSE(0 1 0 1n 1n 125n 200n)

* Boost converter circuit:
* Inductor:
L1 1 2 100u

* Diode, load capacitor and switch:
D1 2 3 diode
CL 3 0 10u
S1 2 0 4 0 switch

.tran 100n 1500u

.end


