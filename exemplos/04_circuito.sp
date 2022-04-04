Lab1, RL = 54

V1 1 0 DC 20

R1 1 2 8
R2 2 3 6
R3 2 0 7
RL 3 0 58

.op

.control
run
let x  = '-$&i(v1)'         ; usei calcular a expressão
set V3 = $&v(3)             ; definindo variável com tensão
                            ; no nó 3 em relação ao terra
set RL = $&@rl[resistance]  ; definindo variável com resistência
							; do resistor RL
let y = '$V3/$RL'           ; calculando a expressão
echo x=$&x, y=$&y
.endc

.end
