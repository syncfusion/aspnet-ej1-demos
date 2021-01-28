<%@ Page Language="C#" Title="RichTextEditor-Custom Tool-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="CustomTool.aspx.cs" MetaDescription="This example demonstrates customozing the toolbar for adding custom tools in the ASP.NET Web Forms RichTextEditor control." Inherits="WebSampleBrowser.RichTextEditor.CustomTools" %>

<asp:Content ID="Content2" ContentPlaceHolderID="SampleHeading" runat="server">
    Custom Tool
   
</asp:Content>
<asp:Content ID="Content1" runat="server" ContentPlaceHolderID="HeadSection">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/codemirror.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/javascript.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/htmlmixed.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/xml.js")%>' type="text/javascript"></script>
    <link href='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/codemirror.min.css")%>'></link>
    <link href='<%= Page.ResolveClientUrl("~/Scripts/CodeMirror/css.js")%>'></link>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
        <ej:RTE ID="rteSample" AllowEditing="true" Width="100%" ToolsList="customTools" runat="server" MinWidth="200px">
            <RTEContent>
                <p><b>Description:</b></p>
        <p>The Rich Text Editor (RTE) control is an easy to render in
        client side. Customer easy to edit the contents and get the HTML content for
        the displayed content. A rich text editor control provides users with a toolbar
        that helps them to apply rich text formats to the text entered in the text
        area. </p>
       <p><b>Functional
        Specifications/Requirements:</b></p>
        <ol><li><p>Provide
        the tool bar support, it’s also customizable.</p></li><li><p>Options
        to get the HTML elements with styles.</p></li><li><p>Support
        to insert image from a defined path.</p></li><li><p>Footer
        elements and styles(tag / Element information , Action button (Upload, Cancel))</p></li><li><p>Re-size
        the editor support.</p></li><li><p>Provide
        efficient public methods and client side events.</p></li><li><p>Keyboard
        navigation support.</p></li></ol>
            </RTEContent>
            <Tools>
                <CustomTools>
                    <ej:CustomTools Action="showDialog" Css="codeInsert" Name="codeInsert" Text="codeInsert" Tooltip="Insert code snippets" />
                </CustomTools>
            </Tools>
        </ej:RTE>

        <div id="TargetList">
            <ul>
                <li>Java Script</li>
                <li>HTML</li>
                <li>CSS</li>
            </ul>
        </div>
        <ej:Dialog ID="customSourceCode" Title="Paste you code and inset to RTE" ShowOnInit="false" EnableModal="true" Width="596" EnableResize="false" runat="server">
            <DialogContent>
                <table>
                    <tr>
                        <td id="dropselect" style="width: 100px">Select type :
                        </td>
                        <td>
                            <div>
                                <ej:DropDownList ID="languageList" TargetID="TargetList" SelectedItemIndex="0" runat="server" />
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <textarea id="srcCode" style="width: 550px; height: 250px">
                                            <div id="srcArea"></div>
                                </textarea>
                        </td>
                    </tr>
                    <tr>
                        <td id="samplebtn" colspan="2">
                            <div class="e-rte-button e-fieldseparate">
                                <ej:Button ID="insert" Type="Button" Text="Insert" runat="server" ClientSideOnClick="customBtnClick"></ej:Button>
                                <ej:Button ID="cancel" Type="Button" Text="Cancel" runat="server" ClientSideOnClick="customBtnClick"></ej:Button>
                            </div>
                        </td>
                    </tr>
                </table>
            </DialogContent>
        </ej:Dialog>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src="../Scripts/CodeMirror/codemirror.js" type="text/javascript"></script>
    <script src="../Scripts/CodeMirror/javascript.js" type="text/javascript"></script>
    <script src="../Scripts/CodeMirror/css.js" type="text/javascript"></script>
    <script src="../Scripts/CodeMirror/xml.js" type="text/javascript"></script>
    <script src="../Scripts/CodeMirror/htmlmixed.js" type="text/javascript"></script>
    <script type="text/javascript">
        var rteObj;
        window.onload = function () {
            //Add text for custom tool bar element.
            $("div.codeInsert").html("Insert code");
            //load the CodeMirror css in the iframe
            $("#<%=rteSample.ClientID%>_Iframe").contents().find("head").append($("<link href='../Scripts/CodeMirror/codemirror.min.css' rel='stylesheet'></link>"))
            rteObj = $("#<%=rteSample.ClientID%>").data("ejRTE");
            $("#<%=customSourceCode.ClientID%>").ejDialog({ enableResize: false, EnableModal: true, shoeOnInit: false, width: "auto" });
            $("#<%=languageList.ClientID%>").ejDropDownList({ selectItemByIndex: 0 });
            $("#<%=customSourceCode.ClientID%>").find(".e-rte-btn").ejButton({ click: "customBtnClick" });
        };
        function showDialog() {
            var dialogobj = $('#<%=customSourceCode.ClientID%>').data('ejDialog');
            $('#srcCode').val('').show();
            dialogobj.open();
            $('#srcCode').focus();
        }
        function customBtnClick(args) {
            if (this._id == "<%=insert.ClientID%>") {
                var scrLang, lang = $("#<%=languageList.ClientID%>").val();
                if (lang == "Java Script")
                    scrLang = "javascript";
                else if (lang == "HTML")
                    scrLang = "text/html";
                else
                    scrLang = "css";
                var htmlEditor = CodeMirror.fromTextArea($("#srcCode")[0], {
                    lineNumbers: false,
                    mode: scrLang
                });
                var codeTags = $("#<%=customSourceCode.ClientID%>").find(".CodeMirror");
                rteObj.executeCommand("inserthtml", codeTags[0].outerHTML);
				$(rteObj.getDocument()).find(".CodeMirror div.CodeMirror-cursor").css({"display":"none"})
                codeTags.remove();
            }
            $("#<%=customSourceCode.ClientID%>").ejDialog("close");
        }
    </script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="../Scripts/CodeMirror/codemirror.min.css" rel="stylesheet" />
    <style type="text/css">
        .codeInsert {
            height: 22px;
            width: 100px;
            display: block;
            text-align: center;
            font-weight: bold;
        }
		#srcCode{
		height: 250px;
	}
	.material .e-ddl{
		width: 285px !important;
	}
	.material #samplebtn{
		padding: 14px 0px 0px 0px;
	}
	.material #dropselect{
		padding: 4px 80px 24px 0px;
	}
	.material #srcCode{
		width: 550px; 
		height: 100px; 
		border-width: 0px 0px 1px 0px; 
		border-color: rgba(0,0,0,.12);
	}
	.material textarea:focus {
		outline: none;
	}
    </style>
</asp:Content>

