<%@ Page Title="BulletGraph-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the default rendering of the Syncfusion ASP.NET Web Forms Bullet graph control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSampleBrowser.BulletGraph.Default" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">BulletGraph / Default</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <center>
                    
    <ej:Bulletgraph ID="BulletGraph1" runat="server" QualitativeRangeSize="32" QuantitativeScaleLength="475" Orientation="horizontal" >
        <TooltipSettings Visible="true" Template="Tooltip" />
        <QuantitativeScaleSettings Location-X="110" Location-Y="10" Minimum="0" Maximum="9" TickPosition="Far" 
            LabelSettings-Position="Below" ComparativeMeasureSettings-Width="5" FeaturedMeasureSettings-width="6"
            Interval="1" MinorTicksPerInterval="4">          
            <FeatureMeasures >
                <ej:FeatureMeasures Value="8" ComparativeMeasure="6.7" Category="" />
            </FeatureMeasures>
            <MajorTickSettings width="1" stroke="gray" size="13"/>
            <MinorTickSettings width="1" stroke="gray" size="5"/>
            <LabelSettings offset="14" size="10" />
        </QuantitativeScaleSettings>
        <QualitativeRanges>
            <ej:QualitativeRanges RangeEnd="4.3" />
            <ej:QualitativeRanges RangeEnd="7.3" />
            <ej:QualitativeRanges RangeEnd="9.82" />
        </QualitativeRanges>
        <CaptionSettings Location-X="17" Location-Y="20" Text="Revenue YTD">
            <Font FontColor="Red" FontFamily="Segoe UI" FontStyle="normal" Size="15px" FontWeight="Normal" Opacity="1" />
             <SubTitle TextAngle="0" Text= "$ in thousands" Location-X="20" Location-Y="35" />
        </CaptionSettings>
    </ej:Bulletgraph>

    <ej:Bulletgraph ID="BulletGraph2" runat="server" QualitativeRangeSize="32" QuantitativeScaleLength="475" Orientation="horizontal">
         <TooltipSettings Visible="true" Template="Tooltip" />
        <QuantitativeScaleSettings Location-X="110" Location-Y="10" Minimum="-10" Maximum="10" TickPosition="Far" 
            LabelSettings-LabelSuffix="%"  LabelSettings-Position="Below" ComparativeMeasureSettings-Width="5"
            FeaturedMeasureSettings-width="6"  Interval="2" MinorTicksPerInterval="4" >           
             <FeatureMeasures >
                <ej:FeatureMeasures Value="8" ComparativeMeasure="6.7" />
            </FeatureMeasures>
            <MajorTickSettings width="1" size="13"/>
            <MinorTickSettings width="1" size="5"/>
            <LabelSettings offset="14" size="10" />
        </QuantitativeScaleSettings>
        <QualitativeRanges>
            <ej:QualitativeRanges RangeEnd="-4" RangeStroke="#61a301"/>
            <ej:QualitativeRanges RangeEnd="3" RangeStroke="#fcda21"/>
            <ej:QualitativeRanges RangeEnd="10" RangeStroke="#d61e3f"/>
        </QualitativeRanges>
        <CaptionSettings Location-X="60" Location-Y="25" Text="Profit"  Font-FontColor="Red" Font-FontFamily="Segoe UI" 
            Font-FontStyle="normal" Font-Size="15px" Font-FontWeight="Normal" Font-Opacity="1" >             
        </CaptionSettings>
    </ej:Bulletgraph>

    <ej:Bulletgraph ID="BulletGraph3" Width="620" runat="server" QualitativeRangeSize="32" QuantitativeScaleLength="475" 
         Orientation="horizontal" FlowDirection="Backward">
         <TooltipSettings Visible="true" Template="Tooltip" />
        <QuantitativeScaleSettings Location-X="125" Location-Y="10" Minimum="-10" Maximum="10" TickPosition="Far" 
            LabelSettings-LabelSuffix="%" LabelSettings-Position="Below" ComparativeMeasureSettings-Width="5" 
            FeaturedMeasureSettings-width="6" Interval="2" MinorTicksPerInterval="4" >           
             <FeatureMeasures >
                <ej:FeatureMeasures Value="-2" ComparativeMeasure="-2" />
            </FeatureMeasures>
            <MajorTickSettings width="1" stroke="gray" size="13"/>
            <MinorTickSettings width="1" stroke="gray" size="5"/>
            <LabelSettings offset="14" size="10" />
        </QuantitativeScaleSettings>
        <QualitativeRanges>
            <ej:QualitativeRanges RangeEnd="-4.3"/>
            <ej:QualitativeRanges RangeEnd="4.3"/>
            <ej:QualitativeRanges RangeEnd="10"/>
        </QualitativeRanges>
        <CaptionSettings Location-X="38" Location-Y="25" Text="Expenses"  Font-FontColor="Red" Font-FontFamily="Segoe UI" 
            Font-FontStyle="normal" Font-Size="15px" Font-FontWeight="Normal" Font-Opacity="1" >             
        </CaptionSettings>
    </ej:Bulletgraph>

    <ej:Bulletgraph ID="BulletGraph4" runat="server" Width="620"  QualitativeRangeSize="32" QuantitativeScaleLength="475"
         Orientation="horizontal" FlowDirection="Backward">
         <TooltipSettings Visible="true" Template="Tooltip" />
        <QuantitativeScaleSettings Location-X="125" Location-Y="10" Minimum="0" Maximum="9" TickPosition="Far"
             LabelSettings-LabelPrefix="$ " LabelSettings-LabelSuffix="K" LabelSettings-Position="Below" 
             LabelSettings-Offset="20" ComparativeMeasureSettings-Width="5" 
             FeaturedMeasureSettings-width="6"  Interval="1" MinorTicksPerInterval="4" >           
             <FeatureMeasures >
                <ej:FeatureMeasures Value="8" ComparativeMeasure="6.7" Category="" />
            </FeatureMeasures>
            <MajorTickSettings width="1" stroke="gray" size="13"/>
            <MinorTickSettings width="1" stroke="gray" size="5"/>
            <LabelSettings offset="14" size="10" />
        </QuantitativeScaleSettings>
        <QualitativeRanges>
            <ej:QualitativeRanges RangeEnd="4.3" RangeStroke="#61a301"/>
            <ej:QualitativeRanges RangeEnd="7.3" RangeStroke="#fcda21"/>
            <ej:QualitativeRanges RangeEnd="9.82" RangeStroke="#d61e3f"/>
        </QualitativeRanges>
        <CaptionSettings Location-X="17" Location-Y="20" Text="Revenue YTD"  Font-FontColor="Red" Font-FontFamily="Segoe UI"
              Font-FontStyle="normal" Font-Size="15px" Font-FontWeight="Normal" Font-Opacity="1" >
             <SubTitle TextAngle="0" Text= "$ in thousands" Location-X="20" Location-Y="35" />
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


