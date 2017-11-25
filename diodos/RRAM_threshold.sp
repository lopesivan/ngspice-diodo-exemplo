* Memristor resistive RAM demo

* Zener diode model:
.model zdiode d(Is=2.0298e-15, n=1, BV=5)

* Load the external memristor model:
.include memristor_integrator_model_with_threshold.sp

* Circuit for one RRAM cell:
R1 1 2 100
X1 2 3 memristor
D1 3 4 zdiode

* VH  is the write-1 pulse
* VL  is the write-0 pulse
* Vrd is the read pulse
VH  1 5 DC 0 PULSE (0 10 00u 10u 10u 400u 2400u)
VL  4 0 DC 0 PULSE (0 10 1200u 10u 10u 400u 2400u)
VRd 5 0 DC 0 PULSE (0 1 660u 10u 10u 30u 1200u)


* Simulation control commands:
.control
tran 100u 20m uic

* Plot write/read/memristor signals:
plot v(1) v(4) 'v(2)-v(3)'

* Plot model integrator state:
plot v(X1.n3)-v(X1.nmin)

* Plot read response:
plot '(v(2)-v(3))*v(5)/3' v(5)

wrdata RRAM_threshold_demo v(1) v(2) v(3) v(4) v(5) X1.n3 X1.nmin

.endc
.end
