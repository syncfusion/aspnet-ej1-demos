<%@ Page Title="Buttons-Radio Buttons-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="RadioButton.aspx.cs" Inherits="WebSampleBrowser.Buttons.radio" MetaDescription="This example demonstrates the default functionalities of the RadioButton and its various property like size, text, checked, enabled and value in a ASP.NET Web Forms" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
            <div class="radioalign">
                <br />
                Category<br />
                <br />
                <table>
                    <tr>
                        <td class="chkrad">
                            <ej:RadioButton Name="category" ID="RadioSizeSmallChecked" runat="server" Text="Fresher" Size="Small" CssClass="RadioNode" Checked="true"></ej:RadioButton>
                        </td>
                        <td class="chkrad" colspan="2">
                            <ej:RadioButton Name="category" ID="RadioSizeSmall" runat="server" Text="Experienced" Size="Small" CssClass="RadioNode"></ej:RadioButton>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
                Experienced<br />
                <br />
                <table>
                    <tr>
                        <td class="chkrad">
                            <ej:RadioButton Name="Experience" ID="RadioSizeMediumChecked" runat="server" Text="1+years" Size="Medium" CssClass="RadioNode" Checked="true"></ej:RadioButton>
                        </td>
                        <td class="chkrad">
                            <ej:RadioButton Name="Experience" ID="RadioSizeMediumRtl" runat="server" Text="2.5+years" Size="Medium" CssClass="RadioNode" EnableRTL="false"></ej:RadioButton>
                        </td>
                        <td class="chkrad">
                            <ej:RadioButton Name="Experience" ID="RadioSizeMedium" runat="server" Text="5+years" Size="Medium" CssClass="RadioNode"></ej:RadioButton>
                        </td>
                    </tr>
                </table>
                <br />
            </div>
        </div>
    </div>
</asp:Content>


<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
      @media (max-width: 977px) and (min-width: 312px) {
            .chkrad {
               white-space:nowrap !important;
                           }
            .frame{
                width:250px !important;
            }
        }
        .frame {
            width: 250px;
        }
        .chkrad{
            white-space:nowrap;
        }    
    </style>
</asp:Content>

