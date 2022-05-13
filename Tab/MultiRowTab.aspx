<%@ Page Language="C#" Title="Tab-MultiRow Tab-ASP.NET-SYNCFUSION" AutoEventWireup="true" MasterPageFile="~/Samplebrowser.Master" CodeBehind="MultiRowTab.aspx.cs" MetaDescription="This sample showcases multiple rows tabs for easy navigation with Syncfusion ASP.NET Web Forms Tab control." Inherits="WebSampleBrowser.Tab.MultiRowTab" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ControlsSection" runat="server">   
<div style="position: relative; overflow: hidden; height: 302px;">
          <div class="controlframe">
        <ej:Tab ID="MultiRowTab" runat="server" ClientSideOnCreate="onClientCreate" EnableTabScroll="false">
            <Items>
                <ej:TabItem ID="html" Text="HTML">
                    <ContentSection>
                      HyperText Markup Language, commonly referred to as HTML, is the standard markup language used to create web pages. Along with CSS, and JavaScript, HTML is a cornerstone technology, used by most websites to create visually engaging web pages, user interfaces for web applications, and user interfaces for many mobile applications.[1] Web browsers can read HTML files and render them into visible or audible web pages. HTML describes the structure of a website semantically along with cues for presentation, making it a markup language, rather than a programming language.
                    </ContentSection>
                </ej:TabItem>
                <ej:TabItem ID="cSharp" Text="C Sharp(C#)">
                    <ContentSection>
                       C# is intended to be a simple, modern, general-purpose, object-oriented programming language.
                            Its development team is led by Anders Hejlsberg. The most recent version is C# 5.0, which was released on August 15, 2012.
                    </ContentSection>
                </ej:TabItem>
              
                <ej:TabItem ID="xam" Text="Xamarin">
                    <ContentSection>
                        Xamarin is a San Francisco, California based software company created in May 2011[3] by the engineers that created Mono,[4] Mono for Android and MonoTouch that are cross-platform implementations of the Common Language Infrastructure (CLI) and Common Language Specifications (often called Microsoft .NET).
                            With a C#-shared codebase, developers can use Xamarin tools to write native Android, iOS, and Windows apps with native user interfaces and share code across multiple platforms.[5] Xamarin has over 1 million developers in more than 120 countries around the World as of May 2015.
                    </ContentSection>
                </ej:TabItem>
                <ej:TabItem ID="ASP" Text="ASP.NET">
                    <ContentSection>
                     ASP.NET is an open-source server-side web application framework designed for web development to produce dynamic web pages. It was developed by Microsoft to allow programmers to build dynamic web sites, web applications and web services.
                            It was first released in January 2002 with version 1.0 of the .NET Framework, and is the successor to Microsoft's Active Server Pages (ASP) technology. ASP.NET is built on the Common Language Runtime (CLR), allowing programmers to write ASP.NET code using any supported .NET language. The ASP.NET SOAP extension framework allows ASP.NET components to process SOAP messages.
                    </ContentSection>
                </ej:TabItem>
                <ej:TabItem ID="MVC" Text="ASP.NET MVC">
                    <ContentSection>
                      The ASP.NET MVC is a web application framework developed by Microsoft, which implements the model–view–controller (MVC) pattern. It is open-source software, apart from the ASP.NET Web Forms component which is proprietary.
                      In the later versions of ASP.NET, ASP.NET MVC, ASP.NET Web API, and ASP.NET Web Pages (a platform using only Razor pages) will merge into a unified MVC 6.The project is called ASP.NET vNext.
            
                    </ContentSection>
                </ej:TabItem>
                  <ej:TabItem ID="JS" Text="JavaScript">
                    <ContentSection>
                      JavaScript (JS) is an interpreted computer programming language.
                      It was originally implemented as part of web browsers so that client-side scripts could interact with the user, control the browser,
                      communicate asynchronously, and alter the document content that was displayed.[5] More recently, however,
                      it has become common in both game development and the creation of desktop applications.
                    </ContentSection>
                </ej:TabItem>
                <ej:TabItem ID="java" Text="Java">
                    <ContentSection>
                       Java is a set of computer software and specifications developed by Sun Microsystems, later acquired by Oracle Corporation, that provides a system for developing application software and deploying it in a cross-platform computing environment. Java is used in a wide variety of computing platforms from embedded devices and mobile phones to enterprise servers and supercomputers. While less common, Java applets run in secure, sandboxed environments to provide many features of native applications and can be embedded in HTML pages.
                    </ContentSection>
                </ej:TabItem>
                  <ej:TabItem ID="vb" Text="VB.Net">
                    <ContentSection>
                      The command-line compiler, VBC.EXE, is installed as part of the freeware .NET Framework SDK.
                       Mono also includes a command-line VB.NET compiler. The most recent version is VB 2012, which was released on August 15, 2012.
                    </ContentSection>
                     
                </ej:TabItem>
    </Items>
      </ej:Tab>
              </div>
    </div>

</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="ScriptSection" runat="server">
    <script type="text/javascript">
      function onClientCreate(e) {
       
             var a=0, element=0, total=0;
             var global=[],local=[]; 
              
             var inst = $("#LayoutSection_ControlsSection_MultiRowTab").ejTab("instance");
             var len=inst.element.find("ul li").length;
             var containerwidth=inst.itemsContainer.outerWidth();
           
           for(var i=0; i<len; i++)
           {
             containerwidth=containerwidth - inst.element.find("ul li").eq(i).outerWidth();
            
             if(containerwidth > 0)
             {
                local.push(inst.element.find("ul li").eq(i).outerWidth());
             }
             
             else if(containerwidth < 0)
             {    
               global.push(local);
               
               var remaining=containerwidth+inst.element.find("ul li").eq(i).outerWidth();
               
               var divspace=remaining/local.length;
               
               for(var b=0; b < local.length; b++)
                {
                  global[a][b] = global[a][b] + divspace; 
                  
                  inst.element.find("ul li").eq((element)).outerWidth(global[a][b]);
                  
                  element++;  
                }
                  local=[]; 
                  containerwidth=inst.itemsContainer.outerWidth();
                  a++;
                  i--;
             }   
            
               if(i==len-1)
                {
                global.push(local);
               
                for(var c=0; c < local.length; c++)
                {
                total=total + global[a][c]; 
                }
               var remaining = inst.itemsContainer.outerWidth() - total; 
                 
               var divspace=remaining/local.length;
                 
               for(var d=0; d < local.length; d++) 
               {
               global[a][d]=global[a][d]+divspace;
                 
               inst.element.find("ul li").eq(i-(local.length-1)).outerWidth(global[a][d]);
                 
               i++;
               }
             }
           }
         }
           
</script>
    </asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="StyleSection" runat="server">
    <style type="text/css">
	
    .e-tab .e-header .e-item {
     border: 1px solid #c8c8c8 !important;
     text-align:center;
     border-bottom:1px solid #c8c8c8 !important;
     
    }
    
    .e-tab .e-header.e-addborderbottom .e-active{
     border-top:1px solid rgb(23, 155, 215) !important;
     
    }
    
</style>
 </asp:Content>







