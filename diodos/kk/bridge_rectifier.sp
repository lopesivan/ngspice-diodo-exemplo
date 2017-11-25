Lab 4, Supplemental Exercise, ECE 3410
***************************
* By Chris Winstead
* bridge rectifier circuit
***************************

* Include the model file:
.include ../lab_parts.md


* The input is a 10Hz sine wave:
Vin 2 1 SIN(0 10 120)

* Bridge rectifier:
D1 0 2 diode
D2 2 3 diode
D3 0 1 diode
D4 1 3 diode

* Load resistor:
Rload 3 0 1k

* Transient simulation:
.control
tran .1m 0.02
plot 'v(2)-v(1)' v(3)
.endc
.end

