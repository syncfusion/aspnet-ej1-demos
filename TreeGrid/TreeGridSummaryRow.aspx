<%@ Page Title="TreeGrid-Summary Row-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates displaying rows to summarize the column fields in a tree grid." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridSummaryRow.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridSummaryRow" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / SummaryRow</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ShowSummaryRow="true" ShowTotalSummary="true" TotalSummaryHeight="120" CollapsibleTotalSummary="true" ID="TreeGridControlSummaryRow" ChildMapping="Children" TreeColumnIndex="0" IsResponsive="true" AllowColumnResize="true">
             <Columns>
                <ej:TreeGridColumn HeaderText="Freight ID" Field="FreightID" EditType="String" Width="85" />
                <ej:TreeGridColumn HeaderText="Freight Name" Field="FreightName" EditType="String" Width="125" />              
                <ej:TreeGridColumn HeaderText="Total Units" Field="TotalUnits" EditType="Numeric" Width="125" />
                <ej:TreeGridColumn HeaderText="Total Costs" Field="TotalCosts" EditType="Numeric" Width="150" />
                 <ej:TreeGridColumn HeaderText="Unit Weight" Field="UnitWeight" EditType="Numeric" Width="125" />
            </Columns>
            <SummaryRows>               
               <ej:TreeGridSummaryRow Title="Maximum">
                   <SummaryColumn>
                       <ej:TreeGridSummaryColumn SummaryType="Maximum" DataMember="TotalUnits" DisplayColumn="TotalUnits"  Prefix="Maximum unit = "/>                      
                   </SummaryColumn> 
                   <SummaryColumn>
                       <ej:TreeGridSummaryColumn SummaryType="Maximum" DataMember="TotalCosts" DisplayColumn="TotalCosts" Prefix="Maximum cost = " Format="{0:C}" />
                    </SummaryColumn>              
                </ej:TreeGridSummaryRow>
                <ej:TreeGridSummaryRow Title="Minimum">
                    <SummaryColumn>
                         <ej:TreeGridSummaryColumn SummaryType="Minimum" DataMember="TotalUnits" DisplayColumn="TotalUnits"  Prefix="Minimum unit = "/>                      
                    </SummaryColumn>
                </ej:TreeGridSummaryRow>
                <ej:TreeGridSummaryRow Title="Total">
                    <SummaryColumn>
                        <ej:TreeGridSummaryColumn SummaryType="Sum" DataMember="TotalCosts" DisplayColumn="TotalCosts" Prefix="Total costs =  " Format= "{0:C}" />
                        <ej:TreeGridSummaryColumn SummaryType="Sum" DataMember="UnitWeight" DisplayColumn="UnitWeight" Prefix="Total weight = " Suffix=" Pounds" />
                    </SummaryColumn>
                </ej:TreeGridSummaryRow>
                <ej:TreeGridSummaryRow Title="Average">
                    <SummaryColumn>
                        <ej:TreeGridSummaryColumn SummaryType="Average" DataMember="TotalCosts" DisplayColumn="TotalCosts" Prefix="Total costs =  " Format= "{0:C}" />
                    </SummaryColumn>
                </ej:TreeGridSummaryRow>
            </SummaryRows>           
            <SizeSettings Width="100%" Height="350px" />            
        </ej:TreeGrid>
    </div>
</asp:Content>

