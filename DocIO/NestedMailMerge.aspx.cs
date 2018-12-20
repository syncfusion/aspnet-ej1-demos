#region Copyright Syncfusion Inc. 2001 - 2018
//
//  Copyright Syncfusion Inc. 2001 - 2018. All rights reserved.
//
//  Use of this code is subject to the terms of our license.
//  A copy of the current license can be obtained at any time by e-mailing
//  licensing@syncfusion.com. Any infringement will be prosecuted under
//  applicable laws. 
//
#endregion

using System;
using System.IO;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using Syncfusion.DocIO;
using Syncfusion.DocIO.DLS;
using System.Data.OleDb;
using System.Collections;
using System.ComponentModel;
using System.Collections.Generic;
using System.Xml;
using Syncfusion.DocToPDFConverter;
using Syncfusion.Pdf;


namespace WebSampleBrowser.DocIO
{
    public partial class NestedMailMerge : System.Web.UI.Page
    {
        # region Private Members
        string dataPath = null;
        # endregion
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        # region Helpher Methods
        /// <summary>
        /// Helps to identify the path of the data folder
        /// </summary>
        /// <param name="fileName"></param>
        /// <returns></returns>
        protected string ResolveApplicationDataPath(string fileName)
        {
            //Data folder path is resolved from requested page physical path.
            string dataPath = new System.IO.DirectoryInfo(Request.PhysicalPath + "..\\..\\..\\App_Data\\").FullName;
            return string.Format("{0}\\{1}", dataPath, fileName);
        }
        # endregion

