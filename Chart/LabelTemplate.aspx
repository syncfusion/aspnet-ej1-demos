<%@ Page Title="Chart-Label Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to customize data label template for series using Syncfusion ASP.NET Web Forms Chart control" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="LabelTemplate1.aspx.cs" Inherits="WebSampleBrowser.Chart.LabelTemplate1" %>


<asp:Content ID="Content1" runat="server" contentplaceholderid="ControlsSection">
    <div id="template">
                <div id="left">
				    <img src="../Content/images/chart/icon_investments.png"/>
			    </div>
                <div id="right">
                  <div id="point">#point.y#%</div>
                </div>
    </div>

    <div>
        <script type="text/javascript" src="../Scripts/ChartData.js"></script>
        <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
        <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad">
            <PrimaryXAxis Title-Text="Years" Valuetype="Category"/>
            <PrimaryYAxis LabelFormat="{value}%" Title-Text="Percentage" RangePadding="None" />
            <CommonSeriesOptions Type="Spline" EnableAnimation="true" Tooltip-Visible="true"
                 Marker-Visible="true" Marker-DataLabel-Visible="true" Marker-Size-Width="10" Marker-Size-Height="10" 
                 Marker-Shape="Circle" Marker-DataLabel-Shape="Rectangle" Marker-DataLabel-EnableContrastColor="true"  />
            <Series>
             <ej:Series Name="India" Fill="#8CC640" Marker-Visible="true" 
                 Marker-DataLabel-Visible="true" Marker-DataLabel-Template="template" Marker-DataLabel-VerticalTextAlignment="Far">
                    <Points >
                        <ej:Points X="2005" Y="28.1"/> 
                        <ej:Points X="2006" Y="29.2"/>  
                        <ej:Points X="2007" Y="33.9"/>  
                        <ej:Points X="2008" Y="36"/>  
                        <ej:Points X="2009" Y="32.4"/>
                        <ej:Points X="2010" Y="32"/> 
                        <ej:Points X="2011" Y="32.8"/>  
                    </Points>
             </ej:Series>
             <ej:Series Name="Singapore" Fill="#CBA4C7" XName="Xvalue" YName="YValue2"  Marker-Visible="true" 
                 Marker-DataLabel-Visible="true" Marker-DataLabel-Shape="Rectangle" Marker-DataLabel-Font-FontSize="14px" Marker-DataLabel-VerticalTextAlignment="Far">
                    <Points >
                        <ej:Points  X="2005" Y="21.8"/> 
                        <ej:Points  X="2006" Y="21.8"/>  
                        <ej:Points  X="2007" Y="24.9"/>  
                        <ej:Points  X="2008" Y="28.5"/>  
                        <ej:Points  X="2009" Y="27.2"/>
                        <ej:Points  X="2010" Y="23.4"/>  
                        <ej:Points X="2011" Y="23.4" />  
                    </Points>
             </ej:Series>
             <ej:Series Name="Russia" XName="Xvalue" YName="YValue3" Marker-Visible="true"
                  Marker-DataLabel-Visible="true" Marker-DataLabel-Shape="Rectangle" Marker-DataLabel-Font-FontSize="14px" Marker-DataLabel-VerticalTextAlignment="Far">
                     <Points >
                        <ej:Points X="2005" Y="18.1"/>  
                        <ej:Points X="2006" Y="18.2"/>  
                        <ej:Points X="2007" Y="21"/>  
                        <ej:Points X="2008" Y="22.1"/>
                        <ej:Points X="2009" Y="21.5"/> 
                        <ej:Points X="2010" Y="18.9"/> 
                        <ej:Points X="2011" Y="21.3"/>   
                    </Points>
             </ej:Series>
            
         </Series>
            <Title Text="Gross Investments"></Title>
            <Legend Visible="true"></Legend>
        </ej:Chart>
    </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style>
        #point {
                font-family: segoe ui;
                font-size: 16px;
                color: black;
            }
            #left, #right {
                float: left;   
            }
            img {
                height: 25px;
                width: 30px;
            }
			 #left{
               background-color: #8CC640;   
           }
			#right{
                background-color: #C3C3C3; 
                height: 30px;
                border-style:solid;
                border-color:#8CC640;
                border-width: 1px;				
            }
            #template {
                display:none;
            }  

    </style>
</asp:Content>

