<%@ Page Title="DropDownList-Template-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Template.aspx.cs" MetaDescription="This demo shows dropdown items with templates in Syncfusion ASP.NET Web DropDownList control." Inherits="WebSampleBrowser.DropDownList.Template" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <div class="control">
            <ej:DropDownList ID="selectFolder" runat="server" Template="<img class='eimg' src='../Content/images/Employee/${eimg}.png' alt='employee' height='50px' width='50px'/><div class='ename'> ${text} </div><div class='desig'> ${desig} </div><div class='cont'> ${country} </div>" WatermarkText="Select an item" Width="100%">
            </ej:DropDownList>
        </div>
    </div>

</asp:Content>

<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .eimg {
            margin: 0;
            padding: 3px 10px 3px 3px;
            border: 0 none;
            width: 60px;
            height: 60px;
            float: left;
        }

        .ename {
            font-weight: bold;
            padding: 6px 3px 1px 3px;
        }

        .desig, .cont {
            font-size: smaller;
            padding: 3px 3px -1px 0px;
        }
    </style>
</asp:Content>