        # region Events
        /// <summary>
        /// Creates document
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Button1_Click(object sender, EventArgs e)
        {
            dataPath = ResolveApplicationDataPath("");

            WordDocument document = new WordDocument();

            //Executes mailmerge and creates document in report format
            # region Report Format
            if (this.radioButtonReport.Checked)
                document.Open(dataPath + "\\DocIO\\Template_Report.doc", FormatType.Doc);
            else
                document.Open(dataPath + "\\DocIO\\Template_Letter.doc", FormatType.Doc);

            if (radioButtonExplicit.Checked)
            {
                DataSet ds = new DataSet();
                ds.ReadXml(dataPath + "\\DocIO\\Employees.xml");
                ArrayList commands = new ArrayList();

                //DictionaryEntry contain "Source table" (KEY) and "Command" (VALUE)
                DictionaryEntry entry = new DictionaryEntry("Employees", string.Empty);
                commands.Add(entry);

                // To retrive customer details
                DataTable table = ds.Tables["Customers"];
                string relation = table.ParentRelations[0].ChildColumns[0].ColumnName + " = %Employees." + table.ParentRelations[0].ParentColumns[0].ColumnName + "%";
                entry = new DictionaryEntry("Customers", relation);
                commands.Add(entry);

                // To retrieve order details
                table = ds.Tables["Orders"];
                relation = table.ParentRelations[0].ChildColumns[0].ColumnName + " = %Customers." + table.ParentRelations[0].ParentColumns[0].ColumnName + "%";
                entry = new DictionaryEntry("Orders", relation);
                commands.Add(entry);

                //Executes nested Mail merge using explicit relational data.
                document.MailMerge.ExecuteNestedGroup(ds, commands);
            }
            else
            {
                MailMergeDataTable dataTable = GetMailMergeDataTable();
                //Executes nested Mail merge using implicit relational data.
                document.MailMerge.ExecuteNestedGroup(dataTable);
            }
            # region Save the document
            //Save as .doc format
            if (rdButtonDoc.Checked)
            {
                document.Save("Sample.doc", FormatType.Doc, Response, HttpContentDisposition.Attachment);
            }
            //Save as .docx format
            else if (rdButtonDocx.Checked)
            {
                document.Save("Sample.docx", FormatType.Docx, Response, HttpContentDisposition.Attachment);
            }
            //Save as WordML(.xml) format
            else if (rdButtonWordML.Checked)
            {
                document.Save("Sample.xml", FormatType.WordML, Response, HttpContentDisposition.Attachment);
            }
            //Save as .pdf format
            else if (rdButtonPdf.Checked)
            {
                DocToPDFConverter converter = new DocToPDFConverter();
                PdfDocument pdfDoc = converter.ConvertToPDF(document);

                pdfDoc.Save("Sample.pdf", Response, HttpReadType.Save);
            }
            # endregion
            # endregion
        }
        /// <summary>
        /// Handles the Click event of the Button2 control.
        /// </summary>
        /// <param name="sender">The source of the event.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected void Button2_Click(object sender, EventArgs e)
        {
            if (this.radioButtonReport.Checked)
                dataPath = ResolveApplicationDataPath("") + "\\DocIO\\Template_Report.doc";
            else if (this.radioButtonLetter.Checked)
                dataPath = ResolveApplicationDataPath("") + "\\DocIO\\Template_Letter.doc";
            string fileName = "Template.doc";
            FileStream fileStream = new FileStream(dataPath, FileMode.Open, FileAccess.Read, FileShare.ReadWrite);
            fileStream.Position = 0L;
            Response.Clear();
            Response.AddHeader("Content-Type", fileName.EndsWith("doc") ? "application/msword" : "application/application/vnd.ms-word.document.12");
            Response.AddHeader("Content-Disposition", "attachment;filename=" + fileName + ";");
            fileStream.CopyTo(Response.OutputStream);
            fileStream.Close();
            Response.End();
        }
        /// <summary>
        /// Gets the mail merge data table.
        /// </summary>
        /// <returns></returns>
        /// <exception cref="System.Exception">reader</exception>
        /// <exception cref="XmlException">Unexpected xml tag  + reader.LocalName</exception>
        private MailMergeDataTable GetMailMergeDataTable()
        {
            List<EmployeeDetailsImplicit> employees = new List<EmployeeDetailsImplicit>();
            FileStream fs = new FileStream(dataPath + "\\DocIO\\Employees.xml", FileMode.Open, FileAccess.Read);

            XmlReader reader = XmlReader.Create(fs);

            if (reader == null)
                throw new Exception("reader");

            while (reader.NodeType != XmlNodeType.Element)
                reader.Read();

            if (reader.LocalName != "EmployeesList")
                throw new XmlException("Unexpected xml tag " + reader.LocalName);

            reader.Read();

            while (reader.NodeType == XmlNodeType.Whitespace)
                reader.Read();

            while (reader.LocalName != "EmployeesList")
            {
                if (reader.NodeType == XmlNodeType.Element)
                {
                    switch (reader.LocalName)
                    {
                        case "Employees":
                            employees.Add(GetEmployee(reader));
                            break;
                    }
                }
                else
                {
                    reader.Read();
                    if ((reader.LocalName == "EmployeesList") && reader.NodeType == XmlNodeType.EndElement)
                        break;
                }
            }

            MailMergeDataTable dataTable = new MailMergeDataTable("Employees", employees);

            reader.Close();
            fs.Dispose();
            return dataTable;
        }
        /// <summary>
        /// Gets the employee.
        /// </summary>
        /// <param name="reader">The reader.</param>
        /// <returns></returns>
        /// <exception cref="System.Exception">reader</exception>
        /// <exception cref="XmlException">Unexpected xml tag  + reader.LocalName</exception>
        private EmployeeDetailsImplicit GetEmployee(XmlReader reader)
        {
            if (reader == null)
                throw new Exception("reader");

            while (reader.NodeType != XmlNodeType.Element)
                reader.Read();

            if (reader.LocalName != "Employees")
                throw new XmlException("Unexpected xml tag " + reader.LocalName);

            reader.Read();

            while (reader.NodeType == XmlNodeType.Whitespace)
                reader.Read();

            EmployeeDetailsImplicit employee = new EmployeeDetailsImplicit();
            while (reader.LocalName != "Employees")
            {
                if (reader.NodeType == XmlNodeType.Element)
                {
                    switch (reader.LocalName)
                    {
                        case "EmployeeID":
                            employee.EmployeeID = reader.ReadElementContentAsString();
                            break;
                        case "LastName":
                            employee.LastName = reader.ReadElementContentAsString();
                            break;
                        case "FirstName":
                            employee.FirstName = reader.ReadElementContentAsString();
                            break;
                        case "Address":
                            employee.Address = reader.ReadElementContentAsString();
                            break;
                        case "City":
                            employee.City = reader.ReadElementContentAsString();
                            break;
                        case "Country":
                            employee.Country = reader.ReadElementContentAsString();
                            break;
                        case "Extension":
                            employee.Extension = reader.ReadElementContentAsString();
                            break;
                        case "Customers":
                            employee.Customers.Add(GetCustomer(reader));
                            break;
                        default:
                            reader.Skip();
                            break;
                    }
                }
                else
                {
                    reader.Read();
                    if ((reader.LocalName == "Employees") && reader.NodeType == XmlNodeType.EndElement)
                        break;
                }
            }
            return employee;
        }
        /// <summary>
        /// Gets the customer.
        /// </summary>
        /// <param name="reader">The reader.</param>
        /// <returns></returns>
        /// <exception cref="System.Exception">reader</exception>
        /// <exception cref="XmlException">Unexpected xml tag  + reader.LocalName</exception>
        private CustomerDetailsImplicit GetCustomer(XmlReader reader)
        {
            if (reader == null)
                throw new Exception("reader");

            while (reader.NodeType != XmlNodeType.Element)
                reader.Read();

            if (reader.LocalName != "Customers")
                throw new XmlException("Unexpected xml tag " + reader.LocalName);

            reader.Read();

            while (reader.NodeType == XmlNodeType.Whitespace)
                reader.Read();

            CustomerDetailsImplicit customer = new CustomerDetailsImplicit();
            while (reader.LocalName != "Customers")
            {
                if (reader.NodeType == XmlNodeType.Element)
                {
                    switch (reader.LocalName)
                    {
                        case "EmployeeID":
                            customer.EmployeeID = reader.ReadElementContentAsString();
                            break;
                        case "CustomerID":
                            customer.CustomerID = reader.ReadElementContentAsString();
                            break;
                        case "CompanyName":
                            customer.CompanyName = reader.ReadElementContentAsString();
                            break;
                        case "ContactName":
                            customer.ContactName = reader.ReadElementContentAsString();
                            break;
                        case "City":
                            customer.City = reader.ReadElementContentAsString();
                            break;
                        case "Country":
                            customer.Country = reader.ReadElementContentAsString();
                            break;
                        case "Orders":
                            customer.Orders.Add(GetOrders(reader));
                            break;
                    }
                    reader.Read();
                }
                else
                {
                    reader.Read();
                    if ((reader.LocalName == "Customers") && reader.NodeType == XmlNodeType.EndElement)
                        break;
                }
            }
            return customer;
        }
        /// <summary>
        /// Gets the orders.
        /// </summary>
        /// <param name="reader">The reader.</param>
        /// <returns></returns>
        /// <exception cref="System.Exception">reader</exception>
        /// <exception cref="XmlException">Unexpected xml tag  + reader.LocalName</exception>
        private OrderDetails GetOrders(XmlReader reader)
        {
            if (reader == null)
                throw new Exception("reader");

            while (reader.NodeType != XmlNodeType.Element)
                reader.Read();

            if (reader.LocalName != "Orders")
                throw new XmlException("Unexpected xml tag " + reader.LocalName);

            reader.Read();

            while (reader.NodeType == XmlNodeType.Whitespace)
                reader.Read();

            OrderDetails order = new OrderDetails();
            while (reader.LocalName != "Orders")
            {
                if (reader.NodeType != XmlNodeType.EndElement)
                {
                    switch (reader.LocalName)
                    {
                        case "OrderID":
                            order.OrderID = reader.ReadElementContentAsString();
                            break;
                        case "CustomerID":
                            order.CustomerID = reader.ReadElementContentAsString();
                            break;
                        case "OrderDate":
                            order.OrderDate = reader.ReadElementContentAsString();
                            break;
                        case "RequiredDate":
                            order.RequiredDate = reader.ReadElementContentAsString();
                            break;
                        case "ShippedDate":
                            order.ShippedDate = reader.ReadElementContentAsString();
                            break;
                    }
                    reader.Read();
                }
                else
                {
                    reader.Read();
                    if ((reader.LocalName == "Orders") && reader.NodeType == XmlNodeType.EndElement)
                        break;
                }
            }
            return order;
        }
        # endregion
    }
    #region Mailmerge data objects
    public class EmployeeDetailsImplicit
    {
        #region Fields
        private string m_employeeID;
        private string m_lastName;
        private string m_firstName;
        private string m_address;
        private string m_city;
        private string m_country;
        private string m_extension;
        private List<CustomerDetailsImplicit> m_customers;
        #endregion

