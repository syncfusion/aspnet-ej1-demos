<%@ Page Title="FileExplorer-Access Control-ASP.NET-SYNCFUSION" Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true"
    CodeBehind="AccessControl.aspx.cs" MetaDescription="This example demonstrates about restricting access to file or folder in a ASP.NET Web Forms File Explorer." Inherits="WebSampleBrowser.FileExplorer.AccessControl" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    AccessControl 
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" EnablePageMethods="true" runat="server">
    <ej:FileExplorer ID="fileexplorer" runat="server" Layout="LargeIcons" IsResponsive="true" Width="100%" MinWidth="150px" 
                     AjaxAction="AccessControl.aspx/FileActionDefault" Path="~/FileContent/">
        <AjaxSettings>
            <Download Url="downloadFile.ashx{0}" />
            <Upload Url="uploadFiles.ashx{0}" />
        </AjaxSettings>
    </ej:FileExplorer>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="PropertySection" runat="server">
    <div id="sampleProperties">
        <div class="prop-grid">
            <div class="row">
                <div class="col-md-3">
                    Signed in
                </div>
                <div class="col-md-3">
                    <ej:DropDownList ID="selectRole" runat="server" TargetID="roleList" OnValueSelect="selectRole_ValueSelect" 
                                     Width="120px" SelectedItemIndex="0"></ej:DropDownList>
                    <div id="roleList">
                        <ul>
                            <li>Administrator</li>
                            <li>Document Manager</li>
                            <li>Default User</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        $(function () {
            $("#sampleProperties").ejPropertiesPanel();
        });
    </script>
</asp:Content>

