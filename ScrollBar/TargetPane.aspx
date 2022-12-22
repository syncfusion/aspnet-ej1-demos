<%@ Page Title="ScrollBar-Target Pane-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" MetaDescription="This example demonstrates how to achieve the targetpane property in ASP.NET Web Forms scroller" CodeBehind="TargetPane.aspx.cs" Inherits="WebSampleBrowser.ScrollBar.Methods" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="control">
        <ej:Scroller ID="scrollcontent" runat="server" Height="300px" Width="100%" TargetPane="#sampleContent3">
            <ScrollerContent>
                <div>
                    <div class="sampleContent" id="sampleContent1">
                        <div>
                            <div>
                                <table class="tableborder" style="width: 100%; border: 0px">
                                    <tr>
                                        <td colspan="3" style="font-weight: bold; border-width: 0px 1px 1px 0px;">ID</td>
                                    </tr>
                                    <tr>
                                        <td>101</td>
                                    </tr>
                                    <tr>
                                        <td>102 </td>
                                    </tr>
                                    <tr>
                                        <td>103  </td>
                                    </tr>
                                    <tr>
                                        <td>104</td>
                                    </tr>
                                    <tr>
                                        <td>105</td>
                                    </tr>
                                    <tr>
                                        <td>106</td>
                                    </tr>
                                    <tr>
                                        <td>107</td>
                                    </tr>
                                    <tr>
                                        <td>108</td>
                                    </tr>
                                    <tr>
                                        <td>109</td>
                                    </tr>
                                    <tr>
                                        <td>110</td>
                                    </tr>
                                    <tr>
                                        <td>111</td>
                                    </tr>
                                    <tr>
                                        <td>112</td>
                                    </tr>
                                    <tr>
                                        <td>123 </td>
                                    </tr>
                                    <tr>
                                        <td>123</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="sampleContent" id="sampleContent3">
                        <div style='width: 700px;'>
                            <table class="tableborder" style="width: 100%; border-width: 0px">
                                <tr>
                                    <td style="font-weight: bold; text-align: center; border-width: 0px 1px 1px 0px;">Order Date</td>
                                    <td style="font-weight: bold; text-align: center; border-width: 0px 1px 1px 0px;">Country</td>
                                    <td style="font-weight: bold; text-align: center; border-width: 0px 0px 1px 0px;">Code</td>
                                </tr>
                                <tr>
                                    <td>07/02/2016</td>
                                    <td>France</td>
                                    <td>51100</td>
                                </tr>
                                <tr>
                                    <td>07/02/2016</td>
                                    <td>Germany</td>
                                    <td>44087</td>
                                </tr>
                                <tr>
                                    <td>19/02/2016</td>
                                    <td>Brazil</td>
                                    <td>60094</td>
                                </tr>
                                <tr>
                                    <td>21/02/2016</td>
                                    <td>France</td>
                                    <td>76321</td>
                                </tr>
                                <tr>
                                    <td>21/02/2016</td>
                                    <td>Belgium </td>
                                    <td>12098</td>
                                </tr>

                                <tr>
                                    <td>22/02/2016</td>
                                    <td>Brazil</td>
                                    <td>45608</td>
                                </tr>

                                <tr>
                                    <td>23/02/2016</td>
                                    <td>Russia</td>
                                    <td>23487</td>
                                </tr>
                                <tr>
                                    <td>26/02/2016</td>
                                    <td>England</td>
                                    <td>98342</td>
                                </tr>
                                <tr>
                                    <td>10/03/2016 </td>
                                    <td>China</td>
                                    <td>62910</td>
                                </tr>
                                <tr>
                                    <td>15/03/2016 </td>
                                    <td>India</td>
                                    <td>45672</td>
                                </tr>
                                <tr>
                                    <td>17/03/2016 </td>
                                    <td>America</td>
                                    <td>81231</td>
                                </tr>
                                <tr>
                                    <td>25/03/2016 </td>
                                    <td>Germany</td>
                                    <td>89734</td>
                                </tr>
                                <tr>
                                    <td>29/03/2016</td>
                                    <td>England</td>
                                    <td>54982</td>
                                </tr>
                                <tr>
                                    <td>07/04/2016</td>
                                    <td>Japan</td>
                                    <td>85479</td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
            </ScrollerContent>
        </ej:Scroller>
    </div>
</asp:Content>
<asp:Content ID="content10" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function() {
            $(window).on('resize', function () {
                var scrollObj = $("#<%=scrollcontent.ClientID%>").ejScroller("instance");
                scrollObj.refresh();
            });
        });
       $(window).on('load',function() {
            var scrollObj = $("#<%=scrollcontent.ClientID%>").ejScroller("instance");
            scrollObj.refresh();
        });
    </script>
</asp:Content>

<asp:Content ID="Content9" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .control
        {
            border: 1px solid #bbbcbb;
            color: gray;
            width: 65%;
            height: 100%;
        }

        .sampleContent
        {
            overflow: hidden;
            float: left;
        }

        #sampleContent1
        {
            width: 30%;
        }

        #sampleContent3
        {
            width: 70%;
        }

        p
        {
            color: green;
        }

        table, th, td
        {
            border: 1px solid #bbbcbb;
        }

        td
        {
            box-sizing: border-box;
            width: 250px;
            text-indent: 20px;
            text-align: center;
        }

        table, th, td {
            border: 1px solid #bbbcbb;
        }

        td {
            box-sizing:border-box;
            width:250px;
            text-align:center;
        }
        table.tableborder tr td {
			border-left: none;			
        }
        table.tableborder tr td:nth-child(0) {
			border-left: none;			
        }
		table.tableborder tr td:nth-child(3){
			border-right: none;
		}
        table.tableborder{
            margin-left:0px;
        }
    </style>

</asp:Content>


