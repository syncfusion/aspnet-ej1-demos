<%@ Page Language="C#" Title="Toolbar-Template-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Template.aspx.cs" Inherits="WebSampleBrowser.Toolbar.Template" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <ej:Toolbar ID="toolbarTemplate" Width="270px" runat="server">
                <Items>
                    <ej:ToolbarItem>
                        <Template>
                            <div class="ctrlradio">
                                <ej:RadioButton ID="RadioButton1" Name="small" runat="server">option</ej:RadioButton>
                            </div>                            
                        </Template>
                    </ej:ToolbarItem>
                    <ej:ToolbarItem>
                        <Template>
                            <div style="float: left">
                                <ej:DropDownList ID="selectcar" runat="server" SelectedItemIndex="0" Width="100px" Height="23px">
                                    <Items>
                                        <ej:DropDownListItem Text="Audi A4" Value="Audi A4"></ej:DropDownListItem>
                                        <ej:DropDownListItem Text="Audi A5" Value="Audi A5"></ej:DropDownListItem>
                                        <ej:DropDownListItem Text="Audi A6" Value="Audi A6"></ej:DropDownListItem>
                                        <ej:DropDownListItem Text="Audi A7" Value="Audi A7"></ej:DropDownListItem>
                                        <ej:DropDownListItem Text="Audi A8" Value="Audi A8"></ej:DropDownListItem>
                                    </Items>
                                </ej:DropDownList>
                            </div>
                        </Template>
                    </ej:ToolbarItem>
                </Items>
            </ej:Toolbar>
        </div>
    </div>
</asp:Content>

<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Content/Toolbar/template.css" rel="stylesheet" />
</asp:Content>


