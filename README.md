# ngspice-diodo-exemplo

### Simple Diode Circuit

So, let's make a circuit with a diode! Now, diodes can have a bunch of characteristics when you buy them, so if you wanted to properly design a diode circuit, you'd need to know all the characteristics of the diode you bought. Also, to properly simulate, you need the same information.

So, I was interested in following the circuit simulation done in [Sedra and Smith](http://www.amazon.com/Microelectronic-Circuits-Electrical-Computer-Engineering/dp/0195323033/ref=sr_1_1?ie=UTF8&qid=1307358598&sr=8-1), so I googled for D1N4148, and found the following circuit model at [`http://www.seas.upenn.edu/~jan/spice/spice.models.html`](http://www.seas.upenn.edu/~jan/spice/spice.models.html). Here is the model

```
.model D1N4148 D (IS=0.1PA, RS=16 CJO=2PF TT=12N BV=100 IBV=0.1PA)\
```

I won't go over everything yet (want to keep this as concrete as possible for now), but the main take away is the the name of this model is D1N4148, as determined by the parameter right after the `.model` statement. You can paste this line at the beginning of your file, or you can, more nicely, put it into a separate file (`"D1N4148.mod"`) `.include`statement, as shown below.

```
.include ~/spice_models/D1N4148.mod

vin 1 0 2.0
r1 1 2 5k
d1 2 0 D1N4148
.dc vin 0.0 1.0 .1
.plot dc v(1)
.end
```

Here, I have created saved the file in the directory `spice_models` located in my home directory.

So, launching spice we do the standard run

```
ngspice  exemplo.cir
******
** ngspice-26 : Circuit level simulation program
** The U. C. Berkeley CAD Group
** Copyright 1985-1994, Regents of the University of California.
** Please get your ngspice manual from http://ngspice.sourceforge.net/docs.html
** Please file your bug-reports at http://ngspice.sourceforge.net/bugrep.html
** Creation Date: Wed Oct  1 23:50:16 BRT 2014
******

Circuit: * exemplo de diodo

ngspice 126 -> run
Doing analysis at TEMP = 27.000000 and TNOM = 27.000000



No. of Data Rows : 11
@ngspice 127 -> plot v(1), v(2)
@ngspice 128 ->
@ngspice 129 -> plot v(1)-v(2), v(2)
@ngspice 130 -> let resistorVoltage = v(1)-v(2)
@ngspice 131 -> plot resistorVoltage, v(2)
@ngspice 132 ->
```

Now we might be initially surprised by this, if we thought that v(1) was the drop across the resistor. It's not, remember it's the voltage at node 1, so it's exactly whatever the voltage of the battery is. So we see as the voltage increases, the voltage drop across the diode eventually saturates to about 1 diode drop. However, let's go actually look at the voltage drop across the resistor

