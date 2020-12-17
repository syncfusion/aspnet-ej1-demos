<%@ Page Language="C#" Title="Menu-Open Direction-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="OpenDirection.aspx.cs" MetaDescription="This example demonstrates how the to customize the menu opening direction in a ASP.NET Web Forms" Inherits="WebSampleBrowser.Menu.OpenDirection" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width:80%">
    <ej:Menu ID="syncfusionProducts" SubMenuDirection="left" runat="server">
        <Items>
            <ej:MenuItem Id="Products" Text="Products">
                <Items>
                    <ej:MenuItem Text="ASP.NET"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="ASP.NET MVC"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Mobile MVC"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Silverlight"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Windows Forms"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Windows Phone"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="WinRT (XMAL)"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="WPF"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Orubase Studio"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Metro Studio"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="What's New">
                        <Items>
                            <ej:MenuItem Text="WinRT (XMAL)"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="WPF"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="Silverlight"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="Windows Forms"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="ASP.NET MVC"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="ASP.NET"></ej:MenuItem>
                        </Items>

                    </ej:MenuItem>
                </Items>
            </ej:MenuItem>

            <ej:MenuItem Id="Support" Text="Support">
                <Items>
                    <ej:MenuItem Text="Direct-Trac Support"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Community Forums"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Knowledge Base"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Online Documentation"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Services">
                        <Items>
                            <ej:MenuItem Text="Consulting"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="Taining"></ej:MenuItem>
                        </Items>
                    </ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Community Forums"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Id="Purchase" Text="Purchase"></ej:MenuItem>
            <ej:MenuItem Id="Downloads" Text="Downloads">
                <Items>
                    <ej:MenuItem Text="Evaluation"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Free E-Books"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Metro Studio"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Latest Version"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Version History"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Id="Resources" Text="Resources">
                <Items>
                    <ej:MenuItem Text="Technology Resource Portal">
                        <Items>
                            <ej:MenuItem Text="E-books"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="White Papers"></ej:MenuItem>
                        </Items>
                    </ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Case Studies"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Bouchers & Datasheets"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="FAQ"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
            <ej:MenuItem Id="Company" Text="Company">
                <Items>
                    <ej:MenuItem Text="About Us">
                        <Items>
                            <ej:MenuItem Text="More About Us"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="Management"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="News & Events"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="Customer Quotes"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="Customer Lists"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="Case Studies"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="Awards"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="Media Kit"></ej:MenuItem>
                        </Items>
                    </ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Company Blog"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Technical Blog"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Newsletter"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Partners">
                        <Items>
                            <ej:MenuItem Text="Technology Partners"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="Training Partners"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="Consulting Partners"></ej:MenuItem>
                        </Items>

                    </ej:MenuItem>
                </Items>

                <Items>
                    <ej:MenuItem Text="Locations">
                        <Items>
                            <ej:MenuItem Text="RDU"></ej:MenuItem>
                        </Items>
                        <Items>
                            <ej:MenuItem Text="Chennai"></ej:MenuItem>
                        </Items>
                    </ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Contact Us"></ej:MenuItem>
                </Items>
                <Items>
                    <ej:MenuItem Text="Contact Us"></ej:MenuItem>
                </Items>
            </ej:MenuItem>
        </Items>
    </ej:Menu>
    </div>
</asp:Content>

