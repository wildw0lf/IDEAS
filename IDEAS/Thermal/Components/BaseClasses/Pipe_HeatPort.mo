within IDEAS.Thermal.Components.BaseClasses;
model Pipe_HeatPort "Pipe with HeatPort"

  extends Thermal.Components.Interfaces.Partials.TwoPort;
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort
    annotation (Placement(transformation(extent={{-10,-110},{10,-90}},
          rotation=0)));
equation
  // energy exchange with medium
  Q_flow = heatPort.Q_flow;
  // defines heatPort's temperature
  heatPort.T = T;
  // pressure drop = none
  flowPort_a.p = flowPort_b.p;
annotation (Documentation(info="<HTML>
Pipe with heat exchange.<br>
Thermodynamic equations are defined by Partials.TwoPort.<br>
Q_flow is defined by heatPort.Q_flow.<br>
<b>Note:</b> Setting parameter m (mass of medium within pipe) to zero
leads to neglection of temperature transient cv*m*der(T).<br>
<b>Note:</b> Injecting heat into a pipe with zero massflow causes
temperature rise defined by storing heat in medium's mass.
</HTML>"),
  Icon(coordinateSystem(preserveAspectRatio=true, extent={{-100,-100},{100,
            100}}), graphics={
        Text(extent={{-150,100},{150,40}}, textString="%name"),
        Polygon(
          points={{-10,-90},{-10,-40},{0,-20},{10,-40},{10,-90},{-10,-90}},
          lineColor={255,0,0},
          fillPattern=FillPattern.Forward,
          fillColor={255,255,255}),
                              Rectangle(
          extent={{-100,20},{100,-20}},
          lineColor={255,255,255},
          fillColor={85,170,255},
          fillPattern=FillPattern.HorizontalCylinder)}),
                            Diagram(coordinateSystem(preserveAspectRatio=
            false, extent={{-100,-100},{100,100}}),
                                    graphics));
end Pipe_HeatPort;