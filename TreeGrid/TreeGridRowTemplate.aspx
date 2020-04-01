<%@ Page Title="TreeGrid-Row Template-ASP.NET-SYNCFUSION"   Language="C#" MetaDescription="This example illustrates defining custom templates for rows in the Syncfusion tree grid control." AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="TreeGridRowTemplate.aspx.cs" Inherits="WebSampleBrowser.TreeGrid.TreeGridRowTemplate" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">TreeGrid / Row Template</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <div>
        <ej:TreeGrid runat="server" ID="TreeGridControlRowTemplate" ChildMapping="Children" RowTemplateId="rowTemplateScript" AltRowTemplateId="altRowTemplateScript" RowHeight="99">
            <Columns>
                <ej:TreeGridColumn HeaderText="Employee ID" Field="EmployeeID" Width="180" />
                <ej:TreeGridColumn HeaderText="Employee Name" Field="Name" />
                <ej:TreeGridColumn HeaderText="Employee picture" Field="Address" />
                <ej:TreeGridColumn HeaderText="DOB" Field="DOB" />

            </Columns>
            <SizeSettings Width="100%" Height="370px" />
            <EditSettings AllowEditing="true" EditMode="cellEditing" />
        </ej:TreeGrid>
    </div>
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ScriptSection">
    <script id="rowTemplateScript" type="text/x-jsrender">

        <tr>
            <td class="border" style='height: 99px;'>
                <div>{{:#data['EmployeeID']}}</div>
            </td>
            <td class="border" style='height: 99px;'>
                <div style="font-size: 14px;">
                    {{:#data['Name']}}
                         <p style="font-size: 8px;">{{:#data['Designation']}}</p>
                </div>
            </td>
            <td class="border" style='height: 99px;'>
                <div>
                    <div style="position: relative; display: inline-block;">
                        <div class="{{:#data['EmployeeID']}}"></div>
                    </div>
                    <div style="display: inline-block;">
                        <div style="padding: 5px;">{{:#data['Address']}}</div>
                        <div style="padding: 5px;">{{:#data['Country']}}</div>
                        <div style="padding: 5px; font-size: 12px;">{{:#data['Contact']}}</div>
                    </div>
                </div>
            </td>
            <td class="border" style='height: 99px;'>
                <div>{{:#data['DOB']}}</div>
            </td>

        </tr>
    </script>

    <script id="altRowTemplateScript" type="text/x-jsrender">

        <tr>
            <td class="border" style='height: 99px;'>
                <div>{{:#data['EmployeeID']}}</div>
            </td>
            <td class="border" style='height: 99px;'>
                <div style="font-size: 14px;">
                    {{:#data['Name']}}
                         <p style="font-size: 9px;">{{:#data['Designation']}}</p>
                </div>
            </td>
            <td class="border" style='height: 99px;'>
                <div>
                    <div style="position: relative;display: inline-block;">
                        <div class="{{:#data['EmployeeID']}}"></div>
                    </div>
                    <div style="display: inline-block;">
                        <div style="padding: 5px;">{{:#data['Address']}}</div>
                        <div style="padding: 5px;">{{:#data['Country']}}</div>
                        <div style="padding: 5px; font-size: 12px;">{{:#data['Contact']}}</div>
                    </div>
                </div>
            </td>
            <td class="border" style='height: 99px;'>
                <div>{{:#data['DOB']}}</div>
            </td>
        </tr>

    </script>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .border {
            border-color: #BDBDBD;
            border-width: 1px;
            border-style: solid;
        }
           .EMP004 {
            background-image: url('Images/David William.png');
             width: 60px;
            height: 60px;
            background-repeat: no-repeat;
        }

        .EMP001 {
            background-image: url('Images/Robert King.png');
            width: 60px;
            height: 60px;
            background-repeat: no-repeat;
        }

        .EMP035 {
            background-image: url('Images/Nancy Davolio.png');
            width: 60px;
            height: 60px;
            background-repeat: no-repeat;
        }

        .EMP045 {
            background-image: url('Images/Andrew Fuller.png');
            width: 60px;
            height: 60px;
            background-repeat: no-repeat;
        }

        .EMP091 {
            background-image: url('Images/Anne Dodsworth.png');
            width: 60px;
            height: 60px;
            background-repeat: no-repeat;
        }

        .EMP110 {
            background-image: url('Images/Michael Suyama.png');
            width: 60px;
            height: 60px;
            background-repeat: no-repeat;
        }

        .EMP131 {
            background-image: url('Images/Janet Leverling.png');
            width: 60px;
            height: 60px;
            background-repeat: no-repeat;
        }

        .EMP039 {
            background-image: url('Images/Romey Wilson.png');
            width: 60px;
            height: 60px;
            background-repeat: no-repeat;
        }

        .EMP213 {
            background-image: url('Images/Margaret Peacock.png');
            width: 60px;
            height: 60px;
            background-repeat: no-repeat;
        }

        .EMP201 {
            background-image: url('Images/Laura Callahan.png');
            width: 60px;
            height: 60px;
            background-repeat: no-repeat;
        }

        .EMP197 {
            background-image: url('Images/Steven Buchanan.png');
            width: 60px;
            height: 60px;
            background-repeat: no-repeat;
        }

        .EMP167 {
            background-image: url('Images/Tedd Lawson.png');
            width: 60px;
            height: 60px;
            background-repeat: no-repeat;
        }

    </style>
</asp:Content>

