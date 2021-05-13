<%@ Page Title="TreeGrid-Stacked Header-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates how to stack or group column headers in the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridStackedHeader.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridStackedHeader" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Stacked Header</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlStackedHeader" ShowStackedHeader="true" ChildMapping="SubTasks" TreeColumnIndex="1" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn HeaderText="S.No" Field="ID" Width="45" />
                <ej:TreeGridColumn HeaderText="Shipment Name" Field="Name" />
                <ej:TreeGridColumn HeaderText="Category" Field="Category" />
                <ej:TreeGridColumn HeaderText="Units" Field="Units" />
                <ej:TreeGridColumn HeaderText="Unit Price($)" Field="UnitPrice" />
                <ej:TreeGridColumn HeaderText="Price($)" Field="Price" />
            </Columns>
            <SizeSettings Width="100%" Height="450px" />
            <StackedHeaderRows>
                <ej:TreeGridStackedHeaderRow>
                    <StackedHeaderColumns>
                        <ej:TreeGridStackedHeaderColumn Column="ID,Name,Category,Units" HeaderText="Shipment Details" TextAlign="center"  />
                        <ej:TreeGridStackedHeaderColumn Column="UnitPrice,Price" HeaderText="Price Details" TextAlign="center"  />
                    </StackedHeaderColumns>
                </ej:TreeGridStackedHeaderRow>
            </StackedHeaderRows>
        </ej:TreeGrid>
    </div>
</asp:Content>

