<%@ Page Title="PredictiveAnalytics-Titanic-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeModelTitanic.aspx.cs" Inherits="WebSampleBrowser.PredictiveAnalytics.TreeModelTitanic" %>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:Tab ID="output" runat="server" ClientSideOnActive="onTabChange">
            <Items>
                <ej:TabItem ID="result" Text="Predicted Result">
                    <ContentSection>
                        <div class="tab_height" id="gridpadding">
                            <ej:Grid ID="OutputGrid"
                                runat="server"
                                AllowResizeToFit="true"
                                AllowResizing="true"
                                AllowScrolling="true"
                                AllowPaging="true"
                                MinWidth="700"                                
                                IsResponsive="true">
                                <ClientSideEvents ActionComplete="gridComplete" />
                                <DataManager URL="treemodeltitanic.aspx/GetData" Adaptor="UrlAdaptor" />
                                <PageSettings PageCount="3" PageSize="17" />
                                <ScrollSettings Height="570" />
                            </ej:Grid>
                        </div>
                    </ContentSection>
                </ej:TabItem>


                <ej:TabItem ID="rcode" Text="R ">
                    <ContentSection>
                        <div class="tab_height">
                            <textarea id="rScript" cols="500" rows="100"></textarea>
                        </div>
                    </ContentSection>
                </ej:TabItem>


                <ej:TabItem ID="pmml" Text="PMML">
                    <ContentSection>
                        <div class="tab_height">
                             <textarea id="pmmlFile" rows="100" cols="400"><%= Session["pmmlFile"]%></textarea>
                        </div>
                    </ContentSection>
                </ej:TabItem>

            </Items>
        </ej:Tab>
    </div>
</asp:Content>

<asp:Content ID="ScriptContent" runat="server" ContentPlaceHolderID="ScriptSection">    
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/codemirror.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/r.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/xml.js")%>' type="text/javascript"></script>

    <script type="text/javascript">
        var editorPMML = null;
        var editorR = null;
        
        $(document).ready(function () {
            var rscript = "<%= Session["rscript"]%>";
                var browserDetails = getBrowserDetails();
                window.flag = "false";

                for (var i = 0; i < rscript.length; i++)
                    rscript = rscript.replace(';', '"');


                rscript = rscript.substring(1, rscript.length - 2);
                if (browserDetails.browser === "msie" && browserDetails.version === "8.0") {
                    rscript = document.createTextNode(rscript);
                }
                document.getElementById("rScript").value = rscript;

                editorR = CodeMirror.fromTextArea(document.getElementById("rScript"), {
                    matchBrackets: true,
                    mode: "text/x-rsrc",
                    lineWrapping: true
                });

                editorPMML = CodeMirror.fromTextArea(document.getElementById("pmmlFile"), {
                    matchBrackets: true,
                    mode: "application/xml",
                    lineWrapping: true
                });
        });

        function onTabChange(args) {
            if (args.activeHeader.innerText == "R") {
                if (editorR)
                    editorR.refresh();
            } else if (args.activeHeader.innerText == "PMML") {

                if (editorPMML)
                    editorPMML.refresh();
            }
        }

            //GET THE BROWSER DETAILS
            function getBrowserDetails() {
                var b = navigator.userAgent.match(/(firefox|chrome|opera|msie|safari)\s?\/?(\d+(.\d+)*)/i);
                if (!!navigator.userAgent.match(/Trident\/7\./))
                    return { browser: "msie", version: jQuery.uaMatch(navigator.userAgent).version };
                return { browser: b[1].toLowerCase(), version: b[2] };
            }

            function gridComplete(args) {
                if (this.initialRender) {
                    var inputColumnCount = "<%= Session["inputColumnCount"]%>";
                    var tableColumnCount = "<%= Session["tableColumnCount"]%>";
                    var numericColumnsCount = "<%= Session["numericColumnsCount"]%>";

                    var numericColumns = "<%= Session["numericColumns"]%>";
                    var columns = args.model.columns;
                    var gridObj = $('#<%= OutputGrid.ClientID%>').data("ejGrid");


                for (var i = 0; i < tableColumnCount; i++) {

                    if (i >= inputColumnCount) {
                        columns[i].cssClass = "predictedColumnColor";
                    }

                    for (var j = 0; j < numericColumnsCount; j++) {
                        var columnName = numericColumns.split(',');
                        if (columns[i].field == columnName[j]) {
                            columns[i].cssClass = columns[i].cssClass == null ? "numericColumnAlignment" : columns[i].cssClass + " numericColumnAlignment";
                        }
                    }
                }

                gridObj.refreshContent(true);
            }
        }
    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .predictedColumnColor {
            background-color: #d6d3d1 !important;
        }
        .CodeMirror {
           height: 450px !important;
           border: 1px solid darkgray;
         }
 
        .CodeMirror-vscrollbar {
           display: block !important;
        }
          .e-grid .e-headercelldiv{
	        text-overflow:unset !important;
        }
        .e-grid .e-textover .e-headercelldiv{
	        text-overflow:unset !important;
        }
        .numericColumnAlignment{
            text-align:right !important;
        }
    </style>
</asp:Content>

