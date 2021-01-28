<%@ Page Title="Create Multiple Column AutoComplete in ASP.NET | Syncfusion" MetaDescription="This example demonstrates multiple columns in the suggestion list in the Syncfusion ASP.NET Web Forms Autocomplete component." Language="C#" AutoEventWireup="true" CodeBehind="MultiColumn.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.AutoComplete.MultiColumn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Autocomplete ID="selectCar" runat="server" Width="100%" WatermarkText="Select a order" HighlightSearch="true" ShowPopupButton="true">
				<MultiColumnSettings Enable="true" ShowHeader="true" StringFormat="{0} ({3}) ({1})"   >
					<Columns>
						<ej:Columns Field="CustomerID" HeaderText="CustomerID" />
						<ej:Columns Field="OrderID" HeaderText="OrderID" />
						<ej:Columns Field="EmployeeID" HeaderText="EmployeeID" />
						<ej:Columns Field="ShipCity" HeaderText="ShipCity" />
					</Columns>
				</MultiColumnSettings> 
            </ej:Autocomplete>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width: 30%;
            padding: 50px;
        }
    </style>
</asp:Content>

