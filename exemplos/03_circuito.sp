Lab1, RL = 2

V1 1 0 DC 20

R1 1 2 8
R2 2 3 6
R3 2 0 7
RL 3 0 2

.op

.control
run
let tensao = $&v(3)              ; definindo variável com tensão
let carga  = $&@rl[resistance]   ; definindo variável com resistência

let x      = '-$&i(v1)'          ; aspas simples para calcular a expressão
let y      = 'tensao/carga'      ; calculando a expressão
let diference_xy = 'x-y'         ; calculando a expressão

echo "x=$&x, y=$&y, x-y=$&diference_xy"
.endc

.end
