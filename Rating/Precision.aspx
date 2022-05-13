<%@ Page Title="Rating-Precision-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Precision.aspx.cs" MetaDescription="This example demonstrates the different precision modes with Syncfusion ASP.NET Web Forms Rating control." Inherits="WebSampleBrowser.Rating.precision" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="frame">
        <table>
            <tr>
                <td valign="top">Full Precision :
                </td>
                <td>
                    <ej:Rating ID="Rating1" runat="server" Value="4"></ej:Rating>
                </td>
            </tr>
            <tr>
                <td valign="top">Half Precision :
                </td>
                <td>
                    <ej:Rating ID="Rating2" runat="server" Value="4"></ej:Rating>
                </td>
            </tr>
            <tr>
                <td valign="top">Exact Precision :
                </td>
                <td>
                    <ej:Rating ID="Rating3" runat="server" Value="4"></ej:Rating>
                </td>
            </tr>
        </table>
    </div>

</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            width:30%;
        }
    </style>
</asp:Content>

