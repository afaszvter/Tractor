model MyEngine20261109 "Import from D:/VCU/VCU_Tractor_HaerBin/Tractor2/Tractor_slx/MyEngine20261109.slx;"
  extends ModelWorkspace;
  import SysplorerEmbeddedCoder.Types.*;
  import BaseWorkspace;
  annotation(__MWORKS(version="26.8.1",PortArrangement,SysblockVersion="1.0",modelType=Control,BlockSystem(blockKind=BlockKind.userModel,SampleTime(auto=true),ExternalCResource(SavedInRelationPath=false,IncludeFile,SourceFile,Library,IncludeDirectory={"classDirectory()/", "D:/VCU/VCU_Tractor_HaerBin/Tractor2/Tractor_slx" },LibraryDirectory={"classDirectory()/", "D:/VCU/VCU_Tractor_HaerBin/Tractor2/Tractor_slx" }))),Icon(coordinateSystem(preserveAspectRatio=false)));
  annotation(experiment(Algorithm = Euler, Interval = 0.005, InlineStepSize=false, InlineIntegrator=false, StartTime = 0.0, StopTime = 10.0, Tolerance = 0.0001));
  model ModelWorkspace
    annotation(__MWORKS(hide = true,BlockSystem(blockKind=BlockKind.modelWorkspace)));
  end ModelWorkspace;
  block Engine_type "子系统