        #region Properties
        public string EmployeeID
        {
            get { return m_employeeID; }
            set { m_employeeID = value; }
        }
        public string LastName
        {
            get { return m_lastName; }
            set { m_lastName = value; }
        }
        public string FirstName
        {
            get { return m_firstName; }
            set { m_firstName = value; }
        }
        public string Address
        {
            get { return m_address; }
            set { m_address = value; }
        }
        public string City
        {
            get { return m_city; }
            set { m_city = value; }
        }
        public string Country
        {
            get { return m_country; }
            set { m_country = value; }
        }
        public string Extension
        {
            get { return m_extension; }
            set { m_extension = value; }
        }
        public List<CustomerDetailsImplicit> Customers
        {
            get
            {
                if (m_customers == null)
                    m_customers = new List<CustomerDetailsImplicit>();
                return m_customers;
            }
            set
            {
                m_customers = value;
            }
        }
        #endregion

        #region Constructor
        public EmployeeDetailsImplicit()
        {
            m_customers = new List<CustomerDetailsImplicit>();
        }
        #endregion
    }
    public class CustomerDetailsImplicit
    {
        #region Fields
        private string m_employeeID;
        private string m_customerID;
        private string m_companyName;
        private string m_contactName;
        private string m_city;
        private string m_country;
        private List<OrderDetails> m_orders;
        #endregion

