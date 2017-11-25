* single-diode regulator circuit

* Generic diode model:
.model diode d(Is=2.0298e-15, n=1)

* The input is a 120Hz sine wave that swings
* from zero up to one volt.
Vin 1 0 SIN(0.5 0.5 120)

* Regulator circuit
* The input  is at node 1
* The output is at node 2
R1 1 2 300
D1 2 0 diode

* Transient simulation:
.tran .1m 0.02

.end

