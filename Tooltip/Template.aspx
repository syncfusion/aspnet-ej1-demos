<%@ Page Language="C#" Title="Tooltip-Template-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="Template.aspx.cs" MetaDescription="This demo shows templates using Syncfusion ASP.NET Web Tooltip control" Inherits="WebSampleBrowser.Tooltip.Template" %>


<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">
   <div class="content-container-fluid">
        <div class="row">
            <div class="cols-sample-area">
	
                <div class="frame">
                    <div class="ctrl col-md-4" id="leftImg" runat="server">
                        <img class="ctrImg" src="../Content/images/tooltip/template-05.png" alt="Template"/>
                        <div class="new">Delphi Succinctly</div>
                    </div>
                    <div class="ctrl col-md-4" id="centerImg" runat="server">
                        <img class="ctrImg" src="../Content/images/tooltip/template-04.png" alt="template-04"/>
                        <div class="new">Roslyn Succinctly</div>
                    </div>
                    <div class="ctrl col-md-4" id="RightImg" runat="server">
                        <img class="ctrImg" src="../Content/images/tooltip/template-06.png" alt="template-06"/>
                        <div class="new">Python Succinctly</div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <ej:Tooltip runat="server" For="leftImg" ClientSideOnCreate="onCreate" Width="440px" Height="200px" Content="<div class='main'> <div class='poster'> <img src='../Content/images/tooltip/template-05.png' class='logo'> </div> <div class='def'> <h4> Delphi Succinctly </h4><div class='link'><div class='author'> <b> Author: </b></div> <div class='category'> Marco Breveglieri </div></div><div class='description'> Learn the fundamentals of Delphi to build a variety of solutions for many devices and platforms. <a href='#'>More...</a></div><div class='rate'> <div class='rateDef'> Rate this: </div><input class='rating'></input></div><div class='btnGroup'><button class='button1'> Download Now</button> <button class='button2'> Review Comments</button></div><div></div>">
        <Position>
            <Stem Horizontal="center" Vertical="bottom" />
            <Target Horizontal="center" Vertical="center" />
        </Position>
    </ej:Tooltip>
    <ej:Tooltip runat="server"  For="centerImg" ClientSideOnCreate="onCreate" Width="440px" Height="200px" Content="<div class='main'> <div class='poster'> <img src='../Content/images/tooltip/template-04.png' class='logo'> </div> <div class='def'> <h4> Roslyn Succinctly </h4><div class='link'> <div class='author'><b> Author:</b> </div> <div class='category'> Alessandro Del Sole </div></div><div class='description'>Microsoft has only recently embraced the world of open source software, offering <a href='#'>More...</a> </div><div class='rate'><div class='rateDef'> Rate this: </div><input class='rating'></input></div><div class='btnGroup'><button class='button1'>Download Now</button> <button class='button2'> Review Comments </button></div><div></div>">
        <Position>
            <Stem Horizontal="center" Vertical="bottom" />
            <Target Horizontal="center" Vertical="center" />
        </Position>
    </ej:Tooltip>
     <ej:Tooltip runat="server"  For="RightImg" ClientSideOnCreate="onCreate" Width="440px" Height="200px" Content="<div class='main'> <div class='poster'> <img src='../Content/images/tooltip/template-06.png' class='logo'> </div> <div class='def'> <h4> Python Succinctly </h4><div class='link'> <div class='author'><b> Author:</b> </div> <div class='category'> Jason Cannon </div></div><div class='description'>Learn to use the Python language to create programs of all kindsto creating practical applications. <a href='#'>More...</a> </div><div class='rate'><div class='rateDef'> Rate this: </div><input class='rating'></input></div><div class='btnGroup'><button class='button1'>Download Now</button> <button class='button2'> Review Comments </button></div><div></div>">
        <Position>
            <Stem Horizontal="center" Vertical="bottom" />
            <Target Horizontal="center" Vertical="center" />
        </Position>
    </ej:Tooltip>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
        function onCreate() {
            $(".rating").ejRating({ height: "30", allowReset: false, value: 4 });
            $(".button1").ejButton({ width: "120px", height: (window.theme =="material")?"36px":"32px", showRoundedCorner: true });
            $(".button2").ejButton({ width: "135px", height: (window.theme =="material")?"36px":"32px", showRoundedCorner: true });
        }

        </script>
</asp:Content>
<asp:Content ID="Content7" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
		 h4{
            margin-top: 0px;
            margin-bottom: 2px;
        }
        #leftImg {
            margin: 35px;
        }
        #centerImg{
             margin: 35px;
        }
        #RightImg{
             margin: 35px;
        }
        .poster {
              
				float: left;
				box-sizing: border-box;
				padding: 4px 0px;
        }
		.new{
			text-align: center;
		}

        .frame {
            width: 100%;
            box-sizing: border-box;
            height: 430px;
        }

        .def {
               width: 280px;
                float: right;
                height: 230px;
        }
		.e-tooltip-wrap .e-tipContainer .e-tipcontent {
			padding: 4px 1px;
		}
        .e-tooltip-wrap {
            max-width: 485px;
        }

        .ctrl {
            border: 1px solid #ebebe0;
            width: 150px;
            padding: 5px;
            height: 225px;
            margin-bottom: 50px;
            float: left;
        }

        .ctrImg {
            width: 150px; 
        }

        .logo {
            float: left;
			 height: 175px;
			padding-left: 10px;
        }

        .category {
            float: left;
            margin-left: 10px;
        }

        .link {
            padding: 2px;
        }

   

        .main {
            width: 430px;
            height: 190px;
            box-sizing: border-box;
        }

        .description {
            width: 285px;
            margin-top: 20px;
            height: 60px;
            background-color: inherit;
            line-height: 20px;
        }

        .author {
            float: left;
        }

        .rate {
            height: 50px;
            clear: both;
        }

        .e-button {
            margin-right: 10px;
        }
		
      img{
	      padding-top: 8px;
	  }
	</style>
</asp:Content>

