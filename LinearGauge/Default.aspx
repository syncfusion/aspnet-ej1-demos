<%@ Page Title="LinearGauge-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample illustrates the default functionality of the Syncfusion ASP.NET Web Forms Linear gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSampleBrowser.LinearGauge.Default" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
   <ej:LinearGauge  ClientIDMode="Static" IsResponsive="true" runat="server" ID="LinearGauge1" LabelColor="#8c8c8c" Load="loadGaugeTheme">
            <Scales>
               <ej:Scales Width="4" ShowBarPointers="false" ShowRanges="true" Length="310" >
                   <Border Width="0"></Border>
                    <Position x="52" Y="50"/>
                    <MarkerPointerCollection> 
                        <ej:MarkerPointers Value="60" Length="10" Width="10" MarkerBackgroundColor="#4D4D4D"><Border Color="#4D4D4D"></Border></ej:MarkerPointers>
                    </MarkerPointerCollection>
                    <LabelCollection>
                        <ej:Labels><DistanceFromScale X="-13"></DistanceFromScale>
                            <Font FontFamily="Segoe UI" FontStyle="Bold" Size="11px"></Font>
                        </ej:Labels>
                    </LabelCollection>
                    <TickCollection>
                        <ej:LinearTicks Type="MajorInterval" Width="1" Color="#8c8c8c"/>
                    </TickCollection>
                    <RangeCollection>
                        <ej:Ranges StartValue="0" EndValue="60" RangeBackgroundColor="#F6B53F" EndWidth="4" StartWidth="4"><Border Color="#F6B53F"></Border></ej:Ranges>
                        <ej:Ranges StartValue="60" EndValue="100" RangeBackgroundColor="#E94649" EndWidth="4" StartWidth="4"><Border Color="#E94649"></Border></ej:Ranges>
                    </RangeCollection>
               </ej:Scales>
            </Scales> 
        </ej:LinearGauge>
        </div>
</asp:Content>

