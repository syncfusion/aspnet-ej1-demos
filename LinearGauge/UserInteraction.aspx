<%@ Page Title="LinearGauge-UserInteraction-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates dragging the pointer of the Syncfusion ASP.NET Web Forms Linear gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="UserInteraction.aspx.cs" Inherits="WebSampleBrowser.LinearGauge.UserInteraction" %>


<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>


<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center">
   <ej:LinearGauge ClientIDMode="Static" runat="server" IsResponsive="true" ID="LinearGauge1" ReadOnly="false" LabelColor="#8c8c8c" Load="loadGaugeTheme">
        <Scales>
            <ej:Scales Width="4" ShowRanges="true" Length="310">
                <Border Color="transparent" Width="0"></Border>
            <Position X="52" Y="50"/>
                <MarkerPointerCollection>
                    <ej:MarkerPointers Value="60" Length="10" Width="10" MarkerdistanceFromScale="8" MarkerBackgroundColor="#4d4d4d">
                        <Border Color="#4d4d4d"></Border>
                    </ej:MarkerPointers>
                </MarkerPointerCollection>
                <BarPointerCollection>
                    <ej:BarPointers BarPointerValue="60" Width="4" BarPointerdistanceFromScale="8" BarPointerBackgroundColor="#6FAAB0">
                    </ej:BarPointers>
                </BarPointerCollection>
                <TickCollection>
                    <ej:LinearTicks Type="MajorInterval" Color="#8c8c8c" Width="1"/>
                </TickCollection>
                <RangeCollection>
                    <ej:Ranges EndValue="50" StartValue="0" RangeBackgroundColor="#F6B53F" EndWidth="4" StartWidth="4"><Border Color="#F6B53F"></Border>
                    </ej:Ranges>
                    <ej:Ranges EndValue="100" StartValue="50" RangeBackgroundColor="#E94649" EndWidth="4" StartWidth="4"><Border Color="#E94649"></Border>
                    </ej:Ranges>
                </RangeCollection>
            </ej:Scales>
        </Scales>
    </ej:LinearGauge>
        </div>
      <div align="center">
          <h5> Hold and Drag the bar pointer to interact with it</h5>
        </div
</asp:Content>

