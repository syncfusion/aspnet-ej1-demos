<%@ Page Title="DatePicker-Special Dates-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master"MetaDescription="This example demonstrates how to highlight the specific dates like weekends, holidays and special dates in a ASP.NET Web Forms DatePicker." CodeBehind="SpecialDates.aspx.cs" Inherits="WebSampleBrowser.DatePicker.SpecialDates" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame ">
        <div class="control">
            <ej:DatePicker runat="server" ID="datepick" Value="5/17/2018" Width="100%">
                <SpecialDates>
                    <ej:SpecialDates Date="5/8/2018" Tooltip="In Australia" IconClass="flags sprite-Australia" />
                    <ej:SpecialDates Date="5/21/2018" Tooltip="In France" IconClass="flags sprite-France" />
                    <ej:SpecialDates Date="5/17/2018" Tooltip="In USA" IconClass="flags sprite-USA" />
                    <ej:SpecialDates Date="6/15/2018" Tooltip="In Germany" IconClass="flags sprite-Germany" />
                    <ej:SpecialDates Date="4/22/2018" Tooltip="In India" IconClass="flags sprite-India" />
                </SpecialDates>
            </ej:DatePicker>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .frame {
            padding: 50px;
            width: 30%;
        }
        .flags {
            width: 16px !important;
            background-image: url("../Content/images/tab/flags.png");
            background-repeat: no-repeat;
        }

        .sprite-Australia {
            background-position: 0 -2px;
        }

        .sprite-Germany {
            background-position: 0 -398px;
        }

        .sprite-India {
            background-position: -3px -462px;
        }

        .sprite-France {
            background-position: 0px -331px;
        }

        .sprite-USA {
            background-position: 0 -1121px;
        }

        .e-datepicker.e-calendar { 
            width: 26em;
        }

    </style>
</asp:Content>

