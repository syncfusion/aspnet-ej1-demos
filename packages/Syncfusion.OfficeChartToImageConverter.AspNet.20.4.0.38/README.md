### Syncfusion ASP.NET Office Chart To Image Converter

The Syncfusion [ASP.NET Word chart to Image Converter](https://www.syncfusion.com/word-framework/net/word-to-pdf-conversion?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget) is a .NET helper class library that allows you to convert the PowerPoint and Word charts to PDF or images in any ASP.NET Web Forms Framework application without Microsoft Office dependencies.

![ASP.NET Word chart to Image Converter](https://cdn.syncfusion.com/nuget-readme/fileformats/net-word-to-pdf.png)

[Features overview](https://www.syncfusion.com/word-framework/net/word-to-pdf-conversion?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget) | [Docs](https://help.syncfusion.com/file-formats/docio/word-to-pdf?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget) | [API Reference](https://help.syncfusion.com/cr/file-formats/Syncfusion.OfficeChartToImageConverter.html?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget) | [Online Demo](https://ej2.syncfusion.com/aspnetmvc/DocIO/DOCtoPDF?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget#/material) | [GitHub Examples](https://github.com/SyncfusionExamples/DocIO-Examples?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget) | [Blogs](https://www.syncfusion.com/blogs/?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget&s=word) | [Support](https://support.syncfusion.com/create?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget) | [Forums](https://www.syncfusion.com/forums?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget) | [Feedback](https://www.syncfusion.com/feedback/word?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget)

### Key Features

* Converts [Word document Chart into PDF](https://help.syncfusion.com/file-formats/docio/word-to-pdf?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget).
* Converts [Word document Chart into Image](https://help.syncfusion.com/file-formats/docio/word-to-image?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget).
* Converts [PowerPoint Chart into PDF](https://help.syncfusion.com/file-formats/presentation/presentation-to-pdf?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget).
* Converts [PowerPoint Chart into Image](https://help.syncfusion.com/file-formats/presentation/presentation-to-image?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget).

### System Requirements
* [System Requirements](https://help.syncfusion.com/file-formats/installation-and-upgrade/system-requirements?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget)

### Getting started
You can fetch the Syncfusion ASP.NET Office Chart to Image converter library NuGet by simply running the command `Install-Package Syncfusion.OfficeChartToImageConverter.AspNet` from the Package Manager Console in Visual Studio.

Try the following code example to convert a Word document into PDF document.

```csharp
using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using Syncfusion.DocToPDFConverter;
using Syncfusion.OfficeChartToImageConverter;
using Syncfusion.OfficeChart;
using Syncfusion.Pdf;
//Loads an existing Word document.
using (WordDocument wordDocument = new WordDocument("Template.docx", FormatType.Automatic))
{
    //Initializes the ChartToImageConverter for converting charts during Word to pdf conversion
    wordDocument.ChartToImageConverter = new ChartToImageConverter();
    //Creates an instance of the DocToPDFConverter.
    using (DocToPDFConverter converter = new DocToPDFConverter())
    {
        //Converts Word document into PDF document.
        using (PdfDocument pdfDocument = converter.ConvertToPDF(wordDocument))
        {
            //Saves the PDF file.
            pdfDocument.Save("Sample.pdf");
        }
    }
}
```

Try the following code example to convert the PowerPoint Presentation to PDF. 

```csharp
//Namespaces to perform PPTX to PDF conversion
using Syncfusion.Presentation;
using Syncfusion.OfficeChartToImageConverter;
using Syncfusion.PresentationToPdfConverter;
using Syncfusion.Pdf;
//Opens a PowerPoint Presentation 
using (IPresentation pptxDoc = Presentation.Open("Sample.pptx"))
{
    //Creates an instance of ChartToImageConverter and assigns it to ChartToImageConverter property of Presentation
    pptxDoc.ChartToImageConverter = new ChartToImageConverter();
    //Convert the PowerPoint document to PDF document.
    using (PdfDocument pdfDocument = PresentationToPdfConverter.Convert(pptxDoc))
    {
        //Creates an instance of memory stream.
        using (MemoryStream pdfStream = new MemoryStream())
        {
            //Save the converted PDF document to memory stream.
            pdfDocument.Save(pdfStream);
        }
    }
}
```

For more information to get started, refer to our [Getting Started Documentation page](https://help.syncfusion.com/file-formats/docio/getting-started?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget).

### License
This is a commercial product and requires a paid license for possession or use. Syncfusion’s licensed software, including this component, is subject to the terms and conditions of [Syncfusion's EULA](https://www.syncfusion.com/eula/es/?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget). You can purchase a licnense [here]( https://www.syncfusion.com/sales/products?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget) or start a free 30-day trial [here](https://www.syncfusion.com/account/manage-trials/start-trials?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget).

### About Syncfusion
Founded in 2001 and headquartered in Research Triangle Park, N.C., Syncfusion has more than 27,000+ customers and more than 1 million users, including large financial institutions, Fortune 500 companies, and global IT consultancies.

Today, we provide 1700+ components and frameworks for web ([Blazor](https://www.syncfusion.com/blazor-components?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [Flutter](https://www.syncfusion.com/flutter-widgets?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [ASP.NET Core](https://www.syncfusion.com/aspnet-core-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [ASP.NET MVC](https://www.syncfusion.com/aspnet-mvc-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [ASP.NET WebForms](https://www.syncfusion.com/jquery/aspnet-webforms-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [JavaScript](https://www.syncfusion.com/javascript-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [Angular](https://www.syncfusion.com/angular-ui-components?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [React](https://www.syncfusion.com/react-ui-components?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [Vue](https://www.syncfusion.com/vue-ui-components?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), and [jQuery](https://www.syncfusion.com/jquery-ui-widgets?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget)), mobile ([.NET MAUI (Preview)](https://www.syncfusion.com/maui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [Flutter](https://www.syncfusion.com/flutter-widgets?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [Xamarin](https://www.syncfusion.com/xamarin-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [UWP](https://www.syncfusion.com/uwp-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), and [JavaScript](https://www.syncfusion.com/javascript-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget)), and desktop development ([WinForms](https://www.syncfusion.com/winforms-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [WPF](https://www.syncfusion.com/wpf-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [WinUI](https://www.syncfusion.com/winui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [.NET MAUI (Preview)](https://www.syncfusion.com/maui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [Flutter](https://www.syncfusion.com/flutter-widgets?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget), [Xamarin](https://www.syncfusion.com/xamarin-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget) and [UWP](https://www.syncfusion.com/uwp-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget)). We provide ready-to-deploy enterprise software for dashboards, reports, data integration, and big data processing. Many customers have saved millions in licensing fees by deploying our software.

___

[sales@syncfusion.com](mailto:sales@syncfusion.com?Subject=Syncfusion%20ASPNET%20DocToPDFConverter%20-%20NuGet) | [www.syncfusion.com](https://www.syncfusion.com?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-officecharttoimageconverter-nuget) | Toll Free: 1-888-9 DOTNET