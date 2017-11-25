* Common-Gate amplifier with active bias
.model ntype NMOS(KP=100e-6,VTo=0.5,LAMBDA=0.05) 

VDD  ndd  0   DC 5V
VIN  ndc  0   DC 1.6V
VG   ng   0   DC 2.5V
RD   ndd  nd  50k
vsig nsig 0   SIN(0 0.01 10k)

RL   nout 0    10Meg
Cout nd   nout 10uF

M1  nd   ng ns 0 ntype W=1u L=200n
RS  ndc  ns 10k
Cin nsig ns 10u

.control
* Foreach loop to scan through RS values:
foreach RSval 1 10 100  1k 5k 10k

alter RS = $RSval
dc VIN 0 5 0.05

end

plot dc1.nd dc2.nd dc3.nd dc4.nd dc5.nd dc6.nd
plot 'dc1.nd-dc1.ng+0.5' 'dc2.nd-dc2.ng+0.5'
+ 'dc3.nd-dc3.ng+0.5' 'dc4.nd-dc4.ng+0.5'
+ 'dc5.nd-dc5.ng+0.5' 'dc6.nd-dc6.ng+0.5'

wrdata cg_dc dc1.nd dc2.nd dc3.nd dc4.nd dc5.nd dc6.nd

tran 1u 1m
plot v(nsig) v(nout)
.endc
.end
