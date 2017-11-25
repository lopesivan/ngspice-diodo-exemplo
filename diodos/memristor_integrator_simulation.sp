* Memristor simulation based on integrator model

.include memristor_integrator_model.sp

V1 nplus 0 SIN(0 5 100k)
X3 nplus 0 memristor

.control
* Medium-frequency simulation:
tran 10n 50u uic
plot -i(v1) vs v(nplus) 
plot v(X3.n3)
wrdata integrator_mid_freq v(nplus) i(v1) v(X3.n3)

* Low-frequency simulation:
alter @V1[sin]=[ 0 5 1k ]
tran .01m .0025 uic 
plot -i(v1) vs v(nplus) 
plot v(X3.n3)
wrdata integrator_low_freq v(nplus) i(v1) v(X3.n3)

* High-frequency simulation:
alter @V1[sin]= [ 0 5 1MEG ]
tran 1n 5u uic
plot -i(v1) vs v(nplus) 
plot v(X3.n3)
wrdata integrator_high_freq v(nplus) i(v1) v(X3.n3)

.endc
.end
