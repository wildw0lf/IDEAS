within IDEAS.Examples;
package TwinHouses
  "Models for validation on Twin house test cases IEA EBC Annex 58"
  extends Modelica.Icons.ExamplesPackage;
  model BuildingN2_Exp1
    "Model for simulation of experiment 1 for the N2 building"
   extends Modelica.Icons.Example;
    BaseClasses.Structures.TwinhouseN2 struct(T_start={303.15,303.15,303.15,303.15,303.15,303.15,
          303.15})
      annotation (Placement(transformation(extent={{-42,-10},{-12,10}})));
    BaseClasses.HeatingSystems.ElectricHeating_Twinhouse_exp1 heaSys(
      nEmbPorts=0,
      nZones=struct.nZones,
      InInterface=true,
      nLoads=0,
      Crad={1000,1000,1000,1000,1100,1000,100},
      Q_design={2000,750,750,750,750,750,750},
      Kemission={100,100,100,100,110,100,100})
      annotation (Placement(transformation(extent={{0,-10},{40,10}})));
     // nLoads=0,
       // Qdesign={2000,0,2000,2000,2000,2000,2000},
    BaseClasses.Ventilation.Vent_TTH vent(
      nZones=struct.nZones,
      VZones=struct.VZones,
      redeclare package Medium = IDEAS.Media.Air)
      annotation (Placement(transformation(extent={{0,20},{40,40}})));
    inner IDEAS.BoundaryConditions.SimInfoManager sim(
      filNam="weatherinput.TMY",
      weaDat(
        pAtmSou=IDEAS.BoundaryConditions.Types.DataSource.Parameter,
        ceiHeiSou=IDEAS.BoundaryConditions.Types.DataSource.Parameter,
        ceiHei=7,
        HSou=IDEAS.BoundaryConditions.Types.RadiationDataSource.Input_HGloHor_HDifHor,
        totSkyCovSou=IDEAS.BoundaryConditions.Types.DataSource.Parameter,
        opaSkyCovSou=IDEAS.BoundaryConditions.Types.DataSource.Parameter,
        calTSky=IDEAS.BoundaryConditions.Types.SkyTemperatureCalculation.TemperaturesAndSkyCover,
        totSkyCov=0.6,
        opaSkyCov=0.6),
      lat=0.83555892609977,
      lon=0.20469221467389,
      linIntRad=false,
      linExtRad=false)
      annotation (Placement(transformation(extent={{-68,64},{-48,84}})));

    Modelica.Blocks.Sources.RealExpression[8] noInput
      annotation (Placement(transformation(extent={{-30,-46},{-10,-26}})));
    Modelica.Blocks.Tables.CombiTable1Ds inputSolTTH(
      tableOnFile=true,
      tableName="data",
      fileName=
          IDEAS.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath(Modelica.Utilities.Files.loadResource("modelica://IDEAS") + "//Inputs//"+"weatherinput.txt"),
      columns=2:30,
      smoothness=Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative2)
      "input for solGloHor and solDifHor measured at TTH"
      annotation (Placement(transformation(extent={{-92,64},{-72,84}})));
  equation
    if time> 20044800 then
    inputSolTTH.u= sim.timMan.timCal;
    else
    inputSolTTH.u = 20044800;
    end if;
    connect(sim.weaDat.HGloHor_in, inputSolTTH.y[8]);
    connect(sim.weaDat.HDifHor_in, inputSolTTH.y[10]);
    connect(struct.heatPortEmb, heaSys.heatPortEmb)
      annotation (Line(points={{-12,6},{0,6}}, color={191,0,0}));
    connect(struct.heatPortCon, heaSys.heatPortCon)
      annotation (Line(points={{-12,2},{0,2}},        color={191,0,0}));
    connect(struct.heatPortRad, heaSys.heatPortRad)
      annotation (Line(points={{-12,-2},{0,-2}}, color={191,0,0}));
    connect(struct.TSensor, heaSys.TSensor)
      annotation (Line(points={{-11.4,-6},{-0.4,-6}},color={0,0,127}));
    connect(struct.TSensor, vent.TSensor) annotation (Line(points={{-11.4,-6},{
            -6,-6},{-6,-4},{-6,24},{-0.4,24}},        color={0,0,127}));
    connect(vent.flowPort_In, struct.flowPort_Out) annotation (Line(points={{0,32},{
            0,32},{-29,32},{-29,22},{-29,10}},
                                             color={0,0,0}));
    connect(struct.flowPort_In, vent.flowPort_Out) annotation (Line(points={{-25,10},
            {-24,10},{-24,28},{0,28}},              color={0,0,0}));
            for i in 1:struct.nZones loop
            end for;
    connect(noInput[1:7].y, heaSys.TSet) annotation (Line(points={{-9,-36},{20,
            -36},{20,-10},{20,-10.2}}, color={0,0,127}));
    connect(noInput[8].y, heaSys.mDHW60C) annotation (Line(points={{-9,-36},{26,
            -36},{26,-10.2}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(
        StartTime=1.5e+007,
        StopTime=2.35872e+007,
        Interval=900,
        Tolerance=1e-006));
  end BuildingN2_Exp1;

  model BuildingN2_Exp1_TB
    "Model for simulation of experiment 1 for the N2 building"
   extends Modelica.Icons.Example;
    BaseClasses.Structures.TwinhouseN2_TB struct(T_start={303.15,303.15,303.15,303.15,303.15,303.15,
          303.15})
      annotation (Placement(transformation(extent={{-42,-10},{-12,10}})));
    BaseClasses.HeatingSystems.ElectricHeating_Twinhouse_exp1 heaSys(
      nEmbPorts=0,
      nZones=struct.nZones,
      InInterface=true,
      nLoads=0,
      Crad={1000,1000,1000,1000,1100,1000,100},
      Q_design={2000,750,750,750,750,750,750},
      Kemission={100,100,100,100,110,100,100})
      annotation (Placement(transformation(extent={{0,-10},{40,10}})));
     // nLoads=0,
       // Qdesign={2000,0,2000,2000,2000,2000,2000},
    BaseClasses.Ventilation.Vent_TTH vent(
      nZones=struct.nZones,
      VZones=struct.VZones,
      redeclare package Medium = IDEAS.Media.Air)
      annotation (Placement(transformation(extent={{0,20},{40,40}})));
    inner IDEAS.BoundaryConditions.SimInfoManager sim(
      filNam="weatherinput.TMY",
      weaDat(
        pAtmSou=IDEAS.BoundaryConditions.Types.DataSource.Parameter,
        ceiHeiSou=IDEAS.BoundaryConditions.Types.DataSource.Parameter,
        ceiHei=7,
        HSou=IDEAS.BoundaryConditions.Types.RadiationDataSource.Input_HGloHor_HDifHor,
        totSkyCovSou=IDEAS.BoundaryConditions.Types.DataSource.Parameter,
        opaSkyCovSou=IDEAS.BoundaryConditions.Types.DataSource.Parameter,
        calTSky=IDEAS.BoundaryConditions.Types.SkyTemperatureCalculation.TemperaturesAndSkyCover,
        totSkyCov=0.6,
        opaSkyCov=0.6),
      lat=0.83555892609977,
      lon=0.20469221467389,
      linIntRad=false,
      linExtRad=false)
      annotation (Placement(transformation(extent={{-68,64},{-48,84}})));

    Modelica.Blocks.Sources.RealExpression[8] noInput
      annotation (Placement(transformation(extent={{-30,-46},{-10,-26}})));
    Modelica.Blocks.Tables.CombiTable1Ds inputSolTTH(
      tableOnFile=true,
      tableName="data",
      fileName=
          IDEAS.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath(Modelica.Utilities.Files.loadResource("modelica://IDEAS") + "//Inputs//"+"weatherinput.txt"),
      columns=2:30,
      smoothness=Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative2)
      "input for solGloHor and solDifHor measured at TTH"
      annotation (Placement(transformation(extent={{-92,64},{-72,84}})));
  equation
    if time> 20044800 then
    inputSolTTH.u= sim.timMan.timCal;
    else
    inputSolTTH.u = 20044800;
    end if;
    connect(sim.weaDat.HGloHor_in, inputSolTTH.y[8]);
    connect(sim.weaDat.HDifHor_in, inputSolTTH.y[10]);
    connect(struct.heatPortEmb, heaSys.heatPortEmb)
      annotation (Line(points={{-12,6},{0,6}}, color={191,0,0}));
    connect(struct.heatPortCon, heaSys.heatPortCon)
      annotation (Line(points={{-12,2},{0,2}},        color={191,0,0}));
    connect(struct.heatPortRad, heaSys.heatPortRad)
      annotation (Line(points={{-12,-2},{0,-2}}, color={191,0,0}));
    connect(struct.TSensor, heaSys.TSensor)
      annotation (Line(points={{-11.4,-6},{-0.4,-6}},color={0,0,127}));
    connect(struct.TSensor, vent.TSensor) annotation (Line(points={{-11.4,-6},{
            -6,-6},{-6,-4},{-6,24},{-0.4,24}},        color={0,0,127}));
    connect(vent.flowPort_In, struct.flowPort_Out) annotation (Line(points={{0,32},{
            0,32},{-29,32},{-29,22},{-29,10}},
                                             color={0,0,0}));
    connect(struct.flowPort_In, vent.flowPort_Out) annotation (Line(points={{-25,10},
            {-24,10},{-24,28},{0,28}},              color={0,0,0}));
            for i in 1:struct.nZones loop
            end for;
    connect(noInput[1:7].y, heaSys.TSet) annotation (Line(points={{-9,-36},{20,
            -36},{20,-10},{20,-10.2}}, color={0,0,127}));
    connect(noInput[8].y, heaSys.mDHW60C) annotation (Line(points={{-9,-36},{26,
            -36},{26,-10.2}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(
        StartTime=1.5e+007,
        StopTime=2.35872e+007,
        Interval=900,
        Tolerance=1e-006));
  end BuildingN2_Exp1_TB;

  model BuildingO5_Exp1
    "Model for simulation of experiment 1 for the O5 building"
   extends Modelica.Icons.Example;
    BaseClasses.Structures.TwinhouseO5 struct(T_start={303.15,303.15,303.15,303.15,303.15,303.15,
          303.15}, inputAtticAndBasement(fileName="C:/Users/glenn/Documents/0_BackUp/TwinHousesv2/bc_TTH_O5.txt"))
      annotation (Placement(transformation(extent={{-42,-10},{-12,10}})));
    BaseClasses.HeatingSystems.ElectricHeating_Twinhouse_exp1 heaSys(
      nEmbPorts=0,
      nZones=struct.nZones,
      InInterface=true,
      nLoads=0,
      Crad={1000,1000,1000,1000,1100,1000,100},
      Q_design={2000,750,750,750,750,750,750},
      Kemission={100,100,100,100,110,100,100},
      measuredInput(fileName="C:/Users/glenn/Documents/0_BackUp/TwinHousesv2/meas_TTH_O5.txt"))
      annotation (Placement(transformation(extent={{0,-10},{40,10}})));
     // nLoads=0,
       // Qdesign={2000,0,2000,2000,2000,2000,2000},
    BaseClasses.Ventilation.Vent_TTH vent(
      nZones=struct.nZones,
      VZones=struct.VZones,
      redeclare package Medium = IDEAS.Media.Air,
      measuredInput(fileName="C:/Users/glenn/Documents/0_BackUp/TwinHousesv2/bc_TTH_O5.txt"))
      annotation (Placement(transformation(extent={{0,20},{40,40}})));
    inner IDEAS.BoundaryConditions.SimInfoManager sim(
      filNam="weatherinput.TMY",
      weaDat(
        pAtmSou=IDEAS.BoundaryConditions.Types.DataSource.Parameter,
        ceiHeiSou=IDEAS.BoundaryConditions.Types.DataSource.Parameter,
        ceiHei=7,
        HSou=IDEAS.BoundaryConditions.Types.RadiationDataSource.Input_HGloHor_HDifHor,
        totSkyCovSou=IDEAS.BoundaryConditions.Types.DataSource.Parameter,
        opaSkyCovSou=IDEAS.BoundaryConditions.Types.DataSource.Parameter,
        calTSky=IDEAS.BoundaryConditions.Types.SkyTemperatureCalculation.TemperaturesAndSkyCover,
        totSkyCov=0.6,
        opaSkyCov=0.6),
      linIntRad=false,
      linExtRad=false,
      lat=0.83555892609977,
      lon=0.20469221467389)
      annotation (Placement(transformation(extent={{-68,64},{-48,84}})));

    Modelica.Blocks.Sources.RealExpression[8] noInput
      annotation (Placement(transformation(extent={{-30,-46},{-10,-26}})));
    Modelica.Blocks.Tables.CombiTable1Ds inputSolTTH(
      tableOnFile=true,
      tableName="data",
      fileName=
          IDEAS.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath(Modelica.Utilities.Files.loadResource("modelica://IDEAS") + "//Inputs//"+"weatherinput.txt"),
      columns=2:30,
      smoothness=Modelica.Blocks.Types.Smoothness.MonotoneContinuousDerivative2)
      "input for solGloHor and solDifHor measured at TTH"
      annotation (Placement(transformation(extent={{-92,64},{-72,84}})));
  equation
    if time> 20044800 then
    inputSolTTH.u= sim.timMan.timCal;
    else
    inputSolTTH.u = 20044800;
    end if;
    connect(sim.weaDat.HGloHor_in, inputSolTTH.y[8]);
    connect(sim.weaDat.HDifHor_in, inputSolTTH.y[10]);
    connect(struct.heatPortEmb, heaSys.heatPortEmb)
      annotation (Line(points={{-12,6},{0,6}}, color={191,0,0}));
    connect(struct.heatPortCon, heaSys.heatPortCon)
      annotation (Line(points={{-12,2},{0,2}},        color={191,0,0}));
    connect(struct.heatPortRad, heaSys.heatPortRad)
      annotation (Line(points={{-12,-2},{0,-2}}, color={191,0,0}));
    connect(struct.TSensor, heaSys.TSensor)
      annotation (Line(points={{-11.4,-6},{-0.4,-6}},color={0,0,127}));
    connect(struct.TSensor, vent.TSensor) annotation (Line(points={{-11.4,-6},{
            -6,-6},{-6,-4},{-6,24},{-0.4,24}},        color={0,0,127}));
    connect(vent.flowPort_In, struct.flowPort_Out) annotation (Line(points={{0,32},{
            0,32},{-29,32},{-29,22},{-29,10}},
                                             color={0,0,0}));
    connect(struct.flowPort_In, vent.flowPort_Out) annotation (Line(points={{-25,10},
            {-24,10},{-24,28},{0,28}},              color={0,0,0}));


    connect(noInput[1:7].y, heaSys.TSet) annotation (Line(points={{-9,-36},{20,
            -36},{20,-10},{20,-10.2}}, color={0,0,127}));
    connect(noInput[8].y, heaSys.mDHW60C) annotation (Line(points={{-9,-36},{26,
            -36},{26,-10.2}}, color={0,0,127}));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)),
      experiment(
        StartTime=1.5e+007,
        StopTime=2.35872e+007,
        Interval=900,
        Tolerance=1e-006));
  end BuildingO5_Exp1;

  package BaseClasses
    extends Modelica.Icons.BasesPackage;

    package Structures "Building structures"

    model TwinhouseN2 "Model Based on Excel autogenerated"
        extends IDEAS.Templates.Interfaces.BaseClasses.Structure(
        redeclare each package Medium = IDEAS.Media.Air,
            nZones = 7,
            VZones = {Living.V,Corridor.V,Bathroom.V,Bedroom1.V,Kitchen.V,Entrance.V,Bedroom2.V},
            AZones = {Living.V/3,Corridor.V/3,Bathroom.V/3,Bedroom1.V/3,Kitchen.V/3,Entrance.V/3,Bedroom2.V/3},
            Q_design = {Living.Q_design,Corridor.Q_design,Bathroom.Q_design,Bedroom1.Q_design,Kitchen.Q_design,Entrance.Q_design,Bedroom2.Q_design},
            nEmb = 0);
     parameter Modelica.SIunits.Angle incWall =  IDEAS.Types.Tilt.Wall;
     parameter Modelica.SIunits.Angle incCeil =  IDEAS.Types.Tilt.Ceiling;
     parameter Modelica.SIunits.Angle incFloor = IDEAS.Types.Tilt.Floor;
     parameter Modelica.SIunits.Angle aziNorth = IDEAS.Types.Azimuth.N;
     parameter Modelica.SIunits.Angle aziEast = IDEAS.Types.Azimuth.E;
     parameter Modelica.SIunits.Angle aziSouth = IDEAS.Types.Azimuth.S;
     parameter Modelica.SIunits.Angle aziWest = IDEAS.Types.Azimuth.W;

     // Declaration of zones
    IDEAS.Buildings.Components.Zone Living(nSurf=18,
    V=86.417818,
     n50=2.2,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium,
        redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{-108,51},
                {-89,76}})));

    IDEAS.Buildings.Components.Zone Corridor(nSurf=10,
    V=12.085281,
     n50=2.2,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{-78,51},
                {-58,76}})));

    IDEAS.Buildings.Components.Zone Bathroom(nSurf=8,
    V=15.4423035,
     n50=2.2,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{-48,51},
                {-28,76}})));

    IDEAS.Buildings.Components.Zone Bedroom1(nSurf=11,
    V=27.6164065,
     n50=2.2,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{-18,51},
                {2,76}})));

    IDEAS.Buildings.Components.Zone Kitchen(nSurf=10,
    V=18.5590575,
     n50=1.62,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{12,51},
                {32,76}})));

    IDEAS.Buildings.Components.Zone Entrance(nSurf=8,
    V=14.6518875,
     n50=1.62,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{42,51},
                {62,76}})));

    IDEAS.Buildings.Components.Zone Bedroom2(nSurf=12,
    V=26.817258,
     n50=1.62,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{72,51},
                {92,76}})));


    // Declaration of walls
    IDEAS.Buildings.Components.OuterWall W1(AWall=9.0436,inc=incWall,azi=aziNorth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-145,34},
                {-135,14}})));
    IDEAS.Buildings.Components.OuterWall W2(AWall=8.0524,inc=incWall,azi=aziNorth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-130,34},
                {-120,14}})));
    IDEAS.Buildings.Components.OuterWall W3(AWall=12.4384,inc=incWall,azi=aziNorth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-115,34},
                {-105,14}})));
    IDEAS.Buildings.Components.OuterWall W4(AWall=12.2344,inc=incWall,azi=aziEast,
    redeclare parameter BaseClasses.Data.Constructions.extwall_E
                                                     constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-100,34},
                {-90,14}})));
    IDEAS.Buildings.Components.OuterWall W5(AWall=10.2664,inc=incWall,azi=aziEast,
    redeclare parameter BaseClasses.Data.Constructions.extwall_E
                                                     constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-85,34},
                {-75,14}})));
    IDEAS.Buildings.Components.OuterWall W6(AWall=11.2832,inc=incWall,azi=aziEast,
    redeclare parameter BaseClasses.Data.Constructions.extwall_E
                                                     constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-70,34},
                {-60,14}})));
    IDEAS.Buildings.Components.OuterWall W7(AWall=13.3584,inc=incWall,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-55,34},
                {-45,14}})));
    IDEAS.Buildings.Components.OuterWall W8(AWall=14.726,inc=incWall,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-40,34},
                {-30,14}})));
    IDEAS.Buildings.Components.OuterWall W9(AWall=16.8428,inc=incWall,azi=aziWest,
    redeclare parameter BaseClasses.Data.Constructions.extwall_Ws
                                                      constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-25,34},
                {-15,14}})));
    IDEAS.Buildings.Components.OuterWall W10(AWall=6.2812,inc=incWall,azi=aziWest,
    redeclare parameter BaseClasses.Data.Constructions.extwall_Wn
                                                      constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-5,34},
                {5,14}})));
    IDEAS.Buildings.Components.OuterWall W11(AWall=10.578,inc=incWall,azi=aziWest,
    redeclare parameter BaseClasses.Data.Constructions.extwall_Wn
                                                      constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{10,34},
                {20,14}})));
    IDEAS.Buildings.Components.BoundaryWall W12(AWall=10.86825,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{25,34},{35,14}})));
    IDEAS.Buildings.Components.BoundaryWall W13(AWall=10.86825,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{40,34},{50,14}})));
    IDEAS.Buildings.Components.BoundaryWall W14(AWall=7.917375,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{55,34},{65,14}})));
    IDEAS.Buildings.Components.BoundaryWall W15(AWall=7.917375,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{70,34},{80,14}})));
    IDEAS.Buildings.Components.BoundaryWall W16(AWall=16.43065,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{85,34},{95,14}})));
    IDEAS.Buildings.Components.BoundaryWall W17(AWall=16.43065,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{100,34},{110,14}})));
    IDEAS.Buildings.Components.BoundaryWall W18(AWall=41.153625,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{115,34},{125,14}})));
    IDEAS.Buildings.Components.BoundaryWall W19(AWall=41.153625,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-145,6},{-135,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W20(AWall=5.68095,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-130,6},{-120,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W21(AWall=5.68095,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-115,6},{-105,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W22(AWall=8.0754,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-100,6},{-90,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W23(AWall=8.0754,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-85,6},{-75,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W24(AWall=15.1532,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-70,6},{-60,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W25(AWall=15.1532,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-55,6},{-45,-14}})));
    IDEAS.Buildings.Components.OuterWall W26(redeclare parameter BaseClasses.Data.Constructions.door_ext
                                                                                             constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=2.014875,inc=incWall,azi = aziNorth)
                                        annotation (Placement(transformation(extent={{-40,6},
                {-30,-14}})));
    IDEAS.Buildings.Components.Window W27(
    A=2.1402,inc=incWall,azi=aziNorth,
        windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
        redeclare Buildings.Components.Shading.Box shaType(
          hWin=1.31,
          wWin=1,
          wLeft=0.1,
          wRight=0.1,
          ovDep=0.15,
          ovGap=0.1,
          hFin=0.1,
          finDep=0.15,
          finGap=0.1))                annotation (Placement(transformation(extent={{-25,6},
                {-15,-14}})));

    IDEAS.Buildings.Components.Window W28(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.1402,inc=incWall,azi=aziEast,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
        redeclare Buildings.Components.Shading.Box shaType(
          hWin=1.31,
          wWin=1,
          wLeft=0.1,
          wRight=0.1,
          ovDep=0.15,
          ovGap=0.1,
          hFin=0.1,
          finDep=0.15,
          finGap=0.1))               annotation (Placement(transformation(extent={{-10,6},
                {0,-14}})));

    IDEAS.Buildings.Components.Window W29(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.1402,inc=incWall,azi=aziSouth,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
          redeclare ClosedBlinds shaType(shaCorr=00.05))
                                      annotation (Placement(transformation(extent={{5,6},{
                15,-14}})));

    IDEAS.Buildings.Components.Window W30(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.8527,inc=incWall,azi=aziSouth,
        frac=0.354,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=6.04),
          redeclare ClosedBlinds shaType(shaCorr=0.05))
                                      annotation (Placement(transformation(extent={{20,4},{
                30,-16}})));

    IDEAS.Buildings.Components.Window W31(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=5.8116,inc=incWall,azi=aziSouth,
        frac=0.293,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=14.4),
          redeclare ClosedBlinds shaType(shaCorr=0.05))
                                      annotation (Placement(transformation(extent={{35,6},{
                45,-14}})));

    IDEAS.Buildings.Components.Window W32(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.1402,inc=incWall,azi=aziWest,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
        redeclare Buildings.Components.Shading.Box shaType(
          hWin=1.31,
          wWin=1,
          wLeft=0.1,
          wRight=0.1,
          ovDep=0.15,
          ovGap=0.1,
          hFin=0.1,
          finDep=0.15,
          finGap=0.1))               annotation (Placement(transformation(extent={{50,6},{
                60,-14}})));

    IDEAS.Buildings.Components.Window W33(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.1402,inc=incWall,azi=aziWest,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
        redeclare Buildings.Components.Shading.Box shaType(
          hWin=1.31,
          wWin=1,
          wLeft=0.1,
          wRight=0.1,
          ovDep=0.15,
          ovGap=0.1,
          hFin=0.1,
          finDep=0.15,
          finGap=0.1))               annotation (Placement(transformation(extent={{63,6},{
                73,-14}})));

    IDEAS.Buildings.Components.InternalWall W34(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.0208,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{80,6},{
                90,-14}})));
    IDEAS.Buildings.Components.InternalWall W35(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.0208,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{95,6},{
                105,-14}})));
    IDEAS.Buildings.Components.InternalWall W36(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.0536,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{110,6},
                {120,-14}})));
    IDEAS.Buildings.Components.InternalWall W37(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=8.0524,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{-145,
                -22},{-135,-42}})));
    IDEAS.Buildings.Components.InternalWall W38(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=5.9532,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{-130,
                -22},{-120,-42}})));
    IDEAS.Buildings.Components.InternalWall W39(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=8.4624,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{-115,
                -22},{-105,-42}})));
    IDEAS.Buildings.Components.InternalWall W40(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=10.0368,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{-100,
                -22},{-90,-42}})));
    IDEAS.Buildings.Components.InternalWall W41(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=10.0368,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{-85,-22},
                {-75,-42}})));
    IDEAS.Buildings.Components.InternalWall W42(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=5.9532,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{-70,-22},
                {-60,-42}})));
    IDEAS.Buildings.Components.InternalWall W43(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=8.4624,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{-55,-22},
                {-45,-42}})));
    IDEAS.Buildings.Components.InternalWall W44(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.2832,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{-40,-22},
                {-30,-42}})));
    IDEAS.Buildings.Components.InternalWall W45(redeclare parameter BaseClasses.Data.Constructions.door_int
                                                                                                constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{-25,-22},
                {-15,-42}})));
    IDEAS.Buildings.Components.InternalWall W46(redeclare parameter BaseClasses.Data.Constructions.door_int
                                                                                                constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{-10,-22},
                {0,-42}})));
    IDEAS.Buildings.Components.InternalWall W47(redeclare parameter BaseClasses.Data.Constructions.door_int
                                                                                                constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{5,-22},
                {15,-42}})));
    IDEAS.Buildings.Components.InternalWall W48(redeclare parameter BaseClasses.Data.Constructions.door_open
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{20,-22},
                {30,-42}})));
    IDEAS.Buildings.Components.InternalWall W49(redeclare parameter BaseClasses.Data.Constructions.door_open
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{35,-22},
                {45,-42}})));
    IDEAS.Buildings.Components.InternalWall W50(redeclare parameter BaseClasses.Data.Constructions.door_open
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{50,-22},
                {60,-42}})));
    IDEAS.Buildings.Components.InternalWall W51(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                              constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.56,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{65,-22},
                {75,-42}})));
    IDEAS.Buildings.Components.InternalWall W52(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                              constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.56,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{80,-22},
                {90,-42}})));
    IDEAS.Buildings.Components.InternalWall W53(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                              constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.56,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{95,-22},
                {105,-42}})));
    IDEAS.Buildings.Components.InternalWall W54(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                              constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.56,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{110,-22},
                {120,-42}})));
    IDEAS.Buildings.Components.InternalWall W55(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.6236,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{125,-22},
                {135,-42}})));


                // input for temperatures of attic and basement
        Modelica.Blocks.Tables.CombiTable1Ds   inputAtticAndBasement(
        table=[0.0,0.0,0.0; 1000,1,1],
        smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
        tableOnFile=true,
        tableName="data",
        fileName=IDEAS.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath(Modelica.Utilities.Files.loadResource("modelica://IDEAS") + "/Inputs/"+ "bc_TTH_N2.txt"),
        columns={2,3})
          annotation (Placement(transformation(extent={{-120,-86},{-100,-66}})));
      Modelica.Blocks.Math.UnitConversions.From_degC[2] from_degC
        annotation (Placement(transformation(extent={{-84,-86},{-64,-66}})));
    equation
    connect(Kitchen.propsBus[1],W1.propsBus_a);
    connect(Entrance.propsBus[1],W2.propsBus_a);
    connect(Bedroom2.propsBus[1],W3.propsBus_a);
    connect(Bedroom2.propsBus[2],W4.propsBus_a);
    connect(Bathroom.propsBus[1],W5.propsBus_a);
    connect(Bedroom1.propsBus[1],W6.propsBus_a);
    connect(Bedroom1.propsBus[2],W7.propsBus_a);
    connect(Living.propsBus[1],W8.propsBus_a);
    connect(Living.propsBus[2],W9.propsBus_a);
    connect(Living.propsBus[3],W10.propsBus_a);
    connect(Kitchen.propsBus[2],W11.propsBus_a);
    connect(Kitchen.propsBus[3],W12.propsBus_a);
    connect(Kitchen.propsBus[4],W13.propsBus_a);
    connect(Entrance.propsBus[2],W14.propsBus_a);
    connect(Entrance.propsBus[3],W15.propsBus_a);
    connect(Bedroom2.propsBus[3],W16.propsBus_a);
    connect(Bedroom2.propsBus[4],W17.propsBus_a);
    connect(Living.propsBus[4],W18.propsBus_a);
    connect(Living.propsBus[5],W19.propsBus_a);
    connect(Corridor.propsBus[1],W20.propsBus_a);
    connect(Corridor.propsBus[2],W21.propsBus_a);
    connect(Bathroom.propsBus[2],W22.propsBus_a);
    connect(Bathroom.propsBus[3],W23.propsBus_a);
    connect(Bedroom1.propsBus[3],W24.propsBus_a);
    connect(Bedroom1.propsBus[4],W25.propsBus_a);
    connect(Entrance.propsBus[4],W26.propsBus_a);
    connect(Bedroom2.propsBus[5],W27.propsBus_a);
    connect(Bathroom.propsBus[4],W28.propsBus_a);
    connect(Bedroom1.propsBus[5],W29.propsBus_a);
    connect(Living.propsBus[6],W30.propsBus_a);
    connect(Living.propsBus[7],W31.propsBus_a);
    connect(Living.propsBus[8],W32.propsBus_a);
    connect(Kitchen.propsBus[5],W33.propsBus_a);
    connect(Entrance.propsBus[5],W34.propsBus_a);
    connect(Kitchen.propsBus[6],W34.propsBus_b);
    connect(Bedroom2.propsBus[6],W35.propsBus_a);
    connect(Entrance.propsBus[6],W35.propsBus_b);
    connect(Living.propsBus[9],W36.propsBus_a);
    connect(Kitchen.propsBus[7],W36.propsBus_b);
    connect(Living.propsBus[10],W37.propsBus_a);
    connect(Entrance.propsBus[7],W37.propsBus_b);
    connect(Corridor.propsBus[3],W38.propsBus_a);
    connect(Bedroom2.propsBus[7],W38.propsBus_b);
    connect(Bathroom.propsBus[5],W39.propsBus_a);
    connect(Bedroom2.propsBus[8],W39.propsBus_b);
    connect(Corridor.propsBus[4],W40.propsBus_a);
    connect(Living.propsBus[11],W40.propsBus_b);
    connect(Bathroom.propsBus[6],W41.propsBus_a);
    connect(Corridor.propsBus[5],W41.propsBus_b);
    connect(Bedroom1.propsBus[6],W42.propsBus_a);
    connect(Corridor.propsBus[6],W42.propsBus_b);
    connect(Bedroom1.propsBus[7],W43.propsBus_a);
    connect(Bathroom.propsBus[7],W43.propsBus_b);
    connect(Bedroom1.propsBus[8],W44.propsBus_a);
    connect(Living.propsBus[12],W44.propsBus_b);
    connect(Living.propsBus[13],W45.propsBus_a);
    connect(Kitchen.propsBus[8],W45.propsBus_b);
    connect(Living.propsBus[14],W46.propsBus_a);
    connect(Entrance.propsBus[8],W46.propsBus_b);
    connect(Corridor.propsBus[7],W47.propsBus_a);
    connect(Bedroom2.propsBus[9],W47.propsBus_b);
    connect(Corridor.propsBus[8],W48.propsBus_a);
    connect(Living.propsBus[15],W48.propsBus_b);
    connect(Bedroom1.propsBus[9],W49.propsBus_a);
    connect(Corridor.propsBus[9],W49.propsBus_b);
    connect(Bathroom.propsBus[8],W50.propsBus_a);
    connect(Corridor.propsBus[10],W50.propsBus_b);
    connect(Kitchen.propsBus[9],W51.propsBus_a);
    connect(Kitchen.propsBus[10],W51.propsBus_b);
    connect(Bedroom2.propsBus[10],W52.propsBus_a);
    connect(Bedroom2.propsBus[11],W52.propsBus_b);
    connect(Living.propsBus[16],W53.propsBus_a);
    connect(Living.propsBus[17],W53.propsBus_b);
    connect(Bedroom1.propsBus[10],W54.propsBus_a);
    connect(Bedroom1.propsBus[11],W54.propsBus_b);
    connect(Bedroom2.propsBus[12],W55.propsBus_a);
    connect(Living.propsBus[18],W55.propsBus_b);

    connect(Living.gainCon.T, TSensor[1]);
    connect(Living.flowPort_In, flowPort_In[1]);
    connect(Living.flowPort_Out, flowPort_Out[1]);
    connect(Living.gainCon, heatPortCon[1]);
    connect(Living.gainRad, heatPortRad[1]);

    connect(Corridor.gainCon.T, TSensor[2]);
    connect(Corridor.flowPort_In, flowPort_In[2]);
    connect(Corridor.flowPort_Out, flowPort_Out[2]);
    connect(Corridor.gainCon, heatPortCon[2]);
    connect(Corridor.gainRad, heatPortRad[2]);

    connect(Bathroom.gainCon.T, TSensor[3]);
    connect(Bathroom.flowPort_In, flowPort_In[3]);
    connect(Bathroom.flowPort_Out, flowPort_Out[3]);
    connect(Bathroom.gainCon, heatPortCon[3]);
    connect(Bathroom.gainRad, heatPortRad[3]);

    connect(Bedroom1.gainCon.T, TSensor[4]);
    connect(Bedroom1.flowPort_In, flowPort_In[4]);
    connect(Bedroom1.flowPort_Out, flowPort_Out[4]);
    connect(Bedroom1.gainCon, heatPortCon[4]);
    connect(Bedroom1.gainRad, heatPortRad[4]);

    connect(Kitchen.gainCon.T, TSensor[5]);
    connect(Kitchen.flowPort_In, flowPort_In[5]);
    connect(Kitchen.flowPort_Out, flowPort_Out[5]);
    connect(Kitchen.gainCon, heatPortCon[5]);
    connect(Kitchen.gainRad, heatPortRad[5]);

    connect(Entrance.gainCon.T, TSensor[6]);
    connect(Entrance.flowPort_In, flowPort_In[6]);
    connect(Entrance.flowPort_Out, flowPort_Out[6]);
    connect(Entrance.gainCon, heatPortCon[6]);
    connect(Entrance.gainRad, heatPortRad[6]);

    connect(Bedroom2.gainCon.T, TSensor[7]);
    connect(Bedroom2.flowPort_In, flowPort_In[7]);
    connect(Bedroom2.flowPort_Out, flowPort_Out[7]);
    connect(Bedroom2.gainCon, heatPortCon[7]);
    connect(Bedroom2.gainRad, heatPortRad[7]);

    connect(W12.T,from_degC[2].y);
    connect(W13.T,from_degC[1].y);
    connect(W14.T,from_degC[2].y);
    connect(W15.T,from_degC[1].y);
    connect(W16.T,from_degC[2].y);
    connect(W17.T,from_degC[1].y);
    connect(W18.T,from_degC[2].y);
    connect(W19.T,from_degC[1].y);
    connect(W20.T,from_degC[2].y);
    connect(W21.T,from_degC[1].y);
    connect(W22.T,from_degC[2].y);
    connect(W23.T,from_degC[1].y);
    connect(W24.T,from_degC[2].y);
    connect(W25.T,from_degC[1].y);
     if time> 20044800 then
      inputAtticAndBasement.u= sim.timMan.timCal;
      else
      inputAtticAndBasement.u = 20044800;
      end if;

      connect(inputAtticAndBasement.y, from_degC.u) annotation (Line(points={{-99,
              -76},{-92.5,-76},{-86,-76}}, color={0,0,127}));
    end TwinhouseN2;

    model TwinhouseO5 "Model Based on Excel autogenerated"
        extends IDEAS.Templates.Interfaces.BaseClasses.Structure(
        redeclare each package Medium = IDEAS.Media.Air,
            nZones = 7,
            VZones = {Living.V,Corridor.V,Bathroom.V,Bedroom1.V,Kitchen.V,Entrance.V,Bedroom2.V},
            AZones = {Living.V/3,Corridor.V/3,Bathroom.V/3,Bedroom1.V/3,Kitchen.V/3,Entrance.V/3,Bedroom2.V/3},
            Q_design = {Living.Q_design,Corridor.Q_design,Bathroom.Q_design,Bedroom1.Q_design,Kitchen.Q_design,Entrance.Q_design,Bedroom2.Q_design},
            nEmb = 0);
     parameter Modelica.SIunits.Angle incWall =  IDEAS.Types.Tilt.Wall;
     parameter Modelica.SIunits.Angle incCeil =  IDEAS.Types.Tilt.Ceiling;
     parameter Modelica.SIunits.Angle incFloor = IDEAS.Types.Tilt.Floor;
     parameter Modelica.SIunits.Angle aziNorth = IDEAS.Types.Azimuth.N;
     parameter Modelica.SIunits.Angle aziEast = IDEAS.Types.Azimuth.E;
     parameter Modelica.SIunits.Angle aziSouth = IDEAS.Types.Azimuth.S;
     parameter Modelica.SIunits.Angle aziWest = IDEAS.Types.Azimuth.W;

     // Declaration of zones
    IDEAS.Buildings.Components.Zone Living(nSurf=17,
    V=82.435299,
     n50=2.2,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium,
        redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{-108,51},
                {-89,76}})));

    IDEAS.Buildings.Components.Zone Corridor(nSurf=10,
    V=13.66761,
     n50=2.2,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{-78,51},
                {-58,76}})));

    IDEAS.Buildings.Components.Zone Bathroom(nSurf=8,
    V=17.2656495,
     n50=2.2,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{-48,51},
                {-28,76}})));

    IDEAS.Buildings.Components.Zone Bedroom1(nSurf=11,
    V=27.880128,
     n50=2.2,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{-18,51},
                {2,76}})));

    IDEAS.Buildings.Components.Zone Kitchen(nSurf=10,
    V=18.5700355,
     n50=1.62,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{12,51},
                {32,76}})));

    IDEAS.Buildings.Components.Zone Entrance(nSurf=8,
    V=14.567307,
     n50=1.62,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{42,51},
                {62,76}})));

    IDEAS.Buildings.Components.Zone Bedroom2(nSurf=11,
    V=27.8549285,
     n50=1.62,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{72,51},
                {92,76}})));

    // Declaration of walls
    IDEAS.Buildings.Components.OuterWall W1(AWall=8.978,inc=incWall,azi=aziNorth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-145,34},
                {-135,14}})));
    IDEAS.Buildings.Components.OuterWall W2(AWall=7.954,inc=incWall,azi=aziNorth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-130,34},
                {-120,14}})));
    IDEAS.Buildings.Components.OuterWall W3(AWall=12.6352,inc=incWall,azi=aziNorth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-115,34},
                {-105,14}})));
    IDEAS.Buildings.Components.OuterWall W4(AWall=11.2176,inc=incWall,azi=aziEast,
    redeclare parameter BaseClasses.Data.Constructions.extwall_E
                                                     constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-100,34},
                {-90,14}})));
    IDEAS.Buildings.Components.OuterWall W5(AWall=11.2832,inc=incWall,azi=aziEast,
    redeclare parameter BaseClasses.Data.Constructions.extwall_E
                                                     constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-85,34},
                {-75,14}})));
    IDEAS.Buildings.Components.OuterWall W6(AWall=11.2504,inc=incWall,azi=aziEast,
    redeclare parameter BaseClasses.Data.Constructions.extwall_E
                                                     constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-70,34},
                {-60,14}})));
    IDEAS.Buildings.Components.OuterWall W7(AWall=13.5224,inc=incWall,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-55,34},
                {-45,14}})));
    IDEAS.Buildings.Components.OuterWall W8(AWall=14.562,inc=incWall,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-40,34},
                {-30,14}})));
    IDEAS.Buildings.Components.OuterWall W9(AWall=16.44592,inc=incWall,azi=aziWest,
    redeclare parameter BaseClasses.Data.Constructions.extwall_Ws
                                                      constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-25,34},
                {-15,14}})));
    IDEAS.Buildings.Components.OuterWall W10(AWall=6.6748,inc=incWall,azi=aziWest,
    redeclare parameter BaseClasses.Data.Constructions.extwall_Wn
                                                      constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-5,34},
                {5,14}})));
    IDEAS.Buildings.Components.OuterWall W11(AWall=10.64688,inc=incWall,azi=aziWest,
    redeclare parameter BaseClasses.Data.Constructions.extwall_Wn
                                                      constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{10,34},
                {20,14}})));
    IDEAS.Buildings.Components.BoundaryWall W12(AWall=10.87075,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{25,34},{35,14}})));
    IDEAS.Buildings.Components.BoundaryWall W13(AWall=10.87075,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{40,34},{50,14}})));
    IDEAS.Buildings.Components.BoundaryWall W14(AWall=7.869125,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{55,34},{65,14}})));
    IDEAS.Buildings.Components.BoundaryWall W15(AWall=7.869125,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{70,34},{80,14}})));
    IDEAS.Buildings.Components.BoundaryWall W16(AWall=15.2703,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{85,34},{95,14}})));
    IDEAS.Buildings.Components.BoundaryWall W17(AWall=15.2703,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{100,34},{110,14}})));
    IDEAS.Buildings.Components.BoundaryWall W18(AWall=40.800375,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{115,34},{125,14}})));
    IDEAS.Buildings.Components.BoundaryWall W19(AWall=40.800375,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-145,6},{-135,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W20(AWall=6.4156,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-130,6},{-120,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W21(AWall=6.4156,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-115,6},{-105,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W22(AWall=8.944,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-100,6},{-90,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W23(AWall=8.944,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-85,6},{-75,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W24(AWall=15.28065,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-70,6},{-60,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W25(AWall=15.28065,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-55,6},{-45,-14}})));
    IDEAS.Buildings.Components.OuterWall W26(redeclare parameter BaseClasses.Data.Constructions.door_ext
                                                                                             constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=2.014875,inc=incWall,azi = aziNorth)
                                        annotation (Placement(transformation(extent={{-40,6},
                {-30,-14}})));
    IDEAS.Buildings.Components.Window W27(
    A=2.1402,inc=incWall,azi=aziNorth,
        windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
        redeclare Buildings.Components.Shading.Box shaType(
          hWin=1.3,
          wWin=1,
          wLeft=0.07,
          wRight=0.07,
          ovDep=0.15,
          ovGap=0.07,
          hFin=0.07,
          finDep=0.15,
          finGap=0.07))               annotation (Placement(transformation(extent={{-25,6},
                {-15,-14}})));

    IDEAS.Buildings.Components.Window W28(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.1402,inc=incWall,azi=aziEast,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
        redeclare Buildings.Components.Shading.Box shaType(
          hWin=1.3,
          wWin=1,
          wLeft=0.07,
          wRight=0.07,
          ovDep=0.15,
          ovGap=0.07,
          hFin=0.07,
          finDep=0.15,
          finGap=0.07))              annotation (Placement(transformation(extent={{-12,6},
                {-2,-14}})));

    IDEAS.Buildings.Components.Window W29(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.1402,inc=incWall,azi=aziSouth,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
        redeclare Buildings.Components.Shading.Interfaces.DoubleShading shaType(
            redeclare Buildings.Components.Shading.Box stateShading2(
            hWin=1.3,
            wWin=1,
            wLeft=0.07,
            wRight=0.07,
            ovDep=0.15,
            ovGap=0.07,
            hFin=0.07,
            finDep=0.15,
            finGap=0.07), redeclare Buildings.Components.Shading.Screen
            stateShading1(shaCorr=0.05)))                annotation (Placement(transformation(extent={{5,6},{
                15,-14}})));

    IDEAS.Buildings.Components.Window W30(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.8527,inc=incWall,azi=aziSouth,
        frac=0.354,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=6.04),
        redeclare Buildings.Components.Shading.Interfaces.DoubleShading shaType(
            redeclare Buildings.Components.Shading.Box stateShading2(
            hWin=1.3,
            wWin=1,
            wLeft=0.07,
            wRight=0.07,
            ovDep=0.15,
            ovGap=0.07,
            hFin=0.07,
            finDep=0.15,
            finGap=0.07), redeclare Buildings.Components.Shading.Screen
            stateShading1(shaCorr=0.05)))                annotation (Placement(transformation(extent={{20,4},{
                30,-16}})));

    IDEAS.Buildings.Components.Window W31(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=5.8116,inc=incWall,azi=aziSouth,
        frac=0.293,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=14.4),
        redeclare Buildings.Components.Shading.Interfaces.DoubleShading shaType(
            redeclare Buildings.Components.Shading.Box stateShading2(
            hWin=1.3,
            wWin=1,
            wLeft=0.07,
            wRight=0.07,
            ovDep=0.15,
            ovGap=0.07,
            hFin=0.07,
            finDep=0.15,
            finGap=0.07), redeclare Buildings.Components.Shading.Screen
            stateShading1(shaCorr=0.05)))                annotation (Placement(transformation(extent={{35,6},{
                45,-14}})));

    IDEAS.Buildings.Components.Window W32(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.1402,inc=incWall,azi=aziWest,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
        redeclare Buildings.Components.Shading.Box shaType(
          hWin=1.31,
          wWin=1,
          wLeft=0.1,
          wRight=0.1,
          ovDep=0.15,
          ovGap=0.1,
          hFin=0.1,
          finDep=0.15,
          finGap=0.1))               annotation (Placement(transformation(extent={{50,6},{
                60,-14}})));

    IDEAS.Buildings.Components.Window W33(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.1402,inc=incWall,azi=aziWest,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
        redeclare Buildings.Components.Shading.Box shaType(
          hWin=1.31,
          wWin=1,
          wLeft=0.1,
          wRight=0.1,
          ovDep=0.15,
          ovGap=0.1,
          hFin=0.1,
          finDep=0.15,
          finGap=0.1))               annotation (Placement(transformation(extent={{63,6},{
                73,-14}})));

    IDEAS.Buildings.Components.InternalWall W34(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.0864,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{80,6},{
                90,-14}})));
    IDEAS.Buildings.Components.InternalWall W35(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.0864,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{95,6},{
                105,-14}})));
    IDEAS.Buildings.Components.InternalWall W36(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.0536,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{110,6},
                {120,-14}})));
    IDEAS.Buildings.Components.InternalWall W37(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=7.954,inc=incWall,azi = 90) annotation (Placement(transformation(extent={{-145,
                -22},{-135,-42}})));
    IDEAS.Buildings.Components.InternalWall W38(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.1172,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{-130,
                -22},{-120,-42}})));
    IDEAS.Buildings.Components.InternalWall W39(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=8.528,inc=incWall,azi = 90) annotation (Placement(transformation(extent={{-115,
                -22},{-105,-42}})));
    IDEAS.Buildings.Components.InternalWall W40(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.0536,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{-100,
                -22},{-90,-42}})));
    IDEAS.Buildings.Components.InternalWall W41(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.0536,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{-85,-22},
                {-75,-42}})));
    IDEAS.Buildings.Components.InternalWall W42(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.1172,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{-70,-22},
                {-60,-42}})));
    IDEAS.Buildings.Components.InternalWall W43(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=8.528,inc=incWall,azi = 90) annotation (Placement(transformation(extent={{-55,-22},
                {-45,-42}})));
    IDEAS.Buildings.Components.InternalWall W44(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.2504,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{-40,-22},
                {-30,-42}})));
    IDEAS.Buildings.Components.InternalWall W45(redeclare parameter BaseClasses.Data.Constructions.door_int
                                                                                                constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{-25,-22},
                {-15,-42}})));
    IDEAS.Buildings.Components.InternalWall W46(redeclare parameter BaseClasses.Data.Constructions.door_int
                                                                                                constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{-10,-22},
                {0,-42}})));
    IDEAS.Buildings.Components.InternalWall W47(redeclare parameter BaseClasses.Data.Constructions.door_int
                                                                                                constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{5,-22},
                {15,-42}})));
    IDEAS.Buildings.Components.InternalWall W48(redeclare parameter BaseClasses.Data.Constructions.door_open
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{20,-22},
                {30,-42}})));
    IDEAS.Buildings.Components.InternalWall W49(redeclare parameter BaseClasses.Data.Constructions.door_open
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{35,-22},
                {45,-42}})));
    IDEAS.Buildings.Components.InternalWall W50(redeclare parameter BaseClasses.Data.Constructions.door_open
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{50,-22},
                {60,-42}})));
    IDEAS.Buildings.Components.InternalWall W51(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                              constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.56,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{65,-22},
                {75,-42}})));
    IDEAS.Buildings.Components.InternalWall W52(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                              constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.56,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{80,-22},
                {90,-42}})));
    IDEAS.Buildings.Components.InternalWall W53(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                              constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.56,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{95,-22},
                {105,-42}})));
    IDEAS.Buildings.Components.InternalWall W54(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                              constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.56,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{110,-22},
                {120,-42}})));

                // input for temperatures of attic and basement
        Modelica.Blocks.Tables.CombiTable1Ds   inputAtticAndBasement(
        table=[0.0,0.0,0.0; 1000,1,1],
        smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
        tableOnFile=true,
        tableName="data",
        fileName=IDEAS.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath(Modelica.Utilities.Files.loadResource("modelica://IDEAS") + "/Inputs/"+ "bc_TTH_N2.txt"),
        columns={2,3})
          annotation (Placement(transformation(extent={{-120,-86},{-100,-66}})));
      Modelica.Blocks.Math.UnitConversions.From_degC[2] from_degC
        annotation (Placement(transformation(extent={{-84,-86},{-64,-66}})));
        controlBlind controlblinds
          annotation (Placement(transformation(extent={{-30,-76},{-10,-56}})));
    equation
    connect(Kitchen.propsBus[1],W1.propsBus_a);
    connect(Entrance.propsBus[1],W2.propsBus_a);
    connect(Bedroom2.propsBus[1],W3.propsBus_a);
    connect(Bedroom2.propsBus[2],W4.propsBus_a);
    connect(Bathroom.propsBus[1],W5.propsBus_a);
    connect(Bedroom1.propsBus[1],W6.propsBus_a);
    connect(Bedroom1.propsBus[2],W7.propsBus_a);
    connect(Living.propsBus[1],W8.propsBus_a);
    connect(Living.propsBus[2],W9.propsBus_a);
    connect(Living.propsBus[3],W10.propsBus_a);
    connect(Kitchen.propsBus[2],W11.propsBus_a);
    connect(Kitchen.propsBus[3],W12.propsBus_a);
    connect(Kitchen.propsBus[4],W13.propsBus_a);
    connect(Entrance.propsBus[2],W14.propsBus_a);
    connect(Entrance.propsBus[3],W15.propsBus_a);
    connect(Bedroom2.propsBus[3],W16.propsBus_a);
    connect(Bedroom2.propsBus[4],W17.propsBus_a);
    connect(Living.propsBus[4],W18.propsBus_a);
    connect(Living.propsBus[5],W19.propsBus_a);
    connect(Corridor.propsBus[1],W20.propsBus_a);
    connect(Corridor.propsBus[2],W21.propsBus_a);
    connect(Bathroom.propsBus[2],W22.propsBus_a);
    connect(Bathroom.propsBus[3],W23.propsBus_a);
    connect(Bedroom1.propsBus[3],W24.propsBus_a);
    connect(Bedroom1.propsBus[4],W25.propsBus_a);
    connect(Entrance.propsBus[4],W26.propsBus_a);
    connect(Bedroom2.propsBus[5],W27.propsBus_a);
    connect(Bathroom.propsBus[4],W28.propsBus_a);
    connect(Bedroom1.propsBus[5],W29.propsBus_a);
    connect(Living.propsBus[6],W30.propsBus_a);
    connect(Living.propsBus[7],W31.propsBus_a);
    connect(Living.propsBus[8],W32.propsBus_a);
    connect(Kitchen.propsBus[5],W33.propsBus_a);
    connect(Entrance.propsBus[5],W34.propsBus_a);
    connect(Kitchen.propsBus[6],W34.propsBus_b);
    connect(Bedroom2.propsBus[6],W35.propsBus_a);
    connect(Entrance.propsBus[6],W35.propsBus_b);
    connect(Living.propsBus[9],W36.propsBus_a);
    connect(Kitchen.propsBus[7],W36.propsBus_b);
    connect(Living.propsBus[10],W37.propsBus_a);
    connect(Entrance.propsBus[7],W37.propsBus_b);
    connect(Corridor.propsBus[3],W38.propsBus_a);
    connect(Bedroom2.propsBus[7],W38.propsBus_b);
    connect(Bathroom.propsBus[5],W39.propsBus_a);
    connect(Bedroom2.propsBus[8],W39.propsBus_b);
    connect(Corridor.propsBus[4],W40.propsBus_a);
    connect(Living.propsBus[11],W40.propsBus_b);
    connect(Bathroom.propsBus[6],W41.propsBus_a);
    connect(Corridor.propsBus[5],W41.propsBus_b);
    connect(Bedroom1.propsBus[6],W42.propsBus_a);
    connect(Corridor.propsBus[6],W42.propsBus_b);
    connect(Bedroom1.propsBus[7],W43.propsBus_a);
    connect(Bathroom.propsBus[7],W43.propsBus_b);
    connect(Bedroom1.propsBus[8],W44.propsBus_a);
    connect(Living.propsBus[12],W44.propsBus_b);
    connect(Living.propsBus[13],W45.propsBus_a);
    connect(Kitchen.propsBus[8],W45.propsBus_b);
    connect(Living.propsBus[14],W46.propsBus_a);
    connect(Entrance.propsBus[8],W46.propsBus_b);
    connect(Corridor.propsBus[7],W47.propsBus_a);
    connect(Bedroom2.propsBus[9],W47.propsBus_b);
    connect(Corridor.propsBus[8],W48.propsBus_a);
    connect(Living.propsBus[15],W48.propsBus_b);
    connect(Bedroom1.propsBus[9],W49.propsBus_a);
    connect(Corridor.propsBus[9],W49.propsBus_b);
    connect(Bathroom.propsBus[8],W50.propsBus_a);
    connect(Corridor.propsBus[10],W50.propsBus_b);
    connect(Kitchen.propsBus[9],W51.propsBus_a);
    connect(Kitchen.propsBus[10],W51.propsBus_b);
    connect(Bedroom2.propsBus[10],W52.propsBus_a);
    connect(Bedroom2.propsBus[11],W52.propsBus_b);
    connect(Living.propsBus[16],W53.propsBus_a);
    connect(Living.propsBus[17],W53.propsBus_b);
    connect(Bedroom1.propsBus[10],W54.propsBus_a);
    connect(Bedroom1.propsBus[11],W54.propsBus_b);

    connect(Living.gainCon.T, TSensor[1]);
    connect(Living.flowPort_In, flowPort_In[1]);
    connect(Living.flowPort_Out, flowPort_Out[1]);
    connect(Living.gainCon, heatPortCon[1]);
    connect(Living.gainRad, heatPortRad[1]);

    connect(Corridor.gainCon.T, TSensor[2]);
    connect(Corridor.flowPort_In, flowPort_In[2]);
    connect(Corridor.flowPort_Out, flowPort_Out[2]);
    connect(Corridor.gainCon, heatPortCon[2]);
    connect(Corridor.gainRad, heatPortRad[2]);

    connect(Bathroom.gainCon.T, TSensor[3]);
    connect(Bathroom.flowPort_In, flowPort_In[3]);
    connect(Bathroom.flowPort_Out, flowPort_Out[3]);
    connect(Bathroom.gainCon, heatPortCon[3]);
    connect(Bathroom.gainRad, heatPortRad[3]);

    connect(Bedroom1.gainCon.T, TSensor[4]);
    connect(Bedroom1.flowPort_In, flowPort_In[4]);
    connect(Bedroom1.flowPort_Out, flowPort_Out[4]);
    connect(Bedroom1.gainCon, heatPortCon[4]);
    connect(Bedroom1.gainRad, heatPortRad[4]);

    connect(Kitchen.gainCon.T, TSensor[5]);
    connect(Kitchen.flowPort_In, flowPort_In[5]);
    connect(Kitchen.flowPort_Out, flowPort_Out[5]);
    connect(Kitchen.gainCon, heatPortCon[5]);
    connect(Kitchen.gainRad, heatPortRad[5]);

    connect(Entrance.gainCon.T, TSensor[6]);
    connect(Entrance.flowPort_In, flowPort_In[6]);
    connect(Entrance.flowPort_Out, flowPort_Out[6]);
    connect(Entrance.gainCon, heatPortCon[6]);
    connect(Entrance.gainRad, heatPortRad[6]);

    connect(Bedroom2.gainCon.T, TSensor[7]);
    connect(Bedroom2.flowPort_In, flowPort_In[7]);
    connect(Bedroom2.flowPort_Out, flowPort_Out[7]);
    connect(Bedroom2.gainCon, heatPortCon[7]);
    connect(Bedroom2.gainRad, heatPortRad[7]);

    connect(W12.T,from_degC[2].y);
    connect(W13.T,from_degC[1].y);
    connect(W14.T,from_degC[2].y);
    connect(W15.T,from_degC[1].y);
    connect(W16.T,from_degC[2].y);
    connect(W17.T,from_degC[1].y);
    connect(W18.T,from_degC[2].y);
    connect(W19.T,from_degC[1].y);
    connect(W20.T,from_degC[2].y);
    connect(W21.T,from_degC[1].y);
    connect(W22.T,from_degC[2].y);
    connect(W23.T,from_degC[1].y);
    connect(W24.T,from_degC[2].y);
    connect(W25.T,from_degC[1].y);

     if time> 20044800 then
      inputAtticAndBasement.u= sim.timMan.timCal;
      else
      inputAtticAndBasement.u = 20044800;
     end if;

      controlblinds.y= W29.Ctrl;
      controlblinds.y= W30.Ctrl;
      controlblinds.y= W31.Ctrl;
      connect(inputAtticAndBasement.y, from_degC.u) annotation (Line(points={{-99,
              -76},{-92.5,-76},{-86,-76}}, color={0,0,127}));
    end TwinhouseO5;

    model TwinhouseN2_TB
      "Model Based on Excel autogenerated with thermal bridges"
        extends IDEAS.Templates.Interfaces.BaseClasses.Structure(
        redeclare each package Medium = IDEAS.Media.Air,
            nZones = 7,
            VZones = {Living.V,Corridor.V,Bathroom.V,Bedroom1.V,Kitchen.V,Entrance.V,Bedroom2.V},
            AZones = {Living.V/3,Corridor.V/3,Bathroom.V/3,Bedroom1.V/3,Kitchen.V/3,Entrance.V/3,Bedroom2.V/3},
            Q_design = {Living.Q_design,Corridor.Q_design,Bathroom.Q_design,Bedroom1.Q_design,Kitchen.Q_design,Entrance.Q_design,Bedroom2.Q_design},
            nEmb = 0);
     parameter Modelica.SIunits.Angle incWall =  IDEAS.Types.Tilt.Wall;
     parameter Modelica.SIunits.Angle incCeil =  IDEAS.Types.Tilt.Ceiling;
     parameter Modelica.SIunits.Angle incFloor = IDEAS.Types.Tilt.Floor;
     parameter Modelica.SIunits.Angle aziNorth = IDEAS.Types.Azimuth.N;
     parameter Modelica.SIunits.Angle aziEast = IDEAS.Types.Azimuth.E;
     parameter Modelica.SIunits.Angle aziSouth = IDEAS.Types.Azimuth.S;
     parameter Modelica.SIunits.Angle aziWest = IDEAS.Types.Azimuth.W;

     // Declaration of zones
    IDEAS.Buildings.Components.Zone Living(nSurf=18,
    V=86.417818,
     n50=2.2,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium,
        redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{-108,51},
                {-89,76}})));

    IDEAS.Buildings.Components.Zone Corridor(nSurf=10,
    V=12.085281,
     n50=2.2,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{-78,51},
                {-58,76}})));

    IDEAS.Buildings.Components.Zone Bathroom(nSurf=8,
    V=15.4423035,
     n50=2.2,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{-48,51},
                {-28,76}})));

    IDEAS.Buildings.Components.Zone Bedroom1(nSurf=11,
    V=27.6164065,
     n50=2.2,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{-18,51},
                {2,76}})));

    IDEAS.Buildings.Components.Zone Kitchen(nSurf=10,
    V=18.5590575,
     n50=1.62,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{12,51},
                {32,76}})));

    IDEAS.Buildings.Components.Zone Entrance(nSurf=8,
    V=14.6518875,
     n50=1.62,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{42,51},
                {62,76}})));

    IDEAS.Buildings.Components.Zone Bedroom2(nSurf=12,
    V=26.817258,
     n50=1.62,
     fRH=22,
     allowFlowReversal=false,
    redeclare package Medium = Medium, redeclare IDEAS.Buildings.Components.ZoneAirModels.WellMixedAir airModel(
            mSenFac=1))               annotation (Placement(transformation(extent={{72,51},
                {92,76}})));

    // Declaration of walls
    IDEAS.Buildings.Components.OuterWall W1(AWall=9.0436,inc=incWall,azi=aziNorth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-145,34},
                {-135,14}})));
    IDEAS.Buildings.Components.OuterWall W2(AWall=8.0524,inc=incWall,azi=aziNorth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-130,34},
                {-120,14}})));
    IDEAS.Buildings.Components.OuterWall W3(AWall=12.4384,inc=incWall,azi=aziNorth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-115,34},
                {-105,14}})));
    IDEAS.Buildings.Components.OuterWall W4(AWall=12.2344,inc=incWall,azi=aziEast,
    redeclare parameter BaseClasses.Data.Constructions.extwall_E
                                                     constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-100,34},
                {-90,14}})));
    IDEAS.Buildings.Components.OuterWall W5(AWall=10.2664,inc=incWall,azi=aziEast,
    redeclare parameter BaseClasses.Data.Constructions.extwall_E
                                                     constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-85,34},
                {-75,14}})));
    IDEAS.Buildings.Components.OuterWall W6(AWall=11.2832,inc=incWall,azi=aziEast,
    redeclare parameter BaseClasses.Data.Constructions.extwall_E
                                                     constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-70,34},
                {-60,14}})));
    IDEAS.Buildings.Components.OuterWall W7(AWall=13.3584,inc=incWall,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-55,34},
                {-45,14}})));
    IDEAS.Buildings.Components.OuterWall W8(AWall=14.726,inc=incWall,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.extwall_S_N
                                                       constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-40,34},
                {-30,14}})));
    IDEAS.Buildings.Components.OuterWall W9(AWall=16.8428,inc=incWall,azi=aziWest,
    redeclare parameter BaseClasses.Data.Constructions.extwall_Ws
                                                      constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-25,34},
                {-15,14}})));
    IDEAS.Buildings.Components.OuterWall W10(AWall=6.2812,inc=incWall,azi=aziWest,
    redeclare parameter BaseClasses.Data.Constructions.extwall_Wn
                                                      constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{-5,34},
                {5,14}})));
    IDEAS.Buildings.Components.OuterWall W11(AWall=10.578,inc=incWall,azi=aziWest,
    redeclare parameter BaseClasses.Data.Constructions.extwall_Wn
                                                      constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001)
                              annotation (Placement(transformation(extent={{10,34},
                {20,14}})));
    IDEAS.Buildings.Components.BoundaryWall W12(AWall=10.86825,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{25,34},{35,14}})));
    IDEAS.Buildings.Components.BoundaryWall W13(AWall=10.86825,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{40,34},{50,14}})));
    IDEAS.Buildings.Components.BoundaryWall W14(AWall=7.917375,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{55,34},{65,14}})));
    IDEAS.Buildings.Components.BoundaryWall W15(AWall=7.917375,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{70,34},{80,14}})));
    IDEAS.Buildings.Components.BoundaryWall W16(AWall=16.43065,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{85,34},{95,14}})));
    IDEAS.Buildings.Components.BoundaryWall W17(AWall=16.43065,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{100,34},{110,14}})));
    IDEAS.Buildings.Components.BoundaryWall W18(AWall=41.153625,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{115,34},{125,14}})));
    IDEAS.Buildings.Components.BoundaryWall W19(AWall=41.153625,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-145,6},{-135,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W20(AWall=5.68095,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-130,6},{-120,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W21(AWall=5.68095,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-115,6},{-105,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W22(AWall=8.0754,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-100,6},{-90,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W23(AWall=8.0754,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-85,6},{-75,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W24(AWall=15.1532,inc=incFloor,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ground
                                                  constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-70,6},{-60,-14}})));
    IDEAS.Buildings.Components.BoundaryWall W25(AWall=15.1532,inc=incCeil,azi=aziSouth,
    redeclare parameter BaseClasses.Data.Constructions.ceiling
                                                   constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    use_T_in = true) annotation (Placement(transformation(extent={{-55,6},{-45,-14}})));
    IDEAS.Buildings.Components.OuterWall W26(redeclare parameter BaseClasses.Data.Constructions.door_ext
                                                                                             constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=2.014875,inc=incWall,azi = aziNorth)
                                        annotation (Placement(transformation(extent={{-40,6},
                {-30,-14}})));
    IDEAS.Buildings.Components.Window W27(
    A=2.1402,inc=incWall,azi=aziNorth,
        windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
        redeclare Buildings.Components.Shading.Box shaType(
          hWin=1.31,
          wWin=1,
          wLeft=0.1,
          wRight=0.1,
          ovDep=0.15,
          ovGap=0.1,
          hFin=0.1,
          finDep=0.15,
          finGap=0.1))                annotation (Placement(transformation(extent={{-25,6},
                {-15,-14}})));

    IDEAS.Buildings.Components.Window W28(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.1402,inc=incWall,azi=aziEast,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
        redeclare Buildings.Components.Shading.Box shaType(
          hWin=1.31,
          wWin=1,
          wLeft=0.1,
          wRight=0.1,
          ovDep=0.15,
          ovGap=0.1,
          hFin=0.1,
          finDep=0.15,
          finGap=0.1))               annotation (Placement(transformation(extent={{-10,6},
                {0,-14}})));

    IDEAS.Buildings.Components.Window W29(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.1402,inc=incWall,azi=aziSouth,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
          redeclare ClosedBlinds shaType(shaCorr=00.05))
                                      annotation (Placement(transformation(extent={{5,6},{
                15,-14}})));

    IDEAS.Buildings.Components.Window W30(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.8527,inc=incWall,azi=aziSouth,
        frac=0.354,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=6.04),
          redeclare ClosedBlinds shaType(shaCorr=0.05))
                                      annotation (Placement(transformation(extent={{20,4},{
                30,-16}})));

    IDEAS.Buildings.Components.Window W31(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=5.8116,inc=incWall,azi=aziSouth,
        frac=0.293,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=14.4),
          redeclare ClosedBlinds shaType(shaCorr=0.05))
                                      annotation (Placement(transformation(extent={{35,6},{
                45,-14}})));

    IDEAS.Buildings.Components.Window W32(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.1402,inc=incWall,azi=aziWest,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
        redeclare Buildings.Components.Shading.Box shaType(
          hWin=1.31,
          wWin=1,
          wLeft=0.1,
          wRight=0.1,
          ovDep=0.15,
          ovGap=0.1,
          hFin=0.1,
          finDep=0.15,
          finGap=0.1))               annotation (Placement(transformation(extent={{50,6},{
                60,-14}})));

    IDEAS.Buildings.Components.Window W33(windowDynamicsType=IDEAS.Buildings.Components.Interfaces.WindowDynamicsType.Two,
        redeclare BaseClasses.Data.Constructions.PvcInsulated
                                                  fraType,
        redeclare BaseClasses.Data.Materials.Glazing
                                         glazing,
    A=2.1402,inc=incWall,azi=aziWest,
        frac=0.397,
        redeclare IDEAS.Buildings.Components.ThermalBridges.LineLosses briType(psi=0.05,
            len=4.62),
        redeclare Buildings.Components.Shading.Box shaType(
          hWin=1.31,
          wWin=1,
          wLeft=0.1,
          wRight=0.1,
          ovDep=0.15,
          ovGap=0.1,
          hFin=0.1,
          finDep=0.15,
          finGap=0.1))               annotation (Placement(transformation(extent={{63,6},{
                73,-14}})));

    IDEAS.Buildings.Components.InternalWall W34(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.0208,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{80,6},{
                90,-14}})));
    IDEAS.Buildings.Components.InternalWall W35(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.0208,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{95,6},{
                105,-14}})));
    IDEAS.Buildings.Components.InternalWall W36(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.0536,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{110,6},
                {120,-14}})));
    IDEAS.Buildings.Components.InternalWall W37(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=8.0524,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{-145,
                -22},{-135,-42}})));
    IDEAS.Buildings.Components.InternalWall W38(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=5.9532,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{-130,
                -22},{-120,-42}})));
    IDEAS.Buildings.Components.InternalWall W39(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=8.4624,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{-115,
                -22},{-105,-42}})));
    IDEAS.Buildings.Components.InternalWall W40(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=10.0368,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{-100,
                -22},{-90,-42}})));
    IDEAS.Buildings.Components.InternalWall W41(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=10.0368,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{-85,-22},
                {-75,-42}})));
    IDEAS.Buildings.Components.InternalWall W42(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=5.9532,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{-70,-22},
                {-60,-42}})));
    IDEAS.Buildings.Components.InternalWall W43(redeclare parameter BaseClasses.Data.Constructions.intwall_2
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=8.4624,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{-55,-22},
                {-45,-42}})));
    IDEAS.Buildings.Components.InternalWall W44(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=11.2832,inc=incWall,azi = 90)
                                       annotation (Placement(transformation(extent={{-40,-22},
                {-30,-42}})));
    IDEAS.Buildings.Components.InternalWall W45(redeclare parameter BaseClasses.Data.Constructions.door_int
                                                                                                constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{-25,-22},
                {-15,-42}})));
    IDEAS.Buildings.Components.InternalWall W46(redeclare parameter BaseClasses.Data.Constructions.door_int
                                                                                                constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{-10,-22},
                {0,-42}})));
    IDEAS.Buildings.Components.InternalWall W47(redeclare parameter BaseClasses.Data.Constructions.door_int
                                                                                                constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{5,-22},
                {15,-42}})));
    IDEAS.Buildings.Components.InternalWall W48(redeclare parameter BaseClasses.Data.Constructions.door_open
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{20,-22},
                {30,-42}})));
    IDEAS.Buildings.Components.InternalWall W49(redeclare parameter BaseClasses.Data.Constructions.door_open
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{35,-22},
                {45,-42}})));
    IDEAS.Buildings.Components.InternalWall W50(redeclare parameter BaseClasses.Data.Constructions.door_open
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.893375,inc=incWall,azi = 90)
                                        annotation (Placement(transformation(extent={{50,-22},
                {60,-42}})));
    IDEAS.Buildings.Components.InternalWall W51(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                              constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.56,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{65,-22},
                {75,-42}})));
    IDEAS.Buildings.Components.InternalWall W52(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                              constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.56,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{80,-22},
                {90,-42}})));
    IDEAS.Buildings.Components.InternalWall W53(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                              constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.56,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{95,-22},
                {105,-42}})));
    IDEAS.Buildings.Components.InternalWall W54(redeclare parameter BaseClasses.Data.Constructions.column
                                                                                              constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=6.56,inc=incWall,azi = 90)
                                    annotation (Placement(transformation(extent={{110,-22},
                {120,-42}})));
    IDEAS.Buildings.Components.InternalWall W55(redeclare parameter BaseClasses.Data.Constructions.intwall_1
                                                                                                 constructionType,
    redeclare parameter IDEAS.Buildings.Data.Insulation.Rockwool insulationType,
    insulationThickness=0.001,
    AWall=1.6236,inc=incWall,azi = 90)
                                      annotation (Placement(transformation(extent={{125,-22},
                {135,-42}})));

                // input for temperatures of attic and basement
        Modelica.Blocks.Tables.CombiTable1Ds   inputAtticAndBasement(
        table=[0.0,0.0,0.0; 1000,1,1],
        smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
        tableOnFile=true,
        tableName="data",
        fileName=IDEAS.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath(Modelica.Utilities.Files.loadResource("modelica://IDEAS") + "/Inputs/"+ "bc_TTH_N2.txt"),
        columns={2,3})
          annotation (Placement(transformation(extent={{-120,-86},{-100,-66}})));
      Modelica.Blocks.Math.UnitConversions.From_degC[2] from_degC
        annotation (Placement(transformation(extent={{-84,-86},{-64,-66}})));
      ThermalBridges thermalBridges
        annotation (Placement(transformation(extent={{22,-78},{42,-58}})));
    equation
    connect(Kitchen.propsBus[1],W1.propsBus_a);
    connect(Entrance.propsBus[1],W2.propsBus_a);
    connect(Bedroom2.propsBus[1],W3.propsBus_a);
    connect(Bedroom2.propsBus[2],W4.propsBus_a);
    connect(Bathroom.propsBus[1],W5.propsBus_a);
    connect(Bedroom1.propsBus[1],W6.propsBus_a);
    connect(Bedroom1.propsBus[2],W7.propsBus_a);
    connect(Living.propsBus[1],W8.propsBus_a);
    connect(Living.propsBus[2],W9.propsBus_a);
    connect(Living.propsBus[3],W10.propsBus_a);
    connect(Kitchen.propsBus[2],W11.propsBus_a);
    connect(Kitchen.propsBus[3],W12.propsBus_a);
    connect(Kitchen.propsBus[4],W13.propsBus_a);
    connect(Entrance.propsBus[2],W14.propsBus_a);
    connect(Entrance.propsBus[3],W15.propsBus_a);
    connect(Bedroom2.propsBus[3],W16.propsBus_a);
    connect(Bedroom2.propsBus[4],W17.propsBus_a);
    connect(Living.propsBus[4],W18.propsBus_a);
    connect(Living.propsBus[5],W19.propsBus_a);
    connect(Corridor.propsBus[1],W20.propsBus_a);
    connect(Corridor.propsBus[2],W21.propsBus_a);
    connect(Bathroom.propsBus[2],W22.propsBus_a);
    connect(Bathroom.propsBus[3],W23.propsBus_a);
    connect(Bedroom1.propsBus[3],W24.propsBus_a);
    connect(Bedroom1.propsBus[4],W25.propsBus_a);
    connect(Entrance.propsBus[4],W26.propsBus_a);
    connect(Bedroom2.propsBus[5],W27.propsBus_a);
    connect(Bathroom.propsBus[4],W28.propsBus_a);
    connect(Bedroom1.propsBus[5],W29.propsBus_a);
    connect(Living.propsBus[6],W30.propsBus_a);
    connect(Living.propsBus[7],W31.propsBus_a);
    connect(Living.propsBus[8],W32.propsBus_a);
    connect(Kitchen.propsBus[5],W33.propsBus_a);
    connect(Entrance.propsBus[5],W34.propsBus_a);
    connect(Kitchen.propsBus[6],W34.propsBus_b);
    connect(Bedroom2.propsBus[6],W35.propsBus_a);
    connect(Entrance.propsBus[6],W35.propsBus_b);
    connect(Living.propsBus[9],W36.propsBus_a);
    connect(Kitchen.propsBus[7],W36.propsBus_b);
    connect(Living.propsBus[10],W37.propsBus_a);
    connect(Entrance.propsBus[7],W37.propsBus_b);
    connect(Corridor.propsBus[3],W38.propsBus_a);
    connect(Bedroom2.propsBus[7],W38.propsBus_b);
    connect(Bathroom.propsBus[5],W39.propsBus_a);
    connect(Bedroom2.propsBus[8],W39.propsBus_b);
    connect(Corridor.propsBus[4],W40.propsBus_a);
    connect(Living.propsBus[11],W40.propsBus_b);
    connect(Bathroom.propsBus[6],W41.propsBus_a);
    connect(Corridor.propsBus[5],W41.propsBus_b);
    connect(Bedroom1.propsBus[6],W42.propsBus_a);
    connect(Corridor.propsBus[6],W42.propsBus_b);
    connect(Bedroom1.propsBus[7],W43.propsBus_a);
    connect(Bathroom.propsBus[7],W43.propsBus_b);
    connect(Bedroom1.propsBus[8],W44.propsBus_a);
    connect(Living.propsBus[12],W44.propsBus_b);
    connect(Living.propsBus[13],W45.propsBus_a);
    connect(Kitchen.propsBus[8],W45.propsBus_b);
    connect(Living.propsBus[14],W46.propsBus_a);
    connect(Entrance.propsBus[8],W46.propsBus_b);
    connect(Corridor.propsBus[7],W47.propsBus_a);
    connect(Bedroom2.propsBus[9],W47.propsBus_b);
    connect(Corridor.propsBus[8],W48.propsBus_a);
    connect(Living.propsBus[15],W48.propsBus_b);
    connect(Bedroom1.propsBus[9],W49.propsBus_a);
    connect(Corridor.propsBus[9],W49.propsBus_b);
    connect(Bathroom.propsBus[8],W50.propsBus_a);
    connect(Corridor.propsBus[10],W50.propsBus_b);
    connect(Kitchen.propsBus[9],W51.propsBus_a);
    connect(Kitchen.propsBus[10],W51.propsBus_b);
    connect(Bedroom2.propsBus[10],W52.propsBus_a);
    connect(Bedroom2.propsBus[11],W52.propsBus_b);
    connect(Living.propsBus[16],W53.propsBus_a);
    connect(Living.propsBus[17],W53.propsBus_b);
    connect(Bedroom1.propsBus[10],W54.propsBus_a);
    connect(Bedroom1.propsBus[11],W54.propsBus_b);
    connect(Bedroom2.propsBus[12],W55.propsBus_a);
    connect(Living.propsBus[18],W55.propsBus_b);

    connect(Living.gainCon.T, TSensor[1]);
    connect(Living.flowPort_In, flowPort_In[1]);
    connect(Living.flowPort_Out, flowPort_Out[1]);
    connect(Living.gainCon, heatPortCon[1]);
    connect(Living.gainRad, heatPortRad[1]);

    connect(Corridor.gainCon.T, TSensor[2]);
    connect(Corridor.flowPort_In, flowPort_In[2]);
    connect(Corridor.flowPort_Out, flowPort_Out[2]);
    connect(Corridor.gainCon, heatPortCon[2]);
    connect(Corridor.gainRad, heatPortRad[2]);

    connect(Bathroom.gainCon.T, TSensor[3]);
    connect(Bathroom.flowPort_In, flowPort_In[3]);
    connect(Bathroom.flowPort_Out, flowPort_Out[3]);
    connect(Bathroom.gainCon, heatPortCon[3]);
    connect(Bathroom.gainRad, heatPortRad[3]);

    connect(Bedroom1.gainCon.T, TSensor[4]);
    connect(Bedroom1.flowPort_In, flowPort_In[4]);
    connect(Bedroom1.flowPort_Out, flowPort_Out[4]);
    connect(Bedroom1.gainCon, heatPortCon[4]);
    connect(Bedroom1.gainRad, heatPortRad[4]);

    connect(Kitchen.gainCon.T, TSensor[5]);
    connect(Kitchen.flowPort_In, flowPort_In[5]);
    connect(Kitchen.flowPort_Out, flowPort_Out[5]);
    connect(Kitchen.gainCon, heatPortCon[5]);
    connect(Kitchen.gainRad, heatPortRad[5]);

    connect(Entrance.gainCon.T, TSensor[6]);
    connect(Entrance.flowPort_In, flowPort_In[6]);
    connect(Entrance.flowPort_Out, flowPort_Out[6]);
    connect(Entrance.gainCon, heatPortCon[6]);
    connect(Entrance.gainRad, heatPortRad[6]);

    connect(Bedroom2.gainCon.T, TSensor[7]);
    connect(Bedroom2.flowPort_In, flowPort_In[7]);
    connect(Bedroom2.flowPort_Out, flowPort_Out[7]);
    connect(Bedroom2.gainCon, heatPortCon[7]);
    connect(Bedroom2.gainRad, heatPortRad[7]);

    connect(W12.T,from_degC[2].y);
    connect(W13.T,from_degC[1].y);
    connect(W14.T,from_degC[2].y);
    connect(W15.T,from_degC[1].y);
    connect(W16.T,from_degC[2].y);
    connect(W17.T,from_degC[1].y);
    connect(W18.T,from_degC[2].y);
    connect(W19.T,from_degC[1].y);
    connect(W20.T,from_degC[2].y);
    connect(W21.T,from_degC[1].y);
    connect(W22.T,from_degC[2].y);
    connect(W23.T,from_degC[1].y);
    connect(W24.T,from_degC[2].y);
    connect(W25.T,from_degC[1].y);
      if time> 20044800 then
      inputAtticAndBasement.u= sim.timMan.timCal;
      else
      inputAtticAndBasement.u = 20044800;
      end if;
        connect(thermalBridges.heatPortRad,heatPortRad);
    //     thermalBridges.heatPortRad[2] = Corridor.gainRad;
    //     thermalBridges.heatPortRad[3] = Bathroom.gainRad;
    //     thermalBridges.heatPortRad[4] = Bedroom1.gainRad;
    //     thermalBridges.heatPortRad[5] = Kitchen.gainRad;
    //     thermalBridges.heatPortRad[6] = Entrance.gainRad;
    //     thermalBridges.heatPortRad[7] = Bedroom2.gainRad;

       thermalBridges.Tzone[1] = Living.TSensor;
       thermalBridges.Tzone[2] = Corridor.TSensor;
       thermalBridges.Tzone[3] = Bathroom.TSensor;
       thermalBridges.Tzone[4] = Bedroom1.TSensor;
       thermalBridges.Tzone[5] = Kitchen.TSensor;
       thermalBridges.Tzone[6] = Entrance.TSensor;
       thermalBridges.Tzone[7] = Bedroom2.TSensor;

      thermalBridges.Te = sim.Te;
      thermalBridges.Tatt= from_degC[1].y;
      thermalBridges.Tbas= from_degC[2].y;


      connect(inputAtticAndBasement.y, from_degC.u) annotation (Line(points={{-99,
              -76},{-92.5,-76},{-86,-76}}, color={0,0,127}));
    end TwinhouseN2_TB;
    end Structures;

    package HeatingSystems

      model ElectricHeating_Twinhouse_exp1
        "Electric heating Twinhouse|exp2| alternative temperature or heat input"

        extends IDEAS.Templates.Interfaces.BaseClasses.HeatingSystem(
          nLoads=1);

      parameter Real[nZones] Crad "thermal mass of radiator";
      parameter Real[nZones] Kemission "heat transfer coefficient";
      parameter Real COP=1;
      Real[nZones] TsetIDEAL;
      final parameter Real frad=0.3 "radiative fraction";
        Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow[nZones] IDEAL_heating_con
          annotation (Placement(transformation(extent={{8,-12},{-12,8}})));

        Modelica.Blocks.Tables.CombiTable1Ds measuredInput(
          tableOnFile=true,
          tableName="data",
          smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
          fileName=IDEAS.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath(Modelica.Utilities.Files.loadResource("modelica://IDEAS") + "/Inputs/"+"meas_TTH_N2.txt"),
          columns=2:15)
          annotation (Placement(transformation(extent={{38,24},{58,44}})));
        Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow[nZones] IDEAL_heating_rad
          annotation (Placement(transformation(extent={{6,-44},{-14,-24}})));
      equation

      P[1] = QHeaSys/COP;
      Q[1] = 0;
      TsetIDEAL= measuredInput.y[1:7];
      if time <20044800 then
        IDEAL_heating_con[1].Q_flow=0.7*max(0,100000*(273.15+30-TSensor[1]));
        IDEAL_heating_con[2].Q_flow=0;
        IDEAL_heating_con[3].Q_flow=0.7*max(0,100000*(273.15+30-TSensor[3]));
        IDEAL_heating_con[4].Q_flow=0.7*max(0,100000*(273.15+30-TSensor[4]));
        IDEAL_heating_con[5].Q_flow=0.7*max(0,100000*(273.15+30-TSensor[5]));
        IDEAL_heating_con[6].Q_flow=0.7*max(0,100000*(273.15+30-TSensor[6]));
        IDEAL_heating_con[7].Q_flow=0.7*max(0,100000*(273.15+30-TSensor[7]));
      elseif time >=20044800 and time < 20800000 then
        IDEAL_heating_con[1].Q_flow=0.7*( min(max(0,100000*(273.15+30-TSensor[1])),Q_design[1]));
        IDEAL_heating_con[2].Q_flow=0;
        IDEAL_heating_con[3].Q_flow=0.7*( min(max(0,100000*(273.15+30-TSensor[3])),Q_design[3]));
        IDEAL_heating_con[4].Q_flow=0.7*( min(max(0,100000*(273.15+30-TSensor[4])),Q_design[4]));
        IDEAL_heating_con[5].Q_flow=0.7*( min(max(0,100000*(273.15+30-TSensor[5])),Q_design[5]));
        IDEAL_heating_con[6].Q_flow=0.7*( min(max(0,100000*(273.15+30-TSensor[6])),Q_design[6]));
        IDEAL_heating_con[7].Q_flow=0.7*( min(max(0,100000*(273.15+30-TSensor[7])),Q_design[7]));
      elseif time>=20800000 and time < 22119000 then
        IDEAL_heating_con[1].Q_flow=0.7*( measuredInput.y[8]);
        IDEAL_heating_con[2].Q_flow=0;
        IDEAL_heating_con[3].Q_flow=0.7*( measuredInput.y[9]);
        IDEAL_heating_con[4].Q_flow=0.7*( measuredInput.y[10]);
        IDEAL_heating_con[5].Q_flow=0.7*( measuredInput.y[11]+measuredInput.y[12]);
        IDEAL_heating_con[6].Q_flow=0.7*( measuredInput.y[13]);
        IDEAL_heating_con[7].Q_flow=0.7*( measuredInput.y[14]);
      elseif time>=22119000 and time < 22637400 then
       IDEAL_heating_con[1].Q_flow=0.7*( min(max(0,100000*(273.15+25-TSensor[1])),Q_design[1]));
        IDEAL_heating_con[2].Q_flow=0;
        IDEAL_heating_con[3].Q_flow=0.7*( min(max(0,100000*(273.15+25-TSensor[3])),Q_design[3]));
        IDEAL_heating_con[4].Q_flow=0.7*( min(max(0,100000*(273.15+25-TSensor[4])),Q_design[4]));
        IDEAL_heating_con[5].Q_flow=0.7*( min(max(0,100000*(273.15+25-TSensor[5])),Q_design[5]));
        IDEAL_heating_con[6].Q_flow=0.7*( min(max(0,100000*(273.15+25-TSensor[6])),Q_design[6]));
        IDEAL_heating_con[7].Q_flow=0.7*( min(max(0,100000*(273.15+25-TSensor[7])),Q_design[7]));
      else
        IDEAL_heating_con[1].Q_flow=0;
        IDEAL_heating_con[2].Q_flow=0;
        IDEAL_heating_con[3].Q_flow=0;
        IDEAL_heating_con[4].Q_flow=0;
        IDEAL_heating_con[5].Q_flow=0+measuredInput.y[12];
        IDEAL_heating_con[6].Q_flow=0;
        IDEAL_heating_con[7].Q_flow=0;
      end if;

      IDEAL_heating_rad.Q_flow=IDEAL_heating_con.Q_flow/0.7*0.3;
      QHeaSys=sum(heatPortRad.Q_flow+heatPortCon.Q_flow);

      if time> 20044800 then
        measuredInput.u= sim.timMan.timCal;
        else
        measuredInput.u = 20044800;
        end if;
        connect(IDEAL_heating_con.port, heatPortCon) annotation (Line(
            points={{-12,-2},{-106,-2},{-106,20},{-200,20}},
            color={191,0,0},
            smooth=Smooth.None));
        connect(IDEAL_heating_rad.port, heatPortRad) annotation (Line(
            points={{-14,-34},{-108,-34},{-108,-20},{-200,-20}},
            color={191,0,0},
            smooth=Smooth.None));
        annotation (Diagram(coordinateSystem(preserveAspectRatio=false,extent={{-200,-100},
                  {200,100}}), graphics={Text(
                extent={{66,34},{80,28}},
                lineColor={28,108,200},
                textString="Order of outputs: 
1: living T 125cm
2: corridor T
3: bath T
4: child T
5: Kit T
6: hall T
7: bedT
8: heat elp living
9: heat elp bath
10: heat elp bed1
11: heat elp kit
12: heat gainvent kit 
13: heat elp hall
14: heat elp bed 2")}));
      end ElectricHeating_Twinhouse_exp1;
    end HeatingSystems;

    package Ventilation

      model Vent_TTH
        "Ventilation based on measured supply/exhaust rates and temperatures"
        extends IDEAS.Templates.Interfaces.BaseClasses.VentilationSystem(nLoads=0,nZones=7);

        Modelica.Blocks.Tables.CombiTable1Ds   measuredInput(
          tableOnFile=true,
          tableName="data",
          smoothness=Modelica.Blocks.Types.Smoothness.ContinuousDerivative,
          fileName=IDEAS.BoundaryConditions.WeatherData.BaseClasses.getAbsolutePath(Modelica.Utilities.Files.loadResource("modelica://IDEAS") + "/Inputs/"+"bc_TTH_N2.txt"),
          columns={4,5})
          annotation (Placement(transformation(extent={{28,-64},{14,-50}})));

        IDEAS.Fluid.Sources.MassFlowSource_T source[1](
          redeclare package Medium = IDEAS.Media.Air,
          use_m_flow_in=true,
           each final nPorts=1,
          use_T_in=true)
          annotation (Placement(transformation(extent={{-80,-56},{-100,-36}})));
        IDEAS.Fluid.FixedResistances.SplitterFixedResistanceDpM spl(
          massDynamics=Modelica.Fluid.Types.Dynamics.SteadyState,
          tau=300,
          from_dp=false,
          portFlowDirection_1=Modelica.Fluid.Types.PortFlowDirection.Entering,
          portFlowDirection_2=Modelica.Fluid.Types.PortFlowDirection.Leaving,
          portFlowDirection_3=Modelica.Fluid.Types.PortFlowDirection.Leaving,
          m_flow_nominal={120,-60,-60}*1.204/3600,
          dp_nominal={50,50,50},
          linearized=true,
          redeclare package Medium = IDEAS.Media.Air)
          annotation (Placement(transformation(extent={{-144,12},{-124,32}})));
        IDEAS.Fluid.Sources.FixedBoundary bou[5](each final nPorts=1,  redeclare
            package Medium =
              IDEAS.Media.Air)
          annotation (Placement(transformation(extent={{-120,48},{-142,66}})));
        Modelica.Blocks.Math.Gain massflowInput(k=1.205/3600)
          annotation (Placement(transformation(extent={{-44,-46},{-60,-30}})));
        Modelica.Blocks.Math.UnitConversions.From_degC from_degC
          annotation (Placement(transformation(extent={{-38,-76},{-54,-60}})));
        IDEAS.Fluid.Sources.MassFlowSource_T source1[3](
          redeclare package Medium = IDEAS.Media.Air,
           each final nPorts=1,
          use_m_flow_in=false,
          use_T_in=false,
          m_flow=0)
          annotation (Placement(transformation(extent={{-124,-90},{-144,-70}})));
      equation
        P[1:nLoads_min] = zeros(nLoads_min);
        Q[1:nLoads_min] = zeros(nLoads_min);
        connect(flowPort_Out[1], source[1].ports[1]);
      if time> 20044800 then
        measuredInput.u= sim.timMan.timCal;
        else
        measuredInput.u = 20044800;
        end if;
        connect(flowPort_In[2], spl.port_1) annotation (Line(points={{-200,
                14.2857},{-172,14.2857},{-172,22},{-144,22}},
                                      color={0,0,0}));
        connect(spl.port_3, flowPort_Out[3]) annotation (Line(points={{-134,12},
                {-134,12},{-134,-22.8571},{-200,-22.8571}},
                                            color={0,127,255}));
        connect(spl.port_2, flowPort_Out[4]) annotation (Line(points={{-124,22},{-110,
                22},{-110,-20},{-200,-20}}, color={0,127,255}));
        connect(flowPort_In[3], bou[1].ports[1]) annotation (Line(points={{-200,
                17.1429},{-200,57},{-142,57}},
                                          color={0,0,0}));
        connect(flowPort_In[4], bou[2].ports[1]) annotation (Line(points={{-200,20},{-200,
                57},{-142,57}},           color={0,0,0}));
        connect(measuredInput.y[2], massflowInput.u) annotation (Line(points={{13.3,-57},
                {0,-57},{0,-38},{-22,-38},{-42.4,-38}}, color={0,0,127}));
        connect(source[1].m_flow_in, massflowInput.y) annotation (Line(points={{-80,-38},
                {-70,-38},{-60.8,-38}},             color={0,0,127}));
        connect(measuredInput.y[1], from_degC.u) annotation (Line(points={{13.3,-57},{
                0,-57},{0,-68},{-36.4,-68}}, color={0,0,127}));
        connect(from_degC.y, source[1].T_in) annotation (Line(points={{-54.8,-68},{-70,
                -68},{-70,-42},{-78,-42}}, color={0,0,127}));
        connect(flowPort_In[5:7], bou[3:5].ports[1]) annotation (Line(points={{-200,
                28.5714},{-190,28.5714},{-190,48},{-190,57},{-142,57}},
                                                        color={0,0,0}));
        connect(source1[1:3].ports[1], flowPort_Out[5:7]) annotation (Line(points={{-144,
                -80},{-152,-80},{-152,-82},{-200,-82},{-200,-11.4286}},
                                                                   color={0,127,255}));
        connect(flowPort_Out[2], flowPort_In[1]) annotation (Line(points={{-200,
                -25.7143},{-200,11.4286}}, color={0,0,0}));
        annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
              coordinateSystem(preserveAspectRatio=false), graphics={Line(points={{-194,
                    -20},{-152,-20},{-152,-44},{-100,-44}}, color={28,108,200})}));
      end Vent_TTH;
    end Ventilation;

  package Data
  extends Modelica.Icons.Package;
  package Constructions
  extends Modelica.Icons.MaterialPropertiesPackage;
  record extwall_S_N
  extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 5,
          final mats={Materials.ext_plaster(d=0.01),Materials.ins_pu(d=0.12),Materials.formerext_plast(d=0.03),Materials.honeycomb_brick(d=0.3),Materials.int_plaster(d=0.01)});
  end extwall_S_N;

   record extwall_S_N_uw
          extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 5,
          final mats={Materials.ext_plaster(d=0.01),Materials.ins_pu(d=0.12),Materials.formerext_plast(d=0.03),Materials.honeycomb_brick(d=0.2),Materials.int_plaster(d=0.01)});
   end extwall_S_N_uw;

   record extwall_E
          extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 5,
          final mats={Materials.ext_plaster(d=0.01),Materials.ins_pu(d=0.08),Materials.formerext_plast(d=0.03),Materials.honeycomb_brick(d=0.3),Materials.int_plaster(d=0.01)});
   end extwall_E;

   record extwall_Ws
          extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 5,
          final mats={Materials.ext_plaster(d=0.01),Materials.ins_eps(d=0.08),Materials.formerext_plast(d=0.03),Materials.honeycomb_brick(d=0.3),Materials.int_plaster(d=0.01)});
   end extwall_Ws;

   record extwall_Wn
          extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 5,
          final mats={Materials.ext_plaster(d=0.01),Materials.ins_mw(d=0.08),Materials.formerext_plast(d=0.03),Materials.honeycomb_brick(d=0.3),Materials.int_plaster(d=0.1)});
   end extwall_Wn;

   record intwall_1
          extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 3,
          final mats={Materials.int_plaster2(d=0.01),Materials.honeycomb_bricki(d=0.24),Materials.int_plaster2(d=0.01)});
   end intwall_1;

   record intwall_2
          extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 3,
          final mats={Materials.int_plaster2(d=0.01),Materials.honeycomb_bricki(d=0.115),Materials.int_plaster2(d=0.01)});
   end intwall_2;

   record ceiling
          extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 5,
          final mats={Materials.screed(d=0.04),Materials.insulation(d=0.04),Materials.concrete(d=0.22),Materials.plaster(d=0.01),Materials.insul_underceil(d=0.1)});
   end ceiling;

   record ground
          extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 5,
          final mats={Materials.concrete2(d=0.22),Materials.levelling(d=0.029),Materials.pur_damm(d=0.03),Materials.composite(d=0.033),Materials.screed(d=0.065)});
   end ground;

   record door_ext
          extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 1,
          final mats={Materials.wooddoor(d=0.04)});
   end door_ext;

   record door_int
          extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 1,
          final mats={Materials.wooddoor(d=0.04)});
   end door_int;

   record door_open
          extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 1,
          final mats={Materials.wooddoor(d=0.04)});
   end door_open;

   record column
          extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 1,
          final mats={Materials.concrete(d=0.07)});
   end column;

   record window
          extends IDEAS.Buildings.Data.Interfaces.Construction(
          final nLay = 1,
          final mats={Materials.concrete(d=0.07)});
   end window;

   record Door
          extends IDEAS.Buildings.Data.Interfaces.Construction(
      final nLay = 1,
    final mats={IDEAS.Buildings.Data.Materials.Timber(d=0.04)});
   end Door;

   record Window
   extends IDEAS.Buildings.Data.Glazing.Ins2;
   end Window;

    record PvcInsulated "Frame TTH U 1.0"
        extends IDEAS.Buildings.Data.Interfaces.Frame(
        U_value=1);
          annotation (Documentation(info="<html>
<p>From: https://windows.lbl.gov/adv_sys/NTNU-LBNL-EuropeanFramesReport.pdf</p>
</html>"));
    end PvcInsulated;
  end Constructions;

  package Materials
  extends Modelica.Icons.MaterialPropertiesPackage;
  record ext_plaster =IDEAS.Buildings.Data.Interfaces.Material (
          k = 0.8,
   c = 1000,
          rho = 1200);
  record ins_pu =IDEAS.Buildings.Data.Interfaces.Material (
          k = 0.035,
   c = 840,
          rho = 80);
  record formerext_plast =IDEAS.Buildings.Data.Interfaces.Material (
          k = 1,
   c = 1000,
          rho = 1200);
  record honeycomb_brick =IDEAS.Buildings.Data.Interfaces.Material (
          k = 0.22,
   c = 1000,
          rho = 800);
  record int_plaster =IDEAS.Buildings.Data.Interfaces.Material (
          k = 1,
   c = 1000,
          rho = 1200);
  record ins_eps =IDEAS.Buildings.Data.Interfaces.Material (
          k = 0.04,
   c = 840,
          rho = 80);
  record ins_mw =IDEAS.Buildings.Data.Interfaces.Material (
          k = 0.036,
   c = 840,
          rho = 80);
  record int_plaster2 =IDEAS.Buildings.Data.Interfaces.Material (
          k = 0.35,
   c = 1000,
          rho = 1200);
  record honeycomb_bricki =IDEAS.Buildings.Data.Interfaces.Material (
          k = 0.331,
   c = 1000,
          rho = 1000);
  record screed =IDEAS.Buildings.Data.Interfaces.Material (
          k = 1.4,
   c = 1000,
          rho = 2000);
  record insulation =IDEAS.Buildings.Data.Interfaces.Material (
          k = 0.04,
   c = 840,
          rho = 80);
  record concrete =IDEAS.Buildings.Data.Interfaces.Material (
          k = 2,
   c = 840,
          rho = 2400);
  record plaster =IDEAS.Buildings.Data.Interfaces.Material (
          k = 1,
   c = 840,
          rho = 1200);
  record insul_underceil =IDEAS.Buildings.Data.Interfaces.Material (
          k = 0.035,
   c = 1000,
          rho = 80);
  record composite =IDEAS.Buildings.Data.Interfaces.Material (
          k = 0.023,
   c = 840,
          rho = 80);
  record pur_damm =IDEAS.Buildings.Data.Interfaces.Material (
          k = 0.025,
   c = 840,
          rho = 80);
  record levelling =IDEAS.Buildings.Data.Interfaces.Material (
          k = 0.06,
   c = 840,
          rho = 80);
  record concrete2 =IDEAS.Buildings.Data.Interfaces.Material (
          k = 2.1,
   c = 1000,
          rho = 2000);
  record wooddoor =IDEAS.Buildings.Data.Interfaces.Material (
          k = 0.131,
   c = 1000,
          rho = 600);
    record Glazing =IDEAS.Buildings.Data.Interfaces.Glazing (
        final nLay=3,
        final mats={IDEAS.Buildings.Data.Materials.Glass(
                                    d=0.004,epsLw_a=0.04),
                    IDEAS.Buildings.Data.Materials.Argon(
                                    d=0.016),
                    IDEAS.Buildings.Data.Materials.Glass(
                                    d=0.004)},
        final SwTrans=[0, 0.543;
                      10, 0.546;
                      20, 0.538;
                      30, 0.528;
                      40, 0.514;
                      50, 0.486;
                      60, 0.426;
                      70, 0.310;
                      80, 0.145;
                      90, 0.000],
        final SwAbs=[0, 0.107, 0.0, 0.085;
                    10, 0.108, 0.0, 0.087;
                    20, 0.109, 0.0, 0.094;
                    30, 0.112, 0.0, 0.1;
                    40, 0.116, 0.0, 0.102;
                    50, 0.121, 0.0, 0.106;
                    60, 0.126, 0.0, 0.119;
                    70, 0.130, 0.0, 0.127;
                    80, 0.124, 0.0, 0.091;
                    90, 0.000, 0.0, 0.000],
        final SwTransDif=0.427,
        final SwAbsDif={0.118,0.0,0.104},
        final U_value=1.1,
        final g_value=0.525)
      "Glass properties as specified by EN410 spectrum (U = 1.1 W/m�K, g = 0.525)"
      annotation (Documentation(revisions="<html>
<ul>
<li>
September 2, 2015, by Filip Jorissen:<br/>
Moved epsLw definition to solid layer to be consistent 
with changed implementation of MultiLayerLucent.
</li>
</ul>
</html>"));
  end Materials;

  end Data;

    model ThermalBridges "Thermal bridges for twinhouses based on psi-values of model specification (obtained for inner dimensions)"

      Modelica.Blocks.Interfaces.RealInput Te
        annotation (Placement(transformation(extent={{-126,40},{-86,80}})));
      Modelica.Blocks.Interfaces.RealInput Tatt
        annotation (Placement(transformation(extent={{-124,-6},{-84,34}})));
      Modelica.Blocks.Interfaces.RealInput Tbas
        annotation (Placement(transformation(extent={{-124,-54},{-84,-14}})));
      Modelica.Blocks.Interfaces.RealInput[7] Tzone
        annotation (Placement(transformation(extent={{-124,-96},{-84,-56}})));
      Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b[7] heatPortRad
        annotation (Placement(transformation(extent={{90,-10},{110,10}})));
      Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow[7] prescribedHeatFlow
        annotation (Placement(transformation(extent={{40,-8},{60,12}})));
    equation
      prescribedHeatFlow[1].Q_flow = (1.113+0.981+0.366+0.091*3.28)*(Te-Tzone[1])+(0.436+(1.136+0.83+1.034+1.163+0.167)/2)*(Tatt-Tzone[1])+(0.583+(1.136+0.167                               +0.83+1.034+1.163)/2)*(Tbas-Tzone[1]);
      prescribedHeatFlow[2].Q_flow = (0.359+1.034+0.606+0.359)/2*(Tatt+Tbas-2*Tzone[2]);
      prescribedHeatFlow[3].Q_flow = (0.623)*(Te-Tzone[3]) + (0.511+0.606+0.511)/2*(Tatt+Tbas-2*Tzone[3]);
      prescribedHeatFlow[4].Q_flow = (0.685+0.841)*(Te-Tzone[4])+ (0.436+(0.359+0.511+1.163)/2)*(Tatt-Tzone[4])+(0.583+(0.359+0.511+1.163)/2)*(Tbas-Tzone[4]);
      prescribedHeatFlow[5].Q_flow = (0.644+0.616)*(Te-Tzone[5])+ (0.436+(0.665+1.139)/2)*(Tatt-Tzone[5])+(0.583+(0.665+1.139)/2)*(Tbas-Tzone[5]);
      prescribedHeatFlow[6].Q_flow = (0.469)*(Te-Tzone[6]) + (0.665+1.136+0.83)/2*(Tatt+Tbas-2*Tzone[6]);
      prescribedHeatFlow[7].Q_flow = (0.841+742)*(Te-Tzone[7])+ (0.436+(1.136+0.359+0.511+0.167)/2)*(Tatt-Tzone[7])+(0.583+(1.136+0.359+0.511+0.167)/2)*(Tbas-Tzone[7])
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
      connect(heatPortRad, prescribedHeatFlow.port) annotation (Line(points={{100,0},
              {80,0},{80,2},{60,2}},                  color={191,0,0}));
    end ThermalBridges;

    model ClosedBlinds "ClosedBlinds"
      extends IDEAS.Buildings.Components.Shading.Interfaces.PartialShading(
                                                                 final controlled=false);
    parameter Real shaCorr=0.24 "Shortwave transmittance of shortwave radiation";
    equation
    iSolDir = 0;
      iSolDif =  solDif*shaCorr + solDir*shaCorr;

      connect(angInc, iAngInc) annotation (Line(
          points={{-60,-50},{-16,-50},{-16,-50},{40,-50}},
          color={0,0,127},
          smooth=Smooth.None));
      annotation (Diagram(coordinateSystem(preserveAspectRatio=false, extent={{-100,
                -100},{100,100}})), Documentation(revisions="<html>
<ul>
<li>
July 18, 2016 by Filip Jorissen:<br/>
Cleaned up implementation and documentation.
</li>
</ul>
</html>",     info="<html>
<p>Use this model if you want no solar shading to be computed.</p>
</html>"));
    end ClosedBlinds;

    model controlBlind

      Modelica.Blocks.Interfaces.RealOutput y(start = 0)
        annotation (Placement(transformation(extent={{92,-10},{112,10}})));

    equation
      if time <=20044800+2*3600*24 then
        y=1;
      elseif time >20044800+2*3600*24 and time <= 20044800+24*3600*23 then
        y=0;
      elseif time >20044800 + 24*3600*23 and time <=20044800 + 24*3600*30 then
        y = 1;
      elseif time >20044800 + 24*3600*30 then
        y = 0;
      else
        y = 0;
      end if;
      annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
            coordinateSystem(preserveAspectRatio=false)));
    end controlBlind;
  end BaseClasses;
end TwinHouses;