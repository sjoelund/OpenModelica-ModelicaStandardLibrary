// Example: Modelica.Electrical.Analog.Examples.NandGate

// Version: $Id$


model NandGate "CMOS NAND Gate (see Tietze/Schenk, page 157)" 
  annotation (
    Coordsys(
      extent=[-100, -100; 100, 100], 
      grid=[1, 1], 
      component=[20, 20]), 
    Icon(Rectangle(extent=[-60, 60; 60, -60], style(
          color=10, 
          thickness=2, 
          gradient=0, 
          fillColor=8, 
          fillPattern=1)), Text(
        extent=[-50, 20; 50, -20], 
        string="NandGate", 
        style(color=0))), 
    Documentation(info="
<HTML>
<p>
The nand gate is a basic CMOS building block. It consists of four CMOS transistors. 
The output voltage Nand.y.v is low if and only if the two input voltages at Nand.x1.v and Nand.x2.v 
are both high. In this way the nand functionality is realized.
<p>
The simulation end time should be set to 1e-7. Please plot the input voltages Nand.x1.v, 
d Nand.x2.v, and the output voltage Nand.y.v.
<p>
<dl>
<dt>
<b>Reference:</b>
<dd>
Tietze, U.; Schenk, Ch.: Halbleiter-Schaltungstechnik. Springer-Verlag Berlin Heidelberg NewYork 1980, p. 157
<p>

<dt>
<b>Main Authors:</b>
<dd>
<a href=\"http://www.eas.iis.fhg.de/~clauss/\">Christoph Clau&szlig;</a> 
    &lt;<a href=\"mailto:clauss@eas.iis.fhg.de\">clauss@eas.iis.fhg.de</a>&gt;<br>
    <a href=\"http://www.eas.iis.fhg.de/~schneider/\">Andr&eacute; Schneider</a> 
    &lt;<a href=\"mailto:schneider@eas.iis.fhg.de\">schneider@eas.iis.fhg.de</a>&gt;<br>
    Fraunhofer Institute for Integrated Circuits<br>
    Design Automation Department<br>
    Zeunerstra&szlig;e 38<br>
    D-01069 Dresden<br>

<p>
<dt>
<b>Version:</b>
<dd>
$Id$<br>
<p>
<dt>
<b>Copyright:</b>
<dd>
Copyright (C) 1998-1999, Modelica Design Group and Fraunhofer-Gesellschaft.<br>
<i>The Modelica package is <b>free</b> software; it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package 
Modelica in file \"Modelica/package.mo\".</i><br>
<p>
</dl>
</HTML>
"), 
    Window(
      x=0.31, 
      y=0.39, 
      width=0.6, 
      height=0.6));
  Modelica.Electrical.Analog.Sources.TrapezoidVoltage VIN1(
    V=3.5, 
    startTime=20e-9, 
    rising=1e-9, 
    width=19e-9, 
    falling=1.e-9, 
    period=40e-9) annotation (extent=[-80, 10; -60, 30], rotation=-90);
  Modelica.Electrical.Analog.Sources.TrapezoidVoltage VIN2(
    V=3.5, 
    startTime=10e-9, 
    rising=1e-9, 
    width=19e-9, 
    falling=1.e-9, 
    period=40e-9) annotation (extent=[-80, -40; -60, -20], rotation=-90);
  Modelica.Electrical.Analog.Sources.RampVoltage VDD(V=5, duration=1e-9) 
    annotation (extent=[40, 60; 60, 80], rotation=-90);
  Modelica.Electrical.Analog.Basic.Ground Gnd1 annotation (extent=[45, 43; 55
        , 53]);
  Modelica.Electrical.Analog.Basic.Ground Gnd4 annotation (extent=[-75, -5; 
        -65, 5]);
  Modelica.Electrical.Analog.Basic.Ground Gnd5 annotation (extent=[-75, -55; 
        -65, -45]);
  Modelica.Electrical.Analog.Examples.Utilities.Nand Nand annotation (extent=[
        -40, -45; 40, 55]);
equation 
  connect(VDD.n, Gnd1.p) annotation (points=[50, 60; 50, 53]);
equation 
  connect(VIN1.n, Gnd4.p) annotation (points=[-70, 10; -70, 5]);
equation 
  connect(VIN2.n, Gnd5.p) annotation (points=[-70, -40; -70, -45]);
equation 
  connect(Nand.Vdd, VDD.p) annotation (points=[0, 55; 0, 90; 50, 90; 50, 80]);
equation 
  connect(VIN1.p, Nand.x1) annotation (points=[-70, 30; -40, 30]);
equation 
  connect(VIN2.p, Nand.x2) annotation (points=[-70, -20; -40, -20]);
end NandGate;
