<%@ Page Language="C#" Title="Tab-Ajax Content-ASP.NET-SYNCFUSION" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="AjaxContent.aspx.cs" MetaDescription="This example demonstrates loading the Syncfusion ASP.NET Web Forms Tab control content using Ajax requests." Inherits="WebSampleBrowser.Tab.AjaxContent" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">

    <div class="controlframe">

        <ej:Tab ID="DefaulttasdbContent" runat="server">
            <Items>
                <ej:TabItem ID="ASPNET" Text="ASP.NET">
                    <ContentSection>
                        <table>
                            <tr>
                                <td style="vertical-align:top">
                                    <div>
                                       Microsoft ASP.NET is a set of technologies in the Microsoft .NET Framework for building Web applications and XML Web services. ASP.NET pages execute on the server and generate markup such as HTML, WML, or XML that is sent to a desktop or mobile browser. ASP.NET pages use a compiled, event-driven programming model that improves performance and enables the separation of application logic and user interface.
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </ContentSection>
                </ej:TabItem>
                <ej:TabItem ID="MVC" Url="../Tab/AjaxContents/mvccontent.html" Text="ASP.NET MVC">
                </ej:TabItem>
                <ej:TabItem ID="WPF" Url="../Tab/AjaxContents/wpfcontent.html" Text="WPF">
                </ej:TabItem>

            </Items>
        </ej:Tab>

    </div>
</asp:Content>

