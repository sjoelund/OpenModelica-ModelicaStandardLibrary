model ChuaCircuit "Chua's circuit, ns, V, A" 
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
        string="ChuaCircuit", 
        style(color=0))), 
    Documentation(info="
<HTML>
<p>
 Chua's circuit is the most simple nonlinear circuit which shows chaotic behaviour. The circuit consists of linear basic elements (capacitors, resistor, conductor, inductor), and one nonlinear element, which is called Chua's diode. The chaotic behaviour is simulated.
<p>
The simulation end time should be set to 5e4. To get the chaotic behaviour please plot C1.v. Choose C2.v as the independent variable.
<p>
<dl>
<dt>
<b>Reference:</b>
<dd>
Kennedy, M.P.: Three Steps to Chaos - Part I: Evolution. IEEE Transactions on CAS I 40 (1993)10, 640-656
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
"));
  Modelica.Electrical.Analog.Basic.Inductor L(L=18) annotation (extent=[-100, 
        25; -50, 75], rotation=-90);
  Modelica.Electrical.Analog.Basic.Resistor Ro(R=12.5e-3) annotation (extent=[
        -100, -30; -50, 20], rotation=-90);
  Modelica.Electrical.Analog.Basic.Conductor G(G=0.565) annotation (extent=[-
        25, 50; 25, 100]);
  Modelica.Electrical.Analog.Basic.Capacitor C1(C=10, v(start=4)) annotation (
      extent=[0, -10; 50, 40], rotation=-90);
  Modelica.Electrical.Analog.Basic.Capacitor C2(C=100) annotation (extent=[-50
        , -10; 0, 40], rotation=-90);
  Modelica.Electrical.Analog.Examples.Utilities.NonlinearResistor Nr(
    Ga=-0.757576, 
    Gb=-0.409091, 
    Ve=1) annotation (extent=[50, -10; 100, 40], rotation=-90);
  Modelica.Electrical.Analog.Basic.Ground Gnd annotation (extent=[-25, -100; 
        25, -50]);
equation 
  connect(L.p, G.p) annotation (points=[-72.6667, 75; -25, 75]);
equation 
  connect(G.n, Nr.p) annotation (points=[25, 75; 75, 75; 75, 40]);
equation 
  connect(Nr.n, Gnd.p) annotation (points=[75, -10; 75, -50; 2.33333, -50]);
equation 
  connect(C1.p, G.n) annotation (points=[25, 40; 25, 75]);
equation 
  connect(L.n, Ro.p) annotation (points=[-75, 25; -75, 20]);
equation 
  connect(G.p, C2.p) annotation (points=[-25, 75; -25, 40]);
equation 
  connect(C1.n, Gnd.p) annotation (points=[25, -10; 25, -50; 0, -50]);
equation 
  connect(C2.n, Gnd.p) annotation (points=[-25, -10; -25, -50; 0, -50]);
equation 
  connect(Ro.n, Gnd.p) annotation (points=[-75, -30; -75, -50; 0, -50]);
end ChuaCircuit;
