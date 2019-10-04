<%@ Page Title="Select multiple values from ASP.NET AutoComplete | Syncfusion" MetaDescription="This example demonstrates using the Syncfusion ASP.NET Web Forms Autocomplete component to select multiple values from the suggestion list." Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="MultipleValues.aspx.cs" Inherits="WebSampleBrowser.AutoComplete.MultipleValues" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="row">
            <div class="control">
                <span class="txt">Using Delimiter</span>
                <ej:Autocomplete ID="delimit" runat="server" Width="100%" MultiSelectMode="Delimiter" ShowPopupButton="true"></ej:Autocomplete>
            </div>
            <div class="control">
                <span class="txt">Using VisualMode</span>
                <ej:Autocomplete ID="visualmode" runat="server" Width="100%" MultiSelectMode="VisualMode" ShowPopupButton="true"></ej:Autocomplete>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css" class="cssStyles">
        .frame {
            height: 20%;
            width: 30%;
            padding: 50px;
        }

        .control {
            width: 100%;
            display: inline-block;
            float: left;
        }

            .control:first-child {
                margin-bottom: 15px;
            }

        .txt {
            display: block;
            margin-bottom: 12px;
        }
    </style>
</asp:Content>