        #region Properties
        public List<OrderDetails> Orders
        {
            get
            {
                if (m_orders == null)
                    m_orders = new List<OrderDetails>();
                return m_orders;
            }
            set
            {
                m_orders = value;
            }
        }
        public string EmployeeID
        {
            get { return m_employeeID; }
            set { m_employeeID = value; }
        }
        public string CustomerID
        {
            get { return m_customerID; }
            set { m_customerID = value; }
        }
        public string CompanyName
        {
            get { return m_companyName; }
            set { m_companyName = value; }
        }
        public string ContactName
        {
            get { return m_contactName; }
            set { m_contactName = value; }
        }
        public string City
        {
            get { return m_city; }
            set { m_city = value; }
        }
        public string Country
        {
            get { return m_country; }
            set { m_country = value; }
        }
        #endregion

        #region Constructor
        public CustomerDetailsImplicit()
        {
            m_orders = new List<OrderDetails>();
        }
        #endregion
    }
    public class OrderDetails
    {
        #region Fields
        private string m_orderID;
        private string m_customerID;
        private string m_orderDate;
        private string m_requiredDate;
        private string m_shippedDate;
        #endregion

        #region Properties
        public string OrderID
        {
            get { return m_orderID; }
            set { m_orderID = value; }
        }
        public string CustomerID
        {
            get { return m_customerID; }
            set { m_customerID = value; }
        }
        public string OrderDate
        {
            get { return m_orderDate; }
            set { m_orderDate = value; }
        }
        public string RequiredDate
        {
            get { return m_requiredDate; }
            set { m_requiredDate = value; }
        }
        public string ShippedDate
        {
            get { return m_shippedDate; }
            set { m_shippedDate = value; }
        }
        #endregion
    }
    #endregion
}