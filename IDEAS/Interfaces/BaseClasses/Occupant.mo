within IDEAS.Interfaces.BaseClasses;
partial model Occupant

  extends IDEAS.Interfaces.BaseClasses.PartialSystem;

  parameter Integer nZones(min=1) "number of conditioned thermal zones";
  parameter Integer nLoads(min=0) = 1 "number of electric loads";

  parameter Integer id=1 "id-number on extern data references";

  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a[nZones] heatPortCon
    "Nodes for convective heat gains" annotation (Placement(transformation(
          extent={{-210,10},{-190,30}}),iconTransformation(extent={{-210,10},{
            -190,30}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a[nZones] heatPortRad
    "Nodes for radiative heat gains" annotation (Placement(transformation(
          extent={{-210,-30},{-190,-10}}),iconTransformation(extent={{-210,-30},
            {-190,-10}})));
  Modelica.Blocks.Interfaces.RealOutput[nZones] TSet(
    final quantity="ThermodynamicTemperature",
    unit="K",
    displayUnit="degC",
    min=0) "Setpoint temperature for the zones" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,100})));

  Modelica.Blocks.Interfaces.RealOutput mDHW60C
    "mFlow for domestic hot water, at 60 degC" annotation (Placement(
        transformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,100}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={60,100})));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,
            -100},{200,100}}),
                         graphics={
        Rectangle(
          extent={{-200,100},{200,-100}},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          lineColor={191,0,0}),
        Ellipse(extent={{-12,74},{12,48}}, lineColor={127,0,0}),
        Polygon(
          points={{4,48},{-4,48},{-8,44},{-14,32},{-18,16},{-20,-6},{-14,-20},{14,
              -20},{-14,-20},{-10,-46},{-8,-56},{-8,-64},{-8,-72},{-10,-76},{4,-76},
              {4,-64},{2,-56},{2,-46},{4,-38},{8,-40},{12,-42},{12,-54},{12,-64},
              {14,-70},{18,-76},{24,-76},{22,-64},{22,-56},{22,-48},{24,-40},{24,
              -30},{22,-24},{20,-18},{18,-8},{18,4},{18,12},{18,14},{18,26},{14,
              38},{10,44},{8,46},{4,48}},
          lineColor={127,0,0},
          smooth=Smooth.None),
        Line(
          points={{-58,-76},{60,-76}},
          color={127,0,0},
          smooth=Smooth.None),
        Line(
          points={{200,100},{200,-100}},
          color={85,170,255},
          smooth=Smooth.None)}), Diagram(coordinateSystem(preserveAspectRatio=false,
          extent={{-200,-100},{200,100}}), graphics));
end Occupant;
