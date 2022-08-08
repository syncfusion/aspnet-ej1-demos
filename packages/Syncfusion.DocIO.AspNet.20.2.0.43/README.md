### Syncfusion ASP.NET Word library
The Syncfusion [.NET Word library](https://www.syncfusion.com/word-framework/net/word-library?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) (Essential DocIO) is a feature-rich and high-performance .NET Word library that is used to create, read, and edit Word documents programmatically without Microsoft Office dependencies.

![ASP.NET Word Library](https://cdn.syncfusion.com/nuget-readme/fileformats/net-word-library.png)

[Features overview](https://www.syncfusion.com/word-framework/net/word-library?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) | [Docs](https://help.syncfusion.com/file-formats/docio/overview?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) | [API Reference](https://help.syncfusion.com/cr/file-formats/Syncfusion.DocIO.html?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) | [Online Demo](https://ej2.syncfusion.com/aspnetmvc/DocIO/UpdateFields?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget#/material) | [GitHub Examples](https://github.com/SyncfusionExamples/DocIO-Examples?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) | [Blogs](https://www.syncfusion.com/blogs/?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget&s=docio) | [Support](https://support.syncfusion.com/create?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) | [Forums](https://www.syncfusion.com/forums?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) | [Feedback](https://www.syncfusion.com/feedback/wpf?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget)

### Key Features
* Support to [create Word document](https://help.syncfusion.com/file-formats/docio/getting-started?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) from scratch.
* Support to open (read), modify and save existing Word documents.
* Advanced [Mail merge](https://help.syncfusion.com/file-formats/docio/working-with-mailmerge?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) support with different data sources.
* Ability to create or edit Word 97-2003 and later version documents (DOCX), and convert them to commonly used file formats such as [RTF](https://help.syncfusion.com/file-formats/docio/rtf?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [WordML](https://help.syncfusion.com/file-formats/docio/word-file-formats?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget#word-processing-xml-xml), [TXT](https://help.syncfusion.com/file-formats/docio/text?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [HTML](https://help.syncfusion.com/file-formats/docio/html?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) and vice versa.
* Ability to export a Word document as a [PDF](https://help.syncfusion.com/file-formats/docio/word-to-pdf?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) file.
* Ability to create and manipulate [charts](https://help.syncfusion.com/file-formats/docio/working-with-charts?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [Shapes](https://help.syncfusion.com/file-formats/docio/working-with-shapes?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), and [Group shape](https://help.syncfusion.com/file-formats/docio/working-with-shapes?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget#grouping-shapes) in DOCX and WordML format documents.
* Ability to read and write [Built-In and Custom Document Properties](https://help.syncfusion.com/file-formats/docio/working-with-word-document?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget#working-with-word-document-properties).
* Ability to [find and replace](https://help.syncfusion.com/file-formats/docio/working-with-find-and-replace?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) text with its original formatting.
* Ability to insert [Bookmarks](https://help.syncfusion.com/file-formats/docio/working-with-bookmarks?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) and navigate corresponding bookmarks to insert, replace, and delete content.
* Support to insert and edit the [form fields](https://help.syncfusion.com/file-formats/docio/working-with-form-fields?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget).
* Support to protect the document to [restrict access](https://help.syncfusion.com/file-formats/docio/working-with-security?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget#protecting-word-document-from-editing) to the elements present within the document.
* Ability to [encrypt and decrypt](https://help.syncfusion.com/file-formats/docio/working-with-security?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) Word documents.
* Support to insert and extract OLE objects.
* Support to run the DocIO applications in multi-thread and its thread safe.

### System Requirements
* [System Requirements](https://help.syncfusion.com/file-formats/installation-and-upgrade/system-requirements?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget)

### Getting Started
You can fetch the Syncfusion .NET Word library NuGet by simply running the command `Install-Package Syncfusion.DocIO.AspNet` from the Package Manager Console in Visual Studio.

Try the following code example to create a Word document.

```csharp
using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;

//Creates a new instance of WordDocument (Empty Word Document).
using (WordDocument document = new WordDocument())
{
    //Adds a section and a paragraph to the document.
    document.EnsureMinimal();
    //Appends text to the last paragraph of the document.
    document.LastParagraph.AppendText("Hello World");
    //Saves the Word document.
    document.Save("Sample.docx", FormatType.Docx);
}
```

For more information to get started, refer to our [Getting Started Documentation page](https://help.syncfusion.com/file-formats/docio/getting-started?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget).

### License
This is a commercial product and requires a paid license for possession or use. Syncfusion’s licensed software, including this component, is subject to the terms and conditions of [Syncfusion's EULA](https://www.syncfusion.com/eula/es/?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget). You can purchase a license [here]( https://www.syncfusion.com/sales/products?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) or start a free 30-day trial [here](https://www.syncfusion.com/account/manage-trials/start-trials?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget).

### About Syncfusion
Founded in 2001 and headquartered in Research Triangle Park, N.C., Syncfusion has more than 27,000+ customers and more than 1 million users, including large financial institutions, Fortune 500 companies, and global IT consultancies.

Today, we provide 1700+ components and frameworks for web ([Blazor](https://www.syncfusion.com/blazor-components?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [Flutter](https://www.syncfusion.com/flutter-widgets?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [ASP.NET Core](https://www.syncfusion.com/aspnet-core-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [ASP.NET MVC](https://www.syncfusion.com/aspnet-mvc-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [ASP.NET WebForms](https://www.syncfusion.com/jquery/aspnet-webforms-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [JavaScript](https://www.syncfusion.com/javascript-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [Angular](https://www.syncfusion.com/angular-ui-components?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [React](https://www.syncfusion.com/react-ui-components?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [Vue](https://www.syncfusion.com/vue-ui-components?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), and [jQuery](https://www.syncfusion.com/jquery-ui-widgets?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget)), mobile ([.NET MAUI (Preview)](https://www.syncfusion.com/maui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [Flutter](https://www.syncfusion.com/flutter-widgets?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [Xamarin](https://www.syncfusion.com/xamarin-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [UWP](https://www.syncfusion.com/uwp-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), and [JavaScript](https://www.syncfusion.com/javascript-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget)), and desktop development ([WinForms](https://www.syncfusion.com/winforms-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [WPF](https://www.syncfusion.com/wpf-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [WinUI](https://www.syncfusion.com/winui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [.NET MAUI (Preview)](https://www.syncfusion.com/maui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [Flutter](https://www.syncfusion.com/flutter-widgets?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget), [Xamarin](https://www.syncfusion.com/xamarin-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) and [UWP](https://www.syncfusion.com/uwp-ui-controls?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget)). We provide ready-to-deploy enterprise software for dashboards, reports, data integration, and big data processing. Many customers have saved millions in licensing fees by deploying our software.

___

[sales@syncfusion.com](mailto:sales@syncfusion.com?Subject=Syncfusion%20ASPNET%20DocIO%20-%20NuGet) | [www.syncfusion.com](https://www.syncfusion.com?utm_source=nuget&utm_medium=listing&utm_campaign=aspnet-docio-nuget) | Toll Free: 1-888-9 DOTNET