<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HealthTracker.aspx.cs" Inherits="WebSampleBrowser.Dashboard.HealthTracker" %>

<%@ Register Assembly="Syncfusion.EJ.Web" TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" %>
<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.Models" TagPrefix="cc1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Essential JS1 ASP.NET Web Form | Showcase Sample | Health Tracker</title>
	<meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta name="description" content="The ASP.NET Web Forms Health Tracker application is used to track and visualize your health details such as food intake and activity history.">
    <link rel="shortcut icon" href='<%= Page.ResolveClientUrl("~/Content/images/favicon.ico")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/ej.widgets.core.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/default-theme/ej.theme.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/bootstrap.min.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/responsive-css/ej.responsive.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/ejthemes/responsive-css/ejgrid.responsive.css")%>' />
    <link rel="stylesheet" href='<%= Page.ResolveClientUrl("~/Content/Dashboard/health-tracker/healthtracker.css" )%>' />
    <link rel="stylesheet" media="screen and (max-width: 100%)" href='<%= Page.ResolveClientUrl("~/Content/Dashboard/health-tracker/healthtracker.css" )%>' />
    <!--[if lt IE 9]>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-1.11.3.min.js")%>' type="text/javascript"></script>
    <![endif]-->
    <!--[if gte IE 9]><!-->
   <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery-3.4.1.min.js")%>' type="text/javascript"></script>
    <!--<![endif]-->
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery.globalize.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery.validate.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsrender.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jsondata.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/respond.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.web.all.min.js")%>' type="text/javascript"></script>    
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/ej.webform.min.js")%>' type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="stepAnnotation" style="display: none">
            <img style="width: 130px; height: 130px" src="../Content/Dashboard/health-tracker/images/step.png" alt="Step"/>
        </div>
        <div id="floorAnnotation" style="display: none">
            <img style="width: 130px; height: 130px" src="../Content/Dashboard/health-tracker/images/floor.png" alt="Floor"/>
        </div>
        <div class="trackerheader">
            <div class="sampleheader container">
                <div class="col-xs-12">
                    <div class="title">
                        <img class="heartsym" src="../Content/Dashboard/health-tracker/images/heart-img.png" alt="Heart" />
                        <h1 class="healthtext">Health Tracker</h1>
                    </div>
                    <div>
                        <div class="boardpicdiv">
                            <div class="dashboardpic">
                                <b>Dashboard</b>
                            </div>
                        </div>
                        <div class="nopicdiv">
                            <div class="nopic">
                                <b>4</b>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="samplecontainer container">
            <div class="row"></div>
            <div id="heading row">
                <div class="col-xs-6">
                    <img class="personpic" src="../Content/Dashboard/health-tracker/images/person.png" alt="Person"/>
                    <p class="persondet">
                        <br />
                        <b>Andrew Fuller</b><br />
                        34 years / 175 cm
                    </p>
                    <img class="personsym" src="../Content/Dashboard/health-tracker/images/personimg.png" alt="Person Symbol"/>
                </div>
                <div class="col-xs-6">
                    <div class="bmiwight">
                        <div class="bmidiv">
                            <label>BMI</label>
                            <div class="bmi">
                                <b>21.7</b><br />
                                <label>Kg/m2</label>
                            </div>
                        </div>
                        <div class="weightdiv">
                            <label>Weight</label>
                            <div class="weight">
                                <b>72.3</b><br />
                                <label>Kg</label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row"></div>
            <div class="row topspace">
                <div class="col-md-12 titlecss">Today</div>
            </div>
            <div class="row" id="todayDetails">
                <div class="col-md-6 ptiles">
                    <div class="col-sm-6  gauge1">
                        <ej:CircularGauge runat="server" ID="GaugeRDI" BackgroundColor="transparent" Width="170" Height="155" DistanceFromCorner="-5" GaugePosition="BottomCenter">
                            <Frame FrameType="HalfCircle" />
                            <Scales>
                                <ej:CircularScales StartAngle="182" ShowRanges="true" ShowLabels="False" SweepAngle="176" Radius="120" Minimum="0" Maximum="2200"
                                    MajorIntervalValue="200">
                                    <PointerCap BorderColor="#3AB54B" BackgroundColor="#3AB54B"></PointerCap>
                                    <PointerCollection>
                                        <ej:Pointers NeedleType="Rectangle" Value="450" Length="70" Width="1">
                                            <Border Color="#3AB54B"></Border>
                                        </ej:Pointers>
                                    </PointerCollection>
                                    <TickCollection>
                                        <ej:CircularTicks Height="16" Width="3" Color="#FFFFFF" />
                                        <ej:CircularTicks Height="7" Width="1" Color="#FFFFFF" />
                                    </TickCollection>
                                    <LabelCollection>
                                        <ej:CircularLabels Color="#8c8c8c"></ej:CircularLabels>
                                    </LabelCollection>
                                    <RangeCollection>
                                        <ej:CircularRanges StartValue="0" EndValue="449" Size="10" BackgroundColor="#3AB54B">
                                            <Border Color="#3Ab54B"></Border>
                                        </ej:CircularRanges>
                                        <ej:CircularRanges BackgroundColor="#B0D2C8" Size="10" StartValue="449" EndValue="2200">
                                            <Border Color="#B0D2C8"></Border>
                                        </ej:CircularRanges>
                                    </RangeCollection>
                                </ej:CircularScales>
                            </Scales>
                        </ej:CircularGauge>
                        <br />
                        <label class="todaylabel rdilabel">Calories Intake - 450/2200</label>
                        <br />
                        <label class="pending todaylabel rdipenlabel">1750 calories pending</label>
                    </div>
                    <div class="col-sm-6 gauge2">
                        <ej:CircularGauge runat="server" ID="GaugeBurnt" BackgroundColor="transparent" Width="170" Height="155" DistanceFromCorner="-5" GaugePosition="BottomCenter">
                            <Frame FrameType="HalfCircle" />
                            <Scales>
                                <ej:CircularScales StartAngle="182" ShowRanges="true" ShowLabels="False" SweepAngle="176" Radius="120" Minimum="0" Maximum="1000"
                                    MajorIntervalValue="200">
                                    <PointerCap BorderColor="#b24848" BackgroundColor="#b24848"></PointerCap>
                                    <PointerCollection>
                                        <ej:Pointers NeedleType="Rectangle" Value="650" Length="70" Width="1">
                                            <Border Color="#b24848"></Border>
                                        </ej:Pointers>
                                    </PointerCollection>
                                    <TickCollection>
                                        <ej:CircularTicks Height="16" Width="3" Color="#FFFFFF" />
                                        <ej:CircularTicks Height="7" Width="1" Color="#FFFFFF" />
                                    </TickCollection>
                                    <LabelCollection>
                                        <ej:CircularLabels Color="#8c8c8c"></ej:CircularLabels>
                                    </LabelCollection>
                                    <RangeCollection>
                                        <ej:CircularRanges StartValue="0" EndValue="649" Size="10" BackgroundColor="#b24848">
                                            <Border Color="#c98c8b"></Border>
                                        </ej:CircularRanges>
                                        <ej:CircularRanges BackgroundColor="#C9A5A6" Size="10" StartValue="649" EndValue="1000">
                                            <Border Color="#C9A5A6"></Border>
                                        </ej:CircularRanges>
                                    </RangeCollection>
                                </ej:CircularScales>
                            </Scales>
                        </ej:CircularGauge>
                        <br />
                        <label class="todaylabel">Calories burnt - 650/1000</label>
                        <br />
                        <label class="todaylabel pending">350 calories pending</label>
                    </div>
                </div>
                <div class="col-md-6 ptiles">
                    <div class="col-sm-6 chart1">
                        <div class="chartimage" id="StepChartDiv">
                            <%--number of steps pending chart is rendered--%>
                            <ej:Chart ID="ChartStep" runat="server" IsResponsive="true">
                                <Series>
                                    <ej:Series Name="New York" XName="Xvalue" YName="YValue1" Type="Doughnut" Opacity="0.8" Border-Width="1" Border-Color="#D3C1D4" 
                                        LabelPosition="Inside" DoughnutSize="0.9" DoughnutCoefficient="0.7" EnableAnimation="false">
                                        <Points>
                                            <ej:Points Visible="true" Fill="#D3C1D4" X="Carbohydrate" Y="10" />
                                            <ej:Points Visible="true" Fill="#B26CAB" X="Fat" Y="90" />
                                        </Points>
                                    </ej:Series>
                                </Series>
                                <Legend Visible="false" Position="Bottom">
                                    <Font Color="Black" FontSize="12px" />
                                </Legend>
                                <Annotations>
                                    <ej:Annotations Visible="true" Content="stepAnnotation" Region="Series"></ej:Annotations>
                                </Annotations>
                                <Margin Left="10" Top="0" Right="10" Bottom="0" />
                                <size height="170" width="200" />
                            </ej:Chart>
                            <br />
                            <label class="todaylabel">Step - 90/100</label>
                            <br />
                            <label class="pending todaylabel">10 steps pending</label>
                        </div>
                    </div>
                    <div class="col-sm-6 chart2">
                        <div class="chartimage" id="FloorChartDiv">
                            <%--number of floors pending chart is rendered--%>
                            <ej:Chart ID="ChartFloor" runat="server" IsResponsive="true">
                                <Series>
                                    <ej:Series Name="New York" XName="Xvalue" YName="YValue1" Type="Doughnut" Opacity="0.8" Border-Width="1" Border-Color="#BFBED9"
                                        LabelPosition="Inside" DoughnutSize="0.9" DoughnutCoefficient="0.7" EnableAnimation="false">
                                        <Points>
                                            <ej:Points Visible="true" Fill="#7D70B3" X="Carbohydrate" Y="6" />
                                            <ej:Points Visible="true" Fill="#BFBED9" X="Fat" Y="4" />
                                        </Points>
                                    </ej:Series>
                                </Series>
                                <Legend Visible="false" Position="Bottom">
                                    <Font Color="Black" FontSize="12px" />
                                </Legend>
                                <Annotations>
                                    <ej:Annotations Visible="true" Content="floorAnnotation" Region="Series"></ej:Annotations>
                                </Annotations>
                                <Margin Left="10" Top="0" Right="10" Bottom="0" />
                                <size height="170" width="200" />
                            </ej:Chart>
                            <br />
                            <label class="todaylabel">Floor - 4/10</label>
                            <br />
                            <label class="pending todaylabel">6 floors pending</label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="topspace row">
                <div class="col-xs-6">
                    <label class="titlecss">
                        Meal Summary
                    </label>
                </div>
                <div class="addbutton col-xs-6">
                    <label class="addlabel">Add Meal</label>
                    <img class="add" src="../Content/Dashboard/health-tracker/images/Add.png" alt="Add"/>
                </div>
            </div>
            <div class="row" id="MealSummary">
                <div class="col-md-6 ptiles">
                    <div class="chartimage1">
                        <%--chart is rendered based on the summary collection value in the grid--%>
                        <ej:Chart ID="Chart" runat="server" IsResponsive="true">
                            <Series>
                                <ej:Series Name="New York" XName="Xvalue" YName="YValue1" Type="Doughnut" Opacity="0.8" Border-Width="1"
                                    LabelPosition="OutSide" DoughnutSize="0.9" Marker-DataLabel-Visible="True" Marker-DataLabel-Font-Color="#707070"
                                    Marker-DataLabel-Font-FontSize="15px"
                                    Marker-DataLabel-Font-FontWeight="Lighter">
                                </ej:Series>
                            </Series>
                            <Legend Visible="false" />
                            <Margin Left="10" Top="0" Right="0" Bottom="0" />
                            <size height="270" />
                        </ej:Chart>
                    </div>
                </div>
                <div class="col-md-6 ptiles">
                    <ej:Grid ID="Grid1" runat="server" ShowSummary="True" EnableAltRow="false" AllowKeyboardNavigation="True" IsResponsive="true" EnableResponsiveRow="false" GridLines="Horizontal">
                        <SummaryRows>
                            <ej:SummaryRow Title="Sum">
                                <SummaryColumn>
                                    <ej:SummaryColumn SummaryType="Sum" DisplayColumn="Fat" DataMember="Fat" Suffix="g" />
                                </SummaryColumn>
                                <SummaryColumn>
                                    <ej:SummaryColumn SummaryType="Sum" DisplayColumn="Carbohydrate" DataMember="Carbohydrate" Suffix="g" />
                                </SummaryColumn>
                                <SummaryColumn>
                                    <ej:SummaryColumn SummaryType="Sum" DisplayColumn="Protein" DataMember="Protein" Suffix="g" />
                                </SummaryColumn>
                                <SummaryColumn>
                                    <ej:SummaryColumn SummaryType="Sum" DisplayColumn="Calorie" DataMember="Calorie" Suffix="cal" />
                                </SummaryColumn>
                            </ej:SummaryRow>
                        </SummaryRows>
                        <Columns>
                            <ej:Column Field="Time" HeaderText="TIME" TextAlign="Center" Width="80">
                                <ValidationRule>
                                    <ej:KeyValue Key="required" Value="true" />
                                </ValidationRule>
                            </ej:Column>
                            <ej:Column Field="FoodName" HeaderText="FOOD" TextAlign="Center" Width="120">
                                <ValidationRule>
                                    <ej:KeyValue Key="required" Value="true" />
                                </ValidationRule>
                            </ej:Column>
                            <ej:Column Field="Fat" HeaderText="FAT" Width="60" Format="{0:N0}g" TextAlign="Center">
                                <ValidationRule>
                                    <ej:KeyValue Key="required" Value="true" />
                                </ValidationRule>
                            </ej:Column>
                            <ej:Column Field="Carbohydrate" HeaderText="CARB" Width="70" Format="{0:N0}g" TextAlign="Center" Priority="3">
                                <ValidationRule>
                                    <ej:KeyValue Key="required" Value="true" />
                                </ValidationRule>
                            </ej:Column>
                            <ej:Column Field="Protein" HeaderText="PROTEIN" Width="70" Format="{0:N0}g" TextAlign="Center" Priority="4">
                                <ValidationRule>
                                    <ej:KeyValue Key="required" Value="true" />
                                </ValidationRule>
                            </ej:Column>
                            <ej:Column Field="Calorie" HeaderText="CALORIES" Width="70" Format="{0:N0}g" TextAlign="Center" Priority="5">
                                <ValidationRule>
                                    <ej:KeyValue Key="required" Value="true" />
                                </ValidationRule>
                            </ej:Column>
                            <ej:Column Field="FoodId" HeaderText="FoodID" Visible="false" IsPrimaryKey="True" />
                        </Columns>
                        <EditSettings AllowAdding="true" AllowDeleting="True" AllowEditing="true" EditMode="DialogTemplate" DialogEditorTemplateID="#healthAddTemplate"></EditSettings>
                        <ClientSideEvents ActionComplete="actionComplete" />
                    </ej:Grid>
                </div>
            </div>

            <div class="row topspace">
                <div class="col-xs-6 titlecss loadondemand">
                    This Month               
                </div>
            </div>
            <div id="HistoryDetails" class="row">
                <div class="col-md-6  chart3 burntCal loadondemand ptiles">
                    <%--monthly report chart for calories burnt--%>
                      <ej:Chart ID="ChartBurnt" runat="server" IsResponsive="true" Title="TOTAL STEPS" InitSeriesRender="false" OnClientLoad="onChartBurntload" Background="transparent">
                        <ChartArea Border-Width="1" />
                        <PrimaryXAxis EdgeLabelPlacement="Hide" ValueType="Double" RangePadding="None" ColumnIndex="0">
                            <Title Text="Days">
                                <Font Opacity="1" FontSize="14px" FontWeight="Bold" />
                            </Title>
                            <Font Opacity="1" FontSize="8px" FontWeight="Regular" />
                            <MajorGridLines Visible="false" />
                        </PrimaryXAxis>
                        <PrimaryYAxis RowIndex="0" ValueType="Double" RangePadding="None">
                            <Title Text="Steps" Font-Opacity="1" Font-FontSize="14px" Font-FontWeight="Bold" />
                            <Font Opacity="1" FontSize="8px" FontWeight="Regular" />
                        </PrimaryYAxis>
                        <Series>
                            <ej:Series Name="Steps Moved" Type="Column" Border-Width="1" Tooltip-Template="BurntTooltip" Fill="#8CC640" EnableAnimation="true" />
                        </Series>
                        <CommonSeriesOptions Tooltip-Visible="true"/>
                        <Size height="500" />
                    </ej:Chart>
                </div>
                <div class="col-md-6 chart4 ptiles">
                    <%--monthly report chart for number of steps moved--%>
                    <ej:Chart ID="ChartCal" runat="server" IsResponsive="true" Title="CALORIES BURNT" InitSeriesRender="false" OnClientLoad="onChartCalLoad" Background="transparent">
                        <ChartArea Border-Width="1" />
                        <PrimaryXAxis EdgeLabelPlacement="Hide" ValueType="Double" RangePadding="None" ColumnIndex="0">
                            <Title Text="Days">
                                <Font Opacity="1" FontSize="14px" FontWeight="Bold" />
                            </Title>
                            <Font Opacity="1" FontSize="8px" FontWeight="Regular" />
                            <MajorGridLines Visible="false" />
                        </PrimaryXAxis>
                        <PrimaryYAxis RowIndex="0" ValueType="Double" RangePadding="None">
                            <Title Text="Calorie" Font-Opacity="1" Font-FontSize="14px" Font-FontWeight="Bold" />
                            <Font Opacity="1" FontSize="8px" FontWeight="Regular" />
                        </PrimaryYAxis>
                        <Series>
                            <ej:Series Name="Calories Burnt" Type="Spline" Border-Width="1" Tooltip-Template="CalTooltip" Fill="#24B7E5" EnableAnimation="true" />
                        </Series>
                        <CommonSeriesOptions Type="line" EnableAnimation="true" Tooltip-Visible="true" Border-Width="2">
                            <Marker Shape="Circle" Size-Height="10" Size-Width="10" Visible="true" />
                        </CommonSeriesOptions>
                        <Size height="500" />
                    </ej:Chart>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12 ptiles chart5">
                    <%--monthly report chart for meal intake--%>
                       <ej:Chart ID="MealDetails" runat="server" IsResponsive="true" Title="MEAL INTAKE" InitSeriesRender="false" OnClientLoad="onChartLoad" Background="transparent">
                        <ChartArea Border-Width="1" />
                        <PrimaryXAxis EdgeLabelPlacement="Hide" ValueType="Double" RangePadding="None" ColumnIndex="0">
                            <Title Text="Days">
                                <Font Opacity="1" FontSize="14px" FontWeight="Bold" />
                            </Title>
                            <Font Opacity="1" FontSize="8px" FontWeight="Regular" />
                            <MajorGridLines Visible="false" />
                        </PrimaryXAxis>
                        <PrimaryYAxis RowIndex="0" ValueType="Double" RangePadding="None">
                            <Title Text="Cal" Font-Opacity="1" Font-FontSize="14px" Font-FontWeight="Bold" />
                            <Font Opacity="1" FontSize="8px" FontWeight="Regular" />
                        </PrimaryYAxis>
                        <Series>
                            <ej:Series Name="Carb" Type="Column" Border-Width="1" Tooltip-Template="HydrateTooltip" Fill="#8CAA55" EnableAnimation="true" />
                            <ej:Series Name="Protein" Type="Column" Border-Width="1" Tooltip-Template="ProteinTooltip" Fill="#B34949" EnableAnimation="true" />
                            <ej:Series Name="Fat" Type="Column" Border-Width="1" Tooltip-Template="FatTooltip" Fill="#58A7C6" EnableAnimation="true" />
                        </Series>
                        <CommonSeriesOptions Tooltip-Visible="true"/>
                        <Size height="500" />
                    </ej:Chart>
                </div>
            </div>
            <div id="footer">
                <div class="bottom-links">
                    <div class="left">
                        <div class="sync-text">
                            Copyright © 2001-2019 Syncfusion Inc.
                        </div>
                    </div>
                    <div class="right">
                        <a href="https://www.syncfusion.com">
                            <div class="syncfusion-image"></div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <ej:Dialog id="healthAddTemplate" ShowOnInit="false" ClientIDMode="Static" runat="server">
            <DialogContent>
            <table cellspacing="14px">
                <tr>
                    <td>Food time:
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" class="timelist valid" id="Time" value="{{:Time}}" aria-required="true" />
                    </td>
                </tr>
                <tr>
                    <td>Food type:
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" class="foodlist ejinputtext valid" id="FoodName" value="{{:FoodName}}" aria-required="true" />
                    </td>
                </tr>
            </table>
            <table cellspacing="14px">
                <tr>
                    <td>Fat:
                    </td>
                    <td>Carb:
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="Fat" value="{{:Fat}}" class="diatxt valid" aria-required="true" />
                    </td>
                    <td>
                        <input type="text" id="Carbohydrate" value="{{:Carbohydrate}}" class="diatxt valid" aria-required="true" />
                    </td>
                </tr>
                <tr>
                    <td>Protein:
                    </td>
                    <td>Calories:
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="Protein" value="{{:Protein}}" class="diatxt" aria-required="true" />
                    </td>
                    <td>
                        <input type="text" id="Calorie" value="{{:Calorie}}" class="diatxt" aria-required="true" />
                    </td>
                </tr>
                <tr>
                    <td id="validation">* All fields are mandatory</td>
                </tr>
            </table>
            </DialogContent>
        </ej:Dialog>
        <div id="BurntTooltip" class="historytooltip">
            <div id="stepTool"></div>
            <div>
                <label id="burntmonth">May #point.x#</label><br />
                <label id="burntday">#point.y#</label><label class="burntlabel">  steps</label>
            </div>
        </div>
        <div id="HydrateTooltip" class="historytooltip">
            <div>
                <div id="hydrateTool"></div>
                <label class="tooltiplabel">May #point.x#</label>
            </div>
            <div class="hydlabel">
                <label id="hydratemonth">Carb</label><br />
                <label id="hydrateday">#point.y# g</label>
            </div>
        </div>
        <div id="ProteinTooltip" class="historytooltip">
            <div>
                <div id="proteinTool"></div>
                <label class="tooltiplabel">May #point.x#</label>
            </div>
            <div class="proLabel">
                <label id="proteinmonth">Protein</label><br />
                <label id="proteinday">#point.y# g</label>
            </div>
        </div>
        <div id="FatTooltip" class="historytooltip">
            <div>
                <div id="fatTool"></div>
                <label class="tooltiplabel">May #point.x#</label>
            </div>
            <div class="fatLabel">
                <label id="fatmonth">Fat</label><br />
                <label id="fatday">#point.y# g</label>
            </div>
        </div>
        <div id="CalTooltip" class="historytooltip">
            <div class="calldiv">
                <span id="calday">#point.y# </span><span>cal</span>
            </div>
            <div class="monthdiv">
                <span id="calmonth">May #point.x#</span>
            </div>
        </div>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Dashboard/healthtracker.js")%>' type="text/javascript"></script>
   </form>   
</body>
</html>
