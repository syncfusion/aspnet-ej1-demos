<%@ Page Title="DropDownList-Default Functionalities-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This demo explains how to initilalize a simple Syncfusion ASP.NET Web Forms DropDownList control." Inherits="WebSampleBrowser.DropDownList.DefultFunctionalities" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="selectCar" runat="server" WatermarkText="Select a car" Width="100%">
                <Items>
                    <ej:DropDownListItem Text="Audi A4" Value="Audi A4"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Audi A5" Value="Audi A5"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Audi A6" Value="Audi A6"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Audi A7" Value="Audi A7"></ej:DropDownListItem>
                    <ej:DropDownListItem Text="Audi A8" Value="Audi A8"></ej:DropDownListItem>
                </Items>
            </ej:DropDownList>
        </div>
    </div>

</asp:Content>


