#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
namespace WebSampleBrowser.SpreadsheetASP.Model
{
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Web;
    using System.ComponentModel;
    public class PersonDetail
    {
        public int SupplierID { get; set; }
        public string CompanyName { get; set; }
        public string ContactName { get; set; }
        public string ContactTitle { get; set; }
        public string City { get; set; }
        public string PostalCode { get; set; }
        public string Country { get; set; }
        public static List<PersonDetail> GetAllPersonList
        {
            get
            {
                List<PersonDetail> lItems = new List<PersonDetail>();

                lItems.Add(new PersonDetail() { SupplierID = 1, CompanyName = "Exotic Liquids", ContactName = "Charlotte Cooper", ContactTitle = "Purchasing Manager", City = "London", PostalCode = "EC1 4SD", Country = "UK" });
                lItems.Add(new PersonDetail() { SupplierID = 2, CompanyName = "New Orleans Cajun Delights", ContactName = "Shelley Burke", ContactTitle = "Order Administrator", City = "New Orleans", PostalCode = "70117", Country = "USA" });
                lItems.Add(new PersonDetail() { SupplierID = 3, CompanyName = "Grandma Kelly's Homestead", ContactName = "Regina Murphy", ContactTitle = "Sales Representative", City = "Ann Arbor", PostalCode = "48104", Country = "USA" });
                lItems.Add(new PersonDetail() { SupplierID = 4, CompanyName = "Tokyo Traders", ContactName = "Yoshi Nagase", ContactTitle = "Marketing Manager", City = "Tokyo", PostalCode = "100", Country = "Japan" });
                lItems.Add(new PersonDetail() { SupplierID = 5, CompanyName = "Cooperativa de Quesos 'Las Cabras'", ContactName = "Antonio del Valle Saavedra", ContactTitle = "Export Administrator", City = "Oviedo", PostalCode = "33007", Country = "Spain" });
                lItems.Add(new PersonDetail() { SupplierID = 6, CompanyName = "Mayumi's", ContactName = "Mayumi Ohno", ContactTitle = "Marketing Representative", City = "Osaka", PostalCode = "545", Country = "Japan" });
                lItems.Add(new PersonDetail() { SupplierID = 7, CompanyName = "Pavlova, Ltd.", ContactName = "Ian Devling", ContactTitle = "Marketing Manager", City = "Melbourne", PostalCode = "3058", Country = "Australia" });
                lItems.Add(new PersonDetail() { SupplierID = 8, CompanyName = "Specialty Biscuits, Ltd.", ContactName = "Peter Wilson", ContactTitle = "Sales Representative", City = "Manchester", PostalCode = "M14 GSD", Country = "UK" });
                lItems.Add(new PersonDetail() { SupplierID = 9, CompanyName = "PB Knäckebröd AB", ContactName = "Lars Peterson", ContactTitle = "Sales Agent", City = "Göteborg", PostalCode = "S-345 67", Country = "Sweden" });
                lItems.Add(new PersonDetail() { SupplierID = 10, CompanyName = "Refrescos Americanas LTDA", ContactName = "Carlos Diaz", ContactTitle = "Marketing Manager", City = "Sao Paulo", PostalCode = "5442", Country = "Brazil" });
                lItems.Add(new PersonDetail() { SupplierID = 11, CompanyName = "Heli Süßwaren GmbH & Co. KG", ContactName = "Petra Winkler", ContactTitle = "Sales Manager", City = "Berlin", PostalCode = "10785", Country = "Germany" });
                lItems.Add(new PersonDetail() { SupplierID = 12, CompanyName = "Plutzer Lebensmittelgroßmärkte AG", ContactName = "Martin Bein", ContactTitle = "International Marketing Mgr.", City = "Frankfurt", PostalCode = "60439", Country = "Germany" });
                lItems.Add(new PersonDetail() { SupplierID = 13, CompanyName = "Nord-Ost-Fisch Handelsgesellschaft mbH", ContactName = "Sven Petersen", ContactTitle = "Coordinator Foreign Markets", City = "Cuxhaven", PostalCode = "27478", Country = "Germany" });
                lItems.Add(new PersonDetail() { SupplierID = 14, CompanyName = "Formaggi Fortini s.r.l.", ContactName = "Elio Rossi", ContactTitle = "Sales Representative", City = "Ravenna", PostalCode = "48100", Country = "Italy" });
                lItems.Add(new PersonDetail() { SupplierID = 15, CompanyName = "Norske Meierier", ContactName = "Beate Vileid", ContactTitle = "Marketing Manager", City = "Sandvika", PostalCode = "1320", Country = "Norway" });
                lItems.Add(new PersonDetail() { SupplierID = 16, CompanyName = "Bigfoot Breweries", ContactName = "Cheryl Saylor", ContactTitle = "Regional Account Rep.", City = "Bend", PostalCode = "97101", Country = "USA" });
                lItems.Add(new PersonDetail() { SupplierID = 17, CompanyName = "Svensk Sjöföda AB", ContactName = "Michael Björn", ContactTitle = "Sales Representative", City = "Stockholm", PostalCode = "S-123 45", Country = "Sweden" });
                lItems.Add(new PersonDetail() { SupplierID = 18, CompanyName = "Aux joyeux ecclésiastiques", ContactName = "Guylène Nodier", ContactTitle = "Sales Manager", City = "Paris", PostalCode = "75004", Country = "France" });
                lItems.Add(new PersonDetail() { SupplierID = 19, CompanyName = "New England Seafood Cannery", ContactName = "Robb Merchant", ContactTitle = "Wholesale Account Agent", City = "Boston", PostalCode = "02134", Country = "USA" });
                lItems.Add(new PersonDetail() { SupplierID = 20, CompanyName = "Leka Trading", ContactName = "Chandra Leka", ContactTitle = "Owner", City = "Singapore", PostalCode = "0512", Country = "Singapore" });
                lItems.Add(new PersonDetail() { SupplierID = 21, CompanyName = "Lyngbysild", ContactName = "Niels Petersen", ContactTitle = "Sales Manager", City = "Lyngby", PostalCode = "2800", Country = "Denmark" });
                lItems.Add(new PersonDetail() { SupplierID = 22, CompanyName = "Zaanse Snoepfabriek", ContactName = "Dirk Luchte", ContactTitle = "Accounting Manager", City = "Zaandam", PostalCode = "9999 ZZ", Country = "Netherlands" });
                lItems.Add(new PersonDetail() { SupplierID = 23, CompanyName = "Karkki Oy", ContactName = "Anne Heikkonen", ContactTitle = "Product Manager", City = "Lappeenranta", PostalCode = "53120", Country = "Finland" });
                lItems.Add(new PersonDetail() { SupplierID = 24, CompanyName = "G'day, Mate", ContactName = "Wendy Mackenzie", ContactTitle = "Sales Representative", City = "Sydney", PostalCode = "2042", Country = "Australia" });
                lItems.Add(new PersonDetail() { SupplierID = 25, CompanyName = "Ma Maison", ContactName = "Jean-Guy Lauzon", ContactTitle = "Marketing Manager", City = "Montréal", PostalCode = "H1J 1C3", Country = "Canada" });
                lItems.Add(new PersonDetail() { SupplierID = 26, CompanyName = "Pasta Buttini s.r.l.", ContactName = "Giovanni Giudici", ContactTitle = "Order Administrator", City = "Salerno", PostalCode = "84100", Country = "Italy" });
                lItems.Add(new PersonDetail() { SupplierID = 27, CompanyName = "Escargots Nouveaux", ContactName = "Marie Delamare", ContactTitle = "Sales Manager", City = "Montceau", PostalCode = "71300", Country = "France" });
                lItems.Add(new PersonDetail() { SupplierID = 28, CompanyName = "Gai pâturage", ContactName = "Eliane Noz", ContactTitle = "Sales Representative", City = "Annecy", PostalCode = "74000", Country = "France" });
                lItems.Add(new PersonDetail() { SupplierID = 29, CompanyName = "Forêts d'érables", ContactName = "Chantal Goulet", ContactTitle = "Accounting Manager", City = "Ste-Hyacinthe", PostalCode = "J2S 7S8", Country = "Canada" });

                return lItems;
            }
        }
    }
}