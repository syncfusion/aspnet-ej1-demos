<%@ Page Title="Grid-XML Data-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This demo explains how to process and bind the XML type data to the Syncfusion ASP.NET Web Forms DataGrid control" AutoEventWireup="true" CodeBehind="XMLBinding.aspx.cs" MasterPageFile="~/Samplebrowser.Master" Inherits="WebSampleBrowser.Grid.XMLBinding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Data Binding / XML Data</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Grid ID="BooksGrid" runat="server" AllowPaging="True" AllowSorting="True" DataSourceID="XmlDataSource1">   
            <ClientSideEvents Load="load" />        
            <Columns>
                <ej:Column Field="Title" HeaderText=" Title" IsPrimaryKey="True" Width="75" />
                <ej:Column Field="Artist" HeaderText="Artist" Width="80" />
                <ej:Column Field="Country" HeaderText="Country" Width="75" />
                <ej:Column Field="Company" HeaderText="Company" Width="75" />                
                <ej:Column Field="Price" HeaderText="Price" Width="80" TextAlign="Right" Format="{0:N2}" />  
                <ej:Column Field="Year" HeaderText="Year" TextAlign="Right" Width="80" />
            </Columns>
        </ej:Grid>
          <asp:XmlDataSource ID="XmlDataSource1" runat="server" 
        DataFile="~/App_Data/Catalog.xml"></asp:XmlDataSource>
    </div>

    <script type="text/javascript">
        function load(args) {
            for (i = 0; i < this.model.dataSource.length; i++) {
                this.model.dataSource[i]["Price"] = parseFloat(this.model.dataSource[i]["Price"]);
            }
        }
    </script>
</asp:Content>

