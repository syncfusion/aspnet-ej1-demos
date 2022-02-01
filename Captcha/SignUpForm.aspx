<%@ Page Language="C#" Title="Captcha-Sign Up Form-ASP.NET-SYNCFUSION" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="SignUpForm.aspx.cs" MetaDescription="This example demonstrates a simple form along with ASP.NET Web Forms Captcha validation." Inherits="WebSampleBrowser.Captcha.SignUpForm" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="frame" style="width: 500px">
        <div class="control">
            <table class="tabprop">
                <tr>
                    <td><span class="NodeText">Enter Name</span>
                    </td>
                    <td>
                        <asp:TextBox ID="Name" runat="server"></asp:TextBox>


                        <span id="Uname" runat="server" style="color: red; display: block; width: 200px; float: right"></span>

                    </td>
                </tr>
                <tr>
                    <td><span class="NodeText" style="width: 200px">Enter Password</span>
                    </td>
                    <td>
                        <asp:TextBox ID="Password" TextMode="Password" runat="server"></asp:TextBox>

                        <span id="Pwd" runat="server" style="color: red; width: 200px; display: block; float: right"></span>
                    </td>
                </tr>
                <tr>
                    <td><span runat="server" class="NodeText">Re-Enter Password</span>
                    </td>
                    <td>
                        <asp:TextBox ID="RePassword" TextMode="Password" runat="server"></asp:TextBox>
                        <span id="RePwd" runat="server" style="color: red; width: 200px; display: block; float: right"></span>
                    </td>
                </tr>

                <tr>
                    <td></td>
                    <td>
                        <div style="width: 185px;">
                            <ej:Captcha ID="captcha1" ShowAudioButton="true" ShowRefreshButton="true" Mapper="GetCurrentItem" EnableAutoValidation="true" CustomErrorMessage="Invalid Captcha" TargetButton="btnSubmit" runat="server"></ej:Captcha>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <ej:Button ID="btnSubmit" runat="server" Text="Submit" Size="Large" Type="Button" ClientSideOnClick="onValidate"></ej:Button>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function onValidate(args) {
            var name = $("#<%= Name.ClientID %>").val();
            var password = $("#<%= Password.ClientID %>").val();
            var rePassword = $("#<%= RePassword.ClientID %>").val();
            var value = $("#<%=captcha1.ClientID%>_CaptchaMessage")[0].innerHTML;
            var UserNameStatus;
            var PasswordStatus;
            if (name == "")
                $("#<%= Uname.ClientID %>").html("Name required");
            else
                UserNameStatus = true;
            if (password == "")
                $("#<%= Pwd.ClientID %>").html("Password required");
            if (rePassword == "")
                $("#<%= RePwd.ClientID %>").html("Re-Enter Password required");

            if (password != rePassword)
                $("#<%= Pwd.ClientID %>").html("Invalid password");
            else
                PasswordStatus = true;

            if (UserNameStatus && PasswordStatus && !(password == "") && (value != "Invalid Captcha")) {
                alert("Thank you for registering");
                $("#<%= Uname.ClientID %>").html("");
                $("#<%= Pwd.ClientID %>").html("");
                $("#<%= RePwd.ClientID %>").html("");
                $("#<%= Name.ClientID %>").val("");
            }
            else {
                if (UserNameStatus && PasswordStatus && !(password == "")) {
                    $("#<%= Pwd.ClientID %>").html("");
                    $("#<%= RePwd.ClientID %>").html("");
                    $("#<%= Uname.ClientID %>").html("");
                }
            }

            $("#<%= Password.ClientID %>").val("");
            $("#<%= RePassword.ClientID %>").val("");

        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style>
        .NodeText {
            color: black;
            font-size: 15px;
        }
		.darktheme .NodeText {
            color: white;
        }
        .tabprop {
            width: 500px;
            height: 275px;
            margin-left: 25px;
        } 
		
		.control {
            width:155px;
        }
        .material .frame .control {
            margin-left: 100px;
        }
        .material .NodeText {
        font-family:  'Roboto',Segoe UI;
        font-size: 14px;
        padding-right: 24px;
        }
        .material input{
          border-width: 0px 0px 1px 0px;
          border-color: rgba(0,0,0,.12);
          margin-bottom: 12px;
        }
        .material input:focus{
            border-width: 0px 0px 2px 0px;
          border-color: #ff4081;
          outline: none;
        }
         .material .tabprop {
            width: 500px;
            height: 275px;
            margin-left: -35px;
        } 
    </style>
</asp:Content>

