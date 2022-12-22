<%@ Page Title="PivotGauge-WebAPI-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo for Syncfusion Essential JS1 for ASP.NET pivot gauge control describes how to bind the pivot data through Web API service" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RelationalWebAPI.aspx.cs" Inherits="WebSampleBrowser.PivotWebApi" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ControlsSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/excanvas.min.js")%>' type="text/javascript"></script>
    <ej:PivotGauge ID="PivotGauge1" runat="server" Url="../api/RelationalGauge" IsResponsive="true" EnableTooltip="true" BackgroundColor="transparent" ClientIDMode="Static">
        <ClientSideEvents RenderSuccess="loadPivotGaugeTheme"/>
        <Scales>
            <ej:CircularScales ShowRanges="true" Radius="150" ShowScaleBar="true" Size="1"  ShowIndicators="true" ShowLabels="true">
                <Border Width ="0.5" />
                <PointerCollection>                    
                    <ej:Pointers ShowBackNeedle="true" BackNeedleLength="20"  Length="125" Width="7" ></ej:Pointers>
                    <ej:Pointers Type="Marker" MarkerType="Diamond" DistanceFromScale="5" Placement="Center" BackgroundColor="#29A4D9" Length="25" Width="15"></ej:Pointers>
                </PointerCollection>
                <TickCollection>
                    <ej:CircularTicks Type="Major" DistanceFromScale="2" Height="16" Width="1" Color="#8c8c8c" />
                    <ej:CircularTicks Type="Minor" Height="6" Width="1" DistanceFromScale="2" Color="#8c8c8c" />
                </TickCollection>
                <LabelCollection>
                    <ej:CircularLabels Color="#8c8c8c"></ej:CircularLabels>
                </LabelCollection>
                <RangeCollection>
                    <ej:CircularRanges DistanceFromScale="-5" BackgroundColor="#fc0606">
                        <Border Color="#fc0606"/></ej:CircularRanges>
                    <ej:CircularRanges DistanceFromScale="-5"></ej:CircularRanges>
                </RangeCollection>
                <CustomLabelCollection>
                    <ej:CircularCustomLabel Color="#666666">
                        <Position X="180" Y="290" />
                        <Font Size="10px" FontFamily="Segoe UI" FontStyle="Normal"></Font>
                    </ej:CircularCustomLabel>
                    <ej:CircularCustomLabel Color="#666666">
                        <Position X="180" Y="320" />
                        <Font Size="10px" FontFamily="Segoe UI" FontStyle="Normal"></Font>
                    </ej:CircularCustomLabel>
                    <ej:CircularCustomLabel Color="#666666">
                        <Position X="180" Y="150" />
                        <Font Size="12px" FontFamily="Segoe UI" FontStyle="Normal"></Font>
                    </ej:CircularCustomLabel>
                </CustomLabelCollection>   
            </ej:CircularScales>
        </Scales>
        <LabelFormatSettings DecimalPlaces="2" />
    </ej:PivotGauge>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="StyleSection">
    <style type="text/css">
        #PivotGauge1 {
            height:300px;
            width:100%;
            float:left;
            overflow:auto;
        }        
    </style>
</asp:Content>

