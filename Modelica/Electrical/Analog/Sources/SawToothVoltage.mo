within Modelica.Electrical.Analog.Sources;
model SawToothVoltage "Saw tooth voltage source"
  parameter SI.Voltage V(start=1) "Amplitude of saw tooth";
  parameter SI.Time period(start=1) "Time for one period";
  extends Interfaces.VoltageSource(redeclare Modelica.Blocks.Sources.SawTooth
      signalSource(final amplitude=V, final period=period));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={Line(points={{-85,-70},{-65,-70},{-5,71},{-5,-70},
              {55,71},{55,-70}}, color={192,192,192})}),
    Documentation(revisions="<html>
<ul>
<li><em> 1998   </em>
       by Christoph Clauss<br> initially implemented<br>
       </li>
</ul>
</html>",
        info="<html>
<p>This voltage source uses the corresponding signal source of the Modelica.Blocks.Sources package. Care for the meaning of the parameters in the Blocks package. Furthermore, an offset parameter is introduced, which is added to the value calculated by the blocks source. The startTime parameter allows to shift the blocks source behavior on the time axis.</p>
<p>
<img src=\"modelica://Modelica/Resources/Images/Electrical/Analog/Sources/SawToothVoltage.png\"
     alt=\"SawToothVoltage.png\">
</p>
</html>"));
end SawToothVoltage;
