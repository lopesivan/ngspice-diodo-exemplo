Lab 4, Supplemental Exercise, ECE 3410
*******************************
* By Chris Winstead
* "Super-Diode"
* precision rectifier circuit
*******************************

* Include the model file:
.include ../lab_parts.md

* Generic diode model:
*.model diode d(Is=2.0298e-15, n=1)

VIN nin  0 SIN(0 4 10)
VDD nvdd 0 DC 10V
VSS nvss 0 DC -10V

* 741 instance
* Pin order: v+ v- VR+ VR- vo
X1 nin nout nvdd nvss nx uA741

D1 nx nout D1N914
RL nout 0 1k

.control
tran 1m 0.5
plot v(nin) v(nx) 
plot v(nin) v(nout)
plot v(nout)
.endc
.end



