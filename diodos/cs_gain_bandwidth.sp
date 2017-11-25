* Common-Source amplifier gain/bw tradeoff
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
Cout nd   0    1pF

M1 nd  ng ns 0 ntype W=1u L=200n 
RD ndd nd 50k
RS ns  0  50k
CS ns  0  1uF
.control

* Sweep R values to see Gain/BW tradeoff:
foreach Rval 5k 10k 25k 50k 100k
alter RD=$Rval
alter RS=$Rval
DC VIN 0 5 0.1
AC dec 10 10 10G
set gm=@m1[gm]
set rv=$Rval
let av=$gm*$rv
let avp=sqrt(2*5e-4*$rv)
let avdb=20*log10(av)
let fc=1.0/(2*3.1415*$rv*1e-12)
echo $rv
print @m1[gm] @m1[id] av avp avdb fc
end

plot db(ac1.nd) db(ac2.nd) db(ac3.nd) db(ac4.nd) db(ac5.nd) 
wrdata cs_gbw db(ac1.nd) db(ac2.nd) db(ac3.nd) db(ac4.nd) db(ac5.nd) 
.endc
.end
