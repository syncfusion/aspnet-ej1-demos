<%@ Page Title="BulletGraph-Data Binding - Local-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the sale review based on thousand people in the Syncfusion ASP.NET Web Forms Bullet graph control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="LocalBinding.aspx.cs" Inherits="WebSampleBrowser.BulletGraph.LocalBinding" %>

<%--<%@ Register Assembly="Syncfusion.EJ.Web" Namespace="Syncfusion.JavaScript.Web" TagPrefix="ej" %>--%>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">BulletGraph / LocalBinding</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
      
      <center>
        <ej:Bulletgraph ID="BulletGraph1" runat="server" Height="400" Width="700" QualitativeRangeSize="320" Orientation="horizontal">
               <QuantitativeScaleSettings Minimum="0" Maximum="10" Location-X="120"  Location-Y="10">
                    <MajorTickSettings width="1" stroke="gray" size="13"/>
                    <MinorTickSettings width="1" stroke="gray" size="5"/>
                    <LabelSettings offset="14" size="10" />             
                </QuantitativeScaleSettings>
            <Fields CategoryField="category" ComparativeMeasureField="comparitiveMeasureValue" FeatureMeasureField="value" />
             <QualitativeRanges>
                <ej:QualitativeRanges RangeEnd="4.3" />
                <ej:QualitativeRanges RangeEnd="7.3" />
                <ej:QualitativeRanges RangeEnd="10" />
            </QualitativeRanges>
            <TooltipSettings Visible="true" Template="Tooltip" />
          
            <CaptionSettings Text="Revenue YTD" TextAngle="-90" Location-X="55" Location-Y="210" Font-FontColor="Red" 
                      Font-FontFamily="Segoe UI" Font-FontStyle="normal" Font-Size="15px" Font-FontWeight="Normal" Font-Opacity="1">
                 <SubTitle TextAngle="-90" Text= "$ in thousands" Location-X="70" Location-Y="210" Font-FontFamily="Segoe UI"
                      Font-FontStyle="normal" Font-Size="12px" Font-FontWeight="normal" Font-Opacity="1" />
            </CaptionSettings>
            </ej:Bulletgraph>

     </center>

  <div id="Tooltip" style="display:none; width:125px;padding-top: 10px;padding-bottom:10px">
           <div align="center" style="font-weight:bold">
           Sales</div>                
           <table>
           <tr><td>Current</td>
               <td>: {{:currentValue}}</td></tr>
           <tr><td>Target</td>
               <td>: {{:targetValue}}</td></tr>
           </table>    
</div>
       
</asp:Content>

