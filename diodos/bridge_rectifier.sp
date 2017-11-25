* bridge rectifier circuit

* Generic diode model:
.model diode d(Is=2.0298e-15, n=1)

* The input is a 120Hz sine wave:
Vin 2 1 SIN(0 10 120)

* Bridge rectifier:
D1 0 2 diode
D2 2 3 diode
D3 0 1 diode
D4 1 3 diode

* Load resistor:
Rload 3 0 1k

* Transient simulation:
.tran .1m 0.02

.end

