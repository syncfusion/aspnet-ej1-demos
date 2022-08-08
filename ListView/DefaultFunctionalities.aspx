<%@ Page Title="ListView-Default Functionalities-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to create sets of data items using the Syncfusion ASP.NET Web Forms ListView component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.ListView.DefaultFunctionalities" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <ej:ListView ID="List" runat="server" ShowHeader="true" HeaderTitle="Favorite" ShowHeaderBackButton="true" HeaderBackButtonText="Back" Height="450" Width="400" ClientSideOnMouseDown="onmousedown">
        <Items>
            <ej:ListViewItems Text="Discover Music">
                <Items>
                    <ej:ListViewItems Text="Hot Singles"></ej:ListViewItems>
                    <ej:ListViewItems Text="Rising Artists"></ej:ListViewItems>
                    <ej:ListViewItems Text="Live Music"></ej:ListViewItems>
                    <ej:ListViewItems Text="Best of 2013 So Far"></ej:ListViewItems>
                </Items>
            </ej:ListViewItems>
        </Items>
        <Items>
            <ej:ListViewItems Text="Sales and Events">
                <Items>
                    <ej:ListViewItems Text="100 Albums - $5 Each"></ej:ListViewItems>
                    <ej:ListViewItems Text="Hip-Hop and R&B Sale"></ej:ListViewItems>
                    <ej:ListViewItems Text="CD Deals"></ej:ListViewItems>
                </Items>
            </ej:ListViewItems>
        </Items>
        <Items>
            <ej:ListViewItems Text="Categories">
                <Items>
                    <ej:ListViewItems Text="Songs"></ej:ListViewItems>
                    <ej:ListViewItems Text="BestSelling Albums"></ej:ListViewItems>
                    <ej:ListViewItems Text="New Releases"></ej:ListViewItems>
                    <ej:ListViewItems Text="Bestselling Songs"></ej:ListViewItems>
                </Items>
            </ej:ListViewItems>
        </Items>
        <Items>
            <ej:ListViewItems Text="MP3 Albums">
                <Items>
                    <ej:ListViewItems Text="Rock"></ej:ListViewItems>
                    <ej:ListViewItems Text="Gospel"></ej:ListViewItems>
                    <ej:ListViewItems Text="Latin Music"></ej:ListViewItems>
                    <ej:ListViewItems Text="Jazz"></ej:ListViewItems>
                </Items>
            </ej:ListViewItems>
        </Items>
        <Items>
            <ej:ListViewItems Text="More in Music">
                <Items>
                    <ej:ListViewItems Text="Music Trade-In"></ej:ListViewItems>
                    <ej:ListViewItems Text="Redeem a Gift Card"></ej:ListViewItems>
                    <ej:ListViewItems Text="Branded T-Shirts"></ej:ListViewItems>
                    <ej:ListViewItems Text="Mobile MVC"></ej:ListViewItems>
                </Items>
            </ej:ListViewItems>
        </Items>
    </ej:ListView>

    <script>

        function onmousedown(args) {
            var listObj = $("#<%=List.ClientID%>").ejListView("instance");
            listObj.model.headerBackButtonText = args.text;
        }

</script>

</asp:Content>

