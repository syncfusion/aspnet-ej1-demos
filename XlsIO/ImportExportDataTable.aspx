<%@ Page MasterPageFile="~/samplebrowser.master" Language="C#" AutoEventWireup="true"
    CodeFile="ImportExportDataTable.aspx.cs" Inherits="WebSampleBrowser.XlsIO.ImportExportDataTable" %>

<asp:content id="content2" contentplaceholderid="ControlsSection" runat="server">
    <p>
      The ImportDataTable and ExportDataTable methods makes it easier to work with ADO.NET data tables. It just takes one line of code to import data from data table to a Spreadsheet or export data from Spreadsheet to a data table.
	   </br></br>Features :
                <ul>
                    <li>Usage of helper methods to work with ADO.NET</li>
                    <li>Import data from Spreadsheet to a data table</li>
                    <li>Export data from data table to Spreadsheet.</li>
                    <li>Apply row and column styles.</li>
                    <li>Export data from Spreadsheet to a data table by skipping specific rows, replacing cell values in the data table, and stop exporting.</li>
                </ul>
    </p>
	<p>
        This sample demonstrates exporting data from Excel to a data table, and import data from the data table to the Grid.
    </p>
    <p>
       Click the "Input Template" button to view the input Excel document. 
    </p>
	<p>
	Click the "Import from Excel" button to import data from Excel and view the data in the grid. Here, the data will be exported to a data table with customized options and imported to the grid.
	</p>
	<p>
	Click the "Export to Excel" button to create a new Microsoft Excel document and export the data from the grid to an Excel workbook.
	</p>
	<p>
	Note: You need to have a MS Excel Viewer installed in order to view the generated Excel file.
	</p>
	<br />
	<div> 
        <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Height="310" Width="782">
        <table>
            <tr>
                <td>
        <ej:Grid ID="DataGrid1" runat="server" AllowPaging="false" 
            IsResponsive="true" EnableResponsiveRow="true">
            <ClientSideEvents EndEdit="endEdit" ActionComplete="complete" />
            <Columns>
                <ej:Column Field="CustomerID" HeaderText="CustomerID" Width="100">
                </ej:Column>
                <ej:Column Field="CompanyName" HeaderText="CompanyName" Width="162">
                </ej:Column>
                <ej:Column Field="ContactName" HeaderText="ContactName" Width="130">
                </ej:Column>
                <ej:Column Field="ContactTitle" HeaderText="ContactTitle" Width="135">
                </ej:Column>
				<ej:Column Field="Address" HeaderText="Address" Width="150">
                </ej:Column>
				<ej:Column Field="City" HeaderText="City" Width="90">
                </ej:Column>
				<ej:Column Field="Region" HeaderText="Region" Width="85">
                </ej:Column>
				<ej:Column Field="PostalCode" HeaderText="PostalCode" Width="85">
                </ej:Column>
				<ej:Column Field="Country" HeaderText="Country" Width="85">
                </ej:Column>
				<ej:Column Field="Phone" HeaderText="Phone" Width="85">
                </ej:Column>
				<ej:Column Field="Fax" HeaderText="Fax" Width="85">
                </ej:Column>
            </Columns> 
            </ej:Grid>
                </td>
            </tr>
        </table>
           </asp:Panel>
        <br/>
        <div>
        <table width="650px" id="PanelTable" cellspacing="0" cellpadding="0" border="0">
            <tr style="margin-top: 5px;">
                <td>			
                    <div>
                        <table width="100%"  cellpadding="0" cellspacing="0" border="0">
                            <tr height="30px">      
                                <td>
								    <asp:label width="110px" runat="server" id="label1" text="Import Options:"></asp:label>
								</td>
								<td>
                                    <asp:label width="90px" runat="server" id="label2" text="Save As:"></asp:label>
							    </td>
								 
						    </tr>
							<tr height="30px">
								<td>
                                    <asp:radiobutton Width ="250px" id="rBtnSkip" runat="server" groupname="Group1" text="Skip rows if ContactTitle is Owner" checked="true" OnCheckedChanged="CheckChanged" AutoPostBack="true" />
								</td>
								<td>
                                    <asp:radiobutton Width ="200px" id="rBtnXls" runat="server" groupname="Group2" text="XLS" />
							    </td>
								<td>
                                    <asp:Button ID="btninput" runat="server" OnClick="Button1_Click" Text="Input Template"
                                        Width="150px" />
                                </td>
								
                            </tr>
                            <tr height="30px">
                                <td>
                                    <asp:radiobutton Width ="250px" id="rBtnReplaceValue" runat="server" groupname="Group1" text="Replace México D.F. to Mexico"  OnCheckedChanged="CheckChanged" AutoPostBack="true" />
                                </td>							
								<td>
                                    <asp:radiobutton Width ="200px" id="rBtnXlsx" runat="server" groupname="Group2" text="XLSX" checked="true" />
                                </td>
								<td>
                                    <asp:Button ID="btnimport" runat="server" OnClick="Button3_Click" Text="Import from Excel"
                                        Width="150px" />
                                </td>
							</tr>
						    <tr height="30px">
							    <td>	
                                    <asp:radiobutton Width ="300px" id="rBtnStop" runat="server" groupname="Group1" text=" Stop importing if CustomerID is CACTU" OnCheckedChanged="CheckChanged" AutoPostBack="true" />
                                </td>
                                <td>								
								</td>
								 <td>
                                    <asp:Button ID="btnexport" runat="server" OnClick="Button2_Click" Text="Export to Excel"
                                        Width="150px" Enabled="false" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <br />
                </td>
            </tr>
        </table>
    </div>
</asp:content>
