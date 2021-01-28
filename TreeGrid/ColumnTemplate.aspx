<%@ Page Title="TreeGrid-Column Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates how to display custom columns and column templates in the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="ColumnTemplate.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.ColumnTemplate" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Column Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">           
       <div>                  
        <ej:TreeGrid runat="server" ID="TreeGridColumnTemplate" ChildMapping="SubFolder"  IsResponsive="true">
            <columns>
                <ej:TreeGridColumn HeaderText="Name" Field="Name" IsTemplateColumn="true" TemplateID="customColumnTemplate"/>
                <ej:TreeGridColumn HeaderText="Type" Field="Type"  Width="150"/>
                <ej:TreeGridColumn HeaderText="Date Created" Field="DateCreated"  Width="150" />
                <ej:TreeGridColumn HeaderText="Date Modified" Field="DateModified"  Width="150"/>                
            </columns>  
            <SizeSettings Width="100%" Height="450px" />          
        </ej:TreeGrid>
       </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
      <style type="text/css">
        .e-treegrid .e-treegridexpand {
            background-image: url(Images/folder-open.png);
            background-repeat: no-repeat;
            width: 14px;
            height: 14px;
        }
        .e-treegrid .e-treegridcollapse {
            background-image: url(Images/Folder.png);
            background-repeat: no-repeat;
            width: 14px;
            height: 14px;
        }
        .e-treegrid .e-doc {
            background-image: url(Images/Document.png);
            background-repeat: no-repeat;
            width: 14px;
            height: 14px;
        }

        .e-treegrid .e-treegridexpand:before {
            content: none;
        }

        .e-treegrid .e-treegridcollapse:before {
            content: none;
        }
        .e-treegrid .e-treegridcollapse:after,
        .e-treegrid .e-treegridexpand:after {
            opacity: 0;
        }
    </style>


<script type="text/x-jsrender" id="customColumnTemplate">     
     <div  style='height:20px;' unselectable='on'>{{if hasChildRecords}}<div class='intend' style='height:1px; float:left; width:{{:level*20}}px; display:inline-block;'></div>
       {{else !hasChildRecords}}
       <div class='intend' style='height:1px; float:left; width:{{:(level)*20}}px; display:inline-block;'></div>
       {{/if}}                         
       <div class='{{if expanded}}e-treegridexpand {{else hasChildRecords}}e-treegridcollapse {{/if}} {{if level===4}}e-doc{{/if}}' style='height:20px;width:30px;margin:auto;float:left;margin-left:10px;
       style='float: left;display:inline-block; unselectable='on'></div>
       <div class='e-cell' style='display:inline-block;width:100%' unselectable='on'>{{:#data['Name']}}</div>
     </div>
    </script>   

  
</asp:Content>

