* super-diode precision rectifier simulation

* Include model for 741 op amp:
.include 741.sp

* Generic diode model:
.model diode d(Is=2.0298e-15, n=1)

VIN 1 0 SIN(0 4 10)
VDD 10 0 DC 10V

* 741 instance
* Pin order: v+ v- VR+ VR- vo
X1 1 2 10 0 3 uA741

D1 3 2 diode
RL 2 0 1k

.tran 1m 0.5

.end



