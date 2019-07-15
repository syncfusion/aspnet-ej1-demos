<%@ Page Title="Sparkline-Default Functionalities-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This sample illustrates the default functionality of Syncfusion ASP.NET Web Forms Sparkline control" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebSampleBrowser.Sparkline.Sparkline" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div class="content-container-fluid">
    <div class="row">
        <div class="cols-sample-area" style="width:100%">
            <table style="width:100%;">
                <tr>
                    <td align ="center"><i>Mean Working Hours for year</i></td>
                    <td>
                        <div style="width:170px;">
                        <ej:Sparkline ID="line" runat="server" Type="Line" OnClientLoad="line" >
                            <Tooltip Visible="true">
                                <Font size="12px"></Font>
                            </Tooltip>
    </ej:Sparkline></div>
                    </td>
                    </tr>
                <tr>
                    <td align ="center"><i>Revenue Status</i></td>
                    <td><div style="height:100px;width:150px;">
                         <ej:Sparkline ID="column" runat="server" OnClientLoad="column">
                             <Tooltip Visible="true">
                                <Font size="12px"></Font>
                            </Tooltip>
    </ej:Sparkline></div>
                    </td>

                </tr>
                <tr>
                    <td align ="center"><i>Project Status Tracing</i></td>
                    <td><div style="height:100px;width:150px;">
                        <ej:Sparkline ID="area" runat="server" OnClientLoad="area">
                           <Tooltip Visible="true">
                                <Font size="12px"></Font>
                            </Tooltip>
    </ej:Sparkline></div>
                    </td>

                </tr>
                <tr>
                    <td align ="center"><i>Profit Comparison for each months</i></td>
                    <td><div style="height:100px;width:150px;">
                       <ej:Sparkline ID="winloss" runat="server" OnClientLoad="winloss">
    </ej:Sparkline></div>
                    </td>

                </tr>
                <tr>
                    <td align ="center"><i>Expenditure for a year</i></td>
                    <td>                       
                        <table><tr>
                               <td><div style="height:40px;width:40px;"> 
                                   <ej:Sparkline ID="pie1" runat="server" OnClientLoad="pie1">
                                       <Tooltip Visible="true">
                                <Font size="12px"></Font>
                            </Tooltip>
                                   </ej:Sparkline>
                                   </div>
                               </td>
                               <td>
                                   <div style="height:40px;width:40px;">
                                        <ej:Sparkline ID="pie2" runat="server" OnClientLoad="pie2">
                                             <Tooltip Visible="true">
                                <Font size="12px"></Font>
                            </Tooltip></ej:Sparkline>
                               <td><div style="height:40px;width:40px;"> <ej:Sparkline ID="pie3" runat="server" OnClientLoad="pie3">
                                  <Tooltip Visible="true">
                                <Font size="12px"></Font>
                            </Tooltip></ej:Sparkline></div></td>
                               <td> <div style="height:40px;width:40px;"><ej:Sparkline ID="pie4" runat="server" OnClientLoad="pie4">
                                    <Tooltip Visible="true">
                                <Font size="12px"></Font>
                            </Tooltip></ej:Sparkline></div></td>
                            </tr>
                        <tr>
                            <td align="center">Q1</td>
                            <td align="center">Q2</td>
                            <td align="center">Q3</td>
                            <td align="center">Q4</td>
                        </tr>
                            </table>
                    </td>

                </tr>
            </table>
        </div>
    </div>
</div>    
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ScriptSection">
<script type="text/javascript">
    $(window).on('load', function() {
        if (!!window.SVGSVGElement) {
            $("#LayoutSection_maincontrolarea").css('visibility', 'visible');
        }
        else
            $("#LayoutSection_maincontrolarea").css('visibility', 'hidden');
    })
    if (!!window.SVGSVGElement) {
           var model;
    function line(args){
        model=args.model;
        model.dataSource = [3, 4, 1, 11, 2, 5, 12, 8, 6, 9, 7, 10, 3, 4, 1, 11, 2, 5, 12, 8, 6, 9, 7, 10, 3, 4, 1, 11, 2, 5, 12, 8, 6, 9, 7, 10, ];
        model.type = "line";
        model.size.height = 40;
        model.size.width = 170;
    }
    function column(args) {
        model = args.model;
        model.dataSource = [2, 6, -1, 1, 12, 5, -2, 7, -3, 5, 8, 10, ];
        model.width = 0.4;
        model.type = "column";
        model.negativePointColor = "red";
        model.highPointColor = "blue";
        model.size.height = 100;
        model.size.width = 150;
    }
    function area(args) {
        model = args.model;
        model.dataSource = [12, -10, 11, 8, 17, 6, 2, -17, 13, -6, 8, 10, ];
        model.markerSettings.visible = true;
        model.type = "area";
        model.highPointColor = "blue";
        model.lowPointColor = "orange";
        model.size.height = 100;
        model.size.width = 150;
    }
    function winloss(args) {
        model = args.model;
        model.dataSource = [12, 15, -11, 13, 17, 0, -12, 17, 13, -15, 8, 10, ];
        model.type = "winloss";
        model.size.height = 100;
        model.size.width = 150;
    }
    function pie1(args) {
        model = args.model;
        model.dataSource = [4, 6, 7];
        model.type = "pie";
        model.border.width = 0;
        model.size.height = 40;
        model.size.width = 40;
    }
    function pie2(args) {
        model = args.model;
        model.dataSource = [8, 9, 1, ];
        model.type = "pie";
        model.border.width = 0;
        model.size.height = 40;
        model.size.width = 40;
    }
    function pie3(args) {
        model = args.model;
        model.dataSource = [2, 3, 5];
        model.type = "pie";
        model.border.width = 0;
        model.size.height = 40;
        model.size.width = 40;
    }
    function pie4(args) {
        model = args.model;
        model.dataSource = [10, 12, 11];
        model.type = "pie";
        model.border.width = 0;
        model.size.height = 40;
        model.size.width = 40;
    }
    } else {
        alert("Sparkline will not be supported in IE Version < 9");
    }
    </script>
    </asp:Content>

