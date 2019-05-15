<%@ Page Title="Chart-SubTitle-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This sample demonstrates how to render and configure sub title using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SubTitle.aspx.cs" Inherits="WebSampleBrowser.Chart.SubTitle" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
      <script type="text/javascript" src="../Scripts/ChartData.js"></script>
    <div>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ClientIDMode="Static" ID="Chart1" runat="server" OnClientLoad="onChartLoad" Width="690" Height="600" IsResponsive="true">
            <PrimaryXAxis Title-Text="year" />
            <PrimaryYAxis LabelFormat="{value}%" RangePadding="Round" Title-Text="Efficiency" />
            <CommonSeriesOptions Type="column" DoughnutSize="0.2" Tooltip-Visible="false" 
                Marker-Size-Height="10" Marker-Size-Width="10" Marker-Border-Width="2" Marker-Visible="false" EnableAnimation="True" />
            <Series>
                <ej:Series Name="India" XName="Xvalue" YName="YValue1" Fill="#69D2E7"></ej:Series>
                <ej:Series Name="Germany" XName="Xvalue" YName="YValue2" Fill="#E27F2D"></ej:Series>
            </Series>
            <Legend Visible="true"></Legend>
            <Title Text="Efficiency of oil-fired power production" MaximumWidth="150">
                <SubTitle Text="(in a week)" TextAlignment="Far" MaximumWidth="50">
                </SubTitle>
            </Title>
        </ej:Chart>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    <strong>Title:</strong>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Placement
                </div>
                <div class="col-md-3">
                    <select name="selectIndex" autocomplete="off" id="Title">
                        <option value="0">Center</option>
                        <option value="1">Near</option>
                        <option value="2">Far</option>
                    </select>
                 </div>
            </div>
             <div class="row">
                <div class="col-md-3">
                    Visibility
                </div>
                <div class="col-md-3">
                    <select name="selectIndex" autocomplete="off" id="titleVisible">
                        <option value="0">true</option>
                        <option value="1">false</option>
                    </select>
                 </div>
            </div>
            <div class="row">
               <div class="col-md-3">
                   Enable Trim
               </div>
               <div class="col-md-3">
                   <select name="selectIndex" autocomplete="off" id="titleTrim">
                       <option value="0">false</option>
                       <option value="1">true</option>
                   </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Maximum Width
                </div>
                <div class="col-md-3">
                    <input type="text" id="titleWidth"  style="width:60px;height:20px;" disabled = true value="150"></input>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Text Overflow
                </div>
                <div class="col-md-3">
                    <select name="selectIndex" autocomplete="off" id="titleTextOverflow">
                       <option value="0">trim</option>
                       <option value="1">wrapandtrim</option>
                       <option value="2">wrap</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    <strong>Subtitle:</strong>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Placement
                </div>
                <div class="col-md-3">
                    <select name="disableItem" autocomplete="off" id="Subtitle">
                        <option value="0">Center</option>
                        <option value="1">Near</option>
                        <option value="2" selected>Far</option>
                    </select>
                </div>
            </div>
            <div class="row">
               <div class="col-md-3">
                  Visibility
               </div>
               <div class="col-md-3">
                    <select name="selectIndex" autocomplete="off" id="subtitleVisible">
                        <option value="0">true</option>
                        <option value="1">false</option>
                    </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Enable Trim
                </div>
                <div class="col-md-3">
                   <select name="selectIndex" autocomplete="off" id="subtitleTrim">
                       <option value="0">false</option>
                       <option value="1">true</option>
                   </select>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Maximum Width
                </div>
                <div class="col-md-3">
                    <input type="text" id="subtitleWidth" style="width:60px;height:20px;" disabled = true value="50"></input>
                </div>
            </div>
            <div class="row">
                <div class="col-md-3">
                    Text Overflow
                </div>
                <div class="col-md-3">
                    <select name="selectIndex" autocomplete="off" id="subtitleTextOverflow">
                        <option value="0">trim</option>
                        <option value="1">wrapandtrim</option>
                        <option value="2">wrap</option>
                    </select>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#Title").change(function () {
            var option1 = $("#Title option:selected").text();
            option1 = option1.toLowerCase();
            var chart = $("#Chart1").ejChart("instance");
            switch (option1) {
                case 'center':
                    chart.model.title.textAlignment = "center";
                    chart.redraw();
                    break;
                case 'near':
                    chart.model.title.textAlignment = "near";
                    chart.redraw();
                    break;
                case 'far':
                    chart.model.title.textAlignment = "far";
                    chart.redraw();
                    break;
                default:
            }
        });
        $("#titleVisible").change(function () {
            var option1 = $("#titleVisible option:selected").text();
            option1 = option1.toLowerCase();
            var chart = $("#Chart1").ejChart("instance");
            switch (option1) {
                case "true":
                    chart.model.title.visible = true;
                    chart.redraw();
                    break;
                case "false":
                    chart.model.title.visible = false;
                    chart.redraw();
                    break;
                default:
            }
        });
        $("#titleTrim").change(function () {
            var option1 = $("#titleTrim option:selected").text();
            option1 = option1.toLowerCase();
            var chart = $("#Chart1").ejChart("instance");
            switch (option1) {
                case "true":
                    chart.model.title.enableTrim = true;
                    $("#titleWidth").attr('disabled', false)
                    chart.redraw();
                    break;
                case "false":
                    chart.model.title.enableTrim = false;
                    $("#titleWidth").attr('disabled', true)
                    chart.redraw();
                    break;
                default:
            }
        });
        $("#titleTextOverflow").change(function () {
            var option1 = $("#titleTextOverflow option:selected").text();
            option1 = option1.toLowerCase();
            var chart = $("#Chart1").ejChart("instance");
            switch (option1) {
                case "trim":
                    chart.model.title.textOverflow = "trim";
                    chart.redraw();
                    break;
                case "wrap":
                    chart.model.title.textOverflow = "wrap";
                    chart.redraw();
                    break;
                case "wrapandtrim":
                    chart.model.title.textOverflow = "wrapandtrim";
                    chart.redraw();
                    break;
                default:
            }
        });
        $('#Subtitle').change(function () {
            var option2 = $("#Subtitle option:selected").text();
            option2 = option2.toLowerCase();
            var chart = $("#Chart1").ejChart("instance");
            switch (option2) {
                case 'center':
                    chart.model.title.subTitle.textAlignment = 'center';
                    chart.redraw();
                    break;
                case 'near':
                    chart.model.title.subTitle.textAlignment = 'near';
                    chart.redraw();
                    break;
                case 'far':
                    chart.model.title.subTitle.textAlignment = 'far';
                    chart.redraw();
                    break;
                default:
            }
        });
        $("#subtitleVisible").change(function () {
            var option1 = $("#subtitleVisible option:selected").text();
            option1 = option1.toLowerCase();
            var chart = $("#Chart1").ejChart("instance");
            switch (option1) {
                case "true":
                    chart.model.title.subTitle.visible = true;
                    chart.redraw();
                    break;
                case "false":
                    chart.model.title.subTitle.visible = false;
                    chart.redraw();
                    break;
                default:
            }
        });
        $("#subtitleTrim").change(function () {
            var option1 = $("#subtitleTrim option:selected").text();
            option1 = option1.toLowerCase();
            var chart = $("#Chart1").ejChart("instance");
            switch (option1) {
                case "true":
                    chart.model.title.subTitle.enableTrim = true;
                    $("#subtitleWidth").attr('disabled', false)
                    chart.redraw();
                    break;
                case "false":
                    chart.model.title.subTitle.enableTrim = false;
                    $("#subtitleWidth").attr('disabled', true)
                    chart.redraw();
                    break;
                default:
            }
        });
        $("#subtitleTextOverflow").change(function () {
            var option1 = $("#subtitleTextOverflow option:selected").text();
            option1 = option1.toLowerCase();
            var chart = $("#Chart1").ejChart("instance");
            switch (option1) {
                case "trim":
                    chart.model.title.subTitle.textOverflow = "trim";
                    chart.redraw();
                    break;
                case "wrap":
                    chart.model.title.subTitle.textOverflow = "wrap";
                    chart.redraw();
                    break;
                case "wrapandtrim":
                    chart.model.title.subTitle.textOverflow = "wrapandtrim";
                    chart.redraw();
                    break;
                default:
            }
        });
        $("#titleWidth").change(function () {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.title.maximumWidth = $('#titleWidth')[0].value;
            chart.redraw();
        });
        $("#subtitleWidth").change(function () {
            var chart = $("#Chart1").ejChart("instance");
            chart.model.title.subTitle.maximumWidth = $('#subtitleWidth')[0].value;
            chart.redraw();
        });
        $("#sampleProperties").ejPropertiesPanel();
    </script>
</asp:Content>

