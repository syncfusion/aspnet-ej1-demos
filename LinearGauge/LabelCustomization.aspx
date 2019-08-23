<%@ Page Title="LinearGauge-Label Customization-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the label customization in the Syncfusion ASP.NET Web Forms Linear gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="LabelCustomization.aspx.cs" Inherits="WebSampleBrowser.LinearGauge.LabelCustomization" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
    <ej:LinearGauge ClientIDMode="Static" IsResponsive="true" runat="server" ID="LinearGauge1" Load="loadGaugeTheme" LabelColor="#8c8c8c">
            <Scales>
                <ej:Scales Width="4" ShowBarPointers="false" ShowRanges="true" Length="310">
                    <Border Width="0"></Border>
                    <Border Color="transparent"></Border>
                    <Position X="52" Y="50"/>
                    <MarkerPointerCollection>
                        <ej:MarkerPointers Width="10" Length="10" Value="60" MarkerBackgroundColor="#4d4d4d">
                            <Border Color="#4d4d4d"></Border>
                        </ej:MarkerPointers>
                    </MarkerPointerCollection>
                    <LabelCollection>
                       <ej:Labels UnitText="F">
                           <Font FontFamily="Segoe UI" FontStyle="Bold" Size="11px"></Font>
                       </ej:Labels>
                    </LabelCollection>
                     <TickCollection>
                        <ej:LinearTicks Type="MajorInterval" Width="1" Color="#8c8c8c"/>
                    </TickCollection>
                    <RangeCollection>
                        <ej:Ranges StartValue="0" EndValue="50" RangeBackgroundColor="#F6B53F" EndWidth="4" StartWidth="4"><Border Color="#F6B53F"></Border></ej:Ranges>
                        <ej:Ranges StartValue="50" EndValue="100" RangeBackgroundColor="#E94649" EndWidth="4" StartWidth="4"><Border Color="#E94649"></Border></ej:Ranges>
                    </RangeCollection>
                </ej:Scales>
            </Scales>
        </ej:LinearGauge>
        </div>
</asp:Content>

