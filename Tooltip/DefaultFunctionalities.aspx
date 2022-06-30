<%@ Page Language="C#" Title="Tooltip-Default Functionalities-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="DefaultFunctionalities.aspx.cs" MetaDescription="This sample demonstrates the default functionalities in the Syncfusion ASP.NET Web Forms Tooltip" Inherits="WebSampleBrowser.Tooltip.DefaultFunctionalities" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame">
        <div class="control">
         <div class="content-container-fluid">
        <div class="row">
            
                <div class="frame">
                    <div class="control">
                        JavaScript is a high-level, dynamic, untyped, and interpreted programming language. It has been standardized in the <a id="link1"><u> ECMAScript </u> </a>language specification. Alongside HTML and CSS, it is one of the three essential technologies of <a id="link2"><u> World&nbsp;Wide&nbsp;Web </u> </a>content production; the majority of websites employ it and it is supported by all modern Web browsers without plug-ins. JavaScript is prototype-based with first-class functions, making it a multi-paradigm language, supporting <a id="link3"> <u>object&nbsp;-&nbsp;oriented </u> </a>, imperative, and functional programming styles.
                    </div>
                </div>
            
        </div>
    </div>
        </div>
    </div>
    <ej:Tooltip For="link1" runat="server" ClientIDMode="Static"  Content="ECMAScript (or ES) is a trademarked scripting-language specification standardized by Ecma International in ECMA-262 and ISO/IEC 16262."></ej:Tooltip>
    <ej:Tooltip For="link2" runat="server" ClientIDMode="Static"  Content="The World Wide Web (WWW) is an information space where documents and other web resources are identified by URLs, interlinked by hypertext links, and can be accessed via the Internet.">
        <Position>
            <Stem Horizontal="left" Vertical="center" />
            <Target Horizontal="right" Vertical="center" />
        </Position>
    </ej:Tooltip>
    <ej:Tooltip For="link3" runat="server" ClientIDMode="Static"  Content="Object-oriented programming (OOP) is a programming language model organized around objects rather than 'actions' and data rather than logic.">
        <Position>
            <Stem Horizontal="right" Vertical="center" />
            <Target Horizontal="left" Vertical="center" />
        </Position>
    </ej:Tooltip>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
		u {
            color: #00b8e6;
        }
        .frame {
            width: 100%;
            box-sizing: border-box;
            line-height: 28px;
			text-align : "justify";
            font-family: "Times New Roman", Times, serif;
        }
	</style>
</asp:Content>

