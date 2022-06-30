<%@ Page Title="SunburstChart-Zooming-ASP.NET-SYNCFUSION"   Language="C#" AutoEventWireup="true" MetaDescription="This sample demonstrates the employee count based on the country using zooming feature in the Syncfusion ASP.NET Web Forms Sunburst control" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Zooming.aspx.cs" Inherits="WebSampleBrowser.Sunburst.Zooming" %>

<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="SampleHeading">
    <span class="sampleName">Sunburst/ Zooming</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">  
    <div>        
        <ej:SunburstChart ClientIDMode="Static" ID="container" runat="server" 
            OnClientLoad="loadSunBurstTheme" ValueMemberPath="EmployeesCount" InnerRadius=0.2 EnableAnimation="true">     
            <Size Height="600" />  
             <Levels>
                <ej:SunburstLevel GroupMemberPath="Country"></ej:SunburstLevel>
                <ej:SunburstLevel GroupMemberPath="JobDescription"></ej:SunburstLevel>
                <ej:SunburstLevel GroupMemberPath="JobGroup"></ej:SunburstLevel>
                <ej:SunburstLevel GroupMemberPath="JobRole"></ej:SunburstLevel>
            </Levels>                  
            <DataLabelSettings Visible="true"></DataLabelSettings>   
			<Tooltip Visible="true"></Tooltip>			
            <Title Text="Sunburst Chart"></Title>
           <ZoomSettings Enable="true" />
            <Legend Visible="false">
            </Legend>                      
        </ej:SunburstChart> 
    </div>     
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="PropertySection">
    <div id="sampleProperties">
               <div class="prop-grid">
			     <div class="row">
                <div class="col-md-3">
                    Enable Zooming
                </div>
                <div class="col-md-3 aligntop">
                   <input type="checkbox" checked="checked" id="enableZoom" />
                </div>
            </div>			   
			 </div>
       </div>			
    <script type="text/javascript">
       
        $('#enableZoom').change(function () {
            var sunburst = $("#container").ejSunburstChart("instance");
            if ($("#enableZoom").is(":checked"))
                sunburst.model.zoomSettings.enable = true;
            else {
                sunburst.model.zoomSettings.enable = false;
            }
            sunburst.redraw();
        });   

        $("#sampleProperties").ejPropertiesPanel();

    </script>
  
</asp:Content>

