<%@ Page Title="Chart-Waterfall-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates how to render waterfall series using Syncfusion ASP.NET Web Forms Chart control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Waterfall.aspx.cs" Inherits="WebSampleBrowser.Chart.Waterfall" %>

<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="ScriptSection">
         
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
   <script type="text/javascript" src="../Scripts/ChartData.js"></script>
  <div id="container">
      <ej:WaitingPopup runat="server" ID="waitingpopup" ShowOnInit="false"></ej:WaitingPopup>
      <ej:Chart ID="Chart1" runat="server" Width="970" Height="600" IsResponsive="true" OnClientLoad="onChartLoad" >
           <PrimaryXAxis LabelIntersectAction="Rotate45"/>
           <PrimaryYAxis LabelFormat="${value}M"/>
          <Series>
              <ej:Series Type="Waterfall" EnableAnimation="true" Fill="#C64E4A" PositiveFill="#93C952">
                  <Points>
                      <ej:Points X="Income" Y="4711">
                          <Border Color="#5D843A" />
                      </ej:Points>
                      <ej:Points X="Marketing and sales" Y="-427"></ej:Points>
                      <ej:Points X="Research" Y="-588"></ej:Points>
                      <ej:Points X="Development" Y="-688"></ej:Points>
                      <ej:Points X="Other revenue" Y="1030">
                          <Border Color="#5D843A" />
                      </ej:Points>
                      <ej:Points X="Intermediate sum" ShowInterMediateSum="true" Fill="#4E81BC">
                          <Border Color="#2B557F" />
                      </ej:Points>
                      <ej:Points X="Administrative" Y="-780"></ej:Points>
                      <ej:Points X="Other expense" Y="-361"></ej:Points>
                      <ej:Points X="Income tax" Y="-695"></ej:Points>
                      <ej:Points X="Net profit" ShowTotalSum="true" Fill="#4E81BC">
                          <Border Color="#2B557F" />
                      </ej:Points>
                  </Points>
                  <Marker DataLabel-Visible="true" DataLabel-EnableContrastColor="true" DataLabel-Font-FontSize="13px" DataLabel-Font-FontWeight="Regular" DataLabel-TextPosition="Middle">
                  </Marker>
                  <Tooltip Visible="true"></Tooltip>
                  <Border Color="#8E2827" />
              </ej:Series>
          </Series>
           <Legend Visible="false"></Legend>
          <Title Text="Company Revenue and Profit"></Title>
      </ej:Chart>
  </div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
  
</asp:Content>

