Lab1, RL = ?

.subckt meu_circuito A B
V1 1 B DC 20
R1 1 2 8
R2 2 A 6
R3 2 B 7
.ends

X1 A B meu_circuito
RL A B 2
.op

.control
run
let I_carga =  'v(a,b)/@rl[resistance]'
echo "corrente na carga = $&I_carga"

.endc

.end
