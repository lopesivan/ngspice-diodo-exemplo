* DC restoration circuit

* Generic diode model:
.model diode d(Is=2.0298e-15, n=1)

* The input is a 10Hz sine wave:
Vin 1 0 SIN(0 2 10)

* Peak detector circuit:
D1 0 2 diode
C1 1 2 10uF

* Transient simulation:
.tran 1m 2

.end

