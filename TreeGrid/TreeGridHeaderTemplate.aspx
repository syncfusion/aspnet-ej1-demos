<%@ Page Title="TreeGrid-Header Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates options to customize column headers with custom templates in the tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridHeaderTemplate.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridHeaderTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / TreeGrid Header Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridColumnHeaderTemplate" ChildMapping="Children" HeaderTextOverflow="Wrap" TreeColumnIndex="0" IsResponsive="true">
            <Columns>
                <ej:TreeGridColumn Field="Name" EditType="String" HeaderTemplateID="#projectName" />
                <ej:TreeGridColumn Field="StartDate" EditType="Datepicker" HeaderTemplateID="#dateTemplate" />
                <ej:TreeGridColumn Field="Resources" EditType="Dropdown" HeaderTemplateID="#resource" />
                <ej:TreeGridColumn Field="Duration" EditType="Numeric" HeaderTemplateID="#durationTemplate" />
                <ej:TreeGridColumn Field="PercentDone" EditType="Numeric" HeaderTemplateID="#progressTemplate" />
            </Columns>
            <SizeSettings Width="100%" Height="450px" />
        </ej:TreeGrid>
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script type="text/x-jsrender" id="resource">
        <div>
            <div>
                <img src="../treegrid/images/icon-03.png" width="20" height="20" />
            </div>
            <div style="position:relative; top:3px;">
                Resources
            </div>
        </div>

    </script>
    <script type="text/x-jsrender" id="progressTemplate">
        <div>
            <div>
                <img src="../treegrid/images/icon-05.png" width="20" height="20" />
            </div>
            <div style="position:relative; top:3px;">
                Progress
            </div>
        </div>
    </script>
    <script type="text/x-jsrender" id="projectName">
        <div>
            <div>
                <img src="../treegrid/images/icon-01.png" width="20" height="20" />
            </div>
            <div style="position:relative; top:3px;">
                Task Name
            </div>
        </div>
    </script>
    <script type="text/x-jsrender" id="dateTemplate">
        <div>
            <div>
                <img src="../treegrid/images/icon-04.png" width="20" height="20" />
            </div>
            <div style="position:relative; top:3px;">
                Start Date
            </div>
        </div>
    </script>

    <script type="text/x-jsrender" id="durationTemplate">
        <div>
            <div>
                <img src="../treegrid/images/icon-02.png" width="20" height="20" />
            </div>
            <div style="position:relative; top:2px;">
                Duration
            </div>
        </div>
    </script>
</asp:Content>

