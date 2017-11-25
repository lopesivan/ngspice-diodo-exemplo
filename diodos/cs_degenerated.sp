* Common-Source amplifier with source degeneration
.model ntype NMOS(KP=100e-6,VTo=0.5,LAMBDA=0.05) 

VDD  ndd  0 DC 5V
VIN  ndc  0 DC 1V
vsig nsig 0 SIN(0 0.1 1k)

RDC  ng   ndc 1Meg
Cin  nsig ng  10uF

RL   nout 0    1Meg
Cout nd   nout 10uF

M1 nd  ng ns 0 ntype W=1u L=200n
RD ndd nd 50k
RS ns  0  1

.control
* Foreach loop to scan through RS values:
foreach RSval 0 500 1000 5000 10000 20000

alter RS = $RSval
dc VIN 0 5 0.05

end

plot dc1.nd dc2.nd dc3.nd dc4.nd dc5.nd dc6.nd
wrdata cs_degenerated_dc dc1.nd dc2.nd dc3.nd dc4.nd dc5.nd dc6.nd
.endc
.end