通过子系统创建模型分层结构。"

    annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left('ThrottleCmd [-]', LoadTrq_Nm), Right(EngineTrq_Nm)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
  grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
  rotationPolicy=RotationPolicy.Follow,
  origin={0,0},
  fillColor={255,255,255},
  fillPattern=FillPattern.Solid,
  lineThickness=3,
  frame=true,
  extent={{-300,120},{300,-120}}), Text(origin={0,-140},
  lineColor={0,0,0},
  extent={{0,-20},{0,20}},
  textString="%name",
  fontSize=14,
  textStyle={TextStyle.None},
  textColor={0,0,0},
  verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
    SysplorerEmbeddedCoder.Port.Inport 'ThrottleCmd [-]' 
      annotation (Placement(transformation(origin = {-432.000000, -258.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
    SysplorerEmbeddedCoder.Port.Inport LoadTrq_Nm 
      annotation (Placement(transformation(origin = {61.000000, -231.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
    ECU_type ECU 
      annotation (Placement(transformation(origin = {-164.000000, -13.000000}, extent = {{-76.500000, -267.000000}, {76.500000, 267.000000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
    Engine_type Engine 
      annotation (Placement(transformation(origin = {194.000000, -9.000000}, extent = {{-71.000000, -265.500000}, {71.000000, 265.500000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
    SysplorerEmbeddedCoder.SignalRouting.From From10 
      annotation (Placement(transformation(origin = {-419.000000, 232.000000}, extent = {{-28.500000, -5.000000}, {28.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EngineSpd",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From11 
      annotation (Placement(transformation(origin = {-422.000000, 170.000000}, extent = {{-25.500000, -5.000000}, {25.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EGRRatio",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From12 
      annotation (Placement(transformation(origin = {-404.000000, 79.000000}, extent = {{-44.000000, -5.000000}, {44.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhTemp_DOC_in",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From15 
      annotation (Placement(transformation(origin = {-417.000000, 109.000000}, extent = {{-30.500000, -5.000000}, {30.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="IntakeMass",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From16 
      annotation (Placement(transformation(origin = {-422.000000, 140.000000}, extent = {{-25.500000, -5.000000}, {25.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="RailPrs_kpa",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From17 
      annotation (Placement(transformation(origin = {-400.000000, 48.000000}, extent = {{-47.500000, -5.000000}, {47.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhTemp_DOC_out",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From18 
      annotation (Placement(transformation(origin = {-400.000000, 17.000000}, extent = {{-47.500000, -5.000000}, {47.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhTemp_DPF_out",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From19 
      annotation (Placement(transformation(origin = {-400.000000, -13.000000}, extent = {{-47.500000, -5.000000}, {47.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhTemp_SCR_out",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From22 
      annotation (Placement(transformation(origin = {-414.000000, -44.000000}, extent = {{-34.000000, -5.000000}, {34.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhMassFlow",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From23 
      annotation (Placement(transformation(origin = {-411.000000, -74.000000}, extent = {{-37.000000, -5.000000}, {37.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="mNOx_SCR_in",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From25 
      annotation (Placement(transformation(origin = {-407.000000, -105.000000}, extent = {{-40.500000, -5.000000}, {40.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="mNOx_SCR_out",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From26 
      annotation (Placement(transformation(origin = {-419.000000, -136.000000}, extent = {{-28.500000, -5.000000}, {28.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="Soot_Load",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From27 
      annotation (Placement(transformation(origin = {-422.000000, -166.000000}, extent = {{-25.500000, -5.000000}, {25.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="DPF_DP",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From28 
      annotation (Placement(transformation(origin = {-419.000000, -197.000000}, extent = {{-28.500000, -5.000000}, {28.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="NH3_Store",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From29 
      annotation (Placement(transformation(origin = {-404.000000, -227.000000}, extent = {{-44.000000, -5.000000}, {44.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="O2_frac",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.From From9 
      annotation (Placement(transformation(origin = {-422.000000, 201.000000}, extent = {{-25.500000, -5.000000}, {25.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="FuelCyle",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto 
      annotation (Placement(transformation(origin = {373.000000, 235.000000}, extent = {{-25.500000, -5.000000}, {25.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EngTrq",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto1 
      annotation (Placement(transformation(origin = {373.000000, 204.000000}, extent = {{-28.500000, -5.000000}, {28.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EngineSpd",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto10 
      annotation (Placement(transformation(origin = {357.000000, 51.000000}, extent = {{-44.000000, -5.000000}, {44.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhTemp_DOC_in",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto11 
      annotation (Placement(transformation(origin = {354.000000, 21.000000}, extent = {{-47.500000, -5.000000}, {47.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhTemp_DOC_out",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto12 
      annotation (Placement(transformation(origin = {354.000000, -10.000000}, extent = {{-47.500000, -5.000000}, {47.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhTemp_DPF_out",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto13 
      annotation (Placement(transformation(origin = {354.000000, -40.000000}, extent = {{-47.500000, -5.000000}, {47.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhTemp_SCR_out",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto14 
      annotation (Placement(transformation(origin = {364.000000, -102.000000}, extent = {{-37.000000, -5.000000}, {37.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="mNOx_SCR_in",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto15 
      annotation (Placement(transformation(origin = {361.000000, -132.000000}, extent = {{-40.500000, -5.000000}, {40.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="mNOx_SCR_out",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto16 
      annotation (Placement(transformation(origin = {373.000000, -163.000000}, extent = {{-28.500000, -5.000000}, {28.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="Soot_Load",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto17 
      annotation (Placement(transformation(origin = {377.000000, -193.000000}, extent = {{-25.500000, -5.000000}, {25.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="DPF_DP",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto18 
      annotation (Placement(transformation(origin = {368.000000, -71.000000}, extent = {{-34.000000, -5.000000}, {34.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhMassFlow",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto19 
      annotation (Placement(transformation(origin = {373.000000, -224.000000}, extent = {{-28.500000, -5.000000}, {28.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="NH3_Store",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto2 
      annotation (Placement(transformation(origin = {377.000000, 174.000000}, extent = {{-25.500000, -5.000000}, {25.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="FuelCyle",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto20 
      annotation (Placement(transformation(origin = {357.000000, -255.000000}, extent = {{-44.000000, -5.000000}, {44.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="O2_frac",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto3 
      annotation (Placement(transformation(origin = {371.000000, 82.000000}, extent = {{-30.500000, -5.000000}, {30.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="IntakeMass",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto4 
      annotation (Placement(transformation(origin = {377.000000, 143.000000}, extent = {{-25.500000, -5.000000}, {25.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EGRRatio",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.SignalRouting.Goto Goto9 
      annotation (Placement(transformation(origin = {377.000000, 113.000000}, extent = {{-25.500000, -5.000000}, {25.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="RailPrs_kpa",tagSocped="MyEngine20261109.Engine_type",tagVisibility="Local"))));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay10'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, -13.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay11'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, -44.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay12'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, -74.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay13'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, -105.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay14'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, -136.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay15'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, -166.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay16'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, -197.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay17'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, -227.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay2'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, 232.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay3'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, 201.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay4'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, 170.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay5'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, 140.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay6'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, 109.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay7'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, 79.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay8'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, 48.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay9'(initCond=0) 
      annotation (Placement(transformation(origin = {-304.000000, 17.000000}, extent = {{-11.500000, -11.500000}, {11.500000, 11.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
    SysplorerEmbeddedCoder.Port.Outport EngineTrq_Nm 
      annotation (Placement(transformation(origin = {432.000000, 252.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
    block ECU_type "子系统
通过子系统创建模型分层结构。"

      annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left(EngineSpd_rpm, FuleCyle_mg, EGRRatio, RailPrs_kpa, IntakeMass, ExhTemp_DOC_in, ExhTemp_DOC_out, ExhTemp_DPF_out, ExhTemp_SCR_out, ExhMassFlow, mNOx_SCR_in, mNOx_SCR_out, DPF_SootLoad, DPF_DP, NH3_Store, O2_frac, 'ThrottleCmd [-]'), Right(FuelCyleTgt_mg, EGROpeningTgt_pct, PostInj_Request, DPF_regen_req, mUREA_target)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
    grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
    rotationPolicy=RotationPolicy.Follow,
    origin={0,0},
    fillColor={255,255,255},
    fillPattern=FillPattern.Solid,
    lineThickness=3,
    frame=true,
    extent={{-300,120},{300,-120}}), Text(origin={0,-140},
    lineColor={0,0,0},
    extent={{0,-20},{0,20}},
    textString="%name",
    fontSize=14,
    textStyle={TextStyle.None},
    textColor={0,0,0},
    verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate),Diagram(graphics={Text(origin = { 680,-3 },lineColor = { 0,0,0 },extent = { { -128.18,-7 },{ 128.18,7 } },textString = "",fontSize = 20,textStyle = { TextStyle.None },textColor = { 0,0,0 },horizontalAlignment = TextAlignment.Left)}));
      SysplorerEmbeddedCoder.Port.Inport EngineSpd_rpm 
        annotation (Placement(transformation(origin = {-482.000000, 59.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport FuleCyle_mg 
        annotation (Placement(transformation(origin = {-367.000000, -84.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport EGRRatio 
        annotation (Placement(transformation(origin = {-367.000000, -111.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport RailPrs_kpa 
        annotation (Placement(transformation(origin = {-360.000000, 31.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false),ComponentMask(backgroundColor={128,128,128})));
      SysplorerEmbeddedCoder.Port.Inport IntakeMass 
        annotation (Placement(transformation(origin = {-360.000000, 4.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport ExhTemp_DOC_in 
        annotation (Placement(transformation(origin = {0.000000, 4.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport ExhTemp_DOC_out 
        annotation (Placement(transformation(origin = {191.000000, 113.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport ExhTemp_DPF_out 
        annotation (Placement(transformation(origin = {0.000000, 86.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport ExhTemp_SCR_out 
        annotation (Placement(transformation(origin = {0.000000, -23.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport ExhMassFlow 
        annotation (Placement(transformation(origin = {191.000000, 31.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport mNOx_SCR_in 
        annotation (Placement(transformation(origin = {232.000000, -115.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport mNOx_SCR_out 
        annotation (Placement(transformation(origin = {0.000000, -50.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport DPF_SootLoad 
        annotation (Placement(transformation(origin = {191.000000, 59.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport DPF_DP 
        annotation (Placement(transformation(origin = {191.000000, 4.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport NH3_Store 
        annotation (Placement(transformation(origin = {0.000000, -77.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport O2_frac 
        annotation (Placement(transformation(origin = {0.000000, -105.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport 'ThrottleCmd [-]' 
        annotation (Placement(transformation(origin = {-482.000000, 86.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      ANR_type ANR 
        annotation (Placement(transformation(origin = {337.000000, -99.000000}, extent = {{-61.000000, -30.500000}, {61.000000, 30.500000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
      DPF_REGEN_type DPF_REGEN 
        annotation (Placement(transformation(origin = {335.000000, 45.000000}, extent = {{-62.500000, -84.000000}, {62.500000, 84.000000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
      EGRCtrl_type EGRCtrl 
        annotation (Placement(transformation(origin = {-221.000000, -84.000000}, extent = {{-61.000000, -40.500000}, {61.000000, 40.500000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
      SysplorerEmbeddedCoder.SignalRouting.From From 
        annotation (Placement(transformation(origin = {-367.000000, -57.000000}, extent = {{-34.000000, -5.000000}, {34.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EngineSpd_rpm",tagSocped="MyEngine20261109.Engine_type.ECU_type",tagVisibility="Local"))));
      SysplorerEmbeddedCoder.SignalRouting.From From1 
        annotation (Placement(transformation(origin = {191.000000, -23.000000}, extent = {{-34.000000, -5.000000}, {34.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EngineSpd_rpm",tagSocped="MyEngine20261109.Engine_type.ECU_type",tagVisibility="Local"))));
      SysplorerEmbeddedCoder.SignalRouting.Goto Goto2 
        annotation (Placement(transformation(origin = {-336.000000, 73.000000}, extent = {{-34.000000, -5.000000}, {34.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EngineSpd_rpm",tagSocped="MyEngine20261109.Engine_type.ECU_type",tagVisibility="Local"))));
      SpdCtrl_type SpdCtrl 
        annotation (Placement(transformation(origin = {-221.000000, 46.000000}, extent = {{-61.000000, -57.500000}, {61.000000, 57.500000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
      SysplorerEmbeddedCoder.Utilities.Terminator Terminator2 
        annotation (Placement(transformation(origin = {65.000000, -50.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
      SysplorerEmbeddedCoder.Utilities.Terminator Terminator3 
        annotation (Placement(transformation(origin = {65.000000, -22.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
      SysplorerEmbeddedCoder.Utilities.Terminator Terminator4 
        annotation (Placement(transformation(origin = {65.000000, 5.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
      SysplorerEmbeddedCoder.Utilities.Terminator Terminator6 
        annotation (Placement(transformation(origin = {65.000000, -104.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
      SysplorerEmbeddedCoder.Utilities.Terminator Terminator7 
        annotation (Placement(transformation(origin = {65.000000, -77.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
      SysplorerEmbeddedCoder.Port.Outport FuelCyleTgt_mg 
        annotation (Placement(transformation(origin = {-108.000000, 45.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport EGROpeningTgt_pct 
        annotation (Placement(transformation(origin = {-112.000000, -84.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport PostInj_Request 
        annotation (Placement(transformation(origin = {482.000000, 45.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport DPF_regen_req 
        annotation (Placement(transformation(origin = {482.000000, 99.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport mUREA_target 
        annotation (Placement(transformation(origin = {462.000000, -101.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      block ANR_type "子系统
通过子系统创建模型分层结构。"

        annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left(ExhTemp_DPF_out, 'mNOx_SCR_kg/h'), Right(mUREA_target)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
      grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
      rotationPolicy=RotationPolicy.Follow,
      origin={0,0},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid,
      lineThickness=3,
      frame=true,
      extent={{-300,120},{300,-120}}), Text(origin={0,-140},
      lineColor={0,0,0},
      extent={{0,-20},{0,20}},
      textString="%name",
      fontSize=14,
      textStyle={TextStyle.None},
      textColor={0,0,0},
      verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
        SysplorerEmbeddedCoder.Port.Inport ExhTemp_DPF_out 
          annotation (Placement(transformation(origin = {-284.000000, 62.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport 'mNOx_SCR_kg/h' 
          annotation (Placement(transformation(origin = {-284.000000, -42.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Sources.Constant ANRtarget(k=1) 
          annotation (Placement(transformation(origin = {-291.000000, -2.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.MathOperation.Product Divide(inputs="*/",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
          annotation (Placement(transformation(origin = {-30.000000, -42.000000}, extent = {{-5.000000, -39.000000}, {5.000000, 39.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="/",instance="u2")))));
        SysplorerEmbeddedCoder.MathOperation.Product Product(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
          annotation (Placement(transformation(origin = {-182.000000, -22.000000}, extent = {{-3.000000, -41.000000}, {3.000000, 41.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
        SysplorerEmbeddedCoder.LogicAndBitOperation.RelationalOperator 'Relational10Operator'(op=SysplorerEmbeddedCoder.LogicAndBitOperation.RelationalOperator.Operators.LE) 
          annotation (Placement(transformation(origin = {124.000000, -15.000000}, extent = {{-6.500000, -19.000000}, {6.500000, 19.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(y(Type(inherit=InheritType.none,ref="boolean"))))));
        SysplorerEmbeddedCoder.SignalRouting.Switch Switch(threshold=0,zeroCross=true,ct=SysplorerEmbeddedCoder.SignalRouting.Switch.ConditionType.Great,hasDiffSize=false) 
          annotation (Placement(transformation(origin = {200.000000, -14.000000}, extent = {{-8.500000, -42.500000}, {8.500000, 42.500000}},rotation=0)),__MWORKS(BlockSystem(zeroCross=true,Instance(y(Type(inherit=InheritType.internalRule))))));
        SysplorerEmbeddedCoder.Sources.Constant zero2(k=0) 
          annotation (Placement(transformation(origin = {155.000000, 12.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Sources.Constant '-75-51-50-62'(k=200) 
          annotation (Placement(transformation(origin = {80.000000, -25.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Sources.Constant '-60-14-53-40-59-88-74-56'(k=0.325) 
          annotation (Placement(transformation(origin = {-73.000000, -63.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Port.Outport mUREA_target 
          annotation (Placement(transformation(origin = {291.000000, -15.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      equation
        connect('Relational10Operator'.y, Switch.u2) 
        annotation(Line(origin={0,0},
        points={{135,-15},{135,-14},{187,-14}}));
        connect('-75-51-50-62'.y, 'Relational10Operator'.u2) 
        annotation(Line(origin={0,0},
        points={{95,-25},{95,-24},{113,-24}}));
        connect(ANRtarget.y, Product.u1) 
        annotation(Line(origin={0,0},
        points={{-276,-2},{-276,-1},{-190,-1}}));
        connect('-60-14-53-40-59-88-74-56'.y, Divide.u2) 
        annotation(Line(origin={0,0},
        points={{-58,-63},{-58,-61},{-40,-61}}));
        connect(ExhTemp_DPF_out, 'Relational10Operator'.u1) 
        annotation(Line(origin={0,0},
        points={{-284,62},{32,62},{32,-6},{32,-5},{113,-5}}));
        connect(Divide.y, Switch.u3) 
        annotation(Line(origin={0,0},
        points={{-20,-42},{187,-42}}));
        connect(zero2.y, Switch.u1) 
        annotation(Line(origin={0,0},
        points={{170,12},{170,14},{187,14}}));
        connect(Product.y, Divide.u1) 
        annotation(Line(origin={0,0},
        points={{-174,-22},{-40,-22}}),Text(origin={-107,-19},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="mNH3_target"))));
        connect('mNOx_SCR_kg/h', Product.u2) 
        annotation(Line(origin={0,0},
        points={{-284,-42},{-190,-42}}));
        connect(Switch.y, mUREA_target) 
        annotation(Line(origin={0,0},
        points={{213,-14},{213,-15},{291,-15}}),Text(origin={252,-12},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="mUREA_target"))));
        end ANR_type;
      block DPF_REGEN_type "子系统
通过子系统创建模型分层结构。"

        annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left(ExhTemp_DOC_out, ExhTemp_DPF_out, DPF_SootLoad, ExhMassFlow, DPF_DP, EngineSpd_rpm), Right(DPF_regen_req, PostInj_Request, Regen_State)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
      grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
      rotationPolicy=RotationPolicy.Follow,
      origin={0,0},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid,
      lineThickness=3,
      frame=true,
      extent={{-300,120},{300,-120}}), Text(origin={0,-140},
      lineColor={0,0,0},
      extent={{0,-20},{0,20}},
      textString="%name",
      fontSize=14,
      textStyle={TextStyle.None},
      textColor={0,0,0},
      verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
        SysplorerEmbeddedCoder.Port.Inport ExhTemp_DOC_out 
          annotation (Placement(transformation(origin = {-121.000000, -44.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport ExhTemp_DPF_out 
          annotation (Placement(transformation(origin = {-267.000000, 48.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport DPF_SootLoad 
          annotation (Placement(transformation(origin = {-121.000000, 41.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport ExhMassFlow 
          annotation (Placement(transformation(origin = {-267.000000, 17.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport DPF_DP 
          annotation (Placement(transformation(origin = {-267.000000, -13.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport EngineSpd_rpm 
          annotation (Placement(transformation(origin = {-267.000000, -44.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Utilities.Terminator Terminator 
          annotation (Placement(transformation(origin = {-196.000000, 48.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
        SysplorerEmbeddedCoder.Utilities.Terminator Terminator1 
          annotation (Placement(transformation(origin = {-196.000000, 18.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
        SysplorerEmbeddedCoder.Utilities.Terminator Terminator2 
          annotation (Placement(transformation(origin = {-196.000000, -13.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
        SysplorerEmbeddedCoder.Utilities.Terminator Terminator3 
          annotation (Placement(transformation(origin = {-196.000000, -43.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
        SysplorerEmbeddedCoder.Port.Outport DPF_regen_req 
          annotation (Placement(transformation(origin = {264.000000, 55.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport PostInj_Request 
          annotation (Placement(transformation(origin = {264.000000, 0.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport Regen_State 
          annotation (Placement(transformation(origin = {267.000000, -54.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        Chart_type Chart 
          annotation (Placement(transformation(origin = {77.000000, 0.000000}, extent = {{-112.000000, -84.000000}, {112.000000, 84.000000}},rotation=0)));
        block Chart_type "状态机"
          annotation (__MWORKS(BlockSystem(blockKind = BlockKind.stateMachine, SampleTime(auto = true), independent = true, StateMachine(virtual = false, functionPack = FunctionPack.auto, functionName = "", sourceFile = "")),PortArrangement(Left(DPF_SootLoad, ExhTemp_DPF_in_c), Right(Regen_Request, Regen_State, PostInj_Request)),sourceModel=SysplorerEmbeddedCoder.StateMachine.Chart,independentInstance=true,hide=true),
            defaultComponentName = "chart",
            Icon(coordinateSystem(extent = {{-100.0, -100.0}, {100.0, 100.0}},
              grid = {2.0, 2.0}), graphics = {Rectangle(origin = {0.0, 0.0},
              lineColor={74,84,154},
              fillColor={255,255,255},
              lineThickness=3,
              frame=true,
              extent = {{-100.0, 100.0}, {100.0, -100.0}},
              radius=11,
              rotationPolicy=RotationPolicy.Follow), Rectangle(origin={0,27},
              lineColor={74,84,154},
              fillColor={255,255,255},
              lineThickness=2,
              extent = {{-25.0, 20.0}, {25.0, -20.0}},
              radius = 10.0), Rectangle(origin = {-40.0, -27.0},
              lineColor={74,84,154},
              fillColor={255,255,255},
              lineThickness=2,
              extent = {{-25.0, 20.0}, {25.0, -20.0}},
              radius = 10.0), Rectangle(origin = {40.0, -27.0},
              lineColor={74,84,154},
              fillColor={255,255,255},
              lineThickness=2,
              extent = {{-25.0, 20.0}, {25.0, -20.0}},
              radius = 10.0), Line(origin = {-40.0, 13.0},
              points = {{-10.0, -13.0}, {-10.0, 7.0}, {10.0, 13.0}},
              color={74,84,154},
              thickness=2,
              arrow={Arrow.None,Arrow.Filled},
              arrowSize = 8.0,
              smooth = Smooth.Bezier), Line(origin = {41.0, 13.0},
              points = {{-9.0, 13.0}, {9.0, 11.0}, {9.0, -13.0}},
              color={74,84,154},
              thickness=2,
              arrow={Arrow.None,Arrow.Filled},
              arrowSize = 8.0,
              smooth = Smooth.Bezier), Line(origin = {0.0, -28.0},
              points = {{10.0, 0.0}, {-10.0, 0.0}},
              color={74,84,154},
              thickness=2,
              arrow={Arrow.None,Arrow.Filled},
              arrowSize = 8.0,
              smooth = Smooth.Bezier), Text(origin = {0.0, -120.0},
              lineColor={74,84,154},
              extent = {{0, 20.0}, {0, -20.0}},
              textString="%name",
              fontSize=14,
              textStyle={TextStyle.None},
              textColor={74,84,154},
              verticalAlignment=TextAlignment.Top)}),Protection(access=Access.packageDuplicate));
          SysplorerEmbeddedCoder.Port.Inport DPF_SootLoad annotation (__MWORKS(internalShare = true,BlockSystem(Type(inherit=InheritType.sameAsSysblock),Dimension(dimensionType=DimensionType.none)=1)),Placement(iconTransformation(extent={{-1.8, -1.8}, {1.8, 1.8}})));
          SysplorerEmbeddedCoder.Port.Inport ExhTemp_DPF_in_c annotation (__MWORKS(internalShare = true,BlockSystem(Type(inherit=InheritType.sameAsSysblock),Dimension(dimensionType=DimensionType.none)=1)),Placement(iconTransformation(extent={{-1.8, -1.8}, {1.8, 1.8}})));
          SysplorerEmbeddedCoder.Port.Outport Regen_Request annotation (__MWORKS(internalShare = true,BlockSystem(Type(inherit=InheritType.none,ref="boolean"),Dimension(dimensionType=DimensionType.none)=1)),Placement(iconTransformation(extent={{-1.8, -1.8}, {1.8, 1.8}})));
          SysplorerEmbeddedCoder.Port.Outport Regen_State annotation (__MWORKS(internalShare = true,BlockSystem(Type(inherit=InheritType.none,ref="uint8"),Dimension(dimensionType=DimensionType.none)=1)),Placement(iconTransformation(extent={{-1.8, -1.8}, {1.8, 1.8}})));
          SysplorerEmbeddedCoder.Port.Outport PostInj_Request annotation (__MWORKS(internalShare = true,BlockSystem(Type(inherit=InheritType.none,ref="boolean"),Dimension(dimensionType=DimensionType.none)=1)),Placement(iconTransformation(extent={{-1.8, -1.8}, {1.8, 1.8}})));
          parameter SysplorerEmbeddedCoder.Types.Auto T_regen_min annotation (__MWORKS(internalShare = true,BlockSystem(Type(inherit=InheritType.none,ref="double"),Dimension(dimensionType=DimensionType.none)=1)));
          parameter SysplorerEmbeddedCoder.Types.Auto T_regen_max annotation (__MWORKS(internalShare = true,BlockSystem(Type(inherit=InheritType.none,ref="double"),Dimension(dimensionType=DimensionType.none)=1)));
          parameter SysplorerEmbeddedCoder.Types.Auto Soot_Load_On annotation (__MWORKS(internalShare = true,BlockSystem(Type(inherit=InheritType.none,ref="double"),Dimension(dimensionType=DimensionType.none)=1)));
          parameter SysplorerEmbeddedCoder.Types.Auto Soot_Load_Off annotation (__MWORKS(internalShare = true,BlockSystem(Type(inherit=InheritType.none,ref="double"),Dimension(dimensionType=DimensionType.none)=1)));
          parameter SysplorerEmbeddedCoder.Types.Auto Regen_Enable_SW annotation (__MWORKS(internalShare = true,BlockSystem(Type(inherit=InheritType.none,ref="double"),Dimension(dimensionType=DimensionType.none)=1)));
          State_type Idle 
            annotation (Placement(transformation(origin = {224.966150, -48.250000}, extent = {{-224.966150, -48.250000}, {224.966150, 48.250000}},rotation=0)));
          State_type1 Wait 
            annotation (Placement(transformation(origin = {166.162500, -215.250000}, extent = {{-166.162500, -48.250000}, {166.162500, 48.250000}},rotation=0)));
          State_type2 Regen 
            annotation (Placement(transformation(origin = {224.966150, -382.250000}, extent = {{-224.966150, -48.250000}, {224.966150, 48.250000}},rotation=0)));
          block State_type "状态"
            annotation (__MWORKS(BlockSystem(blockKind=BlockKind.state,SampleTime(auto = true),State(displayAlgorithm="en:Regen_Request:=false; PostInj_Request:=false;
Regen_State := uint8[0];"),bind),showDiagram = true,sourceModel=SysplorerEmbeddedCoder.StateMachine.State,independentInstance=true,hide=true), defaultComponentName = "state",
             Icon(coordinateSystem(extent={{-100,-100},{100,100}},
          grid={2,2}),graphics = {Text(origin={0,60},
          lineColor={0,0,128},
          extent={{-90,40},{90,-40}},
          textString="state",
          fontName="Arial",
          textStyle={TextStyle.None},
          textColor={0,0,128},
          horizontalAlignment=TextAlignment.Left), Rectangle(origin={0,0},
          lineColor={74,84,154},
          fillColor={255,255,255},
          lineThickness=3,
          extent={{-100,100},{100,-100}},
          radius=11), Line(origin={0,30},
          points={{-100,0},{100,0}},
          color={74,84,154},
          thickness=3)}),
             Diagram(coordinateSystem(extent={{-224.96615,-48.25},{224.96615,48.25}},
initialScale=1,
grid={2,2}),graphics={State(origin={0,0},
stateTitle=Text(origin={0,0},
lineColor={74,84,154},
extent={{-18,10},{18,20}},
textString="%name",
fontSize=25,
textColor={74,84,154},
horizontalAlignment=TextAlignment.Left),
stateText=Text(origin={0,0},
lineColor={74,84,154},
extent={{-18,-20},{18,10}},
textString="%algorithm",
fontSize=25,
textColor={74,84,154},
horizontalAlignment=TextAlignment.Left,
verticalAlignment=TextAlignment.Top),
stateLine = Line(origin={0,0},
color = {74, 84, 154},
points={{-40,22},{40,22}})) }),Protection(access=Access.packageDuplicate));
          algorithm
          annotation(__MWORKS(BlockSystem(StateMachine(actionKind = ActionKind.entry))));Regen_Request:=false; PostInj_Request:=false;
          Regen_State := uint8[0];
          end State_type;
          block State_type1 "状态"
            annotation (__MWORKS(BlockSystem(blockKind=BlockKind.state,SampleTime(auto = true),State(displayAlgorithm="en,du:Regen_Request:=true;
PostInj_Request :=(ExhTemp_DPF_in_c < T_regen_min);
Regen_State := uint8[1];"),bind),showDiagram = true,sourceModel=SysplorerEmbeddedCoder.StateMachine.State,independentInstance=true,hide=true), defaultComponentName = "state",
             Icon(coordinateSystem(extent={{-100,-100},{100,100}},
          grid={2,2}),graphics = {Text(origin={0,60},
          lineColor={0,0,128},
          extent={{-90,40},{90,-40}},
          textString="state",
          fontName="Arial",
          textStyle={TextStyle.None},
          textColor={0,0,128},
          horizontalAlignment=TextAlignment.Left), Rectangle(origin={0,0},
          lineColor={74,84,154},
          fillColor={255,255,255},
          lineThickness=3,
          extent={{-100,100},{100,-100}},
          radius=11), Line(origin={0,30},
          points={{-100,0},{100,0}},
          color={74,84,154},
          thickness=3)}),
             Diagram(coordinateSystem(extent={{-166.1625,-48.25},{166.1625,48.25}},
initialScale=1,
grid={2,2}),graphics={State(origin={0,0},
stateTitle=Text(origin={0,0},
lineColor={74,84,154},
extent={{-18,10},{18,20}},
textString="%name",
fontSize=25,
textColor={74,84,154},
horizontalAlignment=TextAlignment.Left),
stateText=Text(origin={0,0},
lineColor={74,84,154},
extent={{-18,-20},{18,10}},
textString="%algorithm",
fontSize=25,
textColor={74,84,154},
horizontalAlignment=TextAlignment.Left,
verticalAlignment=TextAlignment.Top),
stateLine = Line(origin={0,0},
color = {74, 84, 154},
points={{-40,22},{40,22}})) }),Protection(access=Access.packageDuplicate));
          algorithm
          annotation(__MWORKS(BlockSystem(StateMachine(actionKind = ActionKind.entry or ActionKind.during))));Regen_Request:=true;
          PostInj_Request :=(ExhTemp_DPF_in_c < T_regen_min);
          Regen_State := uint8[1];
          end State_type1;
          block State_type2 "状态"
            annotation (__MWORKS(BlockSystem(blockKind=BlockKind.state,SampleTime(auto = true),State(displayAlgorithm="en,du: Regen_Request:=true;
 Regen_State := uint8[2];"),bind),showDiagram = true,sourceModel=SysplorerEmbeddedCoder.StateMachine.State,independentInstance=true,hide=true), defaultComponentName = "state",
             Icon(coordinateSystem(extent={{-100,-100},{100,100}},
          grid={2,2}),graphics = {Text(origin={0,60},
          lineColor={0,0,128},
          extent={{-90,40},{90,-40}},
          textString="state",
          fontName="Arial",
          textStyle={TextStyle.None},
          textColor={0,0,128},
          horizontalAlignment=TextAlignment.Left), Rectangle(origin={0,0},
          lineColor={74,84,154},
          fillColor={255,255,255},
          lineThickness=3,
          extent={{-100,100},{100,-100}},
          radius=11), Line(origin={0,30},
          points={{-100,0},{100,0}},
          color={74,84,154},
          thickness=3)}),
             Diagram(coordinateSystem(extent={{-224.96615,-48.25},{224.96615,48.25}},
initialScale=1,
grid={2,2}),graphics={State(origin={0,0},
stateTitle=Text(origin={0,0},
lineColor={74,84,154},
extent={{-18,10},{18,20}},
textString="%name",
fontSize=25,
textColor={74,84,154},
horizontalAlignment=TextAlignment.Left),
stateText=Text(origin={0,0},
lineColor={74,84,154},
extent={{-18,-20},{18,10}},
textString="%algorithm",
fontSize=25,
textColor={74,84,154},
horizontalAlignment=TextAlignment.Left,
verticalAlignment=TextAlignment.Top),
stateLine = Line(origin={0,0},
color = {74, 84, 154},
points={{-40,22},{40,22}})) }),Protection(access=Access.packageDuplicate));
          algorithm
          annotation(__MWORKS(BlockSystem(StateMachine(actionKind = ActionKind.entry or ActionKind.during)))); Regen_Request:=true;
           Regen_State := uint8[2];
          end State_type2;
        equation
          initialState(Idle, true, 1) 
          annotation(Line(origin={92.3842,35.1875},
          points={{0,16.3125},{0,-35.1875}},
          color={74,84,154},
          arrowSize=8,
          smooth=Smooth.Bezier),Text(origin={0,0},
          lineColor={74,84,154},
          extent={{0,-3},{0,3}},
          textString="%condition",
          fontSize=25,
          textStyle={TextStyle.Bold},
          textColor={74,84,154}), __MWORKS(BlockSystem(StateMachine(outerTransition = true,comment=false))), displayText ="[true]");
          transition(Idle, Wait, DPF_SootLoad > Soot_Load_On and Regen_Enable_SW==true, reset = false) 
          annotation(Line(origin={52.3036,-127.75},
          points={{0,31.25},{0,-39.25}},
          color={74,84,154},
          arrowSize=8,
          smooth=Smooth.Bezier),Text(origin={-187.089,-1.627},
          lineColor={74,84,154},
          extent={{0,-3},{0,3}},
          textString="%condition",
          fontSize=25,
          textStyle={TextStyle.Bold},
          textColor={74,84,154}), __MWORKS(BlockSystem(StateMachine(outerTransition = true,comment=false))), displayText ="[DPF_SootLoad > Soot_Load_On and Regen_Enable_SW==true]");
          transition(Regen, Idle, (ExhTemp_DPF_in_c > T_regen_max) or (DPF_SootLoad < Soot_Load_Off), reset = false) 
          annotation(Line(origin={403.9669,-219.25},
          points={{0,-114.75},{0,122.75}},
          color={74,84,154},
          arrowSize=8,
          smooth=Smooth.Bezier),Text(origin={221.1726,90.289},
          lineColor={74,84,154},
          extent={{0,-3},{0,3}},
          textString="%condition",
          fontSize=25,
          textStyle={TextStyle.Bold},
          textColor={74,84,154}), __MWORKS(BlockSystem(StateMachine(outerTransition = true,comment=false))), displayText ="[(ExhTemp_DPF_in_c > T_regen_max) or (DPF_SootLoad < Soot_Load_Off)]");
          transition(Wait, Regen, ExhTemp_DPF_in_c > T_regen_min, reset = false) 
          annotation(Line(origin={56.359,-294.75},
          points={{0,31.25},{0,-39.25}},
          color={74,84,154},
          arrowSize=8,
          smooth=Smooth.Bezier),Text(origin={-124.906,1.849},
          lineColor={74,84,154},
          extent={{0,-3},{0,3}},
          textString="%condition",
          fontSize=25,
          textStyle={TextStyle.Bold},
          textColor={74,84,154}), __MWORKS(BlockSystem(StateMachine(outerTransition = true,comment=false))), displayText ="[ExhTemp_DPF_in_c > T_regen_min]");
          transition(Regen, Wait, ExhTemp_DPF_in_c <0.9*T_regen_min, reset = false, priority = 2) 
          annotation(Line(origin={241.171,-302.75},
          points={{0,-31.25},{0,39.25}},
          color={74,84,154},
          arrowSize=8,
          smooth=Smooth.Bezier),Text(origin={-53.8291,-11.602},
          lineColor={74,84,154},
          extent={{0,-3},{0,3}},
          textString="%condition",
          fontSize=25,
          textStyle={TextStyle.Bold},
          textColor={74,84,154}), __MWORKS(BlockSystem(StateMachine(outerTransition = true,comment=false))), displayText ="[ExhTemp_DPF_in_c <0.9*T_regen_min]");
        end Chart_type;
      equation
        connect(DPF_SootLoad, Chart.DPF_SootLoad) 
        annotation(Line(origin={0,0},
        points={{-121,41},{-121,42},{-40,42}}));
        connect(ExhTemp_DOC_out, Chart.ExhTemp_DPF_in_c) 
        annotation(Line(origin={0,0},
        points={{-121,-44},{-121,-42},{-40,-42}}));
        connect(ExhTemp_DPF_out, Terminator.x) 
        annotation(Line(origin={0,0},
        points={{-267,48},{-207,48}}));
        connect(ExhMassFlow, Terminator1.x) 
        annotation(Line(origin={0,0},
        points={{-267,17},{-267,18},{-207,18}}));
        connect(EngineSpd_rpm, Terminator3.x) 
        annotation(Line(origin={0,0},
        points={{-267,-44},{-267,-43},{-207,-43}}));
        connect(DPF_DP, Terminator2.x) 
        annotation(Line(origin={0,0},
        points={{-267,-13},{-207,-13}}));
        connect(Chart.Regen_Request, DPF_regen_req) 
        annotation(Line(origin={0,0},
        points={{194,56},{194,55},{264,55}}));
        connect(Chart.PostInj_Request, PostInj_Request) 
        annotation(Line(origin={0,0},
        points={{194,-56},{194,0},{264,0}}));
        connect(Chart.Regen_State, Regen_State) 
        annotation(Line(origin={0,0},
        points={{194,0},{194,-54},{267,-54}}));
        end DPF_REGEN_type;
      block EGRCtrl_type "子系统
通过子系统创建模型分层结构。"

        annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left(EngineSpd_rpm, FuleCycle_mg, EGRRatio), Right(EGROpeningTgt_pct)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
      grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
      rotationPolicy=RotationPolicy.Follow,
      origin={0,0},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid,
      lineThickness=3,
      frame=true,
      extent={{-300,120},{300,-120}}), Text(origin={0,-140},
      lineColor={0,0,0},
      extent={{0,-20},{0,20}},
      textString="%name",
      fontSize=14,
      textStyle={TextStyle.None},
      textColor={0,0,0},
      verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
        SysplorerEmbeddedCoder.Port.Inport EngineSpd_rpm 
          annotation (Placement(transformation(origin = {-302.000000, 49.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport FuleCycle_mg 
          annotation (Placement(transformation(origin = {-302.000000, 22.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport EGRRatio 
          annotation (Placement(transformation(origin = {-96.000000, 5.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.MathOperation.Sum Add(inputs="+-",isSaturate=false) 
          annotation (Placement(transformation(origin = {-28.000000, 21.000000}, extent = {{-3.000000, -29.500000}, {3.000000, 29.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="-",instance="u2")))));
        SysplorerEmbeddedCoder.Sources.Constant Constant(k=EGRKp) 
          annotation (Placement(transformation(origin = {45.000000, -11.000000}, extent = {{-52.500000, -6.500000}, {52.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Sources.Constant Constant1(k=EGRKi) 
          annotation (Placement(transformation(origin = {45.000000, -42.000000}, extent = {{-52.500000, -6.500000}, {52.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Sources.Constant Constant2(k=EGRKd) 
          annotation (Placement(transformation(origin = {45.000000, -73.000000}, extent = {{-52.500000, -6.500000}, {52.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Sources.Constant Constant3(k=100) 
          annotation (Placement(transformation(origin = {45.000000, -103.000000}, extent = {{-52.500000, -6.500000}, {52.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Sources.Constant Constant4(k=EGRMin) 
          annotation (Placement(transformation(origin = {45.000000, -164.000000}, extent = {{-52.500000, -6.500000}, {52.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Sources.Constant Constant5(k=EGRMax) 
          annotation (Placement(transformation(origin = {45.000000, -134.000000}, extent = {{-52.500000, -6.500000}, {52.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.LookupTable.LookupTable2D EGRTgt(table=EGRTgt,axis1=EGRTgt_x,axis2=EGRTgt_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
          annotation (Placement(transformation(origin = {-204.000000, 36.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
        SysplorerEmbeddedCoder.MathOperation.Gain Gain(k=100,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
          annotation (Placement(transformation(origin = {232.000000, -73.000000}, extent = {{-15.000000, -10.000000}, {15.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
        SysplorerEmbeddedCoder.SignalRouting.Mux Mux(portNumber=2) 
          annotation (Placement(transformation(origin = {-33.000000, 121.000000}, extent = {{-1.500000, -12.500000}, {1.500000, 12.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2)))));
        SysplorerEmbeddedCoder.Discrete.DiscretePIDController 'PID Controller'(controllerType=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.ControllerType.PID,SampleTimeD=-1,externalResetType=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.ExternalResetType.None,initialConditionForIntegrator=0,initialConditionForDifferentiator=0,UpperSaturationLimit=100,LowerSaturationLimit=-100,UpperIntegratorSaturationLimit=100,LowerIntegratorSaturationLimit=-100,Form=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.FormType.Parallel,TimeDomain=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.TimeDomainType.Discrete,ControllerParameterSource=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.SourceType.External,integratorMethodTypeOut=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.IntegratorMethodType.ForwardEuler,UseFilter=true,FilterMethod=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.IntegratorMethodType.ForwardEuler,InitialConditionSource=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.SourceType.Internal,TrackingMode=false,LimitOutput=true,SatLimitsSource=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.ControllerSourceTypeForSaturation.Outer,AntiWindupMode=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.AntiWindupModeType.BackCalculation,Kb=1,LimitIntegratorOutput=false) 
          annotation (Placement(transformation(origin = {166.000000, -73.000000}, extent = {{-23.500000, -102.500000}, {23.500000, 102.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=true)=-1)));
        Scope_type Scope 
          annotation (Placement(transformation(origin = {302.000000, 130.000000}, extent = {{-10.000000, -44.000000}, {10.000000, 44.000000}},rotation=0)));
        SysplorerEmbeddedCoder.Port.Outport EGROpeningTgt_pct 
          annotation (Placement(transformation(origin = {302.000000, -73.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        block Scope_type "示波器
显示仿真过程中生成的信号。"

          parameter String displayFormat = "y(t)" annotation(HideResult = true);

          parameter String showOnSimulator = "false" annotation(HideResult = true);
          SysplorerEmbeddedCoder.Types.InputAuto u1 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
          SysplorerEmbeddedCoder.Types.InputAuto u2 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
          SysplorerEmbeddedCoder.Types.InputAuto u3 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
          SysplorerEmbeddedCoder.Types.InputAuto u4 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));

          annotation(defaultComponentName = "scope", __MWORKS(BlockSystem(blockKind=Types.BlockKind.atomic, bltBlockKind=Types.BltBlockKind.scope),PortArrangement(Left(u1, u2, u3, u4)),sourceModel=SysplorerEmbeddedCoder.Utilities.Scope,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-100,-100},{100,100}},
        grid={2,2}),graphics = {Rectangle(origin={0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        lineThickness=3,
        frame=true,
        extent={{-100,100},{100,-100}},
        rotationPolicy=RotationPolicy.Follow), Rectangle(origin={1,54.5},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        lineThickness=2,
        extent={{-79,24.5},{79,-24.5}},
        radius=10), Text(origin={0,-120},
        lineColor={0,0,0},
        extent={{0,-20},{0,20}},
        textString="%name",
        fontSize=14,
        textStyle={TextStyle.None},
        textColor={0,0,0},
        verticalAlignment=TextAlignment.Top)},rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));

        end Scope_type;
      equation
        connect(Add.y, 'PID Controller'.u1) 
        annotation(Line(origin={0,0},
        points={{-20,21},{-20,15},{138,15}}));
        connect(Constant2.y, 'PID Controller'.D_In) 
        annotation(Line(origin={0,0},
        points={{102,-73},{102,-72},{138,-72}}));
        connect(Constant4.y, 'PID Controller'.lo) 
        annotation(Line(origin={0,0},
        points={{102,-164},{102,-159},{138,-159}}));
        connect(Constant3.y, 'PID Controller'.N_In) 
        annotation(Line(origin={0,0},
        points={{102,-103},{102,-101},{138,-101}}));
        connect(EGRRatio, Mux.u2) 
        annotation(Line(origin={0,0},
        points={{-96,5},{-75,5},{-75,113},{-75,115},{-39,115}}));
        connect(EGRRatio, Add.u2) 
        annotation(Line(origin={0,0},
        points={{-96,5},{-75,5},{-75,7},{-36,7}}));
        connect(Constant.y, 'PID Controller'.P_In) 
        annotation(Line(origin={0,0},
        points={{102,-11},{102,-14},{138,-14}}));
        connect(EGRTgt.y, Mux.u1) 
        annotation(Line(origin={0,0},
        points={{-172,36},{-68,36},{-68,127},{-39,127}}));
        connect(EGRTgt.y, Add.u1) 
        annotation(Line(origin={0,0},
        points={{-172,36},{-68,36},{-36,36}}));
        connect(Constant1.y, 'PID Controller'.I_In) 
        annotation(Line(origin={0,0},
        points={{102,-42},{102,-43},{138,-43}}));
        connect('PID Controller'.outport, Gain.u) 
        annotation(Line(origin={0,0},
        points={{194,-73},{212,-73}}));
        connect(Constant5.y, 'PID Controller'.up) 
        annotation(Line(origin={0,0},
        points={{102,-134},{102,-130},{138,-130}}));
        connect(EngineSpd_rpm, Scope.u1) 
        annotation(Line(origin={0,0},
        points={{-302,49},{-292,49},{-292,161},{-292,163},{287,163}}));
        connect(EngineSpd_rpm, EGRTgt.u1) 
        annotation(Line(origin={0,0},
        points={{-302,49},{-292,49},{-292,50},{-236,50}}));
        connect(FuleCycle_mg, Scope.u2) 
        annotation(Line(origin={0,0},
        points={{-302,22},{-279,22},{-279,141},{287,141}}));
        connect(FuleCycle_mg, EGRTgt.u2) 
        annotation(Line(origin={0,0},
        points={{-302,22},{-279,22},{-279,23},{-236,23}}));
        connect(Gain.y, Scope.u4) 
        annotation(Line(origin={0,0},
        points={{252,-73},{265,-73},{265,100},{265,97},{287,97}}));
        connect(Gain.y, EGROpeningTgt_pct) 
        annotation(Line(origin={0,0},
        points={{252,-73},{265,-73},{302,-73}}));
        connect(Mux.y, Scope.u3) 
        annotation(Line(origin={0,0},
        points={{-27,121},{-27,119},{287,119}}));
        end EGRCtrl_type;
      block SpdCtrl_type "子系统
通过子系统创建模型分层结构。"

        annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left('ThrottleCmd [-]', EngineSpd_rpm, RailPrs_kpa, IntakeMass), Right(FuelCycle_mg)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
      grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
      rotationPolicy=RotationPolicy.Follow,
      origin={0,0},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid,
      lineThickness=3,
      frame=true,
      extent={{-300,120},{300,-120}}), Text(origin={0,-140},
      lineColor={0,0,0},
      extent={{0,-20},{0,20}},
      textString="%name",
      fontSize=14,
      textStyle={TextStyle.None},
      textColor={0,0,0},
      verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
        SysplorerEmbeddedCoder.Port.Inport 'ThrottleCmd [-]' 
          annotation (Placement(transformation(origin = {-370.000000, 54.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport EngineSpd_rpm 
          annotation (Placement(transformation(origin = {-200.000000, 23.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport RailPrs_kpa 
          annotation (Placement(transformation(origin = {-200.000000, -177.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false),ComponentMask(backgroundColor={128,128,128})));
        SysplorerEmbeddedCoder.Port.Inport IntakeMass 
          annotation (Placement(transformation(origin = {-200.000000, -89.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.MathOperation.Sum Add(inputs="+-",isSaturate=false) 
          annotation (Placement(transformation(origin = {-85.000000, 39.000000}, extent = {{-3.000000, -29.500000}, {3.000000, 29.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="-",instance="u2")))));
        SysplorerEmbeddedCoder.Sources.Constant Constant(k=FuelKp) 
          annotation (Placement(transformation(origin = {134.000000, 7.000000}, extent = {{-39.000000, -6.500000}, {39.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Sources.Constant Constant1(k=FuelKi) 
          annotation (Placement(transformation(origin = {134.000000, -24.000000}, extent = {{-39.000000, -6.500000}, {39.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Sources.Constant Constant2(k=FuelKd) 
          annotation (Placement(transformation(origin = {134.000000, -54.000000}, extent = {{-39.000000, -6.500000}, {39.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Sources.Constant Constant3(k=100) 
          annotation (Placement(transformation(origin = {134.000000, -85.000000}, extent = {{-39.000000, -6.500000}, {39.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Sources.Constant Constant4(k=FuelCyleMin) 
          annotation (Placement(transformation(origin = {134.000000, -146.000000}, extent = {{-39.000000, -6.500000}, {39.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Sources.Constant Constant5(k=160) 
          annotation (Placement(transformation(origin = {-4.000000, -133.000000}, extent = {{-27.000000, -5.000000}, {27.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.Sources.Constant Constant6(k=FuelCyleMaxSw) 
          annotation (Placement(transformation(origin = {-19.000000, -116.000000}, extent = {{-42.500000, -6.500000}, {42.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
        SysplorerEmbeddedCoder.LookupTable.LookupTable1D EngineSpdTgt(table=EngineSpdTgt,axis1=EngineSpdTgt_x,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable1D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable1D.ExtrapolationMethod.clip,indexSearchMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable1D.IndexSearchMethod.binarySearch) 
          annotation (Placement(transformation(origin = {-236.000000, 54.000000}, extent = {{-22.000000, -21.500000}, {22.000000, 21.500000}},rotation=0)));
        SysplorerEmbeddedCoder.LookupTable.LookupTable2D FuelCyleMax(table=FuelCyleMax,axis1=FuelCyleMax_x,axis2=FuelCyleMax_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
          annotation (Placement(transformation(origin = {-103.000000, -99.000000}, extent = {{-22.000000, -21.500000}, {22.000000, 21.500000}},rotation=0)));
        SysplorerEmbeddedCoder.MathOperation.Gain Gain9(k=100,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
          annotation (Placement(transformation(origin = {-318.000000, 54.000000}, extent = {{-15.000000, -10.000000}, {15.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
        SysplorerEmbeddedCoder.SignalRouting.Mux Mux(portNumber=2) 
          annotation (Placement(transformation(origin = {286.000000, 148.000000}, extent = {{-1.500000, -12.500000}, {1.500000, 12.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2)))));
        SysplorerEmbeddedCoder.Discrete.DiscretePIDController 'PID Controller'(controllerType=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.ControllerType.PID,SampleTimeD=-1,externalResetType=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.ExternalResetType.None,initialConditionForIntegrator=0,initialConditionForDifferentiator=0,UpperSaturationLimit=100,LowerSaturationLimit=-100,UpperIntegratorSaturationLimit=100,LowerIntegratorSaturationLimit=-100,Form=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.FormType.Parallel,TimeDomain=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.TimeDomainType.Discrete,ControllerParameterSource=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.SourceType.External,integratorMethodTypeOut=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.IntegratorMethodType.ForwardEuler,UseFilter=true,FilterMethod=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.IntegratorMethodType.ForwardEuler,InitialConditionSource=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.SourceType.Internal,TrackingMode=false,LimitOutput=true,SatLimitsSource=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.ControllerSourceTypeForSaturation.Outer,AntiWindupMode=SysplorerEmbeddedCoder.Discrete.DiscretePIDController.AntiWindupModeType.BackCalculation,Kb=1,LimitIntegratorOutput=false) 
          annotation (Placement(transformation(origin = {254.000000, -54.000000}, extent = {{-23.500000, -102.500000}, {23.500000, 102.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=true)=-1)));
        Scope_type Scope 
          annotation (Placement(transformation(origin = {370.000000, 148.000000}, extent = {{-10.000000, -40.000000}, {10.000000, 40.000000}},rotation=0)));
        SysplorerEmbeddedCoder.SignalRouting.Switch Switch(threshold=0,zeroCross=true,ct=SysplorerEmbeddedCoder.SignalRouting.Switch.ConditionType.Great,hasDiffSize=false) 
          annotation (Placement(transformation(origin = {57.000000, -116.000000}, extent = {{-13.500000, -27.000000}, {13.500000, 27.000000}},rotation=0)),__MWORKS(BlockSystem(zeroCross=true,Instance(y(Type(inherit=InheritType.internalRule))))));
        SysplorerEmbeddedCoder.Utilities.Terminator Terminator 
          annotation (Placement(transformation(origin = {-142.000000, -177.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)),__MWORKS(ComponentMask(backgroundColor={128,128,128})));
        SysplorerEmbeddedCoder.Port.Outport FuelCycle_mg 
          annotation (Placement(transformation(origin = {356.000000, -55.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        block Scope_type "示波器
显示仿真过程中生成的信号。"

          parameter String displayFormat = "y(t)" annotation(HideResult = true);

          parameter String showOnSimulator = "false" annotation(HideResult = true);
          SysplorerEmbeddedCoder.Types.InputAuto u1 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
          SysplorerEmbeddedCoder.Types.InputAuto u2 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
          SysplorerEmbeddedCoder.Types.InputAuto u3 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));

          annotation(defaultComponentName = "scope", __MWORKS(BlockSystem(blockKind=Types.BlockKind.atomic, bltBlockKind=Types.BltBlockKind.scope),PortArrangement(Left(u1, u2, u3)),sourceModel=SysplorerEmbeddedCoder.Utilities.Scope,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-100,-100},{100,100}},
        grid={2,2}),graphics = {Rectangle(origin={0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        lineThickness=3,
        frame=true,
        extent={{-100,100},{100,-100}},
        rotationPolicy=RotationPolicy.Follow), Rectangle(origin={1,54.5},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        lineThickness=2,
        extent={{-79,24.5},{79,-24.5}},
        radius=10), Text(origin={0,-120},
        lineColor={0,0,0},
        extent={{0,-20},{0,20}},
        textString="%name",
        fontSize=14,
        textStyle={TextStyle.None},
        textColor={0,0,0},
        verticalAlignment=TextAlignment.Top)},rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));

        end Scope_type;
      equation
        connect(EngineSpd_rpm, Mux.u2) 
        annotation(Line(origin={0,0},
        points={{-200,23},{-181,23},{-153,23},{-153,142},{280,142}}),Text(origin={63,145},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EngineSpd_rpm"))));
        connect(EngineSpd_rpm, Add.u2) 
        annotation(Line(origin={0,0},
        points={{-200,23},{-181,23},{-153,23},{-153,25},{-93,25}}),Text(origin={-123,28},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EngineSpd_rpm"))));
        connect(EngineSpd_rpm, FuelCyleMax.u2) 
        annotation(Line(origin={0,0},
        points={{-200,23},{-181,23},{-181,-109},{-130,-109}}),Text(origin={-155,-106},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EngineSpd_rpm"))));
        connect(Add.y, 'PID Controller'.u1) 
        annotation(Line(origin={0,0},
        points={{-77,39},{-77,34},{226,34}}));
        connect('PID Controller'.outport, Scope.u3) 
        annotation(Line(origin={0,0},
        points={{282,-54},{296,-54},{296,122},{296,123},{355,123}}),Text(origin={325,126},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="FuelCycle_mg"))));
        connect('PID Controller'.outport, FuelCycle_mg) 
        annotation(Line(origin={0,0},
        points={{282,-54},{296,-54},{296,-55},{356,-55}}),Text(origin={326,-52},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="FuelCycle_mg"))));
        connect(Constant.y, 'PID Controller'.P_In) 
        annotation(Line(origin={0,0},
        points={{178,7},{178,5},{226,5}}));
        connect(Constant1.y, 'PID Controller'.I_In) 
        annotation(Line(origin={0,0},
        points={{178,-24},{226,-24}}));
        connect(Constant3.y, 'PID Controller'.N_In) 
        annotation(Line(origin={0,0},
        points={{178,-85},{178,-82},{226,-82}}));
        connect(Constant2.y, 'PID Controller'.D_In) 
        annotation(Line(origin={0,0},
        points={{178,-54},{178,-53},{226,-53}}));
        connect(Constant4.y, 'PID Controller'.lo) 
        annotation(Line(origin={0,0},
        points={{178,-146},{178,-140},{226,-140}}));
        connect(IntakeMass, FuelCyleMax.u1) 
        annotation(Line(origin={0,0},
        points={{-200,-89},{-200,-88},{-130,-88}}));
        connect(RailPrs_kpa, Terminator.x) 
        annotation(Line(origin={0,0},
        points={{-200,-177},{-153,-177}}));
        connect(Switch.y, 'PID Controller'.up) 
        annotation(Line(origin={0,0},
        points={{75,-116},{75,-111},{226,-111}}));
        connect(FuelCyleMax.y, Switch.u1) 
        annotation(Line(origin={0,0},
        points={{-76,-99},{-76,-98},{39,-98}}));
        connect(Constant5.y, Switch.u3) 
        annotation(Line(origin={0,0},
        points={{28,-133},{28,-134},{39,-134}}));
        connect(Constant6.y, Switch.u2) 
        annotation(Line(origin={0,0},
        points={{28,-116},{39,-116}}));
        connect('ThrottleCmd [-]', Scope.u1) 
        annotation(Line(origin={0,0},
        points={{-370,54},{-360,54},{-360,176},{-360,175},{355,175}}),Text(origin={-2,178},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="ThrottleCmd"))));
        connect('ThrottleCmd [-]', Gain9.u) 
        annotation(Line(origin={0,0},
        points={{-370,54},{-360,54},{-338,54}}),Text(origin={-349,57},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="ThrottleCmd"))));
        connect(Gain9.y, EngineSpdTgt.u) 
        annotation(Line(origin={0,0},
        points={{-298,54},{-263,54}}));
        connect(EngineSpdTgt.y, Mux.u1) 
        annotation(Line(origin={0,0},
        points={{-209,54},{-153,54},{-153,156},{-153,154},{280,154}}),Text(origin={63,157},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EngineSpdTgt"))));
        connect(EngineSpdTgt.y, Add.u1) 
        annotation(Line(origin={0,0},
        points={{-209,54},{-153,54},{-93,54}}),Text(origin={-123,57},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EngineSpdTgt"))));
        connect(Mux.y, Scope.u2) 
        annotation(Line(origin={0,0},
        points={{292,147},{292,149},{355,149}}),Text(origin={323,152},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EngineSpd"))));
        end SpdCtrl_type;
    equation
      connect(SpdCtrl.FuelCycle_mg, FuelCyleTgt_mg) 
      annotation(Line(origin={0,0},
      points={{-155,46},{-155,45},{-108,45}}));
      connect(EngineSpd_rpm, Goto2.u) 
      annotation(Line(origin={0,0},
      points={{-482,59},{-412,59},{-412,72},{-412,73},{-375,73}}));
      connect(EngineSpd_rpm, SpdCtrl.EngineSpd_rpm) 
      annotation(Line(origin={0,0},
      points={{-482,59},{-412,59},{-412,61},{-287,61}}));
      connect(FuleCyle_mg, EGRCtrl.FuleCycle_mg) 
      annotation(Line(origin={0,0},
      points={{-367,-84},{-287,-84}}));
      connect(EGRCtrl.EGROpeningTgt_pct, EGROpeningTgt_pct) 
      annotation(Line(origin={0,0},
      points={{-155,-84},{-112,-84}}));
      connect(EGRRatio, EGRCtrl.EGRRatio) 
      annotation(Line(origin={0,0},
      points={{-367,-111},{-287,-111}}));
      connect(RailPrs_kpa, SpdCtrl.RailPrs_kpa) 
      annotation(Line(origin={0,0},
      points={{-360,31},{-360,33},{-287,33}}));
      connect(IntakeMass, SpdCtrl.IntakeMass) 
      annotation(Line(origin={0,0},
      points={{-360,4},{-360,5},{-287,5}}));
      connect(From.y, EGRCtrl.EngineSpd_rpm) 
      annotation(Line(origin={0,0},
      points={{-328,-57},{-287,-57}}));
      connect(mNOx_SCR_in, ANR.'mNOx_SCR_kg/h') 
      annotation(Line(origin={0,0},
      points={{232,-115},{232,-114},{271,-114}}));
      connect(ANR.mUREA_target, mUREA_target) 
      annotation(Line(origin={0,0},
      points={{403,-99},{403,-101},{462,-101}}));
      connect(ExhTemp_DPF_out, DPF_REGEN.ExhTemp_DPF_out) 
      annotation(Line(origin={0,0},
      points={{0,86},{118,86},{118,87},{268,87}}));
      connect(ExhTemp_DPF_out, ANR.ExhTemp_DPF_out) 
      annotation(Line(origin={0,0},
      points={{0,86},{118,86},{118,-84},{271,-84}}));
      connect(DPF_SootLoad, DPF_REGEN.DPF_SootLoad) 
      annotation(Line(origin={0,0},
      points={{191,59},{268,59}}));
      connect(ExhMassFlow, DPF_REGEN.ExhMassFlow) 
      annotation(Line(origin={0,0},
      points={{191,31},{268,31}}));
      connect(DPF_REGEN.DPF_regen_req, DPF_regen_req) 
      annotation(Line(origin={0,0},
      points={{402,101},{402,99},{482,99}}));
      connect(ExhTemp_DOC_in, Terminator4.x) 
      annotation(Line(origin={0,0},
      points={{0,4},{0,5},{54,5}}));
      connect(mNOx_SCR_out, Terminator2.x) 
      annotation(Line(origin={0,0},
      points={{0,-50},{54,-50}}));
      connect(ExhTemp_SCR_out, Terminator3.x) 
      annotation(Line(origin={0,0},
      points={{0,-23},{0,-22},{54,-22}}));
      connect(NH3_Store, Terminator7.x) 
      annotation(Line(origin={0,0},
      points={{0,-77},{54,-77}}));
      connect(O2_frac, Terminator6.x) 
      annotation(Line(origin={0,0},
      points={{0,-105},{0,-104},{54,-104}}));
      connect(DPF_DP, DPF_REGEN.DPF_DP) 
      annotation(Line(origin={0,0},
      points={{191,4},{191,3},{268,3}}));
      connect(ExhTemp_DOC_out, DPF_REGEN.ExhTemp_DOC_out) 
      annotation(Line(origin={0,0},
      points={{191,113},{191,115},{268,115}}));
      connect(From1.y, DPF_REGEN.EngineSpd_rpm) 
      annotation(Line(origin={0,0},
      points={{230,-23},{230,-25},{268,-25}}));
      connect(DPF_REGEN.PostInj_Request, PostInj_Request) 
      annotation(Line(origin={0,0},
      points={{402,45},{482,45}}));
      connect('ThrottleCmd [-]', SpdCtrl.'ThrottleCmd [-]') 
      annotation(Line(origin={0,0},
      points={{-482,86},{-482,89},{-287,89}}));
      end ECU_type;
    block Engine_type "子系统
通过子系统创建模型分层结构。"

      annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left(FuelCyleTgt_mg, EGROpeningTgt_pct, PostInj_Request, DPF_regen_req, mUREA_target, LoadTrq_Nm), Right(EngineTrq_Nm, EngineSpd_rpm, FuelCyle_g, EGRRatio, RailPrs_kpa, 'IntakeMass_kg/h', ExhTemp_DOC_in, ExhTemp_DOC_out, ExhTemp_DPF_out, ExhTemp_SCR_out, ExhMassFlow, mNOx_SCR_in, mNOx_SCR_out, Soot_Load, DPF_DP, NH3_Store, O2_frac)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
    grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
    rotationPolicy=RotationPolicy.Follow,
    origin={0,0},
    fillColor={255,255,255},
    fillPattern=FillPattern.Solid,
    lineThickness=3,
    frame=true,
    extent={{-300,120},{300,-120}}), Text(origin={0,-140},
    lineColor={0,0,0},
    extent={{0,-20},{0,20}},
    textString="%name",
    fontSize=14,
    textStyle={TextStyle.None},
    textColor={0,0,0},
    verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
      SysplorerEmbeddedCoder.Port.Inport FuelCyleTgt_mg 
        annotation (Placement(transformation(origin = {-340.000000, 301.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport EGROpeningTgt_pct 
        annotation (Placement(transformation(origin = {-340.000000, 278.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport PostInj_Request 
        annotation (Placement(transformation(origin = {-340.000000, 247.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport DPF_regen_req 
        annotation (Placement(transformation(origin = {58.000000, 278.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport mUREA_target 
        annotation (Placement(transformation(origin = {61.000000, 233.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      SysplorerEmbeddedCoder.Port.Inport LoadTrq_Nm 
        annotation (Placement(transformation(origin = {-347.000000, -45.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
      AftertreatmentModel_type AftertreatmentModel 
        annotation (Placement(transformation(origin = {184.000000, -181.000000}, extent = {{-81.500000, -135.000000}, {81.500000, 135.000000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
      SysplorerEmbeddedCoder.Utilities.Terminator Terminator 
        annotation (Placement(transformation(origin = {-3.000000, -29.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
      SysplorerEmbeddedCoder.Utilities.Terminator Terminator1 
        annotation (Placement(transformation(origin = {-7.000000, 73.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
      ThermalModel_type ThermalModel 
        annotation (Placement(transformation(origin = {-184.000000, -45.000000}, extent = {{-77.500000, -273.000000}, {77.500000, 273.000000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
      SysplorerEmbeddedCoder.Port.Outport EngineTrq_Nm 
        annotation (Placement(transformation(origin = {-4.000000, 40.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport EngineSpd_rpm 
        annotation (Placement(transformation(origin = {-4.000000, 6.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport FuelCyle_g 
        annotation (Placement(transformation(origin = {-4.000000, 210.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport EGRRatio 
        annotation (Placement(transformation(origin = {-4.000000, 176.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport RailPrs_kpa 
        annotation (Placement(transformation(origin = {-4.000000, 142.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport 'IntakeMass_kg/h' 
        annotation (Placement(transformation(origin = {-4.000000, 108.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport ExhTemp_DOC_in 
        annotation (Placement(transformation(origin = {346.000000, -62.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport ExhTemp_DOC_out 
        annotation (Placement(transformation(origin = {346.000000, -86.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport ExhTemp_DPF_out 
        annotation (Placement(transformation(origin = {346.000000, -110.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport ExhTemp_SCR_out 
        annotation (Placement(transformation(origin = {346.000000, -133.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport ExhMassFlow 
        annotation (Placement(transformation(origin = {346.000000, -157.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport mNOx_SCR_in 
        annotation (Placement(transformation(origin = {346.000000, -181.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport mNOx_SCR_out 
        annotation (Placement(transformation(origin = {346.000000, -204.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport Soot_Load 
        annotation (Placement(transformation(origin = {346.000000, -228.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport DPF_DP 
        annotation (Placement(transformation(origin = {346.000000, -252.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport NH3_Store 
        annotation (Placement(transformation(origin = {346.000000, -276.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      SysplorerEmbeddedCoder.Port.Outport O2_frac 
        annotation (Placement(transformation(origin = {346.000000, -300.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
      block AftertreatmentModel_type "子系统
通过子系统创建模型分层结构。"

        annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left('ExhMassFlow_kg/h', EGT_c, ExhPrs_kpa, O2_pct, 'NOx_kg/h', 'HC_kg/h', 'CO_kg/h', 'PM_kg/h', mUREA_target, DPF_regen_req), Right(ExhTemp_DOC_in, ExhTemp_DOC_out, ExhTemp_DPF_out, ExhTemp_SCR_out, ExhMassFlow, mNOx_SCR_in, mNOx_SCR_out, Soot_Load, DPF_DP, NH3_Store, O2_frac)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
      grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
      rotationPolicy=RotationPolicy.Follow,
      origin={0,0},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid,
      lineThickness=3,
      frame=true,
      extent={{-300,120},{300,-120}}), Text(origin={0,-140},
      lineColor={0,0,0},
      extent={{0,-20},{0,20}},
      textString="%name",
      fontSize=14,
      textStyle={TextStyle.None},
      textColor={0,0,0},
      verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
        SysplorerEmbeddedCoder.Port.Inport 'ExhMassFlow_kg/h' 
          annotation (Placement(transformation(origin = {-495.000000, 98.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport EGT_c 
          annotation (Placement(transformation(origin = {-495.000000, 61.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport ExhPrs_kpa 
          annotation (Placement(transformation(origin = {-495.000000, 23.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport O2_pct 
          annotation (Placement(transformation(origin = {-495.000000, -14.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport 'NOx_kg/h' 
          annotation (Placement(transformation(origin = {-495.000000, -51.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport 'HC_kg/h' 
          annotation (Placement(transformation(origin = {-495.000000, -89.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport 'CO_kg/h' 
          annotation (Placement(transformation(origin = {-495.000000, -126.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport 'PM_kg/h' 
          annotation (Placement(transformation(origin = {-495.000000, -164.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport mUREA_target 
          annotation (Placement(transformation(origin = {222.000000, 170.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport DPF_regen_req 
          annotation (Placement(transformation(origin = {-77.000000, 170.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        DOC_type DOC 
          annotation (Placement(transformation(origin = {-309.000000, -32.000000}, extent = {{-71.000000, -148.500000}, {71.000000, 148.500000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
        DPF_type DPF 
          annotation (Placement(transformation(origin = {-2.000000, 13.000000}, extent = {{-78.000000, -112.000000}, {78.000000, 112.000000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
        SCR_type SCR 
          annotation (Placement(transformation(origin = {328.000000, 69.000000}, extent = {{-72.000000, -55.000000}, {72.000000, 55.000000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
        SysplorerEmbeddedCoder.Utilities.Terminator Terminator 
          annotation (Placement(transformation(origin = {442.000000, 112.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
        SysplorerEmbeddedCoder.Utilities.Terminator Terminator1 
          annotation (Placement(transformation(origin = {442.000000, 78.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
        SysplorerEmbeddedCoder.Utilities.Terminator Terminator2 
          annotation (Placement(transformation(origin = {442.000000, 44.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
        SysplorerEmbeddedCoder.Utilities.Terminator Terminator3 
          annotation (Placement(transformation(origin = {119.000000, 0.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
        SysplorerEmbeddedCoder.Utilities.Terminator Terminator4 
          annotation (Placement(transformation(origin = {119.000000, -27.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
        SysplorerEmbeddedCoder.Utilities.Terminator Terminator5 
          annotation (Placement(transformation(origin = {-193.000000, -109.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
        SysplorerEmbeddedCoder.Utilities.Terminator Terminator6 
          annotation (Placement(transformation(origin = {-193.000000, -139.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
        SysplorerEmbeddedCoder.Utilities.Terminator Terminator7 
          annotation (Placement(transformation(origin = {-193.000000, -170.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
        SysplorerEmbeddedCoder.Port.Outport ExhTemp_DOC_in 
          annotation (Placement(transformation(origin = {-427.000000, 85.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport ExhTemp_DOC_out 
          annotation (Placement(transformation(origin = {-155.000000, 91.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport ExhTemp_DPF_out 
          annotation (Placement(transformation(origin = {151.000000, 98.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport ExhTemp_SCR_out 
          annotation (Placement(transformation(origin = {491.000000, 95.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport ExhMassFlow 
          annotation (Placement(transformation(origin = {-427.000000, 119.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport mNOx_SCR_in 
          annotation (Placement(transformation(origin = {151.000000, 44.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport mNOx_SCR_out 
          annotation (Placement(transformation(origin = {494.000000, 61.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport Soot_Load 
          annotation (Placement(transformation(origin = {151.000000, -55.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport DPF_DP 
          annotation (Placement(transformation(origin = {151.000000, -82.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport NH3_Store 
          annotation (Placement(transformation(origin = {494.000000, 27.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport O2_frac 
          annotation (Placement(transformation(origin = {-427.000000, 6.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        block DOC_type "子系统
通过子系统创建模型分层结构。"

          annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left('ExhMassFlow_kg/h', EGT_c, ExhPrs_kpa, O2_pct, 'NOx_kg/h', 'HC_kg/h', 'CO_kg/h', 'PM_kg/h'), Right('DOC_Flow_kg/h', DOC_Temp_c, DOC_NO2Frac, 'DOC_PM_kg/h', 'DOC_NO2_kg/h', 'DOC_NO_kg/h', DOC_Prs_kpa, DOC_dPrs_kpa, 'DOC_HC_kg/h', 'DOC_CO_kg/h')),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
        grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
        rotationPolicy=RotationPolicy.Follow,
        origin={0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        lineThickness=3,
        frame=true,
        extent={{-300,120},{300,-120}}), Text(origin={0,-140},
        lineColor={0,0,0},
        extent={{0,-20},{0,20}},
        textString="%name",
        fontSize=14,
        textStyle={TextStyle.None},
        textColor={0,0,0},
        verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
          SysplorerEmbeddedCoder.Port.Inport 'ExhMassFlow_kg/h' 
            annotation (Placement(transformation(origin = {-459.000000, 184.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport EGT_c 
            annotation (Placement(transformation(origin = {-326.000000, 157.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport ExhPrs_kpa 
            annotation (Placement(transformation(origin = {-255.000000, 130.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport O2_pct 
            annotation (Placement(transformation(origin = {-459.000000, 96.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport 'NOx_kg/h' 
            annotation (Placement(transformation(origin = {285.000000, -132.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport 'HC_kg/h' 
            annotation (Placement(transformation(origin = {285.000000, 51.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport 'CO_kg/h' 
            annotation (Placement(transformation(origin = {285.000000, 130.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport 'PM_kg/h' 
            annotation (Placement(transformation(origin = {-473.000000, 38.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.MathOperation.Sum Add(inputs="+-",isSaturate=false) 
            annotation (Placement(transformation(origin = {227.000000, 99.000000}, extent = {{-3.000000, -26.500000}, {3.000000, 26.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="-",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Sum Add1(inputs="+-",isSaturate=false) 
            annotation (Placement(transformation(origin = {227.000000, 21.000000}, extent = {{-3.000000, -26.500000}, {3.000000, 26.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="-",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Sum Add2(inputs="+-",isSaturate=false) 
            annotation (Placement(transformation(origin = {234.000000, -207.000000}, extent = {{-3.000000, -26.500000}, {3.000000, 26.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="-",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Sum Add3(inputs="+++",isSaturate=false) 
            annotation (Placement(transformation(origin = {261.000000, -285.000000}, extent = {{-3.000000, -43.500000}, {3.000000, 43.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2,u3),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="+",instance="u2"),label(text="+",instance="u3")))));
          SysplorerEmbeddedCoder.MathOperation.Sum Add4(inputs="+-",isSaturate=false) 
            annotation (Placement(transformation(origin = {-68.000000, 267.000000}, extent = {{-3.000000, -26.500000}, {3.000000, 26.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="-",instance="u2")))));
          SysplorerEmbeddedCoder.Sources.Constant Constant(k=1) 
            annotation (Placement(transformation(origin = {183.000000, 113.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
          SysplorerEmbeddedCoder.Sources.Constant Constant1(k=1) 
            annotation (Placement(transformation(origin = {183.000000, 34.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
          SysplorerEmbeddedCoder.Sources.Constant Constant2(k=1) 
            annotation (Placement(transformation(origin = {203.000000, -193.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
          SysplorerEmbeddedCoder.LookupTable.LookupTable1D DOCdPrs(table=DOCdPrs,axis1=DOCdPrs_x,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable1D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable1D.ExtrapolationMethod.clip,indexSearchMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable1D.IndexSearchMethod.binarySearch) 
            annotation (Placement(transformation(origin = {-138.000000, 234.000000}, extent = {{-22.000000, -21.500000}, {22.000000, 21.500000}},rotation=0)));
          GHSV_type GHSV 
            annotation (Placement(transformation(origin = {-92.000000, 157.000000}, extent = {{-68.000000, -40.500000}, {68.000000, 40.500000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
          SysplorerEmbeddedCoder.MathOperation.Gain Gain(k=20,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
            annotation (Placement(transformation(origin = {224.000000, -258.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
          SysplorerEmbeddedCoder.MathOperation.Gain Gain1(k=25,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
            annotation (Placement(transformation(origin = {224.000000, -285.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
          SysplorerEmbeddedCoder.MathOperation.Product Product(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {400.000000, 115.000000}, extent = {{-3.000000, -29.500000}, {3.000000, 29.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Product Product1(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {400.000000, 37.000000}, extent = {{-3.000000, -29.500000}, {3.000000, 29.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Product Product2(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {400.000000, -116.000000}, extent = {{-3.000000, -29.500000}, {3.000000, 29.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Product Product3(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {400.000000, -191.000000}, extent = {{-3.000000, -29.500000}, {3.000000, 29.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.Utilities.Terminator Terminator 
            annotation (Placement(transformation(origin = {-360.000000, 96.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D eta_CO(table=etaCO,axis1=etaCO_x,axis2=etaCO_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {93.000000, 86.000000}, extent = {{-22.000000, -21.500000}, {22.000000, 21.500000}},rotation=0)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D eta_HC(table=etaHC,axis1=etaHC_x,axis2=etaHC_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {93.000000, 8.000000}, extent = {{-22.000000, -21.500000}, {22.000000, 21.500000}},rotation=0)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D eta_NO2(table=etaNO2,axis1=etaNO2_x,axis2=etaNO2_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {93.000000, -70.000000}, extent = {{-22.000000, -21.500000}, {22.000000, 21.500000}},rotation=0)));
          SysplorerEmbeddedCoder.Port.Outport 'DOC_Flow_kg/h' 
            annotation (Placement(transformation(origin = {156.000000, 312.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport DOC_Temp_c 
            annotation (Placement(transformation(origin = {462.000000, -285.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport DOC_NO2Frac 
            annotation (Placement(transformation(origin = {458.000000, -71.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'DOC_PM_kg/h' 
            annotation (Placement(transformation(origin = {-377.000000, 38.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'DOC_NO2_kg/h' 
            annotation (Placement(transformation(origin = {462.000000, -119.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'DOC_NO_kg/h' 
            annotation (Placement(transformation(origin = {462.000000, -193.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport DOC_Prs_kpa 
            annotation (Placement(transformation(origin = {156.000000, 268.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport DOC_dPrs_kpa 
            annotation (Placement(transformation(origin = {156.000000, 234.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'DOC_HC_kg/h' 
            annotation (Placement(transformation(origin = {472.000000, 34.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'DOC_CO_kg/h' 
            annotation (Placement(transformation(origin = {472.000000, 113.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          block GHSV_type "子系统
通过子系统创建模型分层结构。"

            annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left('ExhMassFlow_kg/h', EGT_c, ExhPrs_kpa), Right('GHSV_1/h')),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
          grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
          rotationPolicy=RotationPolicy.Follow,
          origin={0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=3,
          frame=true,
          extent={{-300,120},{300,-120}}), Text(origin={0,-140},
          lineColor={0,0,0},
          extent={{0,-20},{0,20}},
          textString="%name",
          fontSize=14,
          textStyle={TextStyle.None},
          textColor={0,0,0},
          verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
            SysplorerEmbeddedCoder.Port.Inport 'ExhMassFlow_kg/h' 
              annotation (Placement(transformation(origin = {-206.000000, 92.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
            SysplorerEmbeddedCoder.Port.Inport EGT_c 
              annotation (Placement(transformation(origin = {-196.000000, 18.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
            SysplorerEmbeddedCoder.Port.Inport ExhPrs_kpa 
              annotation (Placement(transformation(origin = {-206.000000, -53.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
            SysplorerEmbeddedCoder.MathOperation.Sum Add(inputs="++",isSaturate=false) 
              annotation (Placement(transformation(origin = {-125.000000, 4.000000}, extent = {{-3.000000, -30.500000}, {3.000000, 30.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="+",instance="u2")))));
            SysplorerEmbeddedCoder.Sources.Constant Constant(k=Rexh) 
              annotation (Placement(transformation(origin = {-205.000000, 63.000000}, extent = {{-30.500000, -6.500000}, {30.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
            SysplorerEmbeddedCoder.Sources.Constant Constant1(k=273) 
              annotation (Placement(transformation(origin = {-205.000000, -12.000000}, extent = {{-30.500000, -6.500000}, {30.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
            SysplorerEmbeddedCoder.Sources.Constant Constant2(k=Vcat_DOC) 
              annotation (Placement(transformation(origin = {-205.000000, -93.000000}, extent = {{-30.500000, -6.500000}, {30.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
            SysplorerEmbeddedCoder.MathOperation.Product Divide(inputs="*/",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
              annotation (Placement(transformation(origin = {-13.000000, 43.000000}, extent = {{-3.000000, -32.500000}, {3.000000, 32.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="/",instance="u2")))));
            SysplorerEmbeddedCoder.MathOperation.Product Divide1(inputs="*/",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
              annotation (Placement(transformation(origin = {58.000000, 26.000000}, extent = {{-3.000000, -32.500000}, {3.000000, 32.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="/",instance="u2")))));
            SysplorerEmbeddedCoder.MathOperation.Gain Gain(k=0.001,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
              annotation (Placement(transformation(origin = {121.000000, 25.000000}, extent = {{-25.500000, -10.000000}, {25.500000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
            SysplorerEmbeddedCoder.MathOperation.Product Product(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
              annotation (Placement(transformation(origin = {-125.000000, 77.000000}, extent = {{-3.000000, -29.500000}, {3.000000, 29.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
            SysplorerEmbeddedCoder.MathOperation.Product Product1(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
              annotation (Placement(transformation(origin = {-71.000000, 61.000000}, extent = {{-3.000000, -29.500000}, {3.000000, 29.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
            SysplorerEmbeddedCoder.Port.Outport 'GHSV_1/h' 
              annotation (Placement(transformation(origin = {205.000000, 25.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          equation
            connect('ExhMassFlow_kg/h', Product.u1) 
            annotation(Line(origin={0,0},
            points={{-206,92},{-133,92}}));
            connect(Constant.y, Product.u2) 
            annotation(Line(origin={0,0},
            points={{-170,63},{-133,63}}));
            connect(Product.y, Product1.u1) 
            annotation(Line(origin={0,0},
            points={{-117,77},{-117,76},{-79,76}}));
            connect(Add.y, Product1.u2) 
            annotation(Line(origin={0,0},
            points={{-117,4},{-97,4},{-97,48},{-97,47},{-79,47}}));
            connect(EGT_c, Add.u1) 
            annotation(Line(origin={0,0},
            points={{-196,18},{-196,19},{-133,19}}));
            connect(Constant1.y, Add.u2) 
            annotation(Line(origin={0,0},
            points={{-170,-12},{-170,-11},{-133,-11}}));
            connect(Product1.y, Divide.u1) 
            annotation(Line(origin={0,0},
            points={{-63,61},{-63,59},{-21,59}}));
            connect(ExhPrs_kpa, Divide.u2) 
            annotation(Line(origin={0,0},
            points={{-206,-53},{-49,-53},{-49,25},{-49,27},{-21,27}}));
            connect(Divide.y, Divide1.u1) 
            annotation(Line(origin={0,0},
            points={{-5,43},{-5,42},{50,42}}));
            connect(Constant2.y, Divide1.u2) 
            annotation(Line(origin={0,0},
            points={{-170,-93},{25,-93},{25,9},{25,10},{50,10}}));
            connect(Divide1.y, Gain.u) 
            annotation(Line(origin={0,0},
            points={{66,26},{66,25},{91,25}}));
            connect(Gain.y, 'GHSV_1/h') 
            annotation(Line(origin={0,0},
            points={{151,25},{205,25}}));
            end GHSV_type;
        equation
          connect('PM_kg/h', 'DOC_PM_kg/h') 
          annotation(Line(origin={0,0},
          points={{-473,38},{-377,38}}));
          connect(ExhPrs_kpa, DOCdPrs.u) 
          annotation(Line(origin={0,0},
          points={{-255,130},{-234,130},{-234,235},{-234,233},{-165,233}}));
          connect(ExhPrs_kpa, Add4.u1) 
          annotation(Line(origin={0,0},
          points={{-255,130},{-234,130},{-234,235},{-234,282},{-234,280},{-76,280}}));
          connect(ExhPrs_kpa, GHSV.ExhPrs_kpa) 
          annotation(Line(origin={0,0},
          points={{-255,130},{-234,130},{-165,130}}));
          connect(EGT_c, Add3.u3) 
          annotation(Line(origin={0,0},
          points={{-326,157},{-314,157},{-314,76},{-314,-2},{-314,-80},{-314,-80},{-314,-311},{-314,-314},{253,-314}}));
          connect(EGT_c, eta_NO2.u2) 
          annotation(Line(origin={0,0},
          points={{-326,157},{-314,157},{-314,76},{-314,-2},{-314,-80},{-314,-80},{66,-80}}));
          connect(EGT_c, eta_HC.u2) 
          annotation(Line(origin={0,0},
          points={{-326,157},{-314,157},{-314,76},{-314,-2},{66,-2}}));
          connect(EGT_c, eta_CO.u2) 
          annotation(Line(origin={0,0},
          points={{-326,157},{-314,157},{-314,76},{66,76}}));
          connect(EGT_c, GHSV.EGT_c) 
          annotation(Line(origin={0,0},
          points={{-326,157},{-314,157},{-165,157}}));
          connect('ExhMassFlow_kg/h', GHSV.'ExhMassFlow_kg/h') 
          annotation(Line(origin={0,0},
          points={{-459,184},{-420,184},{-165,184}}));
          connect('ExhMassFlow_kg/h', 'DOC_Flow_kg/h') 
          annotation(Line(origin={0,0},
          points={{-459,184},{-420,184},{-420,313},{-420,312},{156,312}}));
          connect(GHSV.'GHSV_1/h', eta_NO2.u1) 
          annotation(Line(origin={0,0},
          points={{-19,157},{32,157},{32,96},{32,18},{32,-60},{32,-59},{66,-59}}));
          connect(GHSV.'GHSV_1/h', eta_HC.u1) 
          annotation(Line(origin={0,0},
          points={{-19,157},{32,157},{32,96},{32,18},{32,19},{66,19}}));
          connect(GHSV.'GHSV_1/h', eta_CO.u1) 
          annotation(Line(origin={0,0},
          points={{-19,157},{32,157},{32,96},{32,97},{66,97}}));
          connect(eta_CO.y, Gain.u) 
          annotation(Line(origin={0,0},
          points={{120,86},{137,86},{137,-257},{137,-258},{209,-258}}));
          connect(eta_CO.y, Add.u2) 
          annotation(Line(origin={0,0},
          points={{120,86},{137,86},{219,86}}));
          connect(Constant.y, Add.u1) 
          annotation(Line(origin={0,0},
          points={{198,113},{198,112},{219,112}}));
          connect(Add.y, Product.u2) 
          annotation(Line(origin={0,0},
          points={{235,99},{235,101},{392,101}}));
          connect('CO_kg/h', Product.u1) 
          annotation(Line(origin={0,0},
          points={{285,130},{392,130}}));
          connect(Product.y, 'DOC_CO_kg/h') 
          annotation(Line(origin={0,0},
          points={{408,115},{408,113},{472,113}}));
          connect(Product1.y, 'DOC_HC_kg/h') 
          annotation(Line(origin={0,0},
          points={{408,37},{408,34},{472,34}}));
          connect(Add1.y, Product1.u2) 
          annotation(Line(origin={0,0},
          points={{235,21},{235,23},{392,23}}));
          connect(Constant1.y, Add1.u1) 
          annotation(Line(origin={0,0},
          points={{198,34},{219,34}}));
          connect(eta_HC.y, Gain1.u) 
          annotation(Line(origin={0,0},
          points={{120,8},{127,8},{127,-284},{127,-285},{209,-285}}));
          connect(eta_HC.y, Add1.u2) 
          annotation(Line(origin={0,0},
          points={{120,8},{127,8},{219,8}}));
          connect('HC_kg/h', Product1.u1) 
          annotation(Line(origin={0,0},
          points={{285,51},{285,52},{392,52}}));
          connect('NOx_kg/h', Product3.u1) 
          annotation(Line(origin={0,0},
          points={{285,-132},{355,-132},{355,-176},{392,-176}}));
          connect('NOx_kg/h', Product2.u2) 
          annotation(Line(origin={0,0},
          points={{285,-132},{355,-132},{355,-130},{392,-130}}));
          connect(Product2.y, 'DOC_NO2_kg/h') 
          annotation(Line(origin={0,0},
          points={{408,-116},{408,-119},{462,-119}}));
          connect(Product3.y, 'DOC_NO_kg/h') 
          annotation(Line(origin={0,0},
          points={{408,-191},{408,-193},{462,-193}}));
          connect(eta_NO2.y, DOC_NO2Frac) 
          annotation(Line(origin={0,0},
          points={{120,-70},{173,-70},{173,-71},{458,-71}}));
          connect(eta_NO2.y, Product2.u1) 
          annotation(Line(origin={0,0},
          points={{120,-70},{173,-70},{173,-100},{173,-101},{392,-101}}));
          connect(eta_NO2.y, Add2.u2) 
          annotation(Line(origin={0,0},
          points={{120,-70},{173,-70},{173,-100},{173,-219},{173,-220},{226,-220}}));
          connect(Constant2.y, Add2.u1) 
          annotation(Line(origin={0,0},
          points={{218,-193},{218,-194},{226,-194}}));
          connect(Add2.y, Product3.u2) 
          annotation(Line(origin={0,0},
          points={{242,-207},{242,-205},{392,-205}}));
          connect(O2_pct, Terminator.x) 
          annotation(Line(origin={0,0},
          points={{-459,96},{-371,96}}));
          connect(DOCdPrs.y, Add4.u2) 
          annotation(Line(origin={0,0},
          points={{-111,233},{-90,233},{-90,253},{-90,254},{-76,254}}));
          connect(DOCdPrs.y, DOC_dPrs_kpa) 
          annotation(Line(origin={0,0},
          points={{-111,233},{-90,233},{-90,234},{156,234}}));
          connect(Gain.y, Add3.u1) 
          annotation(Line(origin={0,0},
          points={{239,-258},{239,-256},{253,-256}}));
          connect(Gain1.y, Add3.u2) 
          annotation(Line(origin={0,0},
          points={{239,-285},{253,-285}}));
          connect(Add3.y, DOC_Temp_c) 
          annotation(Line(origin={0,0},
          points={{269,-285},{462,-285}}));
          connect(Add4.y, DOC_Prs_kpa) 
          annotation(Line(origin={0,0},
          points={{-60,266},{-60,268},{156,268}}));
          end DOC_type;
        block DPF_type "子系统
通过子系统创建模型分层结构。"

          annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left('DOC_Flow_kg/h', DOC_Temp_c, DOC_NO2Frac, 'DOC_PM_kg/h', 'DOC_NO2_kg/h', 'DOC_NO_kg/h', DOC_Prs_kpa, DPF_regen_req), Right('DPF_Flow_kg/h', DPF_Temp_c, DPF_Prs_kpa, 'DPF_NOx_kg/h', DPF_NO2Frac, 'DPF_PM_kg/h', DPF_SootLoad_g, DPF_dPrs_kpa)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
        grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
        rotationPolicy=RotationPolicy.Follow,
        origin={0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        lineThickness=3,
        frame=true,
        extent={{-300,120},{300,-120}}), Text(origin={0,-140},
        lineColor={0,0,0},
        extent={{0,-20},{0,20}},
        textString="%name",
        fontSize=14,
        textStyle={TextStyle.None},
        textColor={0,0,0},
        verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
          SysplorerEmbeddedCoder.Port.Inport 'DOC_Flow_kg/h' 
            annotation (Placement(transformation(origin = {-486.000000, 217.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport DOC_Temp_c 
            annotation (Placement(transformation(origin = {-476.000000, 67.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport DOC_NO2Frac 
            annotation (Placement(transformation(origin = {-465.000000, -157.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport 'DOC_PM_kg/h' 
            annotation (Placement(transformation(origin = {40.000000, -21.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport 'DOC_NO2_kg/h' 
            annotation (Placement(transformation(origin = {-469.000000, -191.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport 'DOC_NO_kg/h' 
            annotation (Placement(transformation(origin = {-469.000000, -218.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport DOC_Prs_kpa 
            annotation (Placement(transformation(origin = {-397.000000, 40.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport DPF_regen_req 
            annotation (Placement(transformation(origin = {20.000000, 169.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.MathOperation.Sum Add(inputs="+-",isSaturate=false) 
            annotation (Placement(transformation(origin = {3.000000, 10.000000}, extent = {{-3.000000, -26.500000}, {3.000000, 26.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="-",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Sum Add1(inputs="++",isSaturate=false) 
            annotation (Placement(transformation(origin = {-411.000000, -204.000000}, extent = {{-3.000000, -28.500000}, {3.000000, 28.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="+",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Sum Add4(inputs="-+",isSaturate=false) 
            annotation (Placement(transformation(origin = {431.000000, 132.000000}, extent = {{-3.000000, -26.500000}, {3.000000, 26.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="-",instance="u1"),label(text="+",instance="u2")))));
          SysplorerEmbeddedCoder.Sources.Constant Constant(k=1) 
            annotation (Placement(transformation(origin = {-41.000000, 23.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D DPFdPrs(table=DPFdPrs,axis1=DPFdPrs_x,axis2=DPFdPrs_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {311.000000, 180.000000}, extent = {{-22.000000, -21.500000}, {22.000000, 21.500000}},rotation=0)));
          GHSV_type GHSV 
            annotation (Placement(transformation(origin = {-262.000000, 68.000000}, extent = {{-68.000000, -40.500000}, {68.000000, 40.500000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
          SysplorerEmbeddedCoder.MathOperation.Product Product(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {98.000000, -5.000000}, extent = {{-3.000000, -29.500000}, {3.000000, 29.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SootLoad_type SootLoad 
            annotation (Placement(transformation(origin = {154.000000, 129.000000}, extent = {{-73.000000, -48.000000}, {73.000000, 48.000000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D eta_PM(table=etaPM,axis1=etaPM_x,axis2=etaPM_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-104.000000, -4.000000}, extent = {{-22.000000, -21.500000}, {22.000000, 21.500000}},rotation=0)));
          SysplorerEmbeddedCoder.Port.Outport 'DPF_Flow_kg/h' 
            annotation (Placement(transformation(origin = {486.000000, 217.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport DPF_Temp_c 
            annotation (Placement(transformation(origin = {-344.000000, -99.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport DPF_Prs_kpa 
            annotation (Placement(transformation(origin = {486.000000, 132.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'DPF_NOx_kg/h' 
            annotation (Placement(transformation(origin = {-344.000000, -205.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport DPF_NO2Frac 
            annotation (Placement(transformation(origin = {-344.000000, -157.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'DPF_PM_kg/h' 
            annotation (Placement(transformation(origin = {183.000000, -8.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport DPF_SootLoad_g 
            annotation (Placement(transformation(origin = {299.000000, 128.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport DPF_dPrs_kpa 
            annotation (Placement(transformation(origin = {486.000000, 179.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          block GHSV_type "子系统
通过子系统创建模型分层结构。"

            annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left('ExhMassFlow_kg/h', EGT_c, ExhPrs_kpa), Right('GHSV_1/h')),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
          grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
          rotationPolicy=RotationPolicy.Follow,
          origin={0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=3,
          frame=true,
          extent={{-300,120},{300,-120}}), Text(origin={0,-140},
          lineColor={0,0,0},
          extent={{0,-20},{0,20}},
          textString="%name",
          fontSize=14,
          textStyle={TextStyle.None},
          textColor={0,0,0},
          verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
            SysplorerEmbeddedCoder.Port.Inport 'ExhMassFlow_kg/h' 
              annotation (Placement(transformation(origin = {-206.000000, 92.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
            SysplorerEmbeddedCoder.Port.Inport EGT_c 
              annotation (Placement(transformation(origin = {-196.000000, 18.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
            SysplorerEmbeddedCoder.Port.Inport ExhPrs_kpa 
              annotation (Placement(transformation(origin = {-206.000000, -53.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
            SysplorerEmbeddedCoder.MathOperation.Sum Add(inputs="++",isSaturate=false) 
              annotation (Placement(transformation(origin = {-125.000000, 4.000000}, extent = {{-3.000000, -30.500000}, {3.000000, 30.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="+",instance="u2")))));
            SysplorerEmbeddedCoder.Sources.Constant Constant(k=Rexh) 
              annotation (Placement(transformation(origin = {-205.000000, 63.000000}, extent = {{-30.500000, -6.500000}, {30.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
            SysplorerEmbeddedCoder.Sources.Constant Constant1(k=273) 
              annotation (Placement(transformation(origin = {-205.000000, -12.000000}, extent = {{-30.500000, -6.500000}, {30.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
            SysplorerEmbeddedCoder.Sources.Constant Constant2(k=Vcat_DPF) 
              annotation (Placement(transformation(origin = {-205.000000, -93.000000}, extent = {{-30.500000, -6.500000}, {30.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
            SysplorerEmbeddedCoder.MathOperation.Product Divide(inputs="*/",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
              annotation (Placement(transformation(origin = {-13.000000, 43.000000}, extent = {{-3.000000, -32.500000}, {3.000000, 32.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="/",instance="u2")))));
            SysplorerEmbeddedCoder.MathOperation.Product Divide1(inputs="*/",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
              annotation (Placement(transformation(origin = {58.000000, 26.000000}, extent = {{-3.000000, -32.500000}, {3.000000, 32.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="/",instance="u2")))));
            SysplorerEmbeddedCoder.MathOperation.Gain Gain(k=0.001,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
              annotation (Placement(transformation(origin = {121.000000, 25.000000}, extent = {{-25.500000, -10.000000}, {25.500000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
            SysplorerEmbeddedCoder.MathOperation.Product Product(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
              annotation (Placement(transformation(origin = {-125.000000, 77.000000}, extent = {{-3.000000, -29.500000}, {3.000000, 29.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
            SysplorerEmbeddedCoder.MathOperation.Product Product1(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
              annotation (Placement(transformation(origin = {-71.000000, 61.000000}, extent = {{-3.000000, -29.500000}, {3.000000, 29.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
            SysplorerEmbeddedCoder.Port.Outport 'GHSV_1/h' 
              annotation (Placement(transformation(origin = {205.000000, 25.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          equation
            connect('ExhMassFlow_kg/h', Product.u1) 
            annotation(Line(origin={0,0},
            points={{-206,92},{-133,92}}));
            connect(Constant.y, Product.u2) 
            annotation(Line(origin={0,0},
            points={{-170,63},{-133,63}}));
            connect(Product.y, Product1.u1) 
            annotation(Line(origin={0,0},
            points={{-117,77},{-117,76},{-79,76}}));
            connect(Add.y, Product1.u2) 
            annotation(Line(origin={0,0},
            points={{-117,4},{-97,4},{-97,48},{-97,47},{-79,47}}));
            connect(EGT_c, Add.u1) 
            annotation(Line(origin={0,0},
            points={{-196,18},{-196,19},{-133,19}}));
            connect(Constant1.y, Add.u2) 
            annotation(Line(origin={0,0},
            points={{-170,-12},{-170,-11},{-133,-11}}));
            connect(Product1.y, Divide.u1) 
            annotation(Line(origin={0,0},
            points={{-63,61},{-63,59},{-21,59}}));
            connect(ExhPrs_kpa, Divide.u2) 
            annotation(Line(origin={0,0},
            points={{-206,-53},{-49,-53},{-49,25},{-49,27},{-21,27}}));
            connect(Divide.y, Divide1.u1) 
            annotation(Line(origin={0,0},
            points={{-5,43},{-5,42},{50,42}}));
            connect(Constant2.y, Divide1.u2) 
            annotation(Line(origin={0,0},
            points={{-170,-93},{25,-93},{25,9},{25,10},{50,10}}));
            connect(Divide1.y, Gain.u) 
            annotation(Line(origin={0,0},
            points={{66,26},{66,25},{91,25}}));
            connect(Gain.y, 'GHSV_1/h') 
            annotation(Line(origin={0,0},
            points={{151,25},{205,25}}));
            end GHSV_type;
          block SootLoad_type "子系统
通过子系统创建模型分层结构。"

            annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left(DPF_regen_req, 'DOC_Flow_kg/h', DOC_Temp_c, eta_PM, 'DOC_PM_kg/h'), Right(SootLoad_g)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
          grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
          rotationPolicy=RotationPolicy.Follow,
          origin={0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=3,
          frame=true,
          extent={{-300,120},{300,-120}}), Text(origin={0,-140},
          lineColor={0,0,0},
          extent={{0,-20},{0,20}},
          textString="%name",
          fontSize=14,
          textStyle={TextStyle.None},
          textColor={0,0,0},
          verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
            SysplorerEmbeddedCoder.Port.Inport DPF_regen_req 
              annotation (Placement(transformation(origin = {-70.000000, 30.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
            SysplorerEmbeddedCoder.Port.Inport 'DOC_Flow_kg/h' 
              annotation (Placement(transformation(origin = {-203.000000, 61.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
            SysplorerEmbeddedCoder.Port.Inport DOC_Temp_c 
              annotation (Placement(transformation(origin = {-203.000000, 41.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
            SysplorerEmbeddedCoder.Port.Inport eta_PM 
              annotation (Placement(transformation(origin = {-203.000000, -30.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
            SysplorerEmbeddedCoder.Port.Inport 'DOC_PM_kg/h' 
              annotation (Placement(transformation(origin = {-203.000000, -61.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
            SysplorerEmbeddedCoder.MathOperation.Sum Add1(inputs="-+",isSaturate=false) 
              annotation (Placement(transformation(origin = {83.000000, -33.000000}, extent = {{-3.000000, -26.500000}, {3.000000, 26.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="-",instance="u1"),label(text="+",instance="u2")))));
            SysplorerEmbeddedCoder.Sources.Constant Constant(k=0) 
              annotation (Placement(transformation(origin = {-26.000000, 11.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
            SysplorerEmbeddedCoder.Continuous.Integrator Integrator(externalResetType=SysplorerEmbeddedCoder.Continuous.Integrator.ExternalResetType.None,initCond=0,initCondSourceType=SysplorerEmbeddedCoder.Continuous.Integrator.InitCondSourceType.Internal,zeroCross=true,limitOutput=true,upperSaturationLimit=40,lowerSaturationLimit=0,wrapState=false,showSaturationPort=false,showStatePort=false) 
              annotation (Placement(transformation(origin = {138.000000, -34.000000}, extent = {{-11.500000, -17.000000}, {11.500000, 17.000000}},rotation=0)),__MWORKS(BlockSystem(zeroCross=true)));
            SysplorerEmbeddedCoder.MathOperation.Product Product1(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
              annotation (Placement(transformation(origin = {-91.000000, -45.000000}, extent = {{-3.000000, -29.500000}, {3.000000, 29.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
            SysplorerEmbeddedCoder.LookupTable.LookupTable2D SootBurn_Map(table=DPFSootBurn,axis1=DPFSootBurn_x,axis2=DPFSootBurn_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
              annotation (Placement(transformation(origin = {-123.000000, 50.000000}, extent = {{-22.000000, -21.500000}, {22.000000, 21.500000}},rotation=0)));
            SysplorerEmbeddedCoder.SignalRouting.Switch Switch(threshold=0,zeroCross=true,ct=SysplorerEmbeddedCoder.SignalRouting.Switch.ConditionType.Great,hasDiffSize=false) 
              annotation (Placement(transformation(origin = {28.000000, 31.000000}, extent = {{-10.000000, -32.500000}, {10.000000, 32.500000}},rotation=0)),__MWORKS(BlockSystem(zeroCross=true,Instance(y(Type(inherit=InheritType.internalRule))))));
            SysplorerEmbeddedCoder.MathOperation.Gain kg2g(k=1000,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
              annotation (Placement(transformation(origin = {-54.000000, -47.000000}, extent = {{-13.500000, -12.000000}, {13.500000, 12.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
            SysplorerEmbeddedCoder.Port.Outport SootLoad_g 
              annotation (Placement(transformation(origin = {202.000000, -33.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          equation
            connect(DPF_regen_req, Switch.u2) 
            annotation(Line(origin={0,0},
            points={{-70,30},{-70,32},{13,32}}));
            connect(Integrator.y, SootLoad_g) 
            annotation(Line(origin={0,0},
            points={{154,-34},{154,-33},{202,-33}}));
            connect(Product1.y, kg2g.u) 
            annotation(Line(origin={0,0},
            points={{-83,-45},{-83,-47},{-72,-47}}));
            connect('DOC_PM_kg/h', Product1.u2) 
            annotation(Line(origin={0,0},
            points={{-203,-61},{-203,-59},{-99,-59}}));
            connect(eta_PM, Product1.u1) 
            annotation(Line(origin={0,0},
            points={{-203,-30},{-99,-30}}));
            connect('DOC_Flow_kg/h', SootBurn_Map.u1) 
            annotation(Line(origin={0,0},
            points={{-203,61},{-203,60},{-150,60}}));
            connect(DOC_Temp_c, SootBurn_Map.u2) 
            annotation(Line(origin={0,0},
            points={{-203,41},{-203,39},{-150,39}}));
            connect(SootBurn_Map.y, Switch.u1) 
            annotation(Line(origin={0,0},
            points={{-96,49},{-96,52},{13,52}}));
            connect(Constant.y, Switch.u3) 
            annotation(Line(origin={0,0},
            points={{-11,11},{13,11}}));
            connect(kg2g.y, Add1.u2) 
            annotation(Line(origin={0,0},
            points={{-36,-47},{-36,-46},{75,-46}}));
            connect(Switch.y, Add1.u1) 
            annotation(Line(origin={0,0},
            points={{43,31},{60,31},{60,-20},{75,-20}}));
            connect(Add1.y, Integrator.u1) 
            annotation(Line(origin={0,0},
            points={{91,-33},{91,-34},{122,-34}}));
            end SootLoad_type;
        equation
          connect(DOC_NO2Frac, DPF_NO2Frac) 
          annotation(Line(origin={0,0},
          points={{-465,-157},{-344,-157}}));
          connect('DOC_Flow_kg/h', DPFdPrs.u1) 
          annotation(Line(origin={0,0},
          points={{-486,217},{-457,217},{239,217},{239,190},{239,191},{284,191}}));
          connect('DOC_Flow_kg/h', 'DPF_Flow_kg/h') 
          annotation(Line(origin={0,0},
          points={{-486,217},{-457,217},{239,217},{486,217}}));
          connect('DOC_Flow_kg/h', GHSV.'ExhMassFlow_kg/h') 
          annotation(Line(origin={0,0},
          points={{-486,217},{-457,217},{-457,149},{-457,95},{-335,95}}));
          connect('DOC_Flow_kg/h', SootLoad.'DOC_Flow_kg/h') 
          annotation(Line(origin={0,0},
          points={{-486,217},{-457,217},{-457,149},{76,149}}));
          connect(DOC_Temp_c, GHSV.EGT_c) 
          annotation(Line(origin={0,0},
          points={{-476,67},{-444,67},{-444,68},{-335,68}}));
          connect(DOC_Temp_c, SootLoad.DOC_Temp_c) 
          annotation(Line(origin={0,0},
          points={{-476,67},{-444,67},{-444,128},{-444,130},{76,130}}));
          connect(DOC_Temp_c, DPF_Temp_c) 
          annotation(Line(origin={0,0},
          points={{-476,67},{-444,67},{-444,-14},{-444,-99},{-344,-99}}));
          connect(DOC_Temp_c, eta_PM.u2) 
          annotation(Line(origin={0,0},
          points={{-476,67},{-444,67},{-444,-14},{-131,-14}}));
          connect(DOC_Prs_kpa, Add4.u2) 
          annotation(Line(origin={0,0},
          points={{-397,40},{-372,40},{-372,-67},{391,-67},{391,118},{391,119},{423,119}}));
          connect(DOC_Prs_kpa, GHSV.ExhPrs_kpa) 
          annotation(Line(origin={0,0},
          points={{-397,40},{-372,40},{-372,41},{-335,41}}));
          connect(GHSV.'GHSV_1/h', eta_PM.u1) 
          annotation(Line(origin={0,0},
          points={{-189,68},{-157,68},{-157,7},{-131,7}}));
          connect(Product.y, 'DPF_PM_kg/h') 
          annotation(Line(origin={0,0},
          points={{106,-5},{106,-8},{183,-8}}));
          connect(Constant.y, Add.u1) 
          annotation(Line(origin={0,0},
          points={{-26,23},{-5,23}}));
          connect(eta_PM.y, SootLoad.eta_PM) 
          annotation(Line(origin={0,0},
          points={{-77,-4},{-67,-4},{-67,108},{-67,111},{76,111}}));
          connect(eta_PM.y, Add.u2) 
          annotation(Line(origin={0,0},
          points={{-77,-4},{-67,-4},{-67,-3},{-5,-3}}));
          connect(Add.y, Product.u1) 
          annotation(Line(origin={0,0},
          points={{11,10},{90,10}}));
          connect('DOC_PM_kg/h', SootLoad.'DOC_PM_kg/h') 
          annotation(Line(origin={0,0},
          points={{40,-21},{55,-21},{55,87},{55,92},{76,92}}));
          connect('DOC_PM_kg/h', Product.u2) 
          annotation(Line(origin={0,0},
          points={{40,-21},{55,-21},{55,-19},{90,-19}}));
          connect(DPF_regen_req, SootLoad.DPF_regen_req) 
          annotation(Line(origin={0,0},
          points={{20,169},{20,168},{76,168}}));
          connect(SootLoad.SootLoad_g, DPFdPrs.u2) 
          annotation(Line(origin={0,0},
          points={{232,129},{254,129},{254,169},{254,170},{284,170}}));
          connect(SootLoad.SootLoad_g, DPF_SootLoad_g) 
          annotation(Line(origin={0,0},
          points={{232,129},{254,129},{254,128},{299,128}}));
          connect(DPFdPrs.y, Add4.u1) 
          annotation(Line(origin={0,0},
          points={{338,180},{381,180},{381,146},{381,145},{423,145}}));
          connect(DPFdPrs.y, DPF_dPrs_kpa) 
          annotation(Line(origin={0,0},
          points={{338,180},{381,180},{381,179},{486,179}}));
          connect(Add4.y, DPF_Prs_kpa) 
          annotation(Line(origin={0,0},
          points={{439,132},{486,132}}));
          connect('DOC_NO2_kg/h', Add1.u1) 
          annotation(Line(origin={0,0},
          points={{-469,-191},{-469,-190},{-419,-190}}));
          connect('DOC_NO_kg/h', Add1.u2) 
          annotation(Line(origin={0,0},
          points={{-469,-218},{-419,-218}}));
          connect(Add1.y, 'DPF_NOx_kg/h') 
          annotation(Line(origin={0,0},
          points={{-403,-204},{-403,-205},{-344,-205}}));
          end DPF_type;
        block SCR_type "子系统
通过子系统创建模型分层结构。"

          annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left('DPF_Flow_kg/h', DPF_Temp_c, DPF_Prs_kpa, 'DPF_NOx_kg/h', mUREA_target), Right('OUT_Flow_kg/h', OUT_Temp_c, OUT_Prs_kpa, 'OUT_NOx_kg/h', OUT_mNH3_slip, OUT_NH3store_g)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
        grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
        rotationPolicy=RotationPolicy.Follow,
        origin={0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        lineThickness=3,
        frame=true,
        extent={{-300,120},{300,-120}}), Text(origin={0,-140},
        lineColor={0,0,0},
        extent={{0,-20},{0,20}},
        textString="%name",
        fontSize=14,
        textStyle={TextStyle.None},
        textColor={0,0,0},
        verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
          SysplorerEmbeddedCoder.Port.Inport 'DPF_Flow_kg/h' 
            annotation (Placement(transformation(origin = {-507.000000, -50.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport DPF_Temp_c 
            annotation (Placement(transformation(origin = {-507.000000, -71.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport DPF_Prs_kpa 
            annotation (Placement(transformation(origin = {415.000000, 55.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport 'DPF_NOx_kg/h' 
            annotation (Placement(transformation(origin = {-507.000000, 48.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport mUREA_target 
            annotation (Placement(transformation(origin = {-514.000000, 150.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.MathOperation.Sum Add1(inputs="+--",isSaturate=false) 
            annotation (Placement(transformation(origin = {17.000000, -47.000000}, extent = {{-3.000000, -31.000000}, {3.000000, 31.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2,u3),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="-",instance="u2"),label(text="-",instance="u3")))));
          SysplorerEmbeddedCoder.MathOperation.Sum Add2(inputs="+-",isSaturate=false) 
            annotation (Placement(transformation(origin = {-143.000000, -117.000000}, extent = {{-3.000000, -25.500000}, {3.000000, 25.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="-",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Sum Add3(inputs="+-",isSaturate=false) 
            annotation (Placement(transformation(origin = {452.000000, 41.000000}, extent = {{-3.000000, -30.500000}, {3.000000, 30.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="-",instance="u2")))));
          SysplorerEmbeddedCoder.SignalRouting.From From1 
            annotation (Placement(transformation(origin = {79.000000, -19.000000}, extent = {{-35.500000, -5.000000}, {35.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="DPF_Temp_c",tagSocped="MyEngine20261109.Engine_type.Engine_type.AftertreatmentModel_type.SCR_type",tagVisibility="Local"))));
          SysplorerEmbeddedCoder.SignalRouting.From From2 
            annotation (Placement(transformation(origin = {229.000000, 35.000000}, extent = {{-35.500000, -5.000000}, {35.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="DPF_Flow",tagSocped="MyEngine20261109.Engine_type.Engine_type.AftertreatmentModel_type.SCR_type",tagVisibility="Local"))));
          SysplorerEmbeddedCoder.SignalRouting.Goto Goto 
            annotation (Placement(transformation(origin = {-400.000000, -84.000000}, extent = {{-35.500000, -5.000000}, {35.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="DPF_Temp_c",tagSocped="MyEngine20261109.Engine_type.Engine_type.AftertreatmentModel_type.SCR_type",tagVisibility="Local"))));
          SysplorerEmbeddedCoder.SignalRouting.Goto Goto1 
            annotation (Placement(transformation(origin = {-404.000000, 1.000000}, extent = {{-35.500000, -5.000000}, {35.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="DPF_Flow",tagSocped="MyEngine20261109.Engine_type.Engine_type.AftertreatmentModel_type.SCR_type",tagVisibility="Local"))));
          SysplorerEmbeddedCoder.Continuous.Integrator Integrator(externalResetType=SysplorerEmbeddedCoder.Continuous.Integrator.ExternalResetType.None,zeroCross=true,initCond=0,initCondSourceType=SysplorerEmbeddedCoder.Continuous.Integrator.InitCondSourceType.Internal,limitOutput=false,wrapState=false,showSaturationPort=false,showStatePort=false) 
            annotation (Placement(transformation(origin = {136.000000, -47.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(zeroCross=true)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable1D NH3StoreMax(table=NH3StoreMax,axis1=NH3StoreMax_x,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable1D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable1D.ExtrapolationMethod.clip,indexSearchMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable1D.IndexSearchMethod.binarySearch) 
            annotation (Placement(transformation(origin = {192.000000, -19.000000}, extent = {{-22.000000, -21.500000}, {22.000000, 21.500000}},rotation=0)));
          SysplorerEmbeddedCoder.MathOperation.Product Product1(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {-378.000000, 130.000000}, extent = {{-3.000000, -41.000000}, {3.000000, 41.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Product Product2(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {-143.000000, -46.000000}, extent = {{-3.000000, -27.500000}, {3.000000, 27.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Product Product3(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {-104.000000, -135.000000}, extent = {{-5.000000, -33.000000}, {5.000000, 33.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D SCRdPrs(table=SCRdPrs,axis1=SCRdPrs_x,axis2=SCRdPrs_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {352.000000, 25.000000}, extent = {{-22.000000, -21.500000}, {22.000000, 21.500000}},rotation=0)));
          SysplorerEmbeddedCoder.Discontinuities.SaturationDynamic 'Saturation10Dynamic1' 
            annotation (Placement(transformation(origin = {249.000000, -46.000000}, extent = {{-8.500000, -41.000000}, {8.500000, 41.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(y(Type(inherit=InheritType.sameAsSecondInput))))));
          SysplorerEmbeddedCoder.Continuous.TransferFcn 'Transfer Fcn'(numerator=1,denominator=[1,1]) 
            annotation (Placement(transformation(origin = {-453.000000, 151.000000}, extent = {{-20.000000, -12.000000}, {20.000000, 12.000000}},rotation=0)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D eta_NOx(table=etaPM,axis1=etaPM_x,axis2=etaPM_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-301.000000, -60.000000}, extent = {{-22.000000, -21.500000}, {22.000000, 21.500000}},rotation=0)));
          SysplorerEmbeddedCoder.MathOperation.Gain kg2g(k=1000,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
            annotation (Placement(transformation(origin = {76.000000, -47.000000}, extent = {{-22.000000, -10.000000}, {22.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
          SysplorerEmbeddedCoder.Sources.Constant one(k=1) 
            annotation (Placement(transformation(origin = {-187.000000, -105.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
          SysplorerEmbeddedCoder.Sources.Constant zero3(k=0) 
            annotation (Placement(transformation(origin = {204.000000, -74.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
          SysplorerEmbeddedCoder.Sources.Constant zero4(k=0.0002) 
            annotation (Placement(transformation(origin = {-58.000000, -67.000000}, extent = {{-30.500000, -5.000000}, {30.500000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
          SysplorerEmbeddedCoder.Sources.Constant '-60-14-53-40-59-88-74-561'(k=0.325) 
            annotation (Placement(transformation(origin = {-422.000000, 110.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
          SysplorerEmbeddedCoder.Port.Outport 'OUT_Flow_kg/h' 
            annotation (Placement(transformation(origin = {-361.000000, -23.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport OUT_Temp_c 
            annotation (Placement(transformation(origin = {-361.000000, -118.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport OUT_Prs_kpa 
            annotation (Placement(transformation(origin = {513.000000, 38.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'OUT_NOx_kg/h' 
            annotation (Placement(transformation(origin = {-38.000000, -135.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport OUT_mNH3_slip 
            annotation (Placement(transformation(origin = {364.000000, -108.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport OUT_NH3store_g 
            annotation (Placement(transformation(origin = {350.000000, -47.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        equation
          connect('DPF_NOx_kg/h', Product3.u2) 
          annotation(Line(origin={0,0},
          points={{-507,48},{-263,48},{-263,-33},{-263,-152},{-263,-151},{-114,-151}}),Text(origin={-188,-148},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="m_NOx"))));
          connect('DPF_NOx_kg/h', Product2.u1) 
          annotation(Line(origin={0,0},
          points={{-507,48},{-263,48},{-263,-33},{-263,-32},{-151,-32}}),Text(origin={-207,-29},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="m_NOx"))));
          connect('DPF_Flow_kg/h', eta_NOx.u1) 
          annotation(Line(origin={0,0},
          points={{-507,-50},{-486,-50},{-486,-49},{-328,-49}}));
          connect('DPF_Flow_kg/h', Goto1.u) 
          annotation(Line(origin={0,0},
          points={{-507,-50},{-486,-50},{-486,-23},{-486,0},{-486,1},{-444,1}}));
          connect('DPF_Flow_kg/h', 'OUT_Flow_kg/h') 
          annotation(Line(origin={0,0},
          points={{-507,-50},{-486,-50},{-486,-23},{-361,-23}}));
          connect(DPF_Temp_c, eta_NOx.u2) 
          annotation(Line(origin={0,0},
          points={{-507,-71},{-484,-71},{-484,-70},{-328,-70}}));
          connect(DPF_Temp_c, OUT_Temp_c) 
          annotation(Line(origin={0,0},
          points={{-507,-71},{-484,-71},{-484,-84},{-484,-118},{-361,-118}}));
          connect(DPF_Temp_c, Goto.u) 
          annotation(Line(origin={0,0},
          points={{-507,-71},{-484,-71},{-484,-84},{-440,-84}}));
          connect(eta_NOx.y, Add2.u2) 
          annotation(Line(origin={0,0},
          points={{-274,-60},{-212,-60},{-212,-131},{-212,-129},{-151,-129}}),Text(origin={-181,-126},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="etaNOx"))));
          connect(eta_NOx.y, Product2.u2) 
          annotation(Line(origin={0,0},
          points={{-274,-60},{-212,-60},{-212,-59},{-151,-59}}),Text(origin={-181,-56},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="etaNOx"))));
          connect('Transfer Fcn'.y, Product1.u1) 
          annotation(Line(origin={0,0},
          points={{-428,151},{-386,151}}),Text(origin={-407,154},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="mUREA"))));
          connect(Product1.y, Add1.u1) 
          annotation(Line(origin={0,0},
          points={{-370,130},{-8,130},{-8,-26},{9,-26}}),Text(origin={0,-23},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="mNH3_in"))));
          connect(Product2.y, Add1.u2) 
          annotation(Line(origin={0,0},
          points={{-135,-46},{9,-46}}),Text(origin={-63,-43},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="mNH3_consume"))));
          connect(Add1.y, kg2g.u) 
          annotation(Line(origin={0,0},
          points={{25,-47},{49,-47}}));
          connect(kg2g.y, Integrator.u1) 
          annotation(Line(origin={0,0},
          points={{103,-47},{121,-47}}));
          connect('Saturation10Dynamic1'.y, OUT_NH3store_g) 
          annotation(Line(origin={0,0},
          points={{262,-46},{283,-46},{283,-47},{350,-47}}),Text(origin={316,-44},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="NH3_store"))));
          connect('Saturation10Dynamic1'.y, SCRdPrs.u2) 
          annotation(Line(origin={0,0},
          points={{262,-46},{283,-46},{283,15},{325,15}}),Text(origin={304,18},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="NH3_store"))));
          connect(SCRdPrs.y, Add3.u2) 
          annotation(Line(origin={0,0},
          points={{379,25},{379,26},{444,26}}),Text(origin={411,29},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="SCR_dPrs"))));
          connect(DPF_Prs_kpa, Add3.u1) 
          annotation(Line(origin={0,0},
          points={{415,55},{415,56},{444,56}}));
          connect(Add3.y, OUT_Prs_kpa) 
          annotation(Line(origin={0,0},
          points={{460,41},{460,38},{513,38}}));
          connect(Integrator.y, 'Saturation10Dynamic1'.u) 
          annotation(Line(origin={0,0},
          points={{151,-47},{151,-45},{236,-45}}));
          connect(zero3.y, 'Saturation10Dynamic1'.lowerLimit) 
          annotation(Line(origin={0,0},
          points={{219,-74},{219,-72},{236,-72}}));
          connect(From1.y, NH3StoreMax.u) 
          annotation(Line(origin={0,0},
          points={{119,-19},{165,-19}}));
          connect(NH3StoreMax.y, 'Saturation10Dynamic1'.upperLimit) 
          annotation(Line(origin={0,0},
          points={{219,-19},{219,-18},{236,-18}}));
          connect(From2.y, SCRdPrs.u1) 
          annotation(Line(origin={0,0},
          points={{269,35},{269,36},{325,36}}));
          connect(zero4.y, OUT_mNH3_slip) 
          annotation(Line(origin={0,0},
          points={{-23,-67},{-11,-67},{-11,-107},{-11,-108},{364,-108}}));
          connect(zero4.y, Add1.u3) 
          annotation(Line(origin={0,0},
          points={{-23,-67},{-11,-67},{-11,-66},{9,-66}}));
          connect(one.y, Add2.u1) 
          annotation(Line(origin={0,0},
          points={{-172,-105},{-172,-104},{-151,-104}}));
          connect(Add2.y, Product3.u1) 
          annotation(Line(origin={0,0},
          points={{-135,-117},{-135,-118},{-114,-118}}));
          connect(Product3.y, 'OUT_NOx_kg/h') 
          annotation(Line(origin={0,0},
          points={{-94,-135},{-38,-135}}));
          connect('-60-14-53-40-59-88-74-561'.y, Product1.u2) 
          annotation(Line(origin={0,0},
          points={{-407,110},{-386,110}}));
          connect(mUREA_target, 'Transfer Fcn'.u) 
          annotation(Line(origin={0,0},
          points={{-514,150},{-514,151},{-478,151}}));
          end SCR_type;
      equation
        connect(DOC.DOC_Temp_c, ExhTemp_DOC_out) 
        annotation(Line(origin={0,0},
        points={{-233,73},{-199,73},{-199,90},{-199,91},{-155,91}}));
        connect(DOC.DOC_Temp_c, DPF.DOC_Temp_c) 
        annotation(Line(origin={0,0},
        points={{-233,73},{-199,73},{-199,83},{-85,83}}));
        connect(DOC.DOC_NO2Frac, DPF.DOC_NO2Frac) 
        annotation(Line(origin={0,0},
        points={{-233,44},{-233,55},{-85,55}}));
        connect('ExhMassFlow_kg/h', ExhMassFlow) 
        annotation(Line(origin={0,0},
        points={{-495,98},{-476,98},{-476,118},{-476,119},{-427,119}}));
        connect('ExhMassFlow_kg/h', DOC.'ExhMassFlow_kg/h') 
        annotation(Line(origin={0,0},
        points={{-495,98},{-476,98},{-385,98}}));
        connect(EGT_c, ExhTemp_DOC_in) 
        annotation(Line(origin={0,0},
        points={{-495,61},{-474,61},{-474,84},{-474,85},{-427,85}}));
        connect(EGT_c, DOC.EGT_c) 
        annotation(Line(origin={0,0},
        points={{-495,61},{-474,61},{-385,61}}));
        connect(ExhPrs_kpa, DOC.ExhPrs_kpa) 
        annotation(Line(origin={0,0},
        points={{-495,23},{-495,24},{-385,24}}));
        connect(O2_pct, O2_frac) 
        annotation(Line(origin={0,0},
        points={{-495,-14},{-476,-14},{-476,6},{-427,6}}));
        connect(O2_pct, DOC.O2_pct) 
        annotation(Line(origin={0,0},
        points={{-495,-14},{-476,-14},{-476,-13},{-385,-13}}));
        connect('NOx_kg/h', DOC.'NOx_kg/h') 
        annotation(Line(origin={0,0},
        points={{-495,-51},{-495,-50},{-385,-50}}));
        connect('PM_kg/h', DOC.'PM_kg/h') 
        annotation(Line(origin={0,0},
        points={{-495,-164},{-495,-161},{-385,-161}}));
        connect('HC_kg/h', DOC.'HC_kg/h') 
        annotation(Line(origin={0,0},
        points={{-495,-89},{-495,-87},{-385,-87}}));
        connect('CO_kg/h', DOC.'CO_kg/h') 
        annotation(Line(origin={0,0},
        points={{-495,-126},{-495,-124},{-385,-124}}));
        connect(DOC.'DOC_Flow_kg/h', DPF.'DOC_Flow_kg/h') 
        annotation(Line(origin={0,0},
        points={{-233,102},{-233,111},{-85,111}}));
        connect(DOC.'DOC_PM_kg/h', DPF.'DOC_PM_kg/h') 
        annotation(Line(origin={0,0},
        points={{-233,15},{-233,27},{-85,27}}));
        connect(DOC.'DOC_NO2_kg/h', DPF.'DOC_NO2_kg/h') 
        annotation(Line(origin={0,0},
        points={{-233,-14},{-233,-1},{-85,-1}}));
        connect(DOC.'DOC_NO_kg/h', DPF.'DOC_NO_kg/h') 
        annotation(Line(origin={0,0},
        points={{-233,-43},{-233,-29},{-85,-29}}));
        connect(DOC.DOC_Prs_kpa, DPF.DOC_Prs_kpa) 
        annotation(Line(origin={0,0},
        points={{-233,-72},{-233,-57},{-85,-57}}));
        connect(DPF_regen_req, DPF.DPF_regen_req) 
        annotation(Line(origin={0,0},
        points={{-77,170},{-16,170},{-16,-85},{-85,-85}}));
        connect(DPF.'DPF_Flow_kg/h', SCR.'DPF_Flow_kg/h') 
        annotation(Line(origin={0,0},
        points={{81,111},{81,113},{251,113}}));
        connect(DPF.DPF_Temp_c, ExhTemp_DPF_out) 
        annotation(Line(origin={0,0},
        points={{81,83},{102,83},{102,100},{102,98},{151,98}}));
        connect(DPF.DPF_Temp_c, SCR.DPF_Temp_c) 
        annotation(Line(origin={0,0},
        points={{81,83},{102,83},{102,91},{251,91}}));
        connect(DPF.DPF_dPrs_kpa, DPF_DP) 
        annotation(Line(origin={0,0},
        points={{81,-85},{81,-82},{151,-82}}));
        connect(SCR.OUT_Temp_c, ExhTemp_SCR_out) 
        annotation(Line(origin={0,0},
        points={{405,97},{405,95},{491,95}}));
        connect(DPF.'DPF_NOx_kg/h', mNOx_SCR_in) 
        annotation(Line(origin={0,0},
        points={{81,27},{103,27},{103,44},{151,44}}));
        connect(DPF.'DPF_NOx_kg/h', SCR.'DPF_NOx_kg/h') 
        annotation(Line(origin={0,0},
        points={{81,27},{103,27},{103,47},{251,47}}));
        connect(SCR.'OUT_NOx_kg/h', mNOx_SCR_out) 
        annotation(Line(origin={0,0},
        points={{405,61},{494,61}}));
        connect(DPF.DPF_Prs_kpa, SCR.DPF_Prs_kpa) 
        annotation(Line(origin={0,0},
        points={{81,55},{81,69},{251,69}}));
        connect(DPF.DPF_SootLoad_g, Soot_Load) 
        annotation(Line(origin={0,0},
        points={{81,-57},{81,-55},{151,-55}}));
        connect(SCR.OUT_NH3store_g, NH3_Store) 
        annotation(Line(origin={0,0},
        points={{405,25},{405,27},{494,27}}));
        connect(mUREA_target, SCR.mUREA_target) 
        annotation(Line(origin={0,0},
        points={{222,170},{313,170},{313,25},{251,25}}));
        connect(SCR.'OUT_Flow_kg/h', Terminator.x) 
        annotation(Line(origin={0,0},
        points={{405,115},{405,112},{431,112}}));
        connect(SCR.OUT_Prs_kpa, Terminator1.x) 
        annotation(Line(origin={0,0},
        points={{405,79},{405,78},{431,78}}));
        connect(SCR.OUT_mNH3_slip, Terminator2.x) 
        annotation(Line(origin={0,0},
        points={{405,43},{405,44},{431,44}}));
        connect(DPF.DPF_NO2Frac, Terminator3.x) 
        annotation(Line(origin={0,0},
        points={{81,-1},{81,0},{108,0}}));
        connect(DPF.'DPF_PM_kg/h', Terminator4.x) 
        annotation(Line(origin={0,0},
        points={{81,-29},{81,-27},{108,-27}}));
        connect(DOC.'DOC_HC_kg/h', Terminator6.x) 
        annotation(Line(origin={0,0},
        points={{-233,-130},{-233,-139},{-204,-139}}));
        connect(DOC.DOC_dPrs_kpa, Terminator5.x) 
        annotation(Line(origin={0,0},
        points={{-233,-101},{-233,-109},{-204,-109}}));
        connect(DOC.'DOC_CO_kg/h', Terminator7.x) 
        annotation(Line(origin={0,0},
        points={{-233,-159},{-233,-170},{-204,-170}}));
        end AftertreatmentModel_type;
      block ThermalModel_type "子系统
通过子系统创建模型分层结构。"

        annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left(LoadTrq_Nm, PostInj_Request, EGROpeningTgt_pct, FuelCyleTgt_mg), Right(FuelCycle_mg, EGRRatio, RailPrs_kpa, 'IntakeMass_kg/h', IntakePrs_kpa, EngineTrq_Nm, EngineSpd_rpm, 'BSFC_kg/h', 'ExhMassFlow_kg/h', EGT_c, ExhPrs_kpa, O2_pct, 'NOx_kg/h', 'HC_kg/h', 'CO_kg/h', 'PM_kg/h')),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
      grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
      rotationPolicy=RotationPolicy.Follow,
      origin={0,0},
      fillColor={255,255,255},
      fillPattern=FillPattern.Solid,
      lineThickness=3,
      frame=true,
      extent={{-300,120},{300,-120}}), Text(origin={0,-140},
      lineColor={0,0,0},
      extent={{0,-20},{0,20}},
      textString="%name",
      fontSize=14,
      textStyle={TextStyle.None},
      textColor={0,0,0},
      verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
        SysplorerEmbeddedCoder.Port.Inport LoadTrq_Nm 
          annotation (Placement(transformation(origin = {12.000000, -80.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport PostInj_Request 
          annotation (Placement(transformation(origin = {-841.000000, 121.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport EGROpeningTgt_pct 
          annotation (Placement(transformation(origin = {-464.000000, -83.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.Port.Inport FuelCyleTgt_mg 
          annotation (Placement(transformation(origin = {-841.000000, 39.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
        SysplorerEmbeddedCoder.SignalRouting.BusCreator 'Bus10Creator' 
          annotation (Placement(transformation(origin = {754.000000, 8.000000}, extent = {{-1.500000, -195.000000}, {1.500000, 195.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2,u3,u4,u5,u6,u7,u8,u9,u10,u11,u12,u13,u14,u15,u16,u17,u18,u19),y(Type)),BusCreator(showSignalNames=true))));
        CombustionSystem_type CombustionSystem 
          annotation (Placement(transformation(origin = {146.000000, 56.000000}, extent = {{-66.000000, -159.500000}, {66.000000, 159.500000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, 191.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion1'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, 171.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion10'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, -12.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion11'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, -32.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion12'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, -134.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion13'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, -155.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion14'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, -53.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion15'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, -73.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion16'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, -93.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion17'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, -114.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion18'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, -175.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion2'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, 151.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion3'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, 131.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion4'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, 111.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion5'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, 90.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion6'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, 70.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion7'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, 49.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion8'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, 29.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.MathOperation.TypeConversion 'Data Type Conversion9'(isSaturate=false) 
          annotation (Placement(transformation(origin = {550.000000, 9.000000}, extent = {{-18.500000, -8.000000}, {18.500000, 8.000000}},rotation=0)),__MWORKS(BlockSystem(Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap),Instance(y(Type(inherit=InheritType.backPropagation))))));
        SysplorerEmbeddedCoder.SignalRouting.From From 
          annotation (Placement(transformation(origin = {435.000000, 191.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="PostInj_Request",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From1 
          annotation (Placement(transformation(origin = {435.000000, 172.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="FuelCyleTgt_mg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From10 
          annotation (Placement(transformation(origin = {435.000000, -11.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhPrs_kpa",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From11 
          annotation (Placement(transformation(origin = {435.000000, -32.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="O2_pct",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From12 
          annotation (Placement(transformation(origin = {435.000000, -52.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="NOx_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From13 
          annotation (Placement(transformation(origin = {435.000000, -72.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="HC_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From14 
          annotation (Placement(transformation(origin = {435.000000, -93.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="CO_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From15 
          annotation (Placement(transformation(origin = {435.000000, -113.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="PM_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From16 
          annotation (Placement(transformation(origin = {435.000000, -134.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="BSFC_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From17 
          annotation (Placement(transformation(origin = {435.000000, -154.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EngineTrq_Nm",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From18 
          annotation (Placement(transformation(origin = {435.000000, -174.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EngineSpd_rpm",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From2 
          annotation (Placement(transformation(origin = {435.000000, 152.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="RailPrs_kpa",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From3 
          annotation (Placement(transformation(origin = {435.000000, 132.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="FuelCycle_mg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From4 
          annotation (Placement(transformation(origin = {433.000000, 111.000000}, extent = {{-30.500000, -6.500000}, {30.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="IntakeMass_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From5 
          annotation (Placement(transformation(origin = {433.000000, 91.000000}, extent = {{-30.500000, -6.500000}, {30.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="IntakeTemp_c",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From6 
          annotation (Placement(transformation(origin = {433.000000, 70.000000}, extent = {{-30.500000, -6.500000}, {30.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="IntakePrs_kpa",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From7 
          annotation (Placement(transformation(origin = {433.000000, 50.000000}, extent = {{-30.500000, -6.500000}, {30.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EGRRatio",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From8 
          annotation (Placement(transformation(origin = {435.000000, 30.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhMassFlow_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.From From9 
          annotation (Placement(transformation(origin = {435.000000, 9.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EGT_c",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        FuelSystem_type FuelSystem 
          annotation (Placement(transformation(origin = {-665.000000, 21.000000}, extent = {{-74.500000, -38.000000}, {74.500000, 38.000000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto 
          annotation (Placement(transformation(origin = {-520.000000, 23.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="RailPrs_kpa",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto1 
          annotation (Placement(transformation(origin = {-520.000000, -11.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="FuelCycle_mg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto10 
          annotation (Placement(transformation(origin = {282.000000, 70.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="NOx_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto11 
          annotation (Placement(transformation(origin = {282.000000, 43.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="HC_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto12 
          annotation (Placement(transformation(origin = {282.000000, 16.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="CO_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto13 
          annotation (Placement(transformation(origin = {282.000000, -11.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="PM_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto14 
          annotation (Placement(transformation(origin = {282.000000, -38.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="BSFC_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto15 
          annotation (Placement(transformation(origin = {282.000000, -66.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EngineTrq_Nm",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto16 
          annotation (Placement(transformation(origin = {282.000000, -96.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EngineSpd_rpm",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto17 
          annotation (Placement(transformation(origin = {-748.000000, 87.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="FuelCyleTgt_mg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto18 
          annotation (Placement(transformation(origin = {-748.000000, 121.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="PostInj_Request",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto2 
          annotation (Placement(transformation(origin = {-160.000000, -55.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="IntakeMass_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto3 
          annotation (Placement(transformation(origin = {-160.000000, -79.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="IntakeTemp_c",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto4 
          annotation (Placement(transformation(origin = {-160.000000, -103.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="IntakePrs_kpa",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto5 
          annotation (Placement(transformation(origin = {-160.000000, -130.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EGRRatio",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto6 
          annotation (Placement(transformation(origin = {282.000000, 178.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhMassFlow_kg",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto7 
          annotation (Placement(transformation(origin = {282.000000, 152.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EGT_c",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto8 
          annotation (Placement(transformation(origin = {282.000000, 125.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="ExhPrs_kpa",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        SysplorerEmbeddedCoder.SignalRouting.Goto Goto9 
          annotation (Placement(transformation(origin = {282.000000, 98.000000}, extent = {{-32.000000, -6.500000}, {32.000000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="O2_pct",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type",tagVisibility="Local"))));
        IntakeSystem_type IntakeSystem 
          annotation (Placement(transformation(origin = {-295.000000, -83.000000}, extent = {{-74.500000, -55.000000}, {74.500000, 55.000000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
        ToWorkspace_type 'To Workspace'(var_name="ThermalModel",extract=1,max_data_point=2147483647) 
          annotation (Placement(transformation(origin = {841.000000, 9.000000}, extent = {{-30.500000, -10.000000}, {30.500000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime=-1)));
        SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay'(initCond=0) 
          annotation (Placement(transformation(origin = {145.000000, -192.000000}, extent = {{-11.500000, 11.500000}, {11.500000, -11.500000}},rotation=180)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
        SysplorerEmbeddedCoder.Port.Outport FuelCycle_mg 
          annotation (Placement(transformation(origin = {-454.000000, 2.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport EGRRatio 
          annotation (Placement(transformation(origin = {-43.000000, -124.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport RailPrs_kpa 
          annotation (Placement(transformation(origin = {-454.000000, 39.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport 'IntakeMass_kg/h' 
          annotation (Placement(transformation(origin = {-100.000000, -42.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport IntakePrs_kpa 
          annotation (Placement(transformation(origin = {-43.000000, -97.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport EngineTrq_Nm 
          annotation (Placement(transformation(origin = {359.000000, -53.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport EngineSpd_rpm 
          annotation (Placement(transformation(origin = {359.000000, -80.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport 'BSFC_kg/h' 
          annotation (Placement(transformation(origin = {359.000000, -25.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport 'ExhMassFlow_kg/h' 
          annotation (Placement(transformation(origin = {359.000000, 191.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport EGT_c 
          annotation (Placement(transformation(origin = {359.000000, 165.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport ExhPrs_kpa 
          annotation (Placement(transformation(origin = {359.000000, 138.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport O2_pct 
          annotation (Placement(transformation(origin = {359.000000, 111.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport 'NOx_kg/h' 
          annotation (Placement(transformation(origin = {359.000000, 83.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport 'HC_kg/h' 
          annotation (Placement(transformation(origin = {359.000000, 56.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport 'CO_kg/h' 
          annotation (Placement(transformation(origin = {359.000000, 29.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        SysplorerEmbeddedCoder.Port.Outport 'PM_kg/h' 
          annotation (Placement(transformation(origin = {359.000000, 2.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
        block CombustionSystem_type "子系统
通过子系统创建模型分层结构。"

          annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left(RailPrs_kpa, FuelCycle_mg, 'IntakeMass_kg/h', IntakeTemp_c, IntakePrs_kpa, LoadTrq_Nm), Right('ExhMassFlow_kg/h', EGT_c, ExhPrs_kpa, O2_pct, 'NOx_kg/h', 'HC_kg/h', 'CO_kg/h', 'PM_kg/h', 'BSFC_kg/h', EngineTrq_Nm, EngineSpd_rpm)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
        grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
        rotationPolicy=RotationPolicy.Follow,
        origin={0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        lineThickness=3,
        frame=true,
        extent={{-300,120},{300,-120}}), Text(origin={0,-140},
        lineColor={0,0,0},
        extent={{0,-20},{0,20}},
        textString="%name",
        fontSize=14,
        textStyle={TextStyle.None},
        textColor={0,0,0},
        verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
          SysplorerEmbeddedCoder.Port.Inport RailPrs_kpa 
            annotation (Placement(transformation(origin = {-694.000000, -46.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport FuelCycle_mg 
            annotation (Placement(transformation(origin = {-704.000000, 225.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport 'IntakeMass_kg/h' 
            annotation (Placement(transformation(origin = {346.000000, 114.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport IntakeTemp_c 
            annotation (Placement(transformation(origin = {-697.000000, 103.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport IntakePrs_kpa 
            annotation (Placement(transformation(origin = {499.000000, 29.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport LoadTrq_Nm 
            annotation (Placement(transformation(origin = {-89.000000, 252.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.MathOperation.Sum Add(inputs="++",isSaturate=false) 
            annotation (Placement(transformation(origin = {451.000000, 134.000000}, extent = {{-3.000000, -39.000000}, {3.000000, 39.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="+",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Sum Add1(inputs="++",isSaturate=false) 
            annotation (Placement(transformation(origin = {655.000000, 49.000000}, extent = {{-3.000000, -39.000000}, {3.000000, 39.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="+",instance="u2")))));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D BSFC(table=BSFC,axis1=BSFC_x,axis2=BSFC_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-408.000000, 165.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable1D BackPrs(table=BackPrs,axis1=BackPrs_x,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable1D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable1D.ExtrapolationMethod.linear,indexSearchMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable1D.IndexSearchMethod.binarySearch) 
            annotation (Placement(transformation(origin = {545.000000, 70.000000}, extent = {{-22.000000, -21.500000}, {22.000000, 21.500000}},rotation=0)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D CO(table=CO,axis1=CO_x,axis2=CO_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-408.000000, -209.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D EGT(table=EGT,axis1=EGT_x,axis2=EGT_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-408.000000, 90.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D EngineTrq(table=EngineTrq,axis1=EngineTrq_x,axis2=EngineTrq_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-408.000000, 239.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
          SysplorerEmbeddedCoder.SignalRouting.From From 
            annotation (Placement(transformation(origin = {96.000000, 138.000000}, extent = {{-25.500000, -6.500000}, {25.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="FuelCycle",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type.CombustionSystem_type",tagVisibility="Local"))));
          SysplorerEmbeddedCoder.SignalRouting.From From1 
            annotation (Placement(transformation(origin = {96.000000, 39.000000}, extent = {{-25.500000, -6.500000}, {25.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EngineTrq",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type.CombustionSystem_type",tagVisibility="Local"))));
          SysplorerEmbeddedCoder.SignalRouting.From From2 
            annotation (Placement(transformation(origin = {-346.000000, -318.000000}, extent = {{-25.500000, -6.500000}, {25.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EnginePwr_kw",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type.CombustionSystem_type",tagVisibility="Local"))));
          SysplorerEmbeddedCoder.MathOperation.Gain 'FuelMass_kg/h'(k=0.001,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
            annotation (Placement(transformation(origin = {382.000000, 155.000000}, extent = {{-22.000000, -13.500000}, {22.000000, 13.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
          SysplorerEmbeddedCoder.MathOperation.Gain 'FuelMass_kg/h1'(k=1/9550,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
            annotation (Placement(transformation(origin = {273.000000, 56.000000}, extent = {{-22.000000, -13.500000}, {22.000000, 13.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
          SysplorerEmbeddedCoder.MathOperation.Gain Gain(k=1/60,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
            annotation (Placement(transformation(origin = {317.000000, 155.000000}, extent = {{-22.000000, -13.500000}, {22.000000, 13.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
          SysplorerEmbeddedCoder.MathOperation.Gain Gain1(k=1/2,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
            annotation (Placement(transformation(origin = {252.000000, 155.000000}, extent = {{-22.000000, -13.500000}, {22.000000, 13.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
          SysplorerEmbeddedCoder.SignalRouting.Goto Goto 
            annotation (Placement(transformation(origin = {-600.000000, 209.000000}, extent = {{-25.500000, -6.500000}, {25.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="FuelCycle",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type.CombustionSystem_type",tagVisibility="Local"))));
          SysplorerEmbeddedCoder.SignalRouting.Goto Goto1 
            annotation (Placement(transformation(origin = {-285.000000, 265.000000}, extent = {{-25.500000, -6.500000}, {25.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EngineTrq",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type.CombustionSystem_type",tagVisibility="Local"))));
          SysplorerEmbeddedCoder.SignalRouting.Goto Goto2 
            annotation (Placement(transformation(origin = {388.000000, 56.000000}, extent = {{-25.500000, -6.500000}, {25.500000, 6.500000}},rotation=0)),__MWORKS(BlockSystem(GotoTag(tagName="EnginePwr_kw",tagSocped="MyEngine20261109.Engine_type.Engine_type.ThermalModel_type.CombustionSystem_type",tagVisibility="Local"))));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D HC(table=HC,axis1=HC_x,axis2=HC_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-408.000000, -135.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
          Motion_type Motion 
            annotation (Placement(transformation(origin = {42.000000, 267.000000}, extent = {{-73.000000, -31.500000}, {73.000000, 31.500000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName")));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D NOx(table=NOx,axis1=NOx_x,axis2=NOx_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-408.000000, -60.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D O2(table=O2,axis1=O2_x,axis2=O2_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-408.000000, 15.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D PM(table=PM,axis1=PM_x,axis2=PM_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-408.000000, -294.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
          SysplorerEmbeddedCoder.MathOperation.Product Product(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {203.000000, 156.000000}, extent = {{-3.000000, -36.000000}, {3.000000, 36.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Product Product1(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {203.000000, 58.000000}, extent = {{-3.000000, -36.000000}, {3.000000, 36.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Product Product2(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {-263.000000, -71.000000}, extent = {{-3.000000, -22.500000}, {3.000000, 22.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Product Product3(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {-263.000000, -306.000000}, extent = {{-3.000000, -22.500000}, {3.000000, 22.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Product Product4(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {-263.000000, -146.000000}, extent = {{-3.000000, -22.500000}, {3.000000, 22.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Product Product5(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {-260.000000, -221.000000}, extent = {{-3.000000, -22.500000}, {3.000000, 22.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.MathOperation.Product Product6(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {-263.000000, 153.000000}, extent = {{-3.000000, -22.500000}, {3.000000, 22.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          SysplorerEmbeddedCoder.Utilities.Terminator Terminator1 
            annotation (Placement(transformation(origin = {-622.000000, 104.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
          SysplorerEmbeddedCoder.Utilities.Terminator Terminator4 
            annotation (Placement(transformation(origin = {-619.000000, -46.000000}, extent = {{-6.500000, -6.500000}, {6.500000, 6.500000}},rotation=0)));
          SysplorerEmbeddedCoder.Discrete.UnitDelay 'Unit Delay'(initCond=700) 
            annotation (Placement(transformation(origin = {-423.000000, 316.000000}, extent = {{-11.500000, 11.500000}, {11.500000, -11.500000}},rotation=180)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'ExhMassFlow_kg/h' 
            annotation (Placement(transformation(origin = {704.000000, 134.000000}, extent = {{-8.500000, -8.500000}, {8.500000, 8.500000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport EGT_c 
            annotation (Placement(transformation(origin = {-168.000000, 90.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport ExhPrs_kpa 
            annotation (Placement(transformation(origin = {701.000000, 49.000000}, extent = {{-8.500000, -8.500000}, {8.500000, 8.500000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport O2_pct 
            annotation (Placement(transformation(origin = {-168.000000, 15.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'NOx_kg/h' 
            annotation (Placement(transformation(origin = {-168.000000, -73.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'HC_kg/h' 
            annotation (Placement(transformation(origin = {-168.000000, -148.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'CO_kg/h' 
            annotation (Placement(transformation(origin = {-168.000000, -223.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'PM_kg/h' 
            annotation (Placement(transformation(origin = {-168.000000, -308.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport 'BSFC_kg/h' 
            annotation (Placement(transformation(origin = {-168.000000, 151.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport EngineTrq_Nm 
            annotation (Placement(transformation(origin = {-168.000000, 239.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport EngineSpd_rpm 
            annotation (Placement(transformation(origin = {235.000000, 265.000000}, extent = {{-8.500000, -8.500000}, {8.500000, 8.500000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          block Motion_type "子系统
通过子系统创建模型分层结构。"

            annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left(EngineTrq_Nm, LoadTrq_Nm), Right(EngineSpd_rpm)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
          grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
          rotationPolicy=RotationPolicy.Follow,
          origin={0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=3,
          frame=true,
          extent={{-300,120},{300,-120}}), Text(origin={0,-140},
          lineColor={0,0,0},
          extent={{0,-20},{0,20}},
          textString="%name",
          fontSize=14,
          textStyle={TextStyle.None},
          textColor={0,0,0},
          verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
            SysplorerEmbeddedCoder.Port.Inport EngineTrq_Nm 
              annotation (Placement(transformation(origin = {-197.000000, 33.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
            SysplorerEmbeddedCoder.Port.Inport LoadTrq_Nm 
              annotation (Placement(transformation(origin = {-197.000000, 5.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
            SysplorerEmbeddedCoder.MathOperation.Sum Add(inputs="+-",isSaturate=false) 
              annotation (Placement(transformation(origin = {-136.000000, 20.000000}, extent = {{-3.000000, -27.500000}, {3.000000, 27.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="-",instance="u2")))));
            SysplorerEmbeddedCoder.Sources.Constant Constant(k=Inertia) 
              annotation (Placement(transformation(origin = {-170.000000, -28.000000}, extent = {{-37.000000, -5.000000}, {37.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
            SysplorerEmbeddedCoder.Sources.Constant Constant1(k=radps2rpm) 
              annotation (Placement(transformation(origin = {-11.000000, -35.000000}, extent = {{-37.000000, -5.000000}, {37.000000, 5.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
            SysplorerEmbeddedCoder.MathOperation.Product Divide(inputs="*/",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
              annotation (Placement(transformation(origin = {-84.000000, 5.000000}, extent = {{-5.000000, -30.500000}, {5.000000, 30.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="/",instance="u2")))));
            SysplorerEmbeddedCoder.Continuous.Integrator Integrator(externalResetType=SysplorerEmbeddedCoder.Continuous.Integrator.ExternalResetType.None,zeroCross=true,initCond=SpeedInit,initCondSourceType=SysplorerEmbeddedCoder.Continuous.Integrator.InitCondSourceType.Internal,limitOutput=false,wrapState=false,showSaturationPort=false,showStatePort=false) 
              annotation (Placement(transformation(origin = {125.000000, -18.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(zeroCross=true)));
            SysplorerEmbeddedCoder.MathOperation.Product Product(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
              annotation (Placement(transformation(origin = {70.000000, -16.000000}, extent = {{-3.000000, -36.000000}, {3.000000, 36.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
            SysplorerEmbeddedCoder.Port.Outport EngineSpd_rpm 
              annotation (Placement(transformation(origin = {196.000000, -18.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          equation
            connect(EngineTrq_Nm, Add.u1) 
            annotation(Line(origin={0,0},
            points={{-197,33},{-197,34},{-144,34}}));
            connect(LoadTrq_Nm, Add.u2) 
            annotation(Line(origin={0,0},
            points={{-197,5},{-197,7},{-144,7}}));
            connect(Add.y, Divide.u1) 
            annotation(Line(origin={0,0},
            points={{-128,20},{-94,20}}));
            connect(Constant.y, Divide.u2) 
            annotation(Line(origin={0,0},
            points={{-128,-28},{-105,-28},{-105,-11},{-105,-10},{-94,-10}}));
            connect(Constant1.y, Product.u2) 
            annotation(Line(origin={0,0},
            points={{31,-35},{31,-34},{62,-34}}));
            connect(Product.y, Integrator.u1) 
            annotation(Line(origin={0,0},
            points={{78,-16},{78,-18},{110,-18}}));
            connect(Divide.y, Product.u1) 
            annotation(Line(origin={0,0},
            points={{-74,5},{-74,2},{62,2}}));
            connect(Integrator.y, EngineSpd_rpm) 
            annotation(Line(origin={0,0},
            points={{140,-18},{196,-18}}));
            end Motion_type;
        equation
          connect('Unit Delay'.y, EngineTrq.u1) 
          annotation(Line(origin={0,0},
          points={{-439,315},{-547,315},{-547,251},{-547,252},{-440,252}}));
          connect('Unit Delay'.y, PM.u1) 
          annotation(Line(origin={0,0},
          points={{-439,315},{-547,315},{-547,251},{-547,177},{-547,103},{-547,29},{-547,-45},{-547,-147},{-547,-221},{-547,-278},{-547,-280},{-440,-280}}));
          connect('Unit Delay'.y, CO.u2) 
          annotation(Line(origin={0,0},
          points={{-439,315},{-547,315},{-547,251},{-547,177},{-547,103},{-547,29},{-547,-45},{-547,-147},{-547,-221},{-547,-222},{-440,-222}}));
          connect('Unit Delay'.y, HC.u2) 
          annotation(Line(origin={0,0},
          points={{-439,315},{-547,315},{-547,251},{-547,177},{-547,103},{-547,29},{-547,-45},{-547,-147},{-547,-148},{-440,-148}}));
          connect('Unit Delay'.y, NOx.u1) 
          annotation(Line(origin={0,0},
          points={{-439,315},{-547,315},{-547,251},{-547,177},{-547,103},{-547,29},{-547,-45},{-547,-46},{-440,-46}}));
          connect('Unit Delay'.y, O2.u1) 
          annotation(Line(origin={0,0},
          points={{-439,315},{-547,315},{-547,251},{-547,177},{-547,103},{-547,29},{-440,29}}));
          connect('Unit Delay'.y, EGT.u1) 
          annotation(Line(origin={0,0},
          points={{-439,315},{-547,315},{-547,251},{-547,177},{-547,103},{-550,103},{-550,104},{-440,104}}));
          connect('Unit Delay'.y, BSFC.u1) 
          annotation(Line(origin={0,0},
          points={{-439,315},{-547,315},{-547,251},{-547,177},{-550,177},{-550,179},{-440,179}}));
          connect(EngineTrq.y, EngineTrq_Nm) 
          annotation(Line(origin={0,0},
          points={{-376,239},{-345,239},{-168,239}}));
          connect(EngineTrq.y, Goto1.u) 
          annotation(Line(origin={0,0},
          points={{-376,239},{-345,239},{-345,266},{-345,264},{-315,264}}));
          connect(EngineTrq.y, Motion.EngineTrq_Nm) 
          annotation(Line(origin={0,0},
          points={{-376,239},{-345,239},{-345,266},{-345,283},{-345,282},{-36,282}}));
          connect(FuelCycle_mg, Goto.u) 
          annotation(Line(origin={0,0},
          points={{-704,225},{-658,225},{-658,208},{-658,209},{-630,209}}));
          connect(FuelCycle_mg, PM.u2) 
          annotation(Line(origin={0,0},
          points={{-704,225},{-658,225},{-482,225},{-482,151},{-482,77},{-482,3},{-482,-71},{-482,-118},{-482,-192},{-482,-304},{-482,-307},{-440,-307}}));
          connect(FuelCycle_mg, CO.u1) 
          annotation(Line(origin={0,0},
          points={{-704,225},{-658,225},{-482,225},{-482,151},{-482,77},{-482,3},{-482,-71},{-482,-118},{-482,-192},{-482,-195},{-440,-195}}));
          connect(FuelCycle_mg, HC.u1) 
          annotation(Line(origin={0,0},
          points={{-704,225},{-658,225},{-482,225},{-482,151},{-482,77},{-482,3},{-482,-71},{-482,-118},{-482,-121},{-440,-121}}));
          connect(FuelCycle_mg, NOx.u2) 
          annotation(Line(origin={0,0},
          points={{-704,225},{-658,225},{-482,225},{-482,151},{-482,77},{-482,3},{-482,-71},{-482,-73},{-440,-73}}));
          connect(FuelCycle_mg, O2.u2) 
          annotation(Line(origin={0,0},
          points={{-704,225},{-658,225},{-482,225},{-482,151},{-482,77},{-482,3},{-482,2},{-440,2}}));
          connect(FuelCycle_mg, EGT.u2) 
          annotation(Line(origin={0,0},
          points={{-704,225},{-658,225},{-482,225},{-482,151},{-482,77},{-440,77}}));
          connect(FuelCycle_mg, BSFC.u2) 
          annotation(Line(origin={0,0},
          points={{-704,225},{-658,225},{-482,225},{-482,151},{-482,152},{-440,152}}));
          connect(FuelCycle_mg, EngineTrq.u2) 
          annotation(Line(origin={0,0},
          points={{-704,225},{-658,225},{-482,225},{-482,226},{-440,226}}));
          connect(EGT.y, EGT_c) 
          annotation(Line(origin={0,0},
          points={{-376,90},{-168,90}}));
          connect(O2.y, O2_pct) 
          annotation(Line(origin={0,0},
          points={{-376,15},{-168,15}}));
          connect(IntakeTemp_c, Terminator1.x) 
          annotation(Line(origin={0,0},
          points={{-697,103},{-697,104},{-633,104}}));
          connect(RailPrs_kpa, Terminator4.x) 
          annotation(Line(origin={0,0},
          points={{-694,-46},{-630,-46}}));
          connect(Motion.EngineSpd_rpm, EngineSpd_rpm) 
          annotation(Line(origin={0,0},
          points={{120,266},{147,266},{147,265},{235,265}}));
          connect(Motion.EngineSpd_rpm, 'Unit Delay'.u1) 
          annotation(Line(origin={0,0},
          points={{120,266},{147,266},{147,317},{147,315},{-407,315}}));
          connect(Motion.EngineSpd_rpm, Product.u1) 
          annotation(Line(origin={0,0},
          points={{120,266},{147,266},{147,175},{147,174},{195,174}}));
          connect(LoadTrq_Nm, Motion.LoadTrq_Nm) 
          annotation(Line(origin={0,0},
          points={{-89,252},{-89,251},{-36,251}}));
          connect(From.y, Product1.u1) 
          annotation(Line(origin={0,0},
          points={{126,138},{172,138},{172,77},{172,76},{195,76}}));
          connect(From.y, Product.u2) 
          annotation(Line(origin={0,0},
          points={{126,138},{172,138},{195,138}}));
          connect(Product.y, Gain1.u) 
          annotation(Line(origin={0,0},
          points={{211,156},{211,155},{225,155}}));
          connect(Gain.y, 'FuelMass_kg/h'.u) 
          annotation(Line(origin={0,0},
          points={{344,155},{355,155}}));
          connect('FuelMass_kg/h'.y, Add.u1) 
          annotation(Line(origin={0,0},
          points={{409,155},{409,154},{443,154}}));
          connect('IntakeMass_kg/h', Add.u2) 
          annotation(Line(origin={0,0},
          points={{346,114},{346,115},{443,115}}));
          connect(Gain1.y, Gain.u) 
          annotation(Line(origin={0,0},
          points={{279,155},{290,155}}));
          connect(Add.y, BackPrs.u) 
          annotation(Line(origin={0,0},
          points={{459,134},{494,134},{494,70},{518,70}}));
          connect(Add.y, 'ExhMassFlow_kg/h') 
          annotation(Line(origin={0,0},
          points={{459,134},{494,134},{704,134}}));
          connect(From1.y, Product1.u2) 
          annotation(Line(origin={0,0},
          points={{126,39},{126,40},{195,40}}));
          connect(Product1.y, 'FuelMass_kg/h1'.u) 
          annotation(Line(origin={0,0},
          points={{211,58},{211,56},{246,56}}));
          connect('FuelMass_kg/h1'.y, Goto2.u) 
          annotation(Line(origin={0,0},
          points={{300,56},{358,56}}));
          connect(NOx.y, Product2.u1) 
          annotation(Line(origin={0,0},
          points={{-376,-60},{-271,-60}}));
          connect(From2.y, Product2.u2) 
          annotation(Line(origin={0,0},
          points={{-316,-318},{-298,-318},{-298,-233},{-298,-159},{-298,-85},{-298,-82},{-271,-82}}));
          connect(From2.y, Product6.u2) 
          annotation(Line(origin={0,0},
          points={{-316,-318},{-298,-318},{-298,-233},{-298,-159},{-298,-85},{-298,139},{-298,142},{-271,142}}));
          connect(From2.y, Product4.u2) 
          annotation(Line(origin={0,0},
          points={{-316,-318},{-298,-318},{-298,-233},{-298,-159},{-298,-157},{-271,-157}}));
          connect(From2.y, Product5.u2) 
          annotation(Line(origin={0,0},
          points={{-316,-318},{-298,-318},{-298,-233},{-298,-232},{-268,-232}}));
          connect(From2.y, Product3.u2) 
          annotation(Line(origin={0,0},
          points={{-316,-318},{-298,-318},{-298,-317},{-271,-317}}));
          connect(PM.y, Product3.u1) 
          annotation(Line(origin={0,0},
          points={{-376,-294},{-376,-295},{-271,-295}}));
          connect(HC.y, Product4.u1) 
          annotation(Line(origin={0,0},
          points={{-376,-135},{-271,-135}}));
          connect(CO.y, Product5.u1) 
          annotation(Line(origin={0,0},
          points={{-376,-209},{-376,-210},{-268,-210}}));
          connect(Product2.y, 'NOx_kg/h') 
          annotation(Line(origin={0,0},
          points={{-255,-71},{-255,-73},{-168,-73}}));
          connect(Product3.y, 'PM_kg/h') 
          annotation(Line(origin={0,0},
          points={{-255,-306},{-255,-308},{-168,-308}}));
          connect(Product4.y, 'HC_kg/h') 
          annotation(Line(origin={0,0},
          points={{-255,-146},{-255,-148},{-168,-148}}));
          connect(Product5.y, 'CO_kg/h') 
          annotation(Line(origin={0,0},
          points={{-252,-221},{-252,-223},{-168,-223}}));
          connect(BSFC.y, Product6.u1) 
          annotation(Line(origin={0,0},
          points={{-376,165},{-376,164},{-271,164}}));
          connect(Product6.y, 'BSFC_kg/h') 
          annotation(Line(origin={0,0},
          points={{-255,153},{-255,151},{-168,151}}));
          connect(IntakePrs_kpa, Add1.u2) 
          annotation(Line(origin={0,0},
          points={{499,29},{499,30},{647,30}}));
          connect(Add1.y, ExhPrs_kpa) 
          annotation(Line(origin={0,0},
          points={{663,49},{701,49}}));
          connect(BackPrs.y, Add1.u1) 
          annotation(Line(origin={0,0},
          points={{572,70},{572,69},{647,69}}));
          end CombustionSystem_type;
        block FuelSystem_type "子系统
通过子系统创建模型分层结构。"

          annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left(FuelCycleTgt_mg, EngineSpd_rpm), Right(RailPrs_kpa, FuelCycle_mg)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
        grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
        rotationPolicy=RotationPolicy.Follow,
        origin={0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        lineThickness=3,
        frame=true,
        extent={{-300,120},{300,-120}}), Text(origin={0,-140},
        lineColor={0,0,0},
        extent={{0,-20},{0,20}},
        textString="%name",
        fontSize=14,
        textStyle={TextStyle.None},
        textColor={0,0,0},
        verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));
          SysplorerEmbeddedCoder.Port.Inport FuelCycleTgt_mg 
            annotation (Placement(transformation(origin = {-190.000000, -45.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport EngineSpd_rpm 
            annotation (Placement(transformation(origin = {-190.000000, -18.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D EGRTgt(table=EGRTgt,axis1=EGRTgt_x,axis2=EGRTgt_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-79.000000, -31.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
          SysplorerEmbeddedCoder.SignalRouting.Mux Mux(portNumber=2) 
            annotation (Placement(transformation(origin = {157.000000, 63.000000}, extent = {{-1.500000, -12.500000}, {1.500000, 12.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2)))));
          Scope_type Scope 
            annotation (Placement(transformation(origin = {190.000000, 83.000000}, extent = {{-10.000000, -23.000000}, {10.000000, 23.000000}},rotation=0)));
          SysplorerEmbeddedCoder.Continuous.TransferFcn 'Transfer Fcn'(numerator=1,denominator=[RailTC,1]) 
            annotation (Placement(transformation(origin = {86.000000, -31.000000}, extent = {{-42.500000, -12.000000}, {42.500000, 12.000000}},rotation=0)));
          SysplorerEmbeddedCoder.MathOperation.Gain bar2kpa(k=100,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
            annotation (Placement(transformation(origin = {-15.000000, -31.000000}, extent = {{-13.500000, -10.000000}, {13.500000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
          SysplorerEmbeddedCoder.Port.Outport RailPrs_kpa 
            annotation (Placement(transformation(origin = {179.000000, -31.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport FuelCycle_mg 
            annotation (Placement(transformation(origin = {179.000000, -99.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          block Scope_type "示波器
显示仿真过程中生成的信号。"

            parameter String displayFormat = "y(t)" annotation(HideResult = true);

            parameter String showOnSimulator = "false" annotation(HideResult = true);
            SysplorerEmbeddedCoder.Types.InputAuto u1 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
            SysplorerEmbeddedCoder.Types.InputAuto u2 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
            SysplorerEmbeddedCoder.Types.InputAuto u3 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));

            annotation(defaultComponentName = "scope", __MWORKS(BlockSystem(blockKind=Types.BlockKind.atomic, bltBlockKind=Types.BltBlockKind.scope),PortArrangement(Left(u1, u2, u3)),sourceModel=SysplorerEmbeddedCoder.Utilities.Scope,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-100,-100},{100,100}},
          grid={2,2}),graphics = {Rectangle(origin={0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=3,
          frame=true,
          extent={{-100,100},{100,-100}},
          rotationPolicy=RotationPolicy.Follow), Rectangle(origin={1,54.5},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=2,
          extent={{-79,24.5},{79,-24.5}},
          radius=10), Text(origin={0,-120},
          lineColor={0,0,0},
          extent={{0,-20},{0,20}},
          textString="%name",
          fontSize=14,
          textStyle={TextStyle.None},
          textColor={0,0,0},
          verticalAlignment=TextAlignment.Top)},rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));

          end Scope_type;
        equation
          connect(FuelCycleTgt_mg, Scope.u2) 
          annotation(Line(origin={0,0},
          points={{-190,-45},{-159,-45},{-159,84},{-159,83},{175,83}}));
          connect(FuelCycleTgt_mg, FuelCycle_mg) 
          annotation(Line(origin={0,0},
          points={{-190,-45},{-159,-45},{-144,-45},{-144,-99},{179,-99}}));
          connect(FuelCycleTgt_mg, EGRTgt.u2) 
          annotation(Line(origin={0,0},
          points={{-190,-45},{-159,-45},{-144,-45},{-144,-44},{-111,-44}}));
          connect(EngineSpd_rpm, Scope.u1) 
          annotation(Line(origin={0,0},
          points={{-190,-18},{-172,-18},{-172,97},{-172,98},{175,98}}));
          connect(EngineSpd_rpm, EGRTgt.u1) 
          annotation(Line(origin={0,0},
          points={{-190,-18},{-172,-18},{-172,-17},{-111,-17}}));
          connect(EGRTgt.y, bar2kpa.u) 
          annotation(Line(origin={0,0},
          points={{-47,-31},{-33,-31}}));
          connect('Transfer Fcn'.y, Mux.u2) 
          annotation(Line(origin={0,0},
          points={{133,-31},{139,-31},{139,57},{151,57}}));
          connect('Transfer Fcn'.y, RailPrs_kpa) 
          annotation(Line(origin={0,0},
          points={{133,-31},{139,-31},{179,-31}}));
          connect(bar2kpa.y, Mux.u1) 
          annotation(Line(origin={0,0},
          points={{3,-31},{24,-31},{24,71},{24,69},{151,69}}));
          connect(bar2kpa.y, 'Transfer Fcn'.u) 
          annotation(Line(origin={0,0},
          points={{3,-31},{24,-31},{39,-31}}));
          connect(Mux.y, Scope.u3) 
          annotation(Line(origin={0,0},
          points={{163,62},{169,62},{169,68},{175,68}}));
          end FuelSystem_type;
        block IntakeSystem_type "子系统
通过子系统创建模型分层结构。"

          annotation (defaultComponentName="subSystem", __MWORKS(PortArrangement(Left(FuelCycle_mg, EGROpeningTgt_pct, EngineSpd_rpm), Right('IntakeMass_kg/h', IntakeTemp_c, IntakePrs_kpa, EGRRatio)),BlockSystem(blockKind=BlockKind.subSystem, SampleTime(auto=true), SubSystem(virtual=true, functionPack=FunctionPack.auto, functionName="", sourceFile="")),PortLabels(labelType="PortName"),sourceModel=SysplorerEmbeddedCoder.SubSystems.SubSystem,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-300,-120},{300,120}},
        grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
        rotationPolicy=RotationPolicy.Follow,
        origin={0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        lineThickness=3,
        frame=true,
        extent={{-300,120},{300,-120}}), Text(origin={0,-140},
        lineColor={0,0,0},
        extent={{0,-20},{0,20}},
        textString="%name",
        fontSize=14,
        textStyle={TextStyle.None},
        textColor={0,0,0},
        verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate),Diagram(graphics={Text(origin = { -60,85 },lineColor = { 0,0,0 },extent = { { -17.68,-7 },{ 17.68,7 } },textString = "基础进气量",fontSize = 20,textStyle = { TextStyle.None },textColor = { 0,0,0 },horizontalAlignment = TextAlignment.Left)}));
          SysplorerEmbeddedCoder.Port.Inport FuelCycle_mg 
            annotation (Placement(transformation(origin = {-218.000000, 79.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport EGROpeningTgt_pct 
            annotation (Placement(transformation(origin = {-211.000000, -43.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.Port.Inport EngineSpd_rpm 
            annotation (Placement(transformation(origin = {-289.000000, 107.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1,outputFunctionCall=false,latchByDelayingOutsideSignal=false,latchFeedbackFuncCallSubsystemSignal=false)));
          SysplorerEmbeddedCoder.MathOperation.Sum Add(inputs="+-",isSaturate=false) 
            annotation (Placement(transformation(origin = {-18.000000, 33.000000}, extent = {{-3.000000, -25.500000}, {3.000000, 25.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="+",instance="u1"),label(text="-",instance="u2")))));
          SysplorerEmbeddedCoder.Sources.Constant Constant(k=1) 
            annotation (Placement(transformation(origin = {-69.000000, 45.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
          SysplorerEmbeddedCoder.Sources.Constant Constant1(k=IntakeSw) 
            annotation (Placement(transformation(origin = {-30.000000, -127.000000}, extent = {{-39.000000, -8.500000}, {39.000000, 8.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
          SysplorerEmbeddedCoder.Sources.Constant Constant2(k=IntakeTempInit) 
            annotation (Placement(transformation(origin = {-30.000000, -151.000000}, extent = {{-39.000000, -8.500000}, {39.000000, 8.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
          SysplorerEmbeddedCoder.Sources.Constant Constant3(k=IntakePrsInit) 
            annotation (Placement(transformation(origin = {-30.000000, -243.000000}, extent = {{-39.000000, -8.500000}, {39.000000, 8.500000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=-1,Instance(y(Type(inherit=InheritType.constantValue))))));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D EGRRatioMap(table=EGRRatio,axis1=EGRRatio_x,axis2=EGRRatio_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-130.000000, -29.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D IntakeMap(table=Intake,axis1=Intake_x,axis2=Intake_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-130.000000, 93.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D IntakePrsMap(table=IntakePrs,axis1=IntakePrs_x,axis2=IntakePrs_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-130.000000, -196.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
          SysplorerEmbeddedCoder.LookupTable.LookupTable2D IntakeTempMap(table=IntakeTemp,axis1=IntakeTemp_x,axis2=IntakeTemp_y,interpolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.InterpolationMethod.linearPointSlope,extrapolationMethod=SysplorerEmbeddedCoder.LookupTable.LookupTable2D.ExtrapolationMethod.clip) 
            annotation (Placement(transformation(origin = {-130.000000, -104.000000}, extent = {{-27.000000, -27.000000}, {27.000000, 27.000000}},rotation=0)));
          SysplorerEmbeddedCoder.SignalRouting.Mux Mux(portNumber=2) 
            annotation (Placement(transformation(origin = {174.000000, 201.000000}, extent = {{-1.500000, -12.500000}, {1.500000, 12.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2)))));
          SysplorerEmbeddedCoder.MathOperation.Product Product(inputs="2",isSaturate=false,multiplication=SysplorerEmbeddedCoder.MathOperation.Product.MultiplicationType.elementWise) 
            annotation (Placement(transformation(origin = {21.000000, 46.000000}, extent = {{-5.000000, -25.500000}, {5.000000, 25.500000}},rotation=0)),__MWORKS(BlockSystem(Instance(u(u1,u2),y(Type(inherit=InheritType.internalRule))),Type(overflowKind=SysplorerEmbeddedCoder.Types.OverflowKind.wrap)),PortLabels(labelType="CustomType",labels(label(text="*",instance="u1"),label(text="*",instance="u2")))));
          Scope_type Scope 
            annotation (Placement(transformation(origin = {285.000000, 190.000000}, extent = {{-10.000000, -59.500000}, {10.000000, 59.500000}},rotation=0)));
          SysplorerEmbeddedCoder.SignalRouting.Switch Switch(threshold=0,zeroCross=true,ct=SysplorerEmbeddedCoder.SignalRouting.Switch.ConditionType.Great,hasDiffSize=false) 
            annotation (Placement(transformation(origin = {75.000000, -128.000000}, extent = {{-11.500000, -36.000000}, {11.500000, 36.000000}},rotation=0)),__MWORKS(BlockSystem(zeroCross=true,Instance(y(Type(inherit=InheritType.internalRule))))));
          SysplorerEmbeddedCoder.SignalRouting.Switch Switch1(threshold=0,zeroCross=true,ct=SysplorerEmbeddedCoder.SignalRouting.Switch.ConditionType.Great,hasDiffSize=false) 
            annotation (Placement(transformation(origin = {75.000000, -220.000000}, extent = {{-11.500000, -36.000000}, {11.500000, 36.000000}},rotation=0)),__MWORKS(BlockSystem(zeroCross=true,Instance(y(Type(inherit=InheritType.internalRule))))));
          SysplorerEmbeddedCoder.Continuous.TransferFcn 'Transfer Fcn'(numerator=1,denominator=[IntakeTC,1]) 
            annotation (Placement(transformation(origin = {99.000000, 46.000000}, extent = {{-42.500000, -12.000000}, {42.500000, 12.000000}},rotation=0)));
          SysplorerEmbeddedCoder.MathOperation.Gain bar2kpa(k=100,gainType=SysplorerEmbeddedCoder.MathOperation.Gain.GainType.elementWise,rndMeth=SysplorerEmbeddedCoder.MathOperation.Gain.RndType.floorType) 
            annotation (Placement(transformation(origin = {156.000000, -220.000000}, extent = {{-17.000000, -10.000000}, {17.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Instance(k(Type(inherit=InheritType.internalRule)),y(Type(inherit=InheritType.internalRule))))));
          SysplorerEmbeddedCoder.Port.Outport 'IntakeMass_kg/h' 
            annotation (Placement(transformation(origin = {285.000000, 45.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport IntakeTemp_c 
            annotation (Placement(transformation(origin = {288.000000, -128.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport IntakePrs_kpa 
            annotation (Placement(transformation(origin = {288.000000, -220.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          SysplorerEmbeddedCoder.Port.Outport EGRRatio 
            annotation (Placement(transformation(origin = {288.000000, -29.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(Type(inherit=InheritType.auto),Dimension(dimensionType=DimensionType.auto)=-1,SampleTime(auto=true)=-1)));
          block Scope_type "示波器
显示仿真过程中生成的信号。"

            parameter String displayFormat = "y(t)" annotation(HideResult = true);

            parameter String showOnSimulator = "false" annotation(HideResult = true);
            SysplorerEmbeddedCoder.Types.InputAuto u1 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
            SysplorerEmbeddedCoder.Types.InputAuto u2 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
            SysplorerEmbeddedCoder.Types.InputAuto u3 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
            SysplorerEmbeddedCoder.Types.InputAuto u4 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
            SysplorerEmbeddedCoder.Types.InputAuto u5 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
            SysplorerEmbeddedCoder.Types.InputAuto u6 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));

            annotation(defaultComponentName = "scope", __MWORKS(BlockSystem(blockKind=Types.BlockKind.atomic, bltBlockKind=Types.BltBlockKind.scope),PortArrangement(Left(u1, u2, u3, u4, u5, u6)),sourceModel=SysplorerEmbeddedCoder.Utilities.Scope,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-100,-100},{100,100}},
          grid={2,2}),graphics = {Rectangle(origin={0,0},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=3,
          frame=true,
          extent={{-100,100},{100,-100}},
          rotationPolicy=RotationPolicy.Follow), Rectangle(origin={1,54.5},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineThickness=2,
          extent={{-79,24.5},{79,-24.5}},
          radius=10), Text(origin={0,-120},
          lineColor={0,0,0},
          extent={{0,-20},{0,20}},
          textString="%name",
          fontSize=14,
          textStyle={TextStyle.None},
          textColor={0,0,0},
          verticalAlignment=TextAlignment.Top)},rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));

          end Scope_type;
        equation
          connect(IntakeMap.y, Mux.u1) 
          annotation(Line(origin={0,0},
          points={{-98,93},{1,93},{1,208},{1,207},{168,207}}));
          connect(IntakeMap.y, Product.u1) 
          annotation(Line(origin={0,0},
          points={{-98,93},{1,93},{1,59},{11,59}}));
          connect(EngineSpd_rpm, Scope.u1) 
          annotation(Line(origin={0,0},
          points={{-289,107},{-266,107},{-266,243},{-266,239},{270,239}}));
          connect(EngineSpd_rpm, IntakePrsMap.u1) 
          annotation(Line(origin={0,0},
          points={{-289,107},{-266,107},{-266,-15},{-266,-89},{-266,-180},{-266,-182},{-162,-182}}));
          connect(EngineSpd_rpm, IntakeTempMap.u1) 
          annotation(Line(origin={0,0},
          points={{-289,107},{-266,107},{-266,-15},{-266,-89},{-266,-90},{-162,-90}}));
          connect(EngineSpd_rpm, EGRRatioMap.u1) 
          annotation(Line(origin={0,0},
          points={{-289,107},{-266,107},{-266,-15},{-162,-15}}));
          connect(EngineSpd_rpm, IntakeMap.u1) 
          annotation(Line(origin={0,0},
          points={{-289,107},{-266,107},{-162,107}}));
          connect(FuelCycle_mg, Scope.u2) 
          annotation(Line(origin={0,0},
          points={{-218,79},{-201,79},{-201,221},{-201,220},{270,220}}));
          connect(FuelCycle_mg, IntakeMap.u2) 
          annotation(Line(origin={0,0},
          points={{-218,79},{-201,79},{-201,80},{-162,80}}));
          connect('Transfer Fcn'.y, Mux.u2) 
          annotation(Line(origin={0,0},
          points={{146,46},{156,46},{156,195},{168,195}}));
          connect('Transfer Fcn'.y, 'IntakeMass_kg/h') 
          annotation(Line(origin={0,0},
          points={{146,46},{156,46},{156,45},{285,45}}));
          connect(EGROpeningTgt_pct, IntakePrsMap.u2) 
          annotation(Line(origin={0,0},
          points={{-211,-43},{-186,-43},{-186,-117},{-186,-208},{-186,-209},{-162,-209}}));
          connect(EGROpeningTgt_pct, IntakeTempMap.u2) 
          annotation(Line(origin={0,0},
          points={{-211,-43},{-186,-43},{-186,-117},{-162,-117}}));
          connect(EGROpeningTgt_pct, EGRRatioMap.u2) 
          annotation(Line(origin={0,0},
          points={{-211,-43},{-186,-43},{-186,-42},{-162,-42}}));
          connect(EGRRatioMap.y, Add.u2) 
          annotation(Line(origin={0,0},
          points={{-98,-29},{-38,-29},{-38,18},{-38,21},{-26,21}}));
          connect(EGRRatioMap.y, EGRRatio) 
          annotation(Line(origin={0,0},
          points={{-98,-29},{-38,-29},{179,-29},{288,-29}}));
          connect(EGRRatioMap.y, Scope.u4) 
          annotation(Line(origin={0,0},
          points={{-98,-29},{-38,-29},{179,-29},{179,181},{179,182},{270,182}}));
          connect(Constant.y, Add.u1) 
          annotation(Line(origin={0,0},
          points={{-54,45},{-54,46},{-26,46}}));
          connect(Add.y, Product.u2) 
          annotation(Line(origin={0,0},
          points={{-10,33},{-10,34},{11,34}}));
          connect(Product.y, 'Transfer Fcn'.u) 
          annotation(Line(origin={0,0},
          points={{31,46},{52,46}}));
          connect(IntakeTempMap.y, Switch.u1) 
          annotation(Line(origin={0,0},
          points={{-98,-104},{59,-104}}));
          connect(IntakePrsMap.y, Switch1.u1) 
          annotation(Line(origin={0,0},
          points={{-98,-196},{59,-196}}));
          connect(Switch1.y, bar2kpa.u) 
          annotation(Line(origin={0,0},
          points={{91,-220},{134,-220}}));
          connect(Switch.y, IntakeTemp_c) 
          annotation(Line(origin={0,0},
          points={{91,-128},{195,-128},{288,-128}}));
          connect(Switch.y, Scope.u5) 
          annotation(Line(origin={0,0},
          points={{91,-128},{195,-128},{195,161},{195,163},{270,163}}));
          connect(Constant1.y, Switch1.u2) 
          annotation(Line(origin={0,0},
          points={{14,-127},{37,-127},{37,-218},{37,-220},{59,-220}}));
          connect(Constant1.y, Switch.u2) 
          annotation(Line(origin={0,0},
          points={{14,-127},{37,-127},{37,-128},{59,-128}}));
          connect(Constant2.y, Switch.u3) 
          annotation(Line(origin={0,0},
          points={{14,-151},{14,-152},{59,-152}}));
          connect(Constant3.y, Switch1.u3) 
          annotation(Line(origin={0,0},
          points={{14,-243},{14,-244},{59,-244}}));
          connect(bar2kpa.y, Scope.u6) 
          annotation(Line(origin={0,0},
          points={{178,-220},{214,-220},{214,140},{214,144},{270,144}}));
          connect(bar2kpa.y, IntakePrs_kpa) 
          annotation(Line(origin={0,0},
          points={{178,-220},{214,-220},{288,-220}}));
          connect(Mux.y, Scope.u3) 
          annotation(Line(origin={0,0},
          points={{180,200},{180,201},{270,201}}));
          end IntakeSystem_type;
        block ToWorkspace_type "写工作区
向Syslab工作区写入数据。"
          annotation(defaultComponentName = "toWorkspace", __MWORKS(PortArrangement(Left(inport)),BlockSystem(blockKind=Types.BlockKind.composite, bltBlockKind=Types.BltBlockKind.toWorkspace),sourceModel=SysplorerEmbeddedCoder.Utilities.ToWorkspace,independentInstance=true,hide=true),Icon(coordinateSystem(extent={{-130,-60},{130,60}},
        grid={2,2}),graphics = {Rectangle(sizePolicy=SizePolicy.Expanding,
        rotationPolicy=RotationPolicy.Follow,
        origin={0,0},
        fillColor={255,255,255},
        fillPattern=FillPattern.Solid,
        lineThickness=3,
        frame=true,
        extent={{-130,60},{130,-60}}), Text(origin={0,0},
        lineColor={0,0,0},
        extent={{-120,50},{120,-50}},
        textString="%var_name",
        fontSize=16,
        textStyle={TextStyle.None},
        textColor={0,0,0}), Text(origin={0,-80},
        lineColor={0,0,0},
        extent={{0,-20},{0,20}},
        textString="%name",
        fontSize=14,
        textStyle={TextStyle.None},
        textColor={0,0,0},
        verticalAlignment=TextAlignment.Top)},sizePolicy=SizePolicy.Fixed,rotationPolicy=RotationPolicy.Ignore),Diagram(coordinateSystem(extent={{-100,-100},{100,100}},
        grid={2,2})),Protection(access=Access.packageDuplicate));

            class VarData "外部对象类定义"
              extends ExternalObject;

              function constructor
                input SysplorerEmbeddedCoder.Types.Auto var_name 
                  annotation(__MWORKS(BlockSystem(
                  Type(inherit = InheritType.none, ref = "string"),
                  Dimension(dimensionType = DimensionType.none) = 1)));
                input SysplorerEmbeddedCoder.Types.Auto dimension 
                  annotation(__MWORKS(BlockSystem(
                  Type(inherit = InheritType.none, ref = "int32"),
                  Dimension(dimensionType = DimensionType.none) = 1)));
                input SysplorerEmbeddedCoder.Types.Auto extract_size 
                  annotation(__MWORKS(BlockSystem(
                  Type(inherit = InheritType.none, ref = "int32"),
                  Dimension(dimensionType = DimensionType.none) = 1)));
                input SysplorerEmbeddedCoder.Types.Auto target_workspace 
                  annotation(__MWORKS(BlockSystem(
                  Type(inherit = InheritType.none, ref = "int32"),
                  Dimension(dimensionType = DimensionType.none) = 1)));
                input SysplorerEmbeddedCoder.Types.Auto max_data_point 
                  annotation(__MWORKS(BlockSystem(
                  Type(inherit = InheritType.none, ref = "int32"),
                  Dimension(dimensionType = DimensionType.none) = 1)));
                output VarData obj;
                annotation(Protection(access=Access.packageDuplicate));
              external "C" obj = __ToWorkspaceInit2(var_name, target_workspace, dimension, extract_size, max_data_point) annotation(
                Include = "#include \"ToWorkspace.c\"");
              end constructor;

              function terminator
                input VarData obj;
                annotation(Protection(access=Access.packageDuplicate));
              external "C" __ToWorkspaceTerminate(obj) annotation(
                Include = "#include \"ToWorkspace.c\"");
              end terminator;

              function destructor
                input VarData obj;
                annotation(Protection(access=Access.packageDuplicate));
              external "C" __ToWorkspaceDestory(obj) annotation(
                Include = "#include \"ToWorkspace.c\"");
              end destructor;
              annotation(__MWORKS(hide = true),Protection(access=Access.packageDuplicate));
            end VarData;


          block ExternalObject_T "框图外部对象构造模块"
            SysplorerEmbeddedCoder.Types.InputAuto u annotation(
              __MWORKS(HideResult = true, BlockSystem(VariablePort(defaultNumber = 0))));
            SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
              __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")), Dimension(dimensionType = DimensionType.none) = 1)));
            annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic,
              bltBlockKind = Types.BltBlockKind.externalObject)),Protection(access=Access.packageDuplicate));
          end ExternalObject_T;

            parameter SysplorerEmbeddedCoder.Types.Auto var_name = "simout" 
                  annotation(HideResult = true,__MWORKS(BlockSystem(
                  Type(inherit = InheritType.none, ref = "string"),
                  Dimension(dimensionType = DimensionType.none) = 1)));
            parameter SysplorerEmbeddedCoder.Types.Auto extract = 1 
                  annotation(HideResult = true,__MWORKS(BlockSystem(
                  Type(inherit = InheritType.none, ref = "int32"),
                  Dimension(dimensionType = DimensionType.none) = 1)));
            parameter SysplorerEmbeddedCoder.Types.Auto target_workspace_hint = -1 
                  annotation(HideResult = true,__MWORKS(BlockSystem(
                  Type(inherit = InheritType.none, ref = "int32"),
                  Dimension(dimensionType = DimensionType.none) = 1)));
            parameter SysplorerEmbeddedCoder.Types.Auto target_workspace = 0 
                  annotation(HideResult = true,__MWORKS(BlockSystem(
                  Type(inherit = InheritType.none, ref = "int32"),
                  Dimension(dimensionType = DimensionType.none) = 1)));
            parameter SysplorerEmbeddedCoder.Types.Auto max_data_point = 2147483647 
                  annotation(HideResult = true,__MWORKS(BlockSystem(
                  Type(inherit = InheritType.none, ref = "int32"),
                  Dimension(dimensionType = DimensionType.none) = 1)));

          inner ExternalObject_T x "外部对象构造组件" annotation(HideResult = true,
            __MWORKS(BlockSystem(Instance(u(u1(Type(inherit=InheritType.none ,ref="string") ,Dimension(dimensionType=DimensionType.none)=1)="ThermalModel",u2(Type(inherit=InheritType.none ,ref="int32") ,Dimension(dimensionType=DimensionType.none)=1)=size(reshape.y,1),u3(Type(inherit=InheritType.none ,ref="int32") ,Dimension(dimensionType=DimensionType.none)=1)=1,u4(Type(inherit=InheritType.none ,ref="int32") ,Dimension(dimensionType=DimensionType.none)=1)=target_workspace,u5(Type(inherit=InheritType.none ,ref="int32") ,Dimension(dimensionType=DimensionType.none)=1)=max_data_point),y(Type(inherit=InheritType.none ,ref=VarData) ,Dimension(dimensionType=DimensionType.none)=1)))));

          block ExternalObjectReference "框图外部对象引用模块"
            outer SysplorerEmbeddedCoder.Types.OutputAuto y annotation(
              __MWORKS(BlockSystem(AllowType(choices(choice = "extobj")))));  // 外部对象输出

            annotation(__MWORKS(hide = true, BlockSystem(blockKind = Types.BlockKind.atomic,
              bltBlockKind = Types.BltBlockKind.externalObjectReference)),Protection(access=Access.packageDuplicate));
          end ExternalObjectReference;

          ExternalObjectReference extObjRef "外部对象引用组件" annotation(
            __MWORKS(HideResult = true,BlockSystem(name = "x")));
          CCaller c_caller 
            annotation(HideResult = true,Placement(transformation(origin={37.5,-36.5221},
        extent={{-121.5,-73.5334},{121.5,73.5334}})),__MWORKS(ComponentNamePlacement(BOTTOM)));
          SysplorerEmbeddedCoder.Port.Inport inport 
            annotation (Placement(transformation(origin={-229.818,-36.1558},
        extent={{-10,-10},{10,10}}),
        iconTransformation(origin={-101.8,0},
        extent={{-1.8,-1.8},{1.8,1.8}})),__MWORKS(BlockSystem(AllowDimension(choices(choice = Types.DimensionType.scalar, choice = Types.DimensionType.array1D, choice = Types.DimensionType.columnVector2D, choice = Types.DimensionType.rowVector2D)))));
          SysplorerEmbeddedCoder.MathOperation.Reshape reshape 
            annotation (HideResult = true,Placement(transformation(origin={-153,-36.5221},
        extent={{-10,-10},{10,10}})));
          SysplorerEmbeddedCoder.Sources.DigitalClock digitalClock 
            annotation (Placement(transformation(origin={-231.318,-86.0444},
        extent={{-15,-9},{18,10}})),__MWORKS(BlockSystem(SampleTime(auto=false)=-1)));
          block CCaller

              annotation(
               __MWORKS(PortArrangement(Left(p,data_input,in_time), Right(out)),PortLabels(labelType="CustomType",labels(label(text="p",instance="p"),label(text="data_input",instance="data_input"),label(text="in_time",instance="in_time"),label(text="out",instance="out"))),BlockSystem(blockKind = BlockKind.atomic,bltBlockKind = BltBlockKind.ccaller),independentInstance = true,sourceModel = SysplorerEmbeddedCoder.Utilities.CCaller,ExternalFunctionBlock,hide = true),
                    Icon(coordinateSystem(extent = { {-200.0, -100.0}, {200.0, 100.0} },
                    preserveAspectRatio = false,
                    initialScale = 0.1,
                    grid = { 2.0, 2.0 }), graphics = { Rectangle(origin = {0.0, 0.0},
                    fillColor = {255, 255, 255},
                    fillPattern = FillPattern.Solid,
                    extent = {{-200.0, 100.0}, {200.0, -100.0}}), Text(origin = {0.0, 0.0},
                    extent = {{-200.0, 20.0}, {200, -20}},
                    textString = "__ToWorkspaceStep",
                    verticalAlignment = TextAlignment.VCenter), Text(origin = {0.0, -120.0},
                    lineColor = {0, 0, 0},
                    extent = {{-150, 20}, {150, -20}},
                    textString = "%name",
                    fontSize = 14,
                   textStyle = {TextStyle.None},
                    textColor = {0, 0, 0},
                    verticalAlignment = TextAlignment.Top) }),
                Diagram(coordinateSystem(extent = { {-100.0, -100.0}, {100.0, 100.0} },
                    preserveAspectRatio = false,
                    initialScale = 0.1,
                    grid = { 2.0, 2.0 })),Protection(access=Access.packageDuplicate));
            function func_CCaller
            output SysplorerEmbeddedCoder.Types.Auto out annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="int32"), Dimension(dimensionType = DimensionType.none) = 1)));
            input SysplorerEmbeddedCoder.Types.Auto p annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref=VarData), Dimension(dimensionType = DimensionType.none) = 1)));
            input SysplorerEmbeddedCoder.Types.Auto data_input[:] annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double")/*, Dimension(dimensionType = DimensionType.none) = [3]*/)));
            input SysplorerEmbeddedCoder.Types.Auto in_time annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref="double"), Dimension(dimensionType = DimensionType.none) = 1)));
              annotation(Protection(access=Access.packageDuplicate));
          external "C" out=__ToWorkspaceStep(p,data_input,in_time) 
          annotation (Include = "#include \"ToWorkspace.c\"",
            IncludeDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Include/Workspace",
            Library = "syslab_workspace_operator",
            LibraryDirectory = "modelica://SysplorerEmbeddedCoder/Resources/Library");
          end func_CCaller;
              SysplorerEmbeddedCoder.Port.Inport p 
              annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = VarData),Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
              SysplorerEmbeddedCoder.Port.Inport data_input 
              annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.auto, ref = "double"),Dimension(dimensionType = DimensionType.auto) = -1)), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
              SysplorerEmbeddedCoder.Port.Inport in_time 
              annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "double"),Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
              SysplorerEmbeddedCoder.Port.Outport out 
              annotation(__MWORKS(BlockSystem(Type(inherit = InheritType.none, ref = "int32"),Dimension(dimensionType = DimensionType.none) = 1)), Placement(transformation(origin = {0,0}, extent = { {-10,-10}, {10,10} })));
            equation

            out = func_CCaller(p, data_input, in_time);
          end CCaller;
          equation
          connect(extObjRef.y, c_caller.p);
          connect(c_caller.in_time, digitalClock.y) 
            annotation(Line(origin={-101,-47},
        points={{15.2,-38.5444},{-110.518,-38.5444}},
        color={0,0,0}));
          connect(inport, reshape.u1) 
          annotation(Line(origin={-135,-37},
        points={{-82.8183,0.844205},{-29.8,0.844205},{-29.8,0.4779}},
        color={0,0,0}));
          connect(reshape.y, c_caller.data_input) 
          annotation(Line(origin={-127,-37},
        points={{-14.2,0.4779},{41.2,0.4779}},
        color={0,0,0}));
          end ToWorkspace_type;
      equation
        connect(IntakeSystem.IntakePrs_kpa, Goto4.u) 
        annotation(Line(origin={0,0},
        points={{-216,-95},{-203,-95},{-203,-103},{-197,-103}}));
        connect(IntakeSystem.IntakePrs_kpa, IntakePrs_kpa) 
        annotation(Line(origin={0,0},
        points={{-216,-95},{-203,-95},{-70,-95},{-70,-97},{-43,-97}}));
        connect(IntakeSystem.IntakePrs_kpa, CombustionSystem.IntakePrs_kpa) 
        annotation(Line(origin={0,0},
        points={{-216,-95},{-203,-95},{-70,-95},{-70,-24},{-70,-23},{75,-23}}));
        connect(IntakeSystem.IntakeTemp_c, Goto3.u) 
        annotation(Line(origin={0,0},
        points={{-216,-68},{-201,-68},{-201,-78},{-201,-79},{-197,-79}}));
        connect(IntakeSystem.IntakeTemp_c, CombustionSystem.IntakeTemp_c) 
        annotation(Line(origin={0,0},
        points={{-216,-68},{-201,-68},{-79,-68},{-79,30},{75,30}}));
        connect(IntakeSystem.EGRRatio, Goto5.u) 
        annotation(Line(origin={0,0},
        points={{-216,-122},{-201,-122},{-201,-128},{-201,-130},{-197,-130}}));
        connect(IntakeSystem.EGRRatio, EGRRatio) 
        annotation(Line(origin={0,0},
        points={{-216,-122},{-201,-122},{-201,-124},{-43,-124}}));
        connect(IntakeSystem.'IntakeMass_kg/h', Goto2.u) 
        annotation(Line(origin={0,0},
        points={{-216,-41},{-203,-41},{-203,-55},{-197,-55}}));
        connect(IntakeSystem.'IntakeMass_kg/h', 'IntakeMass_kg/h') 
        annotation(Line(origin={0,0},
        points={{-216,-41},{-203,-41},{-192,-41},{-192,-42},{-100,-42}}));
        connect(IntakeSystem.'IntakeMass_kg/h', CombustionSystem.'IntakeMass_kg/h') 
        annotation(Line(origin={0,0},
        points={{-216,-41},{-203,-41},{-192,-41},{-192,84},{-192,83},{75,83}}));
        connect(EGROpeningTgt_pct, IntakeSystem.EGROpeningTgt_pct) 
        annotation(Line(origin={0,0},
        points={{-464,-83},{-464,-82},{-374,-82}}));
        connect('Unit Delay'.y, FuelSystem.EngineSpd_rpm) 
        annotation(Line(origin={0,0},
        points={{129,-192},{-429,-192},{-779,-192},{-779,1},{-779,2},{-744,2}}));
        connect('Unit Delay'.y, IntakeSystem.EngineSpd_rpm) 
        annotation(Line(origin={0,0},
        points={{129,-192},{-429,-192},{-429,-121},{-429,-118},{-374,-118}}));
        connect(CombustionSystem.EngineSpd_rpm, Goto16.u) 
        annotation(Line(origin={0,0},
        points={{217,-89},{230,-89},{230,-106},{230,-96},{245,-96}}));
        connect(CombustionSystem.EngineSpd_rpm, 'Unit Delay'.u1) 
        annotation(Line(origin={0,0},
        points={{217,-89},{230,-89},{230,-106},{230,-201},{230,-192},{161,-192}}));
        connect(CombustionSystem.EngineSpd_rpm, EngineSpd_rpm) 
        annotation(Line(origin={0,0},
        points={{217,-89},{230,-89},{230,-80},{359,-80}}));
        connect(LoadTrq_Nm, CombustionSystem.LoadTrq_Nm) 
        annotation(Line(origin={0,0},
        points={{12,-80},{12,-76},{75,-76}}));
        connect(FuelSystem.RailPrs_kpa, Goto.u) 
        annotation(Line(origin={0,0},
        points={{-586,40},{-569,40},{-569,23},{-557,23}}));
        connect(FuelSystem.RailPrs_kpa, RailPrs_kpa) 
        annotation(Line(origin={0,0},
        points={{-586,40},{-569,40},{-569,39},{-454,39}}));
        connect(FuelSystem.RailPrs_kpa, CombustionSystem.RailPrs_kpa) 
        annotation(Line(origin={0,0},
        points={{-586,40},{-569,40},{-569,193},{-569,188},{75,188}}));
        connect(CombustionSystem.O2_pct, Goto9.u) 
        annotation(Line(origin={0,0},
        points={{217,114},{235,114},{235,101},{235,98},{245,98}}));
        connect(CombustionSystem.O2_pct, O2_pct) 
        annotation(Line(origin={0,0},
        points={{217,114},{235,114},{235,111},{359,111}}));
        connect(FuelSystem.FuelCycle_mg, FuelCycle_mg) 
        annotation(Line(origin={0,0},
        points={{-586,2},{-569,2},{-454,2}}));
        connect(FuelSystem.FuelCycle_mg, Goto1.u) 
        annotation(Line(origin={0,0},
        points={{-586,2},{-569,2},{-569,-11},{-557,-11}}));
        connect(FuelSystem.FuelCycle_mg, IntakeSystem.FuelCycle_mg) 
        annotation(Line(origin={0,0},
        points={{-586,2},{-569,2},{-569,-11},{-569,-45},{-393,-45},{-393,-46},{-374,-46}}));
        connect(FuelSystem.FuelCycle_mg, CombustionSystem.FuelCycle_mg) 
        annotation(Line(origin={0,0},
        points={{-586,2},{-569,2},{-569,-11},{-569,-45},{-393,-45},{-393,138},{-393,136},{75,136}}));
        connect(CombustionSystem.'NOx_kg/h', Goto10.u) 
        annotation(Line(origin={0,0},
        points={{217,85},{232,85},{232,72},{232,70},{245,70}}));
        connect(CombustionSystem.'NOx_kg/h', 'NOx_kg/h') 
        annotation(Line(origin={0,0},
        points={{217,85},{232,85},{232,83},{359,83}}));
        connect(FuelCyleTgt_mg, Goto17.u) 
        annotation(Line(origin={0,0},
        points={{-841,39},{-810,39},{-810,86},{-810,87},{-785,87}}));
        connect(FuelCyleTgt_mg, FuelSystem.FuelCycleTgt_mg) 
        annotation(Line(origin={0,0},
        points={{-841,39},{-810,39},{-810,40},{-744,40}}));
        connect(CombustionSystem.EngineTrq_Nm, Goto15.u) 
        annotation(Line(origin={0,0},
        points={{217,-60},{235,-60},{235,-73},{235,-66},{245,-66}}));
        connect(CombustionSystem.EngineTrq_Nm, EngineTrq_Nm) 
        annotation(Line(origin={0,0},
        points={{217,-60},{235,-60},{235,-53},{359,-53}}));
        connect(CombustionSystem.EGT_c, Goto7.u) 
        annotation(Line(origin={0,0},
        points={{217,172},{232,172},{232,159},{232,152},{245,152}}));
        connect(CombustionSystem.EGT_c, EGT_c) 
        annotation(Line(origin={0,0},
        points={{217,172},{232,172},{232,165},{359,165}}));
        connect(CombustionSystem.'PM_kg/h', Goto13.u) 
        annotation(Line(origin={0,0},
        points={{217,-2},{234,-2},{234,-15},{234,-11},{245,-11}}));
        connect(CombustionSystem.'PM_kg/h', 'PM_kg/h') 
        annotation(Line(origin={0,0},
        points={{217,-2},{234,-2},{234,2},{359,2}}));
        connect(CombustionSystem.'ExhMassFlow_kg/h', Goto6.u) 
        annotation(Line(origin={0,0},
        points={{217,200},{231,200},{231,187},{231,178},{245,178}}));
        connect(CombustionSystem.'ExhMassFlow_kg/h', 'ExhMassFlow_kg/h') 
        annotation(Line(origin={0,0},
        points={{217,200},{231,200},{231,191},{359,191}}));
        connect(CombustionSystem.'HC_kg/h', Goto11.u) 
        annotation(Line(origin={0,0},
        points={{217,56},{234,56},{234,43},{245,43}}));
        connect(CombustionSystem.'HC_kg/h', 'HC_kg/h') 
        annotation(Line(origin={0,0},
        points={{217,56},{234,56},{359,56}}));
        connect(CombustionSystem.'CO_kg/h', Goto12.u) 
        annotation(Line(origin={0,0},
        points={{217,27},{233,27},{233,14},{233,16},{245,16}}));
        connect(CombustionSystem.'CO_kg/h', 'CO_kg/h') 
        annotation(Line(origin={0,0},
        points={{217,27},{233,27},{233,29},{359,29}}));
        connect(CombustionSystem.ExhPrs_kpa, Goto8.u) 
        annotation(Line(origin={0,0},
        points={{217,143},{234,143},{234,130},{234,125},{245,125}}));
        connect(CombustionSystem.ExhPrs_kpa, ExhPrs_kpa) 
        annotation(Line(origin={0,0},
        points={{217,143},{234,143},{234,138},{359,138}}));
        connect(CombustionSystem.'BSFC_kg/h', Goto14.u) 
        annotation(Line(origin={0,0},
        points={{217,-31},{235,-31},{235,-44},{235,-38},{245,-38}}));
        connect(CombustionSystem.'BSFC_kg/h', 'BSFC_kg/h') 
        annotation(Line(origin={0,0},
        points={{217,-31},{235,-31},{235,-25},{359,-25}}));
        connect(PostInj_Request, Goto18.u) 
        annotation(Line(origin={0,0},
        points={{-841,121},{-785,121}}));
        connect('Data Type Conversion'.y, 'Bus10Creator'.u1) 
        annotation(Line(origin={0,0},
        points={{573,191},{573,193},{748,193}}),Text(origin={660,196},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="PostInj_Request"))));
        connect('Data Type Conversion1'.y, 'Bus10Creator'.u2) 
        annotation(Line(origin={0,0},
        points={{573,171},{573,173},{748,173}}),Text(origin={660,176},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="FuelCyleTgt_mg"))));
        connect('Data Type Conversion2'.y, 'Bus10Creator'.u3) 
        annotation(Line(origin={0,0},
        points={{573,151},{573,153},{748,153}}),Text(origin={660,156},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="RailPrs_kpa"))));
        connect('Data Type Conversion3'.y, 'Bus10Creator'.u4) 
        annotation(Line(origin={0,0},
        points={{573,131},{573,133},{748,133}}),Text(origin={660,136},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="FuelCycle_mg"))));
        connect('Data Type Conversion8'.y, 'Bus10Creator'.u9) 
        annotation(Line(origin={0,0},
        points={{573,29},{573,33},{748,33}}),Text(origin={660,36},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="ExhMassFlow_kg"))));
        connect('Data Type Conversion9'.y, 'Bus10Creator'.u10) 
        annotation(Line(origin={0,0},
        points={{573,9},{573,13},{748,13}}),Text(origin={660,16},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EGT_c"))));
        connect('Data Type Conversion10'.y, 'Bus10Creator'.u11) 
        annotation(Line(origin={0,0},
        points={{573,-12},{573,-7},{748,-7}}),Text(origin={660,-4},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="ExhPrs_kpa"))));
        connect('Data Type Conversion11'.y, 'Bus10Creator'.u12) 
        annotation(Line(origin={0,0},
        points={{573,-32},{573,-27},{748,-27}}),Text(origin={660,-24},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="O2_pct"))));
        connect('Data Type Conversion14'.y, 'Bus10Creator'.u13) 
        annotation(Line(origin={0,0},
        points={{573,-53},{573,-47},{748,-47}}),Text(origin={660,-44},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="NOx_kg"))));
        connect('Data Type Conversion15'.y, 'Bus10Creator'.u14) 
        annotation(Line(origin={0,0},
        points={{573,-73},{573,-67},{748,-67}}),Text(origin={660,-64},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="HC_kg"))));
        connect('Data Type Conversion16'.y, 'Bus10Creator'.u15) 
        annotation(Line(origin={0,0},
        points={{573,-93},{573,-87},{748,-87}}),Text(origin={660,-84},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="CO_kg"))));
        connect('Data Type Conversion17'.y, 'Bus10Creator'.u16) 
        annotation(Line(origin={0,0},
        points={{573,-114},{573,-107},{748,-107}}),Text(origin={660,-104},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="PM_kg"))));
        connect('Data Type Conversion12'.y, 'Bus10Creator'.u17) 
        annotation(Line(origin={0,0},
        points={{573,-134},{573,-127},{748,-127}}),Text(origin={660,-124},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="BSFC_kg"))));
        connect('Data Type Conversion13'.y, 'Bus10Creator'.u18) 
        annotation(Line(origin={0,0},
        points={{573,-155},{573,-147},{748,-147}}),Text(origin={660,-144},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EngineTrq_Nm"))));
        connect('Data Type Conversion18'.y, 'Bus10Creator'.u19) 
        annotation(Line(origin={0,0},
        points={{573,-175},{573,-167},{748,-167}}),Text(origin={660,-164},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EngineSpd_rpm"))));
        connect('Data Type Conversion4'.y, 'Bus10Creator'.u5) 
        annotation(Line(origin={0,0},
        points={{573,111},{573,113},{748,113}}),Text(origin={660,116},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="IntakeMass_kg"))));
        connect('Data Type Conversion5'.y, 'Bus10Creator'.u6) 
        annotation(Line(origin={0,0},
        points={{573,90},{573,93},{748,93}}),Text(origin={660,96},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="IntakeTemp_c"))));
        connect('Data Type Conversion6'.y, 'Bus10Creator'.u7) 
        annotation(Line(origin={0,0},
        points={{573,70},{573,73},{748,73}}),Text(origin={660,76},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="IntakePrs_kpa"))));
        connect('Data Type Conversion7'.y, 'Bus10Creator'.u8) 
        annotation(Line(origin={0,0},
        points={{573,49},{573,53},{748,53}}),Text(origin={660,56},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EGRRatio"))));
        connect('Bus10Creator'.y, 'To Workspace'.inport) 
        annotation(Line(origin={0,0},
        points={{760,8},{760,9},{806,9}}));
        connect(From.y, 'Data Type Conversion'.u) 
        annotation(Line(origin={0,0},
        points={{472,190},{472,191},{527,191}}),Text(origin={499,194},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="PostInj_Request"))));
        connect(From1.y, 'Data Type Conversion1'.u) 
        annotation(Line(origin={0,0},
        points={{472,172},{472,171},{527,171}}),Text(origin={499,174},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="FuelCyleTgt_mg"))));
        connect(From2.y, 'Data Type Conversion2'.u) 
        annotation(Line(origin={0,0},
        points={{472,152},{472,151},{527,151}}),Text(origin={499,154},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="RailPrs_kpa"))));
        connect(From3.y, 'Data Type Conversion3'.u) 
        annotation(Line(origin={0,0},
        points={{472,132},{472,131},{527,131}}),Text(origin={499,134},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="FuelCycle_mg"))));
        connect(From4.y, 'Data Type Conversion4'.u) 
        annotation(Line(origin={0,0},
        points={{468,111},{527,111}}),Text(origin={497,114},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="IntakeMass_kg"))));
        connect(From5.y, 'Data Type Conversion5'.u) 
        annotation(Line(origin={0,0},
        points={{468,91},{468,90},{527,90}}),Text(origin={497,93},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="IntakeTemp_c"))));
        connect(From6.y, 'Data Type Conversion6'.u) 
        annotation(Line(origin={0,0},
        points={{468,70},{527,70}}),Text(origin={497,73},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="IntakePrs_kpa"))));
        connect(From7.y, 'Data Type Conversion7'.u) 
        annotation(Line(origin={0,0},
        points={{468,50},{468,49},{527,49}}),Text(origin={497,52},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EGRRatio"))));
        connect(From8.y, 'Data Type Conversion8'.u) 
        annotation(Line(origin={0,0},
        points={{472,30},{472,29},{527,29}}),Text(origin={499,32},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="ExhMassFlow_kg"))));
        connect(From9.y, 'Data Type Conversion9'.u) 
        annotation(Line(origin={0,0},
        points={{472,9},{527,9}}),Text(origin={499,12},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EGT_c"))));
        connect(From10.y, 'Data Type Conversion10'.u) 
        annotation(Line(origin={0,0},
        points={{472,-11},{472,-12},{527,-12}}),Text(origin={499,-9},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="ExhPrs_kpa"))));
        connect(From11.y, 'Data Type Conversion11'.u) 
        annotation(Line(origin={0,0},
        points={{472,-32},{527,-32}}),Text(origin={499,-29},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="O2_pct"))));
        connect(From12.y, 'Data Type Conversion14'.u) 
        annotation(Line(origin={0,0},
        points={{472,-52},{472,-53},{527,-53}}),Text(origin={499,-50},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="NOx_kg"))));
        connect(From13.y, 'Data Type Conversion15'.u) 
        annotation(Line(origin={0,0},
        points={{472,-72},{472,-73},{527,-73}}),Text(origin={499,-70},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="HC_kg"))));
        connect(From14.y, 'Data Type Conversion16'.u) 
        annotation(Line(origin={0,0},
        points={{472,-93},{527,-93}}),Text(origin={499,-90},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="CO_kg"))));
        connect(From15.y, 'Data Type Conversion17'.u) 
        annotation(Line(origin={0,0},
        points={{472,-113},{472,-114},{527,-114}}),Text(origin={499,-111},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="PM_kg"))));
        connect(From16.y, 'Data Type Conversion12'.u) 
        annotation(Line(origin={0,0},
        points={{472,-134},{527,-134}}),Text(origin={499,-131},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="BSFC_kg"))));
        connect(From17.y, 'Data Type Conversion13'.u) 
        annotation(Line(origin={0,0},
        points={{472,-154},{472,-155},{527,-155}}),Text(origin={499,-152},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EngineTrq_Nm"))));
        connect(From18.y, 'Data Type Conversion18'.u) 
        annotation(Line(origin={0,0},
        points={{472,-174},{472,-175},{527,-175}}),Text(origin={499,-172},extent={{0,-3},{0,3}},textString="%signal",fontSize=12),__MWORKS(BlockSystem(NamedSignal(name="EngineSpd_rpm"))));
        end ThermalModel_type;
    equation
      connect(FuelCyleTgt_mg, ThermalModel.FuelCyleTgt_mg) 
      annotation(Line(origin={0,0},
      points={{-340,301},{-147,301},{-147,-248},{-266,-248}}));
      connect(LoadTrq_Nm, ThermalModel.LoadTrq_Nm) 
      annotation(Line(origin={0,0},
      points={{-347,-45},{-347,160},{-266,160}}));
      connect(EGROpeningTgt_pct, ThermalModel.EGROpeningTgt_pct) 
      annotation(Line(origin={0,0},
      points={{-340,278},{-198,278},{-198,-112},{-266,-112}}));
      connect(ThermalModel.RailPrs_kpa, RailPrs_kpa) 
      annotation(Line(origin={0,0},
      points={{-102,143},{-102,142},{-4,142}}));
      connect(ThermalModel.FuelCycle_mg, FuelCyle_g) 
      annotation(Line(origin={0,0},
      points={{-102,211},{-102,210},{-4,210}}));
      connect(ThermalModel.EGRRatio, EGRRatio) 
      annotation(Line(origin={0,0},
      points={{-102,177},{-102,176},{-4,176}}));
      connect(ThermalModel.IntakePrs_kpa, Terminator1.x) 
      annotation(Line(origin={0,0},
      points={{-102,75},{-102,72},{-18,72}}));
      connect(ThermalModel.EngineTrq_Nm, EngineTrq_Nm) 
      annotation(Line(origin={0,0},
      points={{-102,41},{-102,40},{-4,40}}));
      connect(ThermalModel.EngineSpd_rpm, EngineSpd_rpm) 
      annotation(Line(origin={0,0},
      points={{-102,7},{-102,6},{-4,6}}));
      connect(ThermalModel.EGT_c, AftertreatmentModel.EGT_c) 
      annotation(Line(origin={0,0},
      points={{-102,-95},{-102,-87},{98,-87}}));
      connect(ThermalModel.'ExhMassFlow_kg/h', AftertreatmentModel.'ExhMassFlow_kg/h') 
      annotation(Line(origin={0,0},
      points={{-102,-61},{-102,-60},{98,-60}}));
      connect(ThermalModel.O2_pct, AftertreatmentModel.O2_pct) 
      annotation(Line(origin={0,0},
      points={{-102,-163},{-102,-140},{98,-140}}));
      connect(ThermalModel.'PM_kg/h', AftertreatmentModel.'PM_kg/h') 
      annotation(Line(origin={0,0},
      points={{-102,-299},{-102,-248},{98,-248}}));
      connect(ThermalModel.'HC_kg/h', AftertreatmentModel.'HC_kg/h') 
      annotation(Line(origin={0,0},
      points={{-102,-231},{-102,-194},{98,-194}}));
      connect(ThermalModel.'CO_kg/h', AftertreatmentModel.'CO_kg/h') 
      annotation(Line(origin={0,0},
      points={{-102,-265},{-102,-221},{98,-221}}));
      connect(ThermalModel.ExhPrs_kpa, AftertreatmentModel.ExhPrs_kpa) 
      annotation(Line(origin={0,0},
      points={{-102,-129},{-102,-113},{98,-113}}));
      connect(ThermalModel.'NOx_kg/h', AftertreatmentModel.'NOx_kg/h') 
      annotation(Line(origin={0,0},
      points={{-102,-197},{-102,-167},{98,-167}}));
      connect(ThermalModel.'IntakeMass_kg/h', 'IntakeMass_kg/h') 
      annotation(Line(origin={0,0},
      points={{-102,109},{-102,108},{-4,108}}));
      connect(DPF_regen_req, AftertreatmentModel.DPF_regen_req) 
      annotation(Line(origin={0,0},
      points={{58,278},{211,278},{211,-302},{98,-302}}));
      connect(AftertreatmentModel.ExhTemp_DOC_in, ExhTemp_DOC_in) 
      annotation(Line(origin={0,0},
      points={{270,-58},{270,-62},{346,-62}}));
      connect(AftertreatmentModel.ExhTemp_DOC_out, ExhTemp_DOC_out) 
      annotation(Line(origin={0,0},
      points={{270,-82},{270,-86},{346,-86}}));
      connect(AftertreatmentModel.ExhTemp_DPF_out, ExhTemp_DPF_out) 
      annotation(Line(origin={0,0},
      points={{270,-106},{270,-110},{346,-110}}));
      connect(AftertreatmentModel.ExhTemp_SCR_out, ExhTemp_SCR_out) 
      annotation(Line(origin={0,0},
      points={{270,-130},{270,-133},{346,-133}}));
      connect(AftertreatmentModel.ExhMassFlow, ExhMassFlow) 
      annotation(Line(origin={0,0},
      points={{270,-154},{270,-157},{346,-157}}));
      connect(AftertreatmentModel.mNOx_SCR_in, mNOx_SCR_in) 
      annotation(Line(origin={0,0},
      points={{270,-178},{270,-181},{346,-181}}));
      connect(AftertreatmentModel.mNOx_SCR_out, mNOx_SCR_out) 
      annotation(Line(origin={0,0},
      points={{270,-202},{270,-204},{346,-204}}));
      connect(AftertreatmentModel.Soot_Load, Soot_Load) 
      annotation(Line(origin={0,0},
      points={{270,-226},{270,-228},{346,-228}}));
      connect(AftertreatmentModel.DPF_DP, DPF_DP) 
      annotation(Line(origin={0,0},
      points={{270,-250},{270,-252},{346,-252}}));
      connect(AftertreatmentModel.NH3_Store, NH3_Store) 
      annotation(Line(origin={0,0},
      points={{270,-274},{270,-276},{346,-276}}));
      connect(AftertreatmentModel.O2_frac, O2_frac) 
      annotation(Line(origin={0,0},
      points={{270,-298},{270,-300},{346,-300}}));
      connect(mUREA_target, AftertreatmentModel.mUREA_target) 
      annotation(Line(origin={0,0},
      points={{61,233},{129,233},{129,-275},{98,-275}}));
      connect(ThermalModel.'BSFC_kg/h', Terminator.x) 
      annotation(Line(origin={0,0},
      points={{-102,-27},{-102,-30},{-14,-30}}));
      connect(PostInj_Request, ThermalModel.PostInj_Request) 
      annotation(Line(origin={0,0},
      points={{-340,247},{-249,247},{-249,24},{-266,24}}));
      end Engine_type;
  equation
    connect(Engine.EngineTrq_Nm, Goto.u) 
    annotation(Line(origin={0,0},
    points={{270,241},{307,241},{307,235},{343,235}}));
    connect(Engine.EngineTrq_Nm, EngineTrq_Nm) 
    annotation(Line(origin={0,0},
    points={{270,241},{307,241},{307,258},{307,252},{432,252}}));
    connect(Engine.'IntakeMass_kg/h', Goto3.u) 
    annotation(Line(origin={0,0},
    points={{270,86},{270,82},{336,82}}));
    connect(ECU.EGROpeningTgt_pct, Engine.EGROpeningTgt_pct) 
    annotation(Line(origin={0,0},
    points={{-83,95},{-57,95},{-57,125},{-57,124},{118,124}}));
    connect(Engine.EngineSpd_rpm, Goto1.u) 
    annotation(Line(origin={0,0},
    points={{270,210},{270,204},{340,204}}));
    connect(ECU.FuelCyleTgt_mg, Engine.FuelCyleTgt_mg) 
    annotation(Line(origin={0,0},
    points={{-83,201},{-69,201},{-69,214},{-69,212},{118,212}}));
    connect(Engine.FuelCyle_g, Goto2.u) 
    annotation(Line(origin={0,0},
    points={{270,179},{270,174},{347,174}}));
    connect(ECU.DPF_regen_req, Engine.DPF_regen_req) 
    annotation(Line(origin={0,0},
    points={{-83,-117},{-17,-117},{-17,-53},{-17,-52},{118,-52}}));
    connect(ECU.mUREA_target, Engine.mUREA_target) 
    annotation(Line(origin={0,0},
    points={{-83,-223},{16,-223},{16,-142},{16,-140},{118,-140}}));
    connect(Engine.EGRRatio, Goto4.u) 
    annotation(Line(origin={0,0},
    points={{270,148},{270,143},{347,143}}));
    connect(Engine.RailPrs_kpa, Goto9.u) 
    annotation(Line(origin={0,0},
    points={{270,117},{270,113},{347,113}}));
    connect(Engine.ExhTemp_DOC_in, Goto10.u) 
    annotation(Line(origin={0,0},
    points={{270,55},{270,51},{308,51}}));
    connect(Engine.ExhTemp_DOC_out, Goto11.u) 
    annotation(Line(origin={0,0},
    points={{270,24},{270,21},{302,21}}));
    connect(Engine.ExhTemp_SCR_out, Goto13.u) 
    annotation(Line(origin={0,0},
    points={{270,-38},{270,-40},{302,-40}}));
    connect(Engine.ExhTemp_DPF_out, Goto12.u) 
    annotation(Line(origin={0,0},
    points={{270,-7},{270,-10},{302,-10}}));
    connect(Engine.Soot_Load, Goto16.u) 
    annotation(Line(origin={0,0},
    points={{270,-162},{270,-163},{340,-163}}));
    connect(Engine.DPF_DP, Goto17.u) 
    annotation(Line(origin={0,0},
    points={{270,-193},{347,-193}}));
    connect(Engine.mNOx_SCR_out, Goto15.u) 
    annotation(Line(origin={0,0},
    points={{270,-131},{270,-132},{316,-132}}));
    connect(Engine.mNOx_SCR_in, Goto14.u) 
    annotation(Line(origin={0,0},
    points={{270,-100},{270,-102},{322,-102}}));
    connect(Engine.ExhMassFlow, Goto18.u) 
    annotation(Line(origin={0,0},
    points={{270,-69},{270,-71},{329,-71}}));
    connect(Engine.O2_frac, Goto20.u) 
    annotation(Line(origin={0,0},
    points={{270,-255},{308,-255}}));
    connect(Engine.NH3_Store, Goto19.u) 
    annotation(Line(origin={0,0},
    points={{270,-224},{340,-224}}));
    connect('Unit Delay2'.y, ECU.EngineSpd_rpm) 
    annotation(Line(origin={0,0},
    points={{-288,232},{-288,239},{-245,239}}));
    connect(From10.y, 'Unit Delay2'.u1) 
    annotation(Line(origin={0,0},
    points={{-386,232},{-320,232}}));
    connect(From9.y, 'Unit Delay3'.u1) 
    annotation(Line(origin={0,0},
    points={{-392,201},{-320,201}}));
    connect('Unit Delay3'.y, ECU.FuleCyle_mg) 
    annotation(Line(origin={0,0},
    points={{-288,201},{-288,208},{-245,208}}));
    connect('Unit Delay5'.y, ECU.RailPrs_kpa) 
    annotation(Line(origin={0,0},
    points={{-288,140},{-288,146},{-245,146}}));
    connect(From16.y, 'Unit Delay5'.u1) 
    annotation(Line(origin={0,0},
    points={{-392,140},{-320,140}}));
    connect(From11.y, 'Unit Delay4'.u1) 
    annotation(Line(origin={0,0},
    points={{-392,170},{-320,170}}));
    connect('Unit Delay4'.y, ECU.EGRRatio) 
    annotation(Line(origin={0,0},
    points={{-288,170},{-288,177},{-245,177}}));
    connect('Unit Delay8'.y, ECU.ExhTemp_DOC_out) 
    annotation(Line(origin={0,0},
    points={{-288,48},{-288,53},{-245,53}}));
    connect(From17.y, 'Unit Delay8'.u1) 
    annotation(Line(origin={0,0},
    points={{-348,48},{-320,48}}));
    connect(From18.y, 'Unit Delay9'.u1) 
    annotation(Line(origin={0,0},
    points={{-348,17},{-320,17}}));
    connect('Unit Delay9'.y, ECU.ExhTemp_DPF_out) 
    annotation(Line(origin={0,0},
    points={{-288,17},{-288,22},{-245,22}}));
    connect('Unit Delay7'.y, ECU.ExhTemp_DOC_in) 
    annotation(Line(origin={0,0},
    points={{-288,79},{-288,84},{-245,84}}));
    connect(From12.y, 'Unit Delay7'.u1) 
    annotation(Line(origin={0,0},
    points={{-355,79},{-320,79}}));
    connect(From15.y, 'Unit Delay6'.u1) 
    annotation(Line(origin={0,0},
    points={{-382,109},{-320,109}}));
    connect('Unit Delay6'.y, ECU.IntakeMass) 
    annotation(Line(origin={0,0},
    points={{-288,109},{-288,115},{-245,115}}));
    connect('Unit Delay14'.y, ECU.DPF_SootLoad) 
    annotation(Line(origin={0,0},
    points={{-288,-136},{-288,-133},{-245,-133}}));
    connect(From26.y, 'Unit Delay14'.u1) 
    annotation(Line(origin={0,0},
    points={{-386,-136},{-320,-136}}));
    connect(From27.y, 'Unit Delay15'.u1) 
    annotation(Line(origin={0,0},
    points={{-392,-166},{-320,-166}}));
    connect('Unit Delay15'.y, ECU.DPF_DP) 
    annotation(Line(origin={0,0},
    points={{-288,-166},{-288,-164},{-245,-164}}));
    connect('Unit Delay17'.y, ECU.O2_frac) 
    annotation(Line(origin={0,0},
    points={{-288,-227},{-288,-226},{-245,-226}}));
    connect(From29.y, 'Unit Delay17'.u1) 
    annotation(Line(origin={0,0},
    points={{-355,-227},{-320,-227}}));
    connect(From28.y, 'Unit Delay16'.u1) 
    annotation(Line(origin={0,0},
    points={{-386,-197},{-320,-197}}));
    connect('Unit Delay16'.y, ECU.NH3_Store) 
    annotation(Line(origin={0,0},
    points={{-288,-197},{-288,-195},{-245,-195}}));
    connect('Unit Delay12'.y, ECU.mNOx_SCR_in) 
    annotation(Line(origin={0,0},
    points={{-288,-74},{-288,-71},{-245,-71}}));
    connect(From23.y, 'Unit Delay12'.u1) 
    annotation(Line(origin={0,0},
    points={{-369,-74},{-320,-74}}));
    connect(From25.y, 'Unit Delay13'.u1) 
    annotation(Line(origin={0,0},
    points={{-362,-105},{-320,-105}}));
    connect('Unit Delay13'.y, ECU.mNOx_SCR_out) 
    annotation(Line(origin={0,0},
    points={{-288,-105},{-288,-102},{-245,-102}}));
    connect('Unit Delay11'.y, ECU.ExhMassFlow) 
    annotation(Line(origin={0,0},
    points={{-288,-44},{-288,-40},{-245,-40}}));
    connect(From22.y, 'Unit Delay11'.u1) 
    annotation(Line(origin={0,0},
    points={{-375,-44},{-320,-44}}));
    connect(From19.y, 'Unit Delay10'.u1) 
    annotation(Line(origin={0,0},
    points={{-348,-13},{-320,-13}}));
    connect('Unit Delay10'.y, ECU.ExhTemp_SCR_out) 
    annotation(Line(origin={0,0},
    points={{-288,-13},{-288,-9},{-245,-9}}));
    connect('ThrottleCmd [-]', ECU.'ThrottleCmd [-]') 
    annotation(Line(origin={0,0},
    points={{-432,-258},{-432,-257},{-245,-257}}));
    connect(LoadTrq_Nm, Engine.LoadTrq_Nm) 
    annotation(Line(origin={0,0},
    points={{61,-231},{61,-228},{118,-228}}));
    connect(ECU.PostInj_Request, Engine.PostInj_Request) 
    annotation(Line(origin={0,0},
    points={{-83,-11},{-50,-11},{-50,36},{118,36}}));
    end Engine_type;
  Engine_type Engine 
    annotation (Placement(transformation(origin = {10.000000, -34.000000}, extent = {{-66.000000, -39.000000}, {66.000000, 39.000000}},rotation=0)),__MWORKS(PortLabels(labelType="PortName"),ComponentMask(backgroundColor={232,209,82})));
  Scope_type Scope 
    annotation (Placement(transformation(origin = {114.000000, 36.000000}, extent = {{-10.000000, -23.000000}, {10.000000, 23.000000}},rotation=0)));
  SysplorerEmbeddedCoder.Sources.SineWave 'Sine Wave'(sineType=SysplorerEmbeddedCoder.MathOperation.SineWaveFunction.SineType.timeBased,timeSource=SysplorerEmbeddedCoder.MathOperation.SineWaveFunction.TimeSourceType.simulationTime,amplitude=5,bias=100,frequency=1,phase=0) 
    annotation (Placement(transformation(origin = {-114.000000, -52.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=0)));
  SysplorerEmbeddedCoder.Sources.Step Step(stepTime=5,initialValue=0,finalValue=0.5) 
    annotation (Placement(transformation(origin = {-114.000000, -15.000000}, extent = {{-10.000000, -10.000000}, {10.000000, 10.000000}},rotation=0)),__MWORKS(BlockSystem(SampleTime(auto=false)=0,Instance(y(Type(inherit=InheritType.none,ref="double"))))));
  block Scope_type "示波器
显示仿真过程中生成的信号。"

    parameter String displayFormat = "y(t)" annotation(HideResult = true);

    parameter String showOnSimulator = "false" annotation(HideResult = true);
    SysplorerEmbeddedCoder.Types.InputAuto u1 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
    SysplorerEmbeddedCoder.Types.InputAuto u2 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));
    SysplorerEmbeddedCoder.Types.InputAuto u3 annotation(Placement(transformation(origin = { -110,0 },extent = { { -10,-10 },{ 10,10 } }),iconTransformation(origin = { -101.8,0 },extent = { { -1.8,-1.8 },{ 1.8,1.8 } })));

    annotation(defaultComponentName = "scope", __MWORKS(BlockSystem(blockKind=Types.BlockKind.atomic, bltBlockKind=Types.BltBlockKind.scope),PortArrangement(Left(u1, u2, u3)),sourceModel=SysplorerEmbeddedCoder.Utilities.Scope,independentInstance=true,hide=true), Icon(coordinateSystem(extent={{-100,-100},{100,100}},
  grid={2,2}),graphics = {Rectangle(origin={0,0},
  fillColor={255,255,255},
  fillPattern=FillPattern.Solid,
  lineThickness=3,
  frame=true,
  extent={{-100,100},{100,-100}},
  rotationPolicy=RotationPolicy.Follow), Rectangle(origin={1,54.5},
  fillColor={255,255,255},
  fillPattern=FillPattern.Solid,
  lineThickness=2,
  extent={{-79,24.5},{79,-24.5}},
  radius=10), Text(origin={0,-120},
  lineColor={0,0,0},
  extent={{0,-20},{0,20}},
  textString="%name",
  fontSize=14,
  textStyle={TextStyle.None},
  textColor={0,0,0},
  verticalAlignment=TextAlignment.Top)},rotationPolicy=RotationPolicy.Ignore),Protection(access=Access.packageDuplicate));

  end Scope_type;
equation
  connect('Sine Wave'.y, Scope.u2) 
  annotation(Line(origin={0,0},
  points={{-99,-52},{-81,-52},{-81,36},{-81,37},{99,37}}));
  connect('Sine Wave'.y, Engine.LoadTrq_Nm) 
  annotation(Line(origin={0,0},
  points={{-99,-52},{-81,-52},{-81,-53},{-61,-53}}));
  connect(Step.y, Scope.u1) 
  annotation(Line(origin={0,0},
  points={{-99,-15},{-89,-15},{-89,49},{-89,52},{99,52}}));
  connect(Step.y, Engine.'ThrottleCmd [-]') 
  annotation(Line(origin={0,0},
  points={{-99,-15},{-89,-15},{-89,-14},{-61,-14}}));
  connect(Engine.EngineTrq_Nm, Scope.u3) 
  annotation(Line(origin={0,0},
  points={{81,-34},{91,-34},{91,23},{91,22},{99,22}}));
  connect(Engine.ECU.Goto2.y, Engine.ECU.From.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="EngineSpd_rpm"))));
  connect(Engine.ECU.Goto2.y, Engine.ECU.From1.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="EngineSpd_rpm"))));
  connect(Engine.Engine.AftertreatmentModel.SCR.Goto.y, Engine.Engine.AftertreatmentModel.SCR.From1.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="DPF_Temp_c"))));
  connect(Engine.Engine.AftertreatmentModel.SCR.Goto1.y, Engine.Engine.AftertreatmentModel.SCR.From2.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="DPF_Flow"))));
  connect(Engine.Engine.ThermalModel.CombustionSystem.Goto.y, Engine.Engine.ThermalModel.CombustionSystem.From.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="FuelCycle"))));
  connect(Engine.Engine.ThermalModel.CombustionSystem.Goto1.y, Engine.Engine.ThermalModel.CombustionSystem.From1.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="EngineTrq"))));
  connect(Engine.Engine.ThermalModel.CombustionSystem.Goto2.y, Engine.Engine.ThermalModel.CombustionSystem.From2.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="EnginePwr_kw"))));
  connect(Engine.Engine.ThermalModel.Goto18.y, Engine.Engine.ThermalModel.From.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="PostInj_Request"))));
  connect(Engine.Engine.ThermalModel.Goto17.y, Engine.Engine.ThermalModel.From1.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="FuelCyleTgt_mg"))));
  connect(Engine.Engine.ThermalModel.Goto8.y, Engine.Engine.ThermalModel.From10.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="ExhPrs_kpa"))));
  connect(Engine.Engine.ThermalModel.Goto9.y, Engine.Engine.ThermalModel.From11.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="O2_pct"))));
  connect(Engine.Engine.ThermalModel.Goto10.y, Engine.Engine.ThermalModel.From12.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="NOx_kg"))));
  connect(Engine.Engine.ThermalModel.Goto11.y, Engine.Engine.ThermalModel.From13.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="HC_kg"))));
  connect(Engine.Engine.ThermalModel.Goto12.y, Engine.Engine.ThermalModel.From14.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="CO_kg"))));
  connect(Engine.Engine.ThermalModel.Goto13.y, Engine.Engine.ThermalModel.From15.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="PM_kg"))));
  connect(Engine.Engine.ThermalModel.Goto14.y, Engine.Engine.ThermalModel.From16.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="BSFC_kg"))));
  connect(Engine.Engine.ThermalModel.Goto15.y, Engine.Engine.ThermalModel.From17.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="EngineTrq_Nm"))));
  connect(Engine.Engine.ThermalModel.Goto16.y, Engine.Engine.ThermalModel.From18.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="EngineSpd_rpm"))));
  connect(Engine.Engine.ThermalModel.Goto.y, Engine.Engine.ThermalModel.From2.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="RailPrs_kpa"))));
  connect(Engine.Engine.ThermalModel.Goto1.y, Engine.Engine.ThermalModel.From3.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="FuelCycle_mg"))));
  connect(Engine.Engine.ThermalModel.Goto2.y, Engine.Engine.ThermalModel.From4.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="IntakeMass_kg"))));
  connect(Engine.Engine.ThermalModel.Goto3.y, Engine.Engine.ThermalModel.From5.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="IntakeTemp_c"))));
  connect(Engine.Engine.ThermalModel.Goto4.y, Engine.Engine.ThermalModel.From6.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="IntakePrs_kpa"))));
  connect(Engine.Engine.ThermalModel.Goto5.y, Engine.Engine.ThermalModel.From7.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="EGRRatio"))));
  connect(Engine.Engine.ThermalModel.Goto6.y, Engine.Engine.ThermalModel.From8.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="ExhMassFlow_kg"))));
  connect(Engine.Engine.ThermalModel.Goto7.y, Engine.Engine.ThermalModel.From9.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="EGT_c"))));
  connect(Engine.Goto1.y, Engine.From10.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="EngineSpd"))));
  connect(Engine.Goto4.y, Engine.From11.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="EGRRatio"))));
  connect(Engine.Goto10.y, Engine.From12.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="ExhTemp_DOC_in"))));
  connect(Engine.Goto3.y, Engine.From15.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="IntakeMass"))));
  connect(Engine.Goto9.y, Engine.From16.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="RailPrs_kpa"))));
  connect(Engine.Goto11.y, Engine.From17.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="ExhTemp_DOC_out"))));
  connect(Engine.Goto12.y, Engine.From18.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="ExhTemp_DPF_out"))));
  connect(Engine.Goto13.y, Engine.From19.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="ExhTemp_SCR_out"))));
  connect(Engine.Goto18.y, Engine.From22.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="ExhMassFlow"))));
  connect(Engine.Goto14.y, Engine.From23.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="mNOx_SCR_in"))));
  connect(Engine.Goto15.y, Engine.From25.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="mNOx_SCR_out"))));
  connect(Engine.Goto16.y, Engine.From26.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="Soot_Load"))));
  connect(Engine.Goto17.y, Engine.From27.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="DPF_DP"))));
  connect(Engine.Goto19.y, Engine.From28.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="NH3_Store"))));
  connect(Engine.Goto20.y, Engine.From29.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="O2_frac"))));
  connect(Engine.Goto2.y, Engine.From9.u) annotation(__MWORKS(BlockSystem(GotoFromConnection = true, GotoTag(tagName="FuelCyle"))));

end MyEngine20261109;