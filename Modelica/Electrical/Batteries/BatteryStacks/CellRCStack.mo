within Modelica.Electrical.Batteries.BatteryStacks;
model CellRCStack
  "Battery with open-circuit voltage dependent on state of charge, self-discharge, inner resistance and a series of RC-elements"
  extends BaseClasses.BaseCellStack(r0(final R=Ns*cellData.R0/Np));
  Modelica.Electrical.Analog.Basic.Resistor resistor[cellData.nRC](
    final R=Ns*cellData.rcData.R/Np,
    each final T_ref=cellData.T_ref,
    each final alpha=cellData.alpha,
    each final useHeatPort=true)
    annotation (Placement(transformation(extent={{30,-30},{50,-10}})));
  Modelica.Electrical.Analog.Basic.Capacitor capacitor[cellData.nRC](each v(
        fixed=true, each start=0), final C=Np*cellData.rcData.C/Ns)
    annotation (Placement(transformation(extent={{30,30},{50,10}})));
equation
  assert(cellData.R0 > 0, "Ri has to be greater than sum(rcParameters.R)");
  assert(cellData.rcData[1].R > 0, "Parameters of RC-elements undefined!");
  //connect the RC-elements
  connect(resistor[1].p, r0.n)
    annotation (Line(points={{30,-20},{30,0},{10,0}},color={0,0,255}));
  for k in 1:cellData.nRC loop
    connect(capacitor[k].p, resistor[k].p)
      annotation (Line(points={{30,20},{30,-20}}, color={0,0,255}));
    connect(capacitor[k].n, resistor[k].n)
      annotation (Line(points={{50,20},{50,-20}},          color={0,0,255}));
    connect(internalHeatPort, resistor[k].heatPort)
      annotation (Line(points={{0,-80},{0,-40},{40,-40},{40,-30}}, color={191,0,0}));
    if k < cellData.nRC then
      connect(resistor[k].n, resistor[k + 1].p);
    end if;
  end for;
  connect(resistor[cellData.nRC].n, n)
    annotation (Line(points={{50,-20},{50,0},{100,0}},color={0,0,255}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Rectangle(
          extent={{-20,-20},{20,-6}},
          lineColor={238,46,47},
          lineThickness=0.5),
        Line(
          points={{-6,0},{-6,20}},
          color={238,46,47},
          thickness=0.5),
        Line(
          points={{6,0},{6,20}},
          color={238,46,47},
          thickness=0.5),
        Line(
          points={{-6,10},{-32,10},{-32,-14},{-20,-14}},
          color={238,46,47},
          thickness=0.5),
        Line(
          points={{6,10},{32,10},{32,-14},{20,-14}},
          color={238,46,47},
          thickness=0.5),
        Line(
          points={{-40,0},{-32,0}},
          color={238,46,47},
          thickness=0.5),
        Line(
          points={{32,0},{40,0}},
          color={238,46,47},
          thickness=0.5)}),
    Documentation(info="<html>
<p>
Extends the model <a href=\"modelica://Modelica.Electrical.Batteries.BatteryStacks.CellStack\">CellStack</a> by a series of RC-elements, describing the transient behaviour of the battery.
</p>
<p>
This model can be used for a single cell <code>Ns = Np = 1</code> as well as a stack built from identical cells.
</p>
<p>
For details, see <a href=\"modelica://Modelica.Electrical.Batteries.UsersGuide.Concept\">concept</a> and <a href=\"modelica://Modelica.Electrical.Batteries.UsersGuide.Parameterization\">parameterization</a>.
</p>
<h4>Note:</h4>
<p>
Parameter record array <a href=\"modelica://Modelica.Electrical.Batteries.ParameterRecords.RCData\">rcData</a> contained in
parameter record <a href=\"modelica://Modelica.Electrical.Batteries.ParameterRecords.CellData\">cellData</a> has to be specified.
</p>
<p>
The total inner resistance is the sum of the resistance of resistor <code>r0</code> and the sum of the resistances of the resistors of the RC-elements.
</p>
</html>"));
end CellRCStack;
