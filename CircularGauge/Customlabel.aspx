<%@ Page Title="CircularGauge-Custom Label-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the custom labels in the Syncfusion ASP.NET Web Forms Circular gauge control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Customlabel.aspx.cs" Inherits="WebSampleBrowser.CircularGauge.Customlabel" %>

<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.DataVisualization.Models" TagPrefix="ej" %>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div align="center" style="width:450px;background-position:100%;">
 <ej:CircularGauge ClientIDMode="Static" runat="server" ID="CircularGauge1" BackgroundColor="transparent" EnableAnimation="false" OuterCustomLabelPosition="Left">
     <Tooltip ShowCustomLabelTooltip="true"/>
       <Scales>
           <ej:CircularScales ShowScaleBar="true" Radius="140" Size="0.3" ShowRanges="true" MinorIntervalValue="5">
               <PointerCollection>
                   <ej:Pointers ShowBackNeedle="true" Length="90" Width="8" BackNeedleLength="12" Value="60"></ej:Pointers>
               </PointerCollection>
               <TickCollection>
                   <ej:CircularTicks Type="Major"  Width="1" Color="#8c8c8c"/>
                   <ej:CircularTicks Type="Minor"  Height="7" Width="1" Color="#8c8c8c"/>
               </TickCollection>
               <LabelCollection>
                   <ej:CircularLabels Color="#8c8c8c">
                       <Font FontFamily="Segoe UI" FontStyle="Bold" Size="11px"></Font>
                   </ej:CircularLabels>
               </LabelCollection>
               <RangeCollection>
                   <ej:CircularRanges distanceFromScale="-30" StartValue="0" EndValue="50">
                   </ej:CircularRanges>
                   <ej:CircularRanges BackgroundColor="#fc0606" distanceFromScale="-30" StartValue="50" EndValue="80">
                       <Border Color="#fc0606"></Border>
                   </ej:CircularRanges>
                   <ej:CircularRanges BackgroundColor="#f5b43f" distanceFromScale="-30" StartValue="80" EndValue="100">
                       <Border Color="#f5b43f"></Border>
                   </ej:CircularRanges>
               </RangeCollection>
               <CustomLabelCollection>
                   <ej:CircularCustomLabel Value="KM / H" Color="Green">
                       <Position X="180" Y="270"/>
                       <Font Size="14px"></Font>
                   </ej:CircularCustomLabel>
                   <ej:CircularCustomLabel Value="Average Speed" Color="Red" CustomLabelPositionType="Outer">
                       <Font Size="20px"></Font>
                   </ej:CircularCustomLabel>
               </CustomLabelCollection>
           </ej:CircularScales>
       </Scales>
        </ej:CircularGauge>
        </div>
        <div align="center">
            <h5> Hover the mouse on custom label text</h5>
        </div>
</asp:Content>


