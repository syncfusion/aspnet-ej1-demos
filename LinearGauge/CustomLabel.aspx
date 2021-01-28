<%@ Page Title="LinearGauge-CustomLabel-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the drag functionality of the bar pointer in Syncfusion ASP.NET Web Forms Linear gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="CustomLabel.aspx.cs" Inherits="WebSampleBrowser.LinearGauge.CustomLabel" %>


<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
   
    <div  align="center" style="width:300px" >
   <ej:LinearGauge  ClientIDMode="Static" runat="server" ID="LinearGauge1" LabelColor="#8c8c8c" Load="loadGaugeTheme" EnableAnimation="false" OuterCustomLabelPosition="Right" ReadOnly="false" Width="200">
       <Tooltip ShowCustomLabelTooltip="true"/>
            <Scales>
               <ej:Scales Maximum="1000" Minimum="0" MinorIntervalValue="20" MajorIntervalValue="100" Type="Rectangle" Width="30" ShowCustomLabels="true" ShowBarPointers="true" ShowRanges="true" Length="310" >
                   <Border Width="0" Color="balck"></Border>
                    <Position x="107" Y="50"/>
                   <BarPointerCollection>
                       <ej:BarPointers BarPointerBackgroundColor="#66C1DC" Width="28" BarPointerValue="700"></ej:BarPointers>
                   </BarPointerCollection>
                    <MarkerPointerCollection> 
                        <ej:MarkerPointers Value="700" Length="20" Width="30" Type="Diamond" Placement="Center" MarkerBackgroundColor="#4D4D4D"><Border Color="#4D4D4D"></Border></ej:MarkerPointers>
                    </MarkerPointerCollection>
                    <LabelCollection>
                        <ej:Labels><DistanceFromScale X="-26"></DistanceFromScale>
                            <Font FontFamily="Segoe UI" FontStyle="Bold" Size="11px"></Font>
                        </ej:Labels>
                    </LabelCollection>
                    <TickCollection>
                        <ej:LinearTicks Type="MajorInterval" Width="1" Color="#8c8c8c">
                            <DistanceFromScale X="-13"/>
                            </ej:LinearTicks>
                        <ej:LinearTicks Type="MinorInterval" Width="1" Height="4" Color="#8c8c8c">
                            <DistanceFromScale X="-13"/>
                            </ej:LinearTicks>
                    </TickCollection>
                    <RangeCollection>
                        <ej:Ranges StartValue="0" EndValue="400" RangeBackgroundColor="#E94649" EndWidth="4" StartWidth="4" Placement="Near" DistanceFromScale="-5"><Border Color="#E94649"></Border></ej:Ranges>
                        <ej:Ranges StartValue="400" EndValue="700" RangeBackgroundColor="#F6B53F" EndWidth="4" StartWidth="4" Placement="Near" DistanceFromScale="-5"><Border Color="#F6B53F"></Border></ej:Ranges>
                        <ej:Ranges StartValue="700" EndValue="1000" RangeBackgroundColor="Green" EndWidth="4" StartWidth="4" Placement="Near" DistanceFromScale="-5"><Border Color="Green"></Border></ej:Ranges>
                    </RangeCollection>
                   <CustomLabelCollection>
                       <ej:CustomLabel Value="Water Level in Liter" Color="black">
                           <Position X="82" Y="100"/>
                           <Font FontFamily="Arial" FontStyle="Bold" Size="12px"></Font>
                       </ej:CustomLabel>
                       <ej:CustomLabel Value="700-1000 L Sufficient" Color="Green" CustomLabelPositionType="Outer">
                           <Font FontFamily="Arial" FontStyle="Bold" Size="12px"></Font>
                       </ej:CustomLabel>
                       <ej:CustomLabel Value="400-700 L Managable" Color="#F6B53F" CustomLabelPositionType="Outer">
                           <Font FontFamily="Arial" FontStyle="Bold" Size="12px"></Font>
                       </ej:CustomLabel>
                       <ej:CustomLabel Value="0-400 L Inadequate" Color="#E94649" CustomLabelPositionType="Outer">
                           <Font FontFamily="Arial" FontStyle="Bold" Size="12px"></Font>
                       </ej:CustomLabel>
                   </CustomLabelCollection>
               </ej:Scales>
            </Scales> 
        </ej:LinearGauge>
        </div>
        <div align="center">
          <h5>Hold and Drag the bar pointer to interact with it and hover the mouse on label text</h5>
        </div
</asp:Content>

