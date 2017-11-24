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
