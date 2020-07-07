<%@ Page Language="C#" Title="Menu-Default Functionalities-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This example demonstrates how to initialize a simple menu using Syncfusion ASP.NET Web Forms Menu control." Inherits="WebSampleBrowser.Menu.DefaultFunctionalities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="imgframe controlframe" style="width: 514px">
        <ej:Menu ID="syncfusionProducts" runat="server">
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
                                <ej:MenuItem Text="White Papers<"></ej:MenuItem>
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

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
		.office-365 .controlframe{
            width: 560px !important;
        }
        .imgframe {
            background: url("../Content/images/menu/menu-bg.png") no-repeat scroll 0 0 transparent;
            height: 213px;
            margin: 0 auto;
            background-size: 100% 100%;
        }

        div.e-menu-res-wrap li a {
            background-color:#fff;
        }
    </style>
</asp:Content>

