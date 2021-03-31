<%@ Page Title="ListBox-Template-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to customize the list of items in the Syncfusion ASP.NET Web Forms ListBox component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="WebSampleBrowser.ListBox.Template" %>

<asp:Content ID="Content11" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript" >
        $(function () {
                setTimeout(function () {
                    $(".listbox").css("display", "block");
                    var obj = $("#LayoutSection_ControlsSection_selectExperts").data("ejListBox");
                    obj.scrollerObj.refresh();
                }, 300);
            });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control listbox" style="display:none">
        <div class="frame">
            <div class="ctrllabel">Select an expert</div>
            <ej:ListBox ID="selectExperts" runat="server" Template="<img class='eimg' src='../Content/images/Employee/${eimg}.png' alt='employee' height='50px' width='50px'/><div class='ename'> ${text} </div><div class='desig'> ${desig} </div><div class='cont'> ${country} </div>">
            </ej:ListBox>
        </div>


    </div>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <link href="<%=ResolveClientUrl("~/Content/AutoComplete/Template.css")%>" rel="stylesheet" />
    <style type="text/css">
        .e-ddl-popup {
            margin: 0 auto;
        }

        .ctrllabel {
            font-weight: 600;
            padding-bottom: 12px;
        }

        .eimg {
            margin: 0;
            padding: 3px 10px 3px 3px;
            border: 0 none;
            width: 60px;
            height: 60px;
            float: left;
        }

        .ename {
            font-weight: bold;
            padding: 3px 3px 1px 3px;
        }

        .desig, .cont {
            font-size: smaller;
            padding: 3px 3px -1px 0px;
        }

        #<%=selectExperts.ClientID %> li {
            width: 200px;
            height: 70px;
            padding: 5px;
        }

        .htmljssamplebrowser.office-365 #<%=selectExperts.ClientID %> li {
			height: 98px;
			width: 250px;
			padding: 0 !important;
            border-bottom: 1px solid #eaeaea; 
		}

        .htmljssamplebrowser.office-365 .ename, .htmljssamplebrowser.office-365 .cont, .htmljssamplebrowser.office-365 .desig {
			line-height: normal;
		}
		
		.htmljssamplebrowser.office-365 .ename {
			color: #333333;
			font-size: 21px;
			font-weight: lighter;
			padding: 12px 0 6px;
		}
		
		.htmljssamplebrowser.office-365 .desig, .htmljssamplebrowser.office-365 .cont {
			color: #666666;
			font-size: 13px;
		}
		
		.htmljssamplebrowser.office-365 .cont {
			padding-top: 12px;
		}
		
		.htmljssamplebrowser.office-365 .eimg{
			height: 50px;
			width: 50px;
			padding: 10px 10px 20px;
		}
    </style>
</asp:Content>

