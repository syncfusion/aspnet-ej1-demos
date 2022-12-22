<%@ Page Title="XlsIO-Collection Objects-ASP.NET-SYNCFUSION"   MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true"
    CodeFile="CollectionObjects.aspx.cs" Inherits="WebSampleBrowser.XlsIO.CollectionObjects" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
    <p>
       Essential XlsIO allows you to import/export data from/to Collection Objects. Collection object usually holds a set of instance variables or properties, also known as attributes.
    </p>
    <br/>
      <p>
        This sample demonstrates the usage of Collection objects using Essential XlsIO.
    </p>
      <p>
        Click the 'Import From Excel' button to import data from nested class into the ListView. The 'Export To Excel' button will generate a new Microsoft Excel document by exporting the nested class data from the ListView using Essential XlsIO. Please note that you need to have a MS Excel viewer installed in order to view the generated excel file.
    </p>
    <div> 
        <asp:Panel ID="Panel1" runat="server" ScrollBars="Vertical" Height="290" Width="500">
        <table>
            <tr>
                <td>
        <ej:Grid ID="grdView" runat="server" AllowPaging="false" OnServerEditRow="EditEvents_ServerEditRow" 
            IsResponsive="true" EnableResponsiveRow="true">
            <ClientSideEvents EndEdit="endEdit" ActionComplete="complete" />
            <Columns>
                <ej:Column Field="ID" HeaderText="ID" IsPrimaryKey="true" Visible="false" Width="75">
                    <ValidationRule>
                        <ej:KeyValue Key="required" Value="true" />
                        <ej:KeyValue Key="number" Value="true" />
                    </ValidationRule>
                </ej:Column>
                <ej:Column Field="BrandName" HeaderText="Brand">
                </ej:Column>
                <ej:Column Field="VehicleType.VehicleName" HeaderText="Vehicle Type">
                </ej:Column>
                <ej:Column Field="VehicleType.Model.ModelName" HeaderText="Model">
                </ej:Column>
            </Columns>
            <EditSettings AllowEditing="True" AllowAdding="True" AllowDeleting="True"></EditSettings> 
        </ej:Grid>
                </td>
            </tr>
        </table>
           </asp:Panel>
        <br/>
        <table id="PanelTable" width="750px" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                   
                </td>
            </tr>
            <tr style="margin-top: 5px;">
                <td>
                    <asp:label runat="server" id="label1" text="Save As :"></asp:label>
                    <asp:radiobutton style="margin-left: 10px" id="rBtnXls" runat="server" groupname="formatgrp" text="XLS" />
                    <asp:radiobutton  style="margin-left: 10px" id="rBtnXlsx" runat="server" groupname="formatgrp" text="XLSX" checked="true" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                         
                </td>
            </tr>
            </table>
        <asp:Label></asp:Label>
            <table id="PanelTable2" width="750px" cellpadding="0" cellspacing="0" border="0">
            <tr>
                <td>
                    <asp:button id="Button1" runat="server" onclick="Button1_Click" text="Input Template" width="147.5px" />  
                    <asp:button id="Button2" runat="server" onclick="Button2_Click" text="Import From Excel" width="147.5px" />  
                    <asp:button id="Button3" runat="server" onclick="Button3_Click" text="Export To Excel" width="147.5px" Enabled="false"/>  
                </td>
            </tr>
        </table>
        
    </div>
</asp:Content>

