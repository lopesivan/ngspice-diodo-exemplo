* Common-Source amplifier with source degeneration
.model ntype NMOS(KP=100e-6,VTo=0.5,LAMBDA=0.05)

VDD  ndd  0 DC 5V
VIN  ndc  0 DC 2.5V
vsig nsig 0 DC=0 AC=1 SIN(0 0.01 1k)

Rsig nsig  nin   10
RDC  ng    ndc   1Meg
CC1  nin   ng    10uF
Cin  ng    0     1pF

RL   nout 0    1Meg
CC2  nd   nout 10uF
Cout nd   0    1fF

M1 nd  ng ns 0 ntype W=1u L=200n 
RD ndd nd 50k
RS ns  0  50k
CS ns  0  1uF
.control
* INPUT DOMINANT CASES:
* Foreach loop to scan through RSig values:
foreach RSigval 100 500 2500 12500 62500 312500
alter Rsig = $RSigval
AC dec 10 10 10G
end

* OUTPUT DOMINANT CASES:
* Foreach loop to scan through Cout values:
alter Rsig=10
foreach Coutval 10f 50f 250f 1.25p 6.25p 31.25p 10p
alter Cout = $Coutval
AC dec 10 10 10G
end

plot db(ac1.nd) db(ac2.nd) db(ac3.nd) db(ac4.nd) db(ac5.nd) db(ac6.nd) 
plot db(ac7.nd) db(ac8.nd) db(ac9.nd) db(ac10.nd) db(ac11.nd) db(ac12.nd) 
.endc
.end
