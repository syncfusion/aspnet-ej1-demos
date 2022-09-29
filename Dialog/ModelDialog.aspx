<%@ Page Title="Dialog-Modal Dialog-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to prevent the interaction with other items on the same page using the Syncfusion ASP.NET Web Forms Dialog component overlay." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="ModelDialog.aspx.cs" Inherits="WebSampleBrowser.Dialog.ModelDialog" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <asp:UpdatePanel ID="Update" runat="server" UpdateMode="Always">
        <ContentTemplate>
            <div class="control">
                <ej:Button ID="btnOpen" Type="Button" Text="Click to open dialog" ClientSideOnClick="btnclick" CssClass="e-btn" runat="server"></ej:Button>
                <ej:Dialog ID="lognForm" Title="Login Form" Containment=".control" ClientSideOnClose="onDialogClose" IsResponsive="True" Width="300px" EnableModal="true" EnableResize="false" runat="server">
                    <DialogContent>
                        <table>
                            <tr>
                                <td>
                                    <p style="margin-top: 5px;">
                                        Please enter your username and password<p>
                                </td>
                            </tr>
                            <tr>
                                <td>Username
                                    <p class="reqired">*</p>
                                    <input type="text" id="txtName" name="txtName" class="ejinputtext" style="width: 100%" required /><br />
                                </td>
                            </tr>
                            <tr>
                                <td>Password
                                    <p class="reqired">*</p>
                                    <input type="password" id="txtPassword" name="txtPassword" class="ejinputtext" style="width: 100%" required />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="checkbox" id="txtRember" class="ejinputtext" required />
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <br />
                                    <ej:Button ID="downloadBtn" Text="LOGIN" CssClass="e-btn" Width="100px" Height="30px" runat="server" Size="Medium" Type="Button" ClientSideOnClick="formsubmit"></ej:Button>
                                    <label class="error" for="btn"></label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="font-size: 12px; padding-top: 8px;">Don't have an account ? <a href="#">Signup</a>
                                </td>
                            </tr>
                        </table>
                    </DialogContent>
                </ej:Dialog>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script src='<%= Page.ResolveClientUrl("~/Scripts/Dialog/ModalDialog.js")%>' type="text/javascript"></script>
    <script src='<%= Page.ResolveClientUrl("~/Scripts/jquery.validate.min.js")%>' type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        #LayoutSection_maincontrolarea {
            padding: 0;
        }
        label.error {
            color: red;
        }
        .control {
            height: 500px;
            position: relative;
        }
        .htmljssamplebrowser.material .control {
            height: 600px;
        }

        input {
            height: 25px;
            margin-bottom: 10px;
        }

        .downloadBtn {
            margin-top: 2px;
        }

        #ejtxtRember {
            margin-top: 5px;
        }

        .reqired {
            margin: 0 0 3px 0;
            color: red;
            display: inline-block;
        }

        .e-btn.e-button.e-js {
            border: none;
        }
    </style>
    <script type="text/javascript">
        $(function () {
            $("#txtRember").ejCheckBox({ text: "Remember me" });
            $("#Form1").validate({
                rules: {
                    txtPassword: "required",
                    txtName: "required"
                },
                messages: {
                    txtName: { required: "Please enter user name" },
                    txtPassword: { required: "Please enter password" }
                }
            })
        })
        function formsubmit() {
            $("#Form1").valid();
        }
    </script>
</asp:Content>

