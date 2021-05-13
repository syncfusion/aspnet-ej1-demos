<%@ Page Title="SpellCheck-Default-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This sample showcases the default functionalities in a ASP.NET Web Forms SpellCheck" Inherits="WebSampleBrowser.SpellCheck.DefaultFunctionalities" %>

<asp:Content ID="Content4" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">SpellChcek / Default</span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="content-container-fluid">
        <div class="row">
            <div>
                <div id="TextArea" contenteditable="true">
                    Facebook is a social networking service headquartered in Menlo Park, California. Its website was launched on February 4, 2004, by Mark Zuckerberg with his Harvard College roommates and fellow students Eduardo, Andrew McCollum, Dustin and Chris Hughes.
                    The fouders had initially limited the websites membrship to Harvard students, but later expanded it to collges in the Boston area, the Ivy League, and Stanford Univrsity. It graually added support for students at various other universities and later to high-school students.
                </div>
                <div>
                    <ej:Button ID="btn_Default" Type="Button" ClientSideOnClick="showInDialog" Text="Spell check using dialog" runat="server"></ej:Button>
                </div>
            </div>
        </div>
    </div>
    <ej:SpellCheck ID="SpellCheck" ClientIDMode="Static" runat="server" ControlsToValidate="#TextArea">
        <DictionarySettings DictionaryUrl="../api/SpellCheck/CheckWords" CustomDictionaryUrl="../api/SpellCheck/AddToDictionary" />
    </ej:SpellCheck>    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function showInDialog() {
            var spellObj = $("#SpellCheck").data("ejSpellCheck");
            spellObj.showInDialog();
        }
    </script>
    <style>
        #TextArea{
			padding-bottom:15px;
		}
		.fixedlayout.office-365 #SpellCheck{
			width:193px !important;
		}
    </style>
</asp:Content>

