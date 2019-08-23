<%@ Page Title="BulletGraph-Data Binding - Remote-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample demonstrates the product unit based on product Id in the Syncfusion ASP.NET Web Forms Bullet graph control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="RemoteBinding.aspx.cs" Inherits="WebSampleBrowser.BulletGraph.RemoteBinding" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">BulletGraph / Default</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    
    <center>
        <ej:BulletGraph ID="BulletGraph1" ClientIDMode="Static" runat="server" Height="540" EnableAnimation="true"  FlowDirection="Backward" 
            QualitativeRangeSize="320" QuantitativeScaleLength="475" Orientation="Vertical">
            <TooltipSettings Visible="true" Template="Tooltip" />
            <QuantitativeScaleSettings Location-X="50" Location-Y="170" Maximum="45" Minimum="5" Interval="10" 
                MinorTicksPerInterval="4" TickPosition="Near">
                <MajorTickSettings width="1" stroke="gray" size="13"/>
                <MinorTickSettings width="1" stroke="gray" size="5"/>
                <LabelSettings Position="Above" offset="14" size="10" />
                </QuantitativeScaleSettings>
            <QualitativeRanges>
                <ej:QualitativeRanges RangeEnd="25" />
                <ej:QualitativeRanges RangeEnd="37" />
                <ej:QualitativeRanges RangeEnd="45" />
            </QualitativeRanges>
            <Fields query="ej.Query().from('Products').take(10).where('UnitPrice', ej.FilterOperators.greaterThan, 18, false).where('UnitPrice', ej.FilterOperators.lessThanOrEqual, 40, false).where('UnitsInStock', ej.FilterOperators.greaterThan, 5, false).where('UnitsInStock',ej.FilterOperators.lessThanOrEqual,45,false)"
                 CategoryField="ProductID" FeatureMeasureField="UnitPrice" ComparativeMeasureField="UnitsInStock" />
            <CaptionSettings Location-X="270" Location-Y="540" TextAngle="0" Text="Product (with ID's)"  
                    Font-FontFamily="Segoe UI" Font-FontStyle="normal" Font-Size="15px" Font-FontWeight="regular" Font-Opacity="1" >
                <SubTitle TextAngle="270" Text= "Production in Units" Location-X="115" Location-Y="290" 
                    Font-FontFamily="Segoe UI" Font-FontStyle="normal" Font-Size="15px" Font-FontWeight="regular" Font-Opacity="1" />
            </CaptionSettings>
        </ej:BulletGraph>
    </center>      
    <script type="text/javascript" >
            var dataManger = new ej.DataManager({
                url: "//js.syncfusion.com/demos/ejServices/Wcf/Northwind.svc/", crossDomain: true
            });

            // Query creation
              var query = ej.Query().from("Products").take(10).where("UnitPrice", ej.FilterOperators.greaterThan, 18, false).where("UnitPrice", ej.FilterOperators.lessThanOrEqual, 40, false).where("UnitsInStock", ej.FilterOperators.greaterThan, 5, false).where("UnitsInStock",ej.FilterOperators.lessThanOrEqual,45,false); 
            $("#BulletGraph1").ejBulletGraph({
                height: 540,
                fields: {
                    dataSource: dataManger, query: query, category: "ProductID",
                    featureMeasures: "UnitPrice",
                    comparativeMeasure: "UnitsInStock"
                }
            });
    </script>
    <div id="Tooltip" style="display:none; width:125px;padding-top: 10px;padding-bottom:10px">
       
                <div align="center" style="font-weight:bold">
                    Production
                </div>                
           <table>
           <tr>
                <td>
                   Production level
                </td>
                <td>
                    : {{:currentValue}}
                </td>
               
            </tr>
            <tr>
                <td>
                    Estimated level
                </td>
                <td>
                    : {{:targetValue}}
                </td>
               
            </tr>
             <tr>
                <td>
                    Product ID
                </td>
                <td >
                    : {{:category}}
                </td>
               
            </tr>
                          
        </table>    

</div>
</asp:Content>

