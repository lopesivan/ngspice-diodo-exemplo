Lab1, Circuito 2

Vin n1 0 DC 1V

R1  n1 n2 1k
R2  n2 0  10k

.op

.control
run
let y = v(n2)
echo Solução: $&y
.endc

.end
