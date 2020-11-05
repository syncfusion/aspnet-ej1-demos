<%@ Page Title="TileView-DefaultFunctionalities-ASP.NET-SYNCFUSION" MetaDescription="This example demonstrates how to display groups and separated columns using the Syncfusion ASP.NET Web Forms Tile view component." Language="C#" MasterPageFile="~/Samplebrowser.Master" AutoEventWireup="true" CodeBehind="DefaultFunctionalities.aspx.cs" Inherits="WebSampleBrowser.Tile.DefaultFunctionalities" %>

<asp:Content ID="Content5" ContentPlaceHolderID="ControlsSection" runat="server">
    <div class="e-tile-group">
        <div class="e-tile-column">
            <ej:Tile ID="tile1" runat="server" ImagePosition="Fill" TileSize="Medium" ImageUrl="../Content/images/Tile/people_1.png" Text="People"></ej:Tile>
            <div class="e-tile-small-col-2">
                <ej:Tile ID="tile2" runat="server" ImagePosition="Center" TileSize="Small" ImageUrl="../Content/images/Tile/alerts.png"></ej:Tile>
                <ej:Tile ID="tile3" runat="server" ImagePosition="Center" TileSize="Small" ImageUrl="../Content/images/Tile/bing.png"></ej:Tile>
                <ej:Tile ID="tile4" runat="server" TileSize="Small" ImageUrl="../Content/images/Tile/camera.png"></ej:Tile>
                <ej:Tile ID="tile5" runat="server" ImagePosition="Center" TileSize="Small" ImageUrl="../Content/images/Tile/messages.png"></ej:Tile>
            </div>
            <ej:Tile ID="tile6" runat="server" ImagePosition="Center" TileSize="Medium" ImageUrl="../Content/images/Tile/games.png" Text="Play"></ej:Tile>
            <ej:Tile ID="tile7" runat="server" TileSize="Medium" ImageUrl="../Content/images/Tile/map.png" Text="Maps"></ej:Tile>
            <ej:Tile ID="tile8" runat="server" ImagePosition="Fill" TileSize="Wide" ImageUrl="../Content/images/Tile/sports.png" Text="Sports"></ej:Tile>
        </div>
        <div class="e-tile-column">
            <ej:Tile ID="tile9" runat="server" ImagePosition="Fill" TileSize="Medium" ImageUrl="../Content/images/Tile/people_2.png" Text="People"></ej:Tile>
            <ej:Tile ID="tile10" runat="server" ImagePosition="Center" TileSize="Medium" ImageUrl="../Content/images/Tile/pictures.png" Text="Photo"></ej:Tile>
            <ej:Tile ID="tile11" runat="server" ImagePosition="Center" TileSize="Wide" ImageUrl="../Content/images/Tile/weather.png" Text="Weather"></ej:Tile>
            <ej:Tile ID="tile12" runat="server" ImagePosition="Center" TileSize="Medium" ImageUrl="../Content/images/Tile/music.png" Text="Music"></ej:Tile>
            <ej:Tile ID="tile13" runat="server" ImagePosition="Center" TileSize="Medium" ImageUrl="../Content/images/Tile/favs.png" Text="Favorites"></ej:Tile>
        </div>
    </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
        .cols-sample-area{
            text-align: center;
        } 
        .e-tile-group{
            padding: 0;
            float: none;
            display: inline-block;
        }
    </style>
</asp:Content>

