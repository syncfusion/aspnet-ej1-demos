<%@ Page Title="Grid-Table-ASP.NET-SYNCFUSION" Language="C#" MetaDescription="This demo explains how to bind a HTML table element as dataSource to the Syncfusion ASP.NET Web Forms DataGrid control." MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="TableBinding.aspx.cs" Inherits="WebSampleBrowser.Grid.DataBinding.TableBinding" %>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleHeading" runat="server">
    <span class="sampleName">Grid / Data Binding / Table</span>
</asp:Content>

<asp:Content ID="ControlContent" runat="server" ContentPlaceHolderID="ControlsSection">
    <script id="_table1" type="text/template">
        <table>
            <colgroup>
                <col />
                <col />
                <col />
                <col />
                <col />
                <col />
            </colgroup>
            <thead>
                <tr>
                    <th>Laptop
                    </th>
                    <th>Model
                    </th>
                    <th>Price
                    </th>
                    <th>OS
                    </th>
                    <th>RAM
                    </th>
                    <th>ScreenSize
                    </th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>Dell Vostro</td>
                    <td>2520</td>
                    <td>638.56</td>
                    <td>Windows 8</td>
                    <td>4GB</td>
                    <td>15.6</td>
                </tr>
                <tr>
                    <td>HP Pavilion Sleekbook</td>
                    <td>14-B104AU</td>
                    <td>364.07</td>
                    <td>Windows 8</td>
                    <td>2GB</td>
                    <td>14</td>
                </tr>
                <tr>
                    <td>Sony Vaio</td>
                    <td>E14A15</td>
                    <td>678.64</td>
                    <td>Windows 7 Home Premium</td>
                    <td>4GB DDR3 RAM</td>
                    <td>14</td>
                </tr>
                <tr>
                    <td>Acer Aspire</td>
                    <td>V5-471P-Core i3</td>
                    <td>633.93</td>
                    <td>Windows 8</td>
                    <td>4GB DDR3 RAM</td>
                    <td>14</td>
                </tr>
                <tr>
                    <td>Samsung</td>
                    <td>NP350V5C-A02IN</td>
                    <td>558.88</td>
                    <td>Windows 7 Premium</td>
                    <td>4GB DDR3 RAM</td>
                    <td>15.6</td>
                </tr>
                <tr>
                    <td>Lenovo</td>
                    <td>Yoga 13</td>
                    <td>910.18</td>
                    <td>Windows 8 RT</td>
                    <td>2GB DDR3 RAM</td>
                    <td>11.6</td>
                </tr>
                <tr>
                    <td>Toshiba</td>
                    <td>L850-Y3110</td>
                    <td>921.36</td>
                    <td>Windows 8 SL</td>
                    <td>8GB DDR3 RAM</td>
                    <td>15.6</td>
                </tr>
                <tr>
                    <td>Apple MacBook Pro </td>
                    <td>Retina MD213HN/A</td>
                    <td>1756.47</td>
                    <td>Mac OS X Mountain Lion</td>
                    <td>8GB DDR3</td>
                    <td>13.3</td>
                </tr>
                <tr>
                    <td>Asus</td>
                    <td>X54C-SX454D </td>
                    <td>295.17</td>
                    <td>DOS</td>
                    <td>2GB DDR3</td>
                    <td>15.6</td>
                </tr>
            </tbody>
        </table>
    </script>
    <div>
        <ej:Grid ID="SalesGrid" runat="server">
            <DataManager Table="#_table1"></DataManager>
            <Columns>
                <ej:Column Field="Laptop" HeaderText="Laptop Brands" Width="105" />
                <ej:Column Field="Model" HeaderText="Model" Width="100" />
                <ej:Column Field="Price" HeaderText="Price" TextAlign="Right" Width="85" Format="{0:C}" />
                <ej:Column Field="OS" HeaderText="Operating System" Width="130" />
                <ej:Column Field="RAM" HeaderText="RAM" Width="100" TextAlign="Right" />
                <ej:Column Field="ScreenSize" HeaderText="Screen Size" Width="100" Format="{0:N1} inch" />
            </Columns>
        </ej:Grid>
    </div>
</asp:Content>



