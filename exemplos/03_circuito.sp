Lab1, Circuito 1

Vin n1 0 DC 5V

R1  n1 n2 1k
R2  n2 0  10k

* Vin varia de 0 até 5 ao passo de 1
* for (Vin = 0; Vin <= 5; Vin++){}
* => loop executado 6 vezes (5 - 0 + 1 = 6).
.dc Vin 0V 5V 1V

.control
run
plot vdb(n2)
.endc

.end
