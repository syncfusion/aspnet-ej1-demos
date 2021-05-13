<%@ Page Title="TreeView-RTL-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" 
CodeBehind="RTL.aspx.cs" MetaDescription="This example demonstrates how to enable the rtl property in a ASP.NET Web Forms TreeView." Inherits="WebSampleBrowser.TreeView.treertl" %>

<asp:Content ID="Content3" ContentPlaceHolderID="ControlsSection" runat="server">
    <div style="width:250px">
        <ej:TreeView ID="treeview" runat="server" Height="100%" EnableRTL="true">
        <Nodes>
            <ej:TreeViewNode Expanded="True" Text="كتب">
                <Nodes>
                    <ej:TreeViewNode Text="الإصدارات الجديدة"></ej:TreeViewNode>
                    <ej:TreeViewNode Text="جديد إصدارات الكتب السمعية"></ej:TreeViewNode>
                    <ej:TreeViewNode Text="أكثر الكتب مبيعا"></ej:TreeViewNode>
                    <ej:TreeViewNode Text="قادمة"></ej:TreeViewNode>
                    <ej:TreeViewNode Text="مجموعات مربع"></ej:TreeViewNode>
                </Nodes>
            </ej:TreeViewNode>

            <ej:TreeViewNode Text="الألعاب">
                <Nodes>
                    <ej:TreeViewNode Text="اكس بوكس"></ej:TreeViewNode>
                    <ej:TreeViewNode Text="لوحات المفاتيح"></ej:TreeViewNode>
                </Nodes>
            </ej:TreeViewNode>

            <ej:TreeViewNode Text="متنقل">
                <Nodes>
                    <ej:TreeViewNode Text="القادمون الجدد"></ej:TreeViewNode>
                    <ej:TreeViewNode Text="منخفض السعر"></ej:TreeViewNode>
                    <ej:TreeViewNode Text="القادمون الجدد"></ej:TreeViewNode>
                    <ej:TreeViewNode Text="أقراص"></ej:TreeViewNode>
                </Nodes>
            </ej:TreeViewNode>
        </Nodes>
    </ej:TreeView>
        </div>
</asp:Content>


