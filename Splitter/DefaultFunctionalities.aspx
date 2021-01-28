<%@ Page Title="Splitter-Default Functionalities-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates using the Syncfusion ASP.NET Web Forms Splitter component to divide a web page into distinct areas by inserting resizable panes." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.Splitter.DefaultFunctionalities" %>

<%@ Register Assembly="Syncfusion.EJ.Web" TagPrefix="ej" Namespace="Syncfusion.JavaScript.Web" %>
<%@ Register Assembly="Syncfusion.EJ" Namespace="Syncfusion.JavaScript.Models" TagPrefix="cc1" %>


<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">

    <ej:Splitter ID="outersplitter" Height="250" Width="401" Orientation="Vertical" runat="server" EnableAutoResize="true">
        <ej:SplitPane>
            <ej:Splitter ID="innersplitter" Width="401" runat="server" EnableAutoResize="true">
                <ej:SplitPane>
                    <div>
                        <div class="cont">Pane 1</div>
                    </div>
                </ej:SplitPane>
                <ej:SplitPane>
                    <div>
                        <div class="cont">Pane 2</div>
                    </div>
                </ej:SplitPane>
            </ej:Splitter>
        </ej:SplitPane>
        <ej:SplitPane PaneSize="80">
            <div>
                <div class="cont">Pane 3 </div>
            </div>
        </ej:SplitPane>

    </ej:Splitter>
</asp:Content>


<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .cont {
            padding: 10px 0 0 10px;
            text-align: center;
        }

    </style>
</asp:Content>



