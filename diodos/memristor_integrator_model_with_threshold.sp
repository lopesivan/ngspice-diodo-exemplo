* Memristor integrator model with threshold

* Generic diode model:
.model diode d(Is=2.0298e-15, n=1, BV=200)

* Memristor subcircuit model:
.subckt memristor nplus nminus
D2 nplus nth diode
D3 nth nplus diode
R1 nth n2 100
C1 n2 n3a 10n ic=0

* Ideal op amp model (dependent v source):
E1 n3 nmin nmin n2 10000

* Stabilizing RC network at op amp's output:
R2 n3a n3 1
C2 n3a 0  10f

* Zener diode to constrain integrator bounds:
D1 n3a n2a diode
V1 n2a n2  DC -0.8V

* Nonlinear current source:
B1 nplus nmin i={-0.0001*(v(n3)-v(nmin))*((v(nplus)-v(nmin)))}

* Stabilizing series resistance:
R3 nmin nminus 1
.ends

