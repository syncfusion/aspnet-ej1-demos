#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.AutoComplete
{
    public partial class MultiColumn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            GetRecords();

        }
        public void GetRecords()
        {

            List<EmployeeData> list = new List<EmployeeData>();
            list.Add(new EmployeeData(10248, "VINET", 5, 8364186, "Vins et alcools Chevalier", "Reims", "59 rue de l'Abbaye", null, "51100", "France", 32.38));
            list.Add(new EmployeeData(10249, "TOMSP", 6, 836505, "Toms Spezialitäten", "Münster", "Luisenstr. 48", null, "44087", "Germany", 11.61));
            list.Add(new EmployeeData(10250, "HANAR", 4, 8367642, "Hanari Carnes", "Rio de Janeiro", "Rua do Paço, 67", "RJ", "05454-876", "Brazil", 65.83));
            list.Add(new EmployeeData(10251, "VICTE", 3, 8367642, "Victuailles en stock", "Lyon", "2, rue du Commerce", null, "69004", "France", 41.34));
            list.Add(new EmployeeData(10252, "SUPRD", 4, 8368506, "Suprêmes délices", "Charleroi", "Boulevard Tirou, 255", null, "B-6000", "Belgium", 51.3));
            list.Add(new EmployeeData(10253, "HANAR", 3, 836937, "Hanari Carnes", "Rio de Janeiro", "Rua do Paço, 67", "RJ", "05454-876", "Brazil", 58.17));
            list.Add(new EmployeeData(10254, "CHOPS", 5, 8370234, "Chop-suey Chinese", "Bern", "Hauptstr. 31", null, "3012", "Switzerland", 22.98));
            list.Add(new EmployeeData(10255, "RICSU", 9, 8371098, "Richter Supermarkt", "Genève", "Starenweg 5", null, "1204", "Switzerland", 148.33));
            list.Add(new EmployeeData(10256, "WELLI", 3, 837369, "Wellington Importadora", "Resende", "Rua do Mercado, 12", "SP", "08737-363", "Brazil", 13.97));
            list.Add(new EmployeeData(10257, "HILAA", 4, 8374554, "HILARION-Abastos", "San Cristóbal", "Carrera 22 con Ave. Carlos Soublette #8-35", "Táchira", "5022", "Venezuela", 81.91));
            list.Add(new EmployeeData(10258, "ERNSH", 1, 8375418, "Ernst Handel", "Graz", "Kirchgasse 6", null, "8010", "Austria", 140.51));
            list.Add(new EmployeeData(10259, "CENTC", 4, 8376282, "Centro comercial Moctezuma", "México D.F.", "Sierras de Granada 9993", null, "05022", "Mexico", 3.25));
            list.Add(new EmployeeData(10260, "OTTIK", 4, 8377146, "Ottilies Käseladen", "Köln", "Mehrheimerstr. 369", null, "50739", "Germany", 55.09));
            list.Add(new EmployeeData(10261, "QUEDE", 4, 8377146, "Que Delícia", "Rio de Janeiro", "Rua da Panificadora, 12", "RJ", "02389-673", "Brazil", 3.05));
            list.Add(new EmployeeData(10262, "RATTC", 8, 8379738, "Rattlesnake Canyon Grocery", "Albuquerque", "2817 Milton Dr.", "NM", "87110", "USA", 48.29));
            list.Add(new EmployeeData(10263, "ERNSH", 9, 8380602, "Ernst Handel", "Graz", "Kirchgasse 6", null, "8010", "Austria", 146.06));
            list.Add(new EmployeeData(10264, "FOLKO", 6, 8381466, "Folk och fä HB", "Bräcke", "Åkergatan 24", null, "S-844 67", "Sweden", 3.67));
            list.Add(new EmployeeData(10265, "BLONP", 2, 838233, "Blondel père et fils", "Strasbourg", "24, place Kléber", null, "67000", "France", 55.28));
            list.Add(new EmployeeData(10266, "WARTH", 3, 8383194, "Wartian Herkku", "Oulu", "Torikatu 38", null, "90110", "Finland", 25.73));
            list.Add(new EmployeeData(10267, "FRANK", 4, 8385786, "Frankenversand", "München", "Berliner Platz 43", null, "80805", "Germany", 208.58));
            list.Add(new EmployeeData(10268, "GROSR", 8, 838665, "GROSELLA-Restaurante", "Caracas", "5ª Ave. Los Palos Grandes", "DF", "1081", "Venezuela", 66.29));
            list.Add(new EmployeeData(10269, "WHITC", 5, 8387514, "White Clover Markets", "Seattle", "1029 - 12th Ave. S.", "WA", "98124", "USA", 4.56));
            list.Add(new EmployeeData(10270, "WARTH", 1, 8388378, "Wartian Herkku", "Oulu", "Torikatu 38", null, "90110", "Finland", 136.54));
            list.Add(new EmployeeData(10271, "SPLIR", 6, 8388378, "Split Rail Beer & Ale", "Lander", "P.O. Box 555", "WY", "82520", "USA", 4.54));
            list.Add(new EmployeeData(10272, "RATTC", 6, 8389242, "Rattlesnake Canyon Grocery", "Albuquerque", "2817 Milton Dr.", "NM", "87110", "USA", 98.03));
            list.Add(new EmployeeData(10273, "QUICK", 3, 8391834, "QUICK-Stop", "Cunewalde", "Taucherstraße 10", null, "01307", "Germany", 76.07));
            list.Add(new EmployeeData(10274, "VINET", 6, 8392698, "Vins et alcools Chevalier", "Reims", "59 rue de l'Abbaye", null, "51100", "France", 6.01));
            list.Add(new EmployeeData(10275, "MAGAA", 1, 8393562, "Magazzini Alimentari Riuniti", "Bergamo", "Via Ludovico il Moro 22", null, "24100", "Italy", 26.93));
            list.Add(new EmployeeData(10276, "TORTU", 8, 8394426, "Tortuga Restaurante", "México D.F.", "Avda. Azteca 123", null, "05033", "Mexico", 13.84));
            list.Add(new EmployeeData(10277, "MORGK", 2, 839529, "Morgenstern Gesundkost", "Leipzig", "Heerstr. 22", null, "04179", "Germany", 125.77));
            list.Add(new EmployeeData(10278, "BERGS", 8, 8397882, "Berglunds snabbköp", "Luleå", "Berguvsvägen  8", null, "S-958 22", "Sweden", 92.69));
            list.Add(new EmployeeData(10279, "LEHMS", 8, 8398746, "Lehmanns Marktstand", "Frankfurt a.M.", "Magazinweg 7", null, "60528", "Germany", 25.83));
            list.Add(new EmployeeData(10280, "BERGS", 2, 839961, "Berglunds snabbköp", "Luleå", "Berguvsvägen  8", null, "S-958 22", "Sweden", 8.98));
            list.Add(new EmployeeData(10281, "ROMEY", 4, 839961, "Romero y tomillo", "Madrid", "Gran Vía, 1", null, "28001", "Spain", 2.94));
            list.Add(new EmployeeData(10282, "ROMEY", 4, 8400474, "Romero y tomillo", "Madrid", "Gran Vía, 1", null, "28001", "Spain", 12.69));
            list.Add(new EmployeeData(10283, "LILAS", 3, 8401338, "LILA-Supermercado", "Barquisimeto", "Carrera 52 con Ave. Bolívar #65-98 Llano Largo", "Lara", "3508", "Venezuela", 84.81));
            list.Add(new EmployeeData(10284, "LEHMS", 4, 840393, "Lehmanns Marktstand", "Frankfurt a.M.", "Magazinweg 7", null, "60528", "Germany", 76.56));
            list.Add(new EmployeeData(10285, "QUICK", 1, 8404794, "QUICK-Stop", "Cunewalde", "Taucherstraße 10", null, "01307", "Germany", 76.83));
            list.Add(new EmployeeData(10286, "QUICK", 8, 8405658, "QUICK-Stop", "Cunewalde", "Taucherstraße 10", null, "01307", "Germany", 229.24));
            list.Add(new EmployeeData(10287, "RICAR", 8, 8406522, "Ricardo Adocicados", "Rio de Janeiro", "Av. Copacabana, 267", "RJ", "02389-890", "Brazil", 12.76));
            list.Add(new EmployeeData(10288, "REGGC", 4, 8407386, "Reggiani Caseifici", "Reggio Emilia", "Strada Provinciale 124", null, "42100", "Italy", 7.45));
            list.Add(new EmployeeData(10289, "BSBEV", 7, 8409978, "B's Beverages", "London", "Fauntleroy Circus", null, "EC2 5NT", "UK", 22.77));
            list.Add(new EmployeeData(10290, "COMMI", 8, 8410842, "Comércio Mineiro", "Sao Paulo", "Av. dos Lusíadas, 23", "SP", "05432-043", "Brazil", 79.7));
            list.Add(new EmployeeData(10291, "QUEDE", 6, 8410842, "Que Delícia", "Rio de Janeiro", "Rua da Panificadora, 12", "RJ", "02389-673", "Brazil", 6.4));
            list.Add(new EmployeeData(10292, "TRADH", 1, 8411706, "Tradiçao Hipermercados", "Sao Paulo", "Av. Inês de Castro, 414", "SP", "05634-030", "Brazil", 1.35));
            list.Add(new EmployeeData(10293, "TORTU", 1, 841257, "Tortuga Restaurante", "México D.F.", "Avda. Azteca 123", null, "05033", "Mexico", 21.18));
            list.Add(new EmployeeData(10294, "RATTC", 4, 8413434, "Rattlesnake Canyon Grocery", "Albuquerque", "2817 Milton Dr.", "NM", "87110", "USA", 147.26));
            list.Add(new EmployeeData(10295, "VINET", 2, 8416026, "Vins et alcools Chevalier", "Reims", "59 rue de l'Abbaye", null, "51100", "France", 1.15));
            list.Add(new EmployeeData(10296, "LILAS", 6, 841689, "LILA-Supermercado", "Barquisimeto", "Carrera 52 con Ave. Bolívar #65-98 Llano Largo", "Lara", "3508", "Venezuela", .12));
            list.Add(new EmployeeData(10297, "BLONP", 5, 8417754, "Blondel père et fils", "Strasbourg", "24, place Kléber", null, "67000", "France", 5.74));
            list.Add(new EmployeeData(10298, "HUNGO", 6, 8418618, "Hungry Owl All-Night Grocers", "Cork", "8 Johnstown Road", "Co. Cork", null, "Ireland", 168.22));
            list.Add(new EmployeeData(10299, "RICAR", 4, 8419482, "Ricardo Adocicados", "Rio de Janeiro", "Av. Copacabana, 267", "RJ", "02389-890", "Brazil", 29.76));
            list.Add(new EmployeeData(10300, "MAGAA", 2, 8422074, "Magazzini Alimentari Riuniti", "Bergamo", "Via Ludovico il Moro 22", null, "24100", "Italy", 17.68));
            list.Add(new EmployeeData(10301, "WANDK", 8, 8422074, "Die Wandernde Kuh", "Stuttgart", "Adenauerallee 900", null, "70563", "Germany", 45.08));
            list.Add(new EmployeeData(10302, "SUPRD", 4, 8422938, "Suprêmes délices", "Charleroi", "Boulevard Tirou, 255", null, "B-6000", "Belgium", 6.27));
            list.Add(new EmployeeData(10303, "GODOS", 7, 8423802, "Godos Cocina Típica", "Sevilla", "C/ Romero, 33", null, "41101", "Spain", 107.83));
            list.Add(new EmployeeData(10304, "TORTU", 1, 8424666, "Tortuga Restaurante", "México D.F.", "Avda. Azteca 123", null, "05033", "Mexico", 63.79));
            list.Add(new EmployeeData(10305, "OLDWO", 8, 842553, "Old World Delicatessen", "Anchorage", "2743 Bering St.", "AK", "99508", "USA", 257.62));
            list.Add(new EmployeeData(10306, "ROMEY", 1, 8428122, "Romero y tomillo", "Madrid", "Gran Vía, 1", null, "28001", "Spain", 7.56));
            list.Add(new EmployeeData(10307, "LONEP", 2, 8428986, "Lonesome Pine Restaurant", "Portland", "89 Chiaroscuro Rd.", "OR", "97219", "USA", .56));
            list.Add(new EmployeeData(10308, "ANATR", 7, 842985, "Ana Trujillo Emparedados y helados", "México D.F.", "Avda. de la Constitución 2222", null, "05021", "Mexico", 1.61));
            list.Add(new EmployeeData(10309, "HUNGO", 3, 8430714, "Hungry Owl All-Night Grocers", "Cork", "8 Johnstown Road", "Co. Cork", null, "Ireland", 47.3));
            list.Add(new EmployeeData(10310, "THEBI", 8, 8431578, "The Big Cheese", "Portland", "89 Jefferson Way Suite 2", "OR", "97201", "USA", 17.52));
            list.Add(new EmployeeData(10311, "DUMON", 1, 8431578, "Du monde entier", "Nantes", "67, rue des Cinquante Otages", null, "44000", "France", 24.69));
            list.Add(new EmployeeData(10312, "WANDK", 2, 843417, "Die Wandernde Kuh", "Stuttgart", "Adenauerallee 900", null, "70563", "Germany", 40.26));
            list.Add(new EmployeeData(10313, "QUICK", 2, 8435034, "QUICK-Stop", "Cunewalde", "Taucherstraße 10", null, "01307", "Germany", 1.96));
            list.Add(new EmployeeData(10314, "RATTC", 1, 8435898, "Rattlesnake Canyon Grocery", "Albuquerque", "2817 Milton Dr.", "NM", "87110", "USA", 74.16));
            list.Add(new EmployeeData(10315, "ISLAT", 4, 8436762, "Island Trading", "Cowes", "Garden House Crowther Way", "Isle of Wight", "PO31 7PJ", "UK", 41.76));
            list.Add(new EmployeeData(10316, "RATTC", 1, 8437626, "Rattlesnake Canyon Grocery", "Albuquerque", "2817 Milton Dr.", "NM", "87110", "USA", 150.15));
            list.Add(new EmployeeData(10317, "LONEP", 6, 8440218, "Lonesome Pine Restaurant", "Portland", "89 Chiaroscuro Rd.", "OR", "97219", "USA", 12.69));
            list.Add(new EmployeeData(10318, "ISLAT", 8, 8441082, "Island Trading", "Cowes", "Garden House Crowther Way", "Isle of Wight", "PO31 7PJ", "UK", 4.73));
            list.Add(new EmployeeData(10319, "TORTU", 7, 8441946, "Tortuga Restaurante", "México D.F.", "Avda. Azteca 123", null, "05033", "Mexico", 64.5));
            list.Add(new EmployeeData(10320, "WARTH", 5, 844281, "Wartian Herkku", "Oulu", "Torikatu 38", null, "90110", "Finland", 34.57));
            list.Add(new EmployeeData(10321, "ISLAT", 3, 844281, "Island Trading", "Cowes", "Garden House Crowther Way", "Isle of Wight", "PO31 7PJ", "UK", 3.43));
            list.Add(new EmployeeData(10322, "PERIC", 7, 8443674, "Pericles Comidas clásicas", "México D.F.", "Calle Dr. Jorge Cash 321", null, "05033", "Mexico", .4));
            list.Add(new EmployeeData(10323, "KOENE", 4, 8446266, "Königlich Essen", "Brandenburg", "Maubelstr. 90", null, "14776", "Germany", 4.88));
            list.Add(new EmployeeData(10324, "SAVEA", 9, 844713, "Save-a-lot Markets", "Boise", "187 Suffolk Ln.", "ID", "83720", "USA", 214.27));
            list.Add(new EmployeeData(10325, "KOENE", 1, 8447994, "Königlich Essen", "Brandenburg", "Maubelstr. 90", null, "14776", "Germany", 64.86));
            list.Add(new EmployeeData(10326, "BOLID", 4, 8448858, "Bólido Comidas preparadas", "Madrid", "C/ Araquil, 67", null, "28023", "Spain", 77.92));
            list.Add(new EmployeeData(10327, "FOLKO", 2, 8449722, "Folk och fä HB", "Bräcke", "Åkergatan 24", null, "S-844 67", "Sweden", 63.36));
            list.Add(new EmployeeData(10328, "FURIB", 4, 8452314, "Furia Bacalhau e Frutos do Mar", "Lisboa", "Jardim das rosas n. 32", null, "1675", "Portugal", 87.03));
            list.Add(new EmployeeData(10329, "SPLIR", 4, 8453178, "Split Rail Beer & Ale", "Lander", "P.O. Box 555", "WY", "82520", "USA", 191.67));
            list.Add(new EmployeeData(10330, "LILAS", 3, 8454042, "LILA-Supermercado", "Barquisimeto", "Carrera 52 con Ave. Bolívar #65-98 Llano Largo", "Lara", "3508", "Venezuela", 12.75));
            list.Add(new EmployeeData(10331, "BONAP", 9, 8454042, "Bon app'", "Marseille", "12, rue des Bouchers", null, "13008", "France", 10.19));
            list.Add(new EmployeeData(10332, "MEREP", 3, 8454906, "Mère Paillarde", "Montréal", "43 rue St. Laurent", "Québec", "H1J 1C3", "Canada", 52.84));
            list.Add(new EmployeeData(10333, "WARTH", 5, 845577, "Wartian Herkku", "Oulu", "Torikatu 38", null, "90110", "Finland", .59));
            list.Add(new EmployeeData(10334, "VICTE", 8, 8458362, "Victuailles en stock", "Lyon", "2, rue du Commerce", null, "69004", "France", 8.56));
            list.Add(new EmployeeData(10335, "HUNGO", 7, 8459226, "Hungry Owl All-Night Grocers", "Cork", "8 Johnstown Road", "Co. Cork", null, "Ireland", 42.11));
            list.Add(new EmployeeData(10336, "PRINI", 7, 846009, "Princesa Isabel Vinhos", "Lisboa", "Estrada da saúde n. 58", null, "1756", "Portugal", 15.51));
            list.Add(new EmployeeData(10337, "FRANK", 4, 8460954, "Frankenversand", "München", "Berliner Platz 43", null, "80805", "Germany", 108.26));
            list.Add(new EmployeeData(10338, "OLDWO", 4, 8461818, "Old World Delicatessen", "Anchorage", "2743 Bering St.", "AK", "99508", "USA", 84.21));
            list.Add(new EmployeeData(10339, "MEREP", 2, 846441, "Mère Paillarde", "Montréal", "43 rue St. Laurent", "Québec", "H1J 1C3", "Canada", 15.66));
            list.Add(new EmployeeData(10340, "BONAP", 1, 8465274, "Bon app'", "Marseille", "12, rue des Bouchers", null, "13008", "France", 166.31));
            list.Add(new EmployeeData(10341, "SIMOB", 7, 8465274, "Simons bistro", "Kobenhavn", "Vinbæltet 34", null, "1734", "Denmark", 26.78));
            list.Add(new EmployeeData(10342, "FRANK", 4, 8466138, "Frankenversand", "München", "Berliner Platz 43", null, "80805", "Germany", 54.83));
            list.Add(new EmployeeData(10343, "LEHMS", 4, 8467002, "Lehmanns Marktstand", "Frankfurt a.M.", "Magazinweg 7", null, "60528", "Germany", 110.37));
            list.Add(new EmployeeData(10344, "WHITC", 4, 8467866, "White Clover Markets", "Seattle", "1029 - 12th Ave. S.", "WA", "98124", "USA", 23.29));
            list.Add(new EmployeeData(10345, "QUICK", 2, 8470458, "QUICK-Stop", "Cunewalde", "Taucherstraße 10", null, "01307", "Germany", 249.06));
            list.Add(new EmployeeData(10346, "RATTC", 3, 8471322, "Rattlesnake Canyon Grocery", "Albuquerque", "2817 Milton Dr.", "NM", "87110", "USA", 142.08));
            list.Add(new EmployeeData(10347, "FAMIA", 4, 8472186, "Familia Arquibaldo", "Sao Paulo", "Rua Orós, 92", "SP", "05442-030", "Brazil", 3.1));
            list.Add(new EmployeeData(10348, "WANDK", 4, 847305, "Die Wandernde Kuh", "Stuttgart", "Adenauerallee 900", null, "70563", "Germany", .78));
            list.Add(new EmployeeData(10349, "SPLIR", 7, 8473914, "Split Rail Beer & Ale", "Lander", "P.O. Box 555", "WY", "82520", "USA", 8.63));
            list.Add(new EmployeeData(10350, "LAMAI", 6, 8476506, "La maison d'Asie", "Toulouse", "1 rue Alsace-Lorraine", null, "31000", "France", 64.19));
            list.Add(new EmployeeData(10351, "ERNSH", 1, 8476506, "Ernst Handel", "Graz", "Kirchgasse 6", null, "8010", "Austria", 162.33));
            list.Add(new EmployeeData(10352, "FURIB", 3, 847737, "Furia Bacalhau e Frutos do Mar", "Lisboa", "Jardim das rosas n. 32", null, "1675", "Portugal", 1.3));
            list.Add(new EmployeeData(10353, "PICCO", 7, 8478234, "Piccolo und mehr", "Salzburg", "Geislweg 14", null, "5020", "Austria", 360.63));
            list.Add(new EmployeeData(10354, "PERIC", 8, 8479098, "Pericles Comidas clásicas", "México D.F.", "Calle Dr. Jorge Cash 321", null, "05033", "Mexico", 53.8));
            list.Add(new EmployeeData(10355, "AROUT", 6, 8479962, "Around the Horn", "Colchester", "Brook Farm Stratford St. Mary", "Essex", "CO7 6JX", "UK", 41.95));
            list.Add(new EmployeeData(10356, "WANDK", 6, 8482554, "Die Wandernde Kuh", "Stuttgart", "Adenauerallee 900", null, "70563", "Germany", 36.71));
            list.Add(new EmployeeData(10357, "LILAS", 1, 8483418, "LILA-Supermercado", "Barquisimeto", "Carrera 52 con Ave. Bolívar #65-98 Llano Largo", "Lara", "3508", "Venezuela", 34.88));
            list.Add(new EmployeeData(10358, "LAMAI", 5, 8484282, "La maison d'Asie", "Toulouse", "1 rue Alsace-Lorraine", null, "31000", "France", 19.64));
            list.Add(new EmployeeData(10359, "SEVES", 5, 8485146, "Seven Seas Imports", "London", "90 Wadhurst Rd.", null, "OX15 4NB", "UK", 288.43));
            list.Add(new EmployeeData(10360, "BLONP", 4, 848601, "Blondel père et fils", "Strasbourg", "24, place Kléber", null, "67000", "France", 131.7));
            list.Add(new EmployeeData(10361, "QUICK", 1, 848601, "QUICK-Stop", "Cunewalde", "Taucherstraße 10", null, "01307", "Germany", 183.17));
            list.Add(new EmployeeData(10362, "BONAP", 3, 8488602, "Bon app'", "Marseille", "12, rue des Bouchers", null, "13008", "France", 96.04));
            list.Add(new EmployeeData(10363, "DRACD", 4, 8489466, "Drachenblut Delikatessen", "Aachen", "Walserweg 21", null, "52066", "Germany", 30.54));
            list.Add(new EmployeeData(10364, "EASTC", 1, 8489466, "Eastern Connection", "London", "35 King George", null, "WX3 6FW", "UK", 71.97));
            list.Add(new EmployeeData(10365, "ANTON", 3, 849033, "Antonio Moreno Taquería", "México D.F.", "Mataderos  2312", null, "05023", "Mexico", 22));
            list.Add(new EmployeeData(10366, "GALED", 8, 8491194, "Galería del gastronómo", "Barcelona", "Rambla de Cataluña, 23", null, "8022", "Spain", 10.14));
            list.Add(new EmployeeData(10367, "VAFFE", 7, 8491194, "Vaffeljernet", "Århus", "Smagsloget 45", null, "8200", "Denmark", 13.55));
            list.Add(new EmployeeData(10368, "ERNSH", 2, 8492058, "Ernst Handel", "Graz", "Kirchgasse 6", null, "8010", "Austria", 101.95));
            list.Add(new EmployeeData(10369, "SPLIR", 8, 849465, "Split Rail Beer & Ale", "Lander", "P.O. Box 555", "WY", "82520", "USA", 195.68));
            list.Add(new EmployeeData(10370, "CHOPS", 6, 8495514, "Chop-suey Chinese", "Bern", "Hauptstr. 31", null, "3012", "Switzerland", 1.17));
            list.Add(new EmployeeData(10371, "LAMAI", 1, 8495514, "La maison d'Asie", "Toulouse", "1 rue Alsace-Lorraine", null, "31000", "France", .45));
            list.Add(new EmployeeData(10372, "QUEEN", 5, 8496378, "Queen Cozinha", "Sao Paulo", "Alameda dos Canàrios, 891", "SP", "05487-020", "Brazil", 890.78));
            list.Add(new EmployeeData(10373, "HUNGO", 4, 8497242, "Hungry Owl All-Night Grocers", "Cork", "8 Johnstown Road", "Co. Cork", null, "Ireland", 124.12));
            list.Add(new EmployeeData(10374, "WOLZA", 1, 8497242, "Wolski Zajazd", "Warszawa", "ul. Filtrowa 68", null, "01-012", "Poland", 3.94));
            list.Add(new EmployeeData(10375, "HUNGC", 3, 8498106, "Hungry Coyote Import Store", "Elgin", "City Center Plaza 516 Main St.", "OR", "97827", "USA", 20.12));
            list.Add(new EmployeeData(10376, "MEREP", 1, 8500698, "Mère Paillarde", "Montréal", "43 rue St. Laurent", "Québec", "H1J 1C3", "Canada", 20.39));
            list.Add(new EmployeeData(10377, "SEVES", 1, 8500698, "Seven Seas Imports", "London", "90 Wadhurst Rd.", null, "OX15 4NB", "UK", 22.21));
            list.Add(new EmployeeData(10378, "FOLKO", 5, 8501562, "Folk och fä HB", "Bräcke", "Åkergatan 24", null, "S-844 67", "Sweden", 5.44));
            list.Add(new EmployeeData(10379, "QUEDE", 2, 8502426, "Que Delícia", "Rio de Janeiro", "Rua da Panificadora, 12", "RJ", "02389-673", "Brazil", 45.03));
            list.Add(new EmployeeData(10380, "HUNGO", 8, 850329, "Hungry Owl All-Night Grocers", "Cork", "8 Johnstown Road", "Co. Cork", null, "Ireland", 35.03));
            list.Add(new EmployeeData(10381, "LILAS", 3, 850329, "LILA-Supermercado", "Barquisimeto", "Carrera 52 con Ave. Bolívar #65-98 Llano Largo", "Lara", "3508", "Venezuela", 7.99));
            list.Add(new EmployeeData(10382, "ERNSH", 4, 8504154, "Ernst Handel", "Graz", "Kirchgasse 6", null, "8010", "Austria", 94.77));
            list.Add(new EmployeeData(10383, "AROUT", 8, 8506746, "Around the Horn", "Colchester", "Brook Farm Stratford St. Mary", "Essex", "CO7 6JX", "UK", 34.24));
            list.Add(new EmployeeData(10384, "BERGS", 3, 8506746, "Berglunds snabbköp", "Luleå", "Berguvsvägen  8", null, "S-958 22", "Sweden", 168.64));
            list.Add(new EmployeeData(10385, "SPLIR", 1, 850761, "Split Rail Beer & Ale", "Lander", "P.O. Box 555", "WY", "82520", "USA", 30.96));
            list.Add(new EmployeeData(10386, "FAMIA", 9, 8508474, "Familia Arquibaldo", "Sao Paulo", "Rua Orós, 92", "SP", "05442-030", "Brazil", 13.99));
            list.Add(new EmployeeData(10387, "SANTG", 1, 8508474, "Santé Gourmet", "Stavern", "Erling Skakkes gate 78", null, "4110", "Norway", 93.63));
            list.Add(new EmployeeData(10388, "SEVES", 2, 8509338, "Seven Seas Imports", "London", "90 Wadhurst Rd.", null, "OX15 4NB", "UK", 34.86));
            list.Add(new EmployeeData(10389, "BOTTM", 4, 8510202, "Bottom-Dollar Markets", "Tsawassen", "23 Tsawassen Blvd.", "BC", "T2F 8M4", "Canada", 47.42));
            list.Add(new EmployeeData(10390, "ERNSH", 6, 8512794, "Ernst Handel", "Graz", "Kirchgasse 6", null, "8010", "Austria", 126.38));
            list.Add(new EmployeeData(10391, "DRACD", 3, 8512794, "Drachenblut Delikatessen", "Aachen", "Walserweg 21", null, "52066", "Germany", 5.45));
            list.Add(new EmployeeData(10392, "PICCO", 2, 8513658, "Piccolo und mehr", "Salzburg", "Geislweg 14", null, "5020", "Austria", 122.46));
            list.Add(new EmployeeData(10393, "SAVEA", 1, 8514522, "Save-a-lot Markets", "Boise", "187 Suffolk Ln.", "ID", "83720", "USA", 126.56));
            list.Add(new EmployeeData(10394, "HUNGC", 1, 8514522, "Hungry Coyote Import Store", "Elgin", "City Center Plaza 516 Main St.", "OR", "97827", "USA", 30.34));
            list.Add(new EmployeeData(10395, "HILAA", 6, 8515386, "HILARION-Abastos", "San Cristóbal", "Carrera 22 con Ave. Carlos Soublette #8-35", "Táchira", "5022", "Venezuela", 184.41));
            list.Add(new EmployeeData(10396, "FRANK", 1, 851625, "Frankenversand", "München", "Berliner Platz 43", null, "80805", "Germany", 135.35));
            list.Add(new EmployeeData(10397, "PRINI", 5, 851625, "Princesa Isabel Vinhos", "Lisboa", "Estrada da saúde n. 58", null, "1756", "Portugal", 60.26));
            list.Add(new EmployeeData(10398, "SAVEA", 2, 8518842, "Save-a-lot Markets", "Boise", "187 Suffolk Ln.", "ID", "83720", "USA", 89.16));
            list.Add(new EmployeeData(10399, "VAFFE", 8, 8519706, "Vaffeljernet", "Århus", "Smagsloget 45", null, "8200", "Denmark", 27.36));
            list.Add(new EmployeeData(10400, "EASTC", 1, 852057, "Eastern Connection", "London", "35 King George", null, "WX3 6FW", "UK", 83.93));
            list.Add(new EmployeeData(10401, "RATTC", 1, 852057, "Rattlesnake Canyon Grocery", "Albuquerque", "2817 Milton Dr.", "NM", "87110", "USA", 12.51));
            list.Add(new EmployeeData(10402, "ERNSH", 8, 8521434, "Ernst Handel", "Graz", "Kirchgasse 6", null, "8010", "Austria", 67.88));
            list.Add(new EmployeeData(10403, "ERNSH", 4, 8522298, "Ernst Handel", "Graz", "Kirchgasse 6", null, "8010", "Austria", 73.79));
            list.Add(new EmployeeData(10404, "MAGAA", 2, 8522298, "Magazzini Alimentari Riuniti", "Bergamo", "Via Ludovico il Moro 22", null, "24100", "Italy", 155.97));
            list.Add(new EmployeeData(10405, "LINOD", 1, 852489, "LINO-Delicateses", "I. de Margarita", "Ave. 5 de Mayo Porlamar", "Nueva Esparta", "4980", "Venezuela", 34.82));
            list.Add(new EmployeeData(10406, "QUEEN", 7, 8525754, "Queen Cozinha", "Sao Paulo", "Alameda dos Canàrios, 891", "SP", "05487-020", "Brazil", 108.04));
            list.Add(new EmployeeData(10407, "OTTIK", 2, 8525754, "Ottilies Käseladen", "Köln", "Mehrheimerstr. 369", null, "50739", "Germany", 91.48));
            list.Add(new EmployeeData(10408, "FOLIG", 8, 8526618, "Folies gourmandes", "Lille", "184, chaussée de Tournai", null, "59000", "France", 11.26));
            list.Add(new EmployeeData(10409, "OCEAN", 3, 8527482, "Océano Atlántico Ltda.", "Buenos Aires", "Ing. Gustavo Moncada 8585 Piso 20-A", null, "1010", "Argentina", 29.83));
            list.Add(new EmployeeData(10410, "BOTTM", 3, 8528346, "Bottom-Dollar Markets", "Tsawassen", "23 Tsawassen Blvd.", "BC", "T2F 8M4", "Canada", 2.4));
            list.Add(new EmployeeData(10411, "BOTTM", 9, 8528346, "Bottom-Dollar Markets", "Tsawassen", "23 Tsawassen Blvd.", "BC", "T2F 8M4", "Canada", 23.65));
            list.Add(new EmployeeData(10412, "WARTH", 8, 8530938, "Wartian Herkku", "Oulu", "Torikatu 38", null, "90110", "Finland", 3.77));
            list.Add(new EmployeeData(10413, "LAMAI", 3, 8531802, "La maison d'Asie", "Toulouse", "1 rue Alsace-Lorraine", null, "31000", "France", 95.66));
            list.Add(new EmployeeData(10414, "FAMIA", 2, 8531802, "Familia Arquibaldo", "Sao Paulo", "Rua Orós, 92", "SP", "05442-030", "Brazil", 21.48));
            list.Add(new EmployeeData(10415, "HUNGC", 3, 8532666, "Hungry Coyote Import Store", "Elgin", "City Center Plaza 516 Main St.", "OR", "97827", "USA", .2));
            list.Add(new EmployeeData(10416, "WARTH", 8, 853353, "Wartian Herkku", "Oulu", "Torikatu 38", null, "90110", "Finland", 22.72));
            list.Add(new EmployeeData(10417, "SIMOB", 4, 853353, "Simons bistro", "Kobenhavn", "Vinbæltet 34", null, "1734", "Denmark", 70.29));
            list.Add(new EmployeeData(10418, "QUICK", 4, 8534394, "QUICK-Stop", "Cunewalde", "Taucherstraße 10", null, "01307", "Germany", 17.55));
            list.Add(new EmployeeData(10419, "RICSU", 4, 8536986, "Richter Supermarkt", "Genève", "Starenweg 5", null, "1204", "Switzerland", 137.35));
            list.Add(new EmployeeData(10420, "WELLI", 3, 853785, "Wellington Importadora", "Resende", "Rua do Mercado, 12", "SP", "08737-363", "Brazil", 44.12));
            list.Add(new EmployeeData(10421, "QUEDE", 8, 853785, "Que Delícia", "Rio de Janeiro", "Rua da Panificadora, 12", "RJ", "02389-673", "Brazil", 99.23));
            list.Add(new EmployeeData(10422, "FRANS", 2, 8538714, "Franchi S.p.A.", "Torino", "Via Monte Bianco 34", null, "10100", "Italy", 3.02));
            list.Add(new EmployeeData(10423, "GOURL", 6, 8539578, "Gourmet Lanchonetes", "Campinas", "Av. Brasil, 442", "SP", "04876-786", "Brazil", 24.5));
            list.Add(new EmployeeData(10424, "MEREP", 7, 8539578, "Mère Paillarde", "Montréal", "43 rue St. Laurent", "Québec", "H1J 1C3", "Canada", 370.61));
            list.Add(new EmployeeData(10425, "LAMAI", 6, 8540442, "La maison d'Asie", "Toulouse", "1 rue Alsace-Lorraine", null, "31000", "France", 7.93));
            list.Add(new EmployeeData(10426, "GALED", 4, 8543034, "Galería del gastronómo", "Barcelona", "Rambla de Cataluña, 23", null, "8022", "Spain", 18.69));
            list.Add(new EmployeeData(10427, "PICCO", 4, 8543034, "Piccolo und mehr", "Salzburg", "Geislweg 14", null, "5020", "Austria", 31.29));
            list.Add(new EmployeeData(10428, "REGGC", 7, 8543898, "Reggiani Caseifici", "Reggio Emilia", "Strada Provinciale 124", null, "42100", "Italy", 11.09));
            list.Add(new EmployeeData(10429, "HUNGO", 3, 8544762, "Hungry Owl All-Night Grocers", "Cork", "8 Johnstown Road", "Co. Cork", null, "Ireland", 56.63));
            list.Add(new EmployeeData(10430, "ERNSH", 4, 8545626, "Ernst Handel", "Graz", "Kirchgasse 6", null, "8010", "Austria", 458.78));
            list.Add(new EmployeeData(10431, "BOTTM", 4, 8545626, "Bottom-Dollar Markets", "Tsawassen", "23 Tsawassen Blvd.", "BC", "T2F 8M4", "Canada", 44.17));
            list.Add(new EmployeeData(10432, "SPLIR", 3, 854649, "Split Rail Beer & Ale", "Lander", "P.O. Box 555", "WY", "82520", "USA", 4.34));
            list.Add(new EmployeeData(10433, "PRINI", 3, 8549082, "Princesa Isabel Vinhos", "Lisboa", "Estrada da saúde n. 58", null, "1756", "Portugal", 73.83));
            list.Add(new EmployeeData(10434, "FOLKO", 3, 8549082, "Folk och fä HB", "Bräcke", "Åkergatan 24", null, "S-844 67", "Sweden", 17.92));
            list.Add(new EmployeeData(10435, "CONSH", 8, 8549946, "Consolidated Holdings", "London", "Berkeley Gardens 12  Brewery", null, "WX1 6LT", "UK", 9.21));
            list.Add(new EmployeeData(10436, "BLONP", 3, 855081, "Blondel père et fils", "Strasbourg", "24, place Kléber", null, "67000", "France", 156.66));
            list.Add(new EmployeeData(10437, "WARTH", 8, 855081, "Wartian Herkku", "Oulu", "Torikatu 38", null, "90110", "Finland", 19.97));
            list.Add(new EmployeeData(10438, "TOMSP", 3, 8551674, "Toms Spezialitäten", "Münster", "Luisenstr. 48", null, "44087", "Germany", 8.24));
            list.Add(new EmployeeData(10439, "MEREP", 6, 8552538, "Mère Paillarde", "Montréal", "43 rue St. Laurent", "Québec", "H1J 1C3", "Canada", 4.07));
            list.Add(new EmployeeData(10440, "SAVEA", 4, 855513, "Save-a-lot Markets", "Boise", "187 Suffolk Ln.", "ID", "83720", "USA", 86.53));
            list.Add(new EmployeeData(10441, "OLDWO", 3, 855513, "Old World Delicatessen", "Anchorage", "2743 Bering St.", "AK", "99508", "USA", 73.02));
            list.Add(new EmployeeData(10442, "ERNSH", 3, 8555994, "Ernst Handel", "Graz", "Kirchgasse 6", null, "8010", "Austria", 47.94));
            list.Add(new EmployeeData(10443, "REGGC", 8, 8556858, "Reggiani Caseifici", "Reggio Emilia", "Strada Provinciale 124", null, "42100", "Italy", 13.95));
            list.Add(new EmployeeData(10444, "BERGS", 3, 8556858, "Berglunds snabbköp", "Luleå", "Berguvsvägen  8", null, "S-958 22", "Sweden", 3.5));
            list.Add(new EmployeeData(10445, "BERGS", 3, 8557722, "Berglunds snabbköp", "Luleå", "Berguvsvägen  8", null, "S-958 22", "Sweden", 9.3));
            list.Add(new EmployeeData(10446, "TOMSP", 6, 8558586, "Toms Spezialitäten", "Münster", "Luisenstr. 48", null, "44087", "Germany", 14.68));
            list.Add(new EmployeeData(10447, "RICAR", 4, 8558586, "Ricardo Adocicados", "Rio de Janeiro", "Av. Copacabana, 267", "RJ", "02389-890", "Brazil", 68.66));
            this.selectCar.DataSource = list;
            this.selectCar.DataBind();
        }
        [Serializable]
        public class EmployeeData
        {
            public int _orderID;
            public string _customerID;
            public int _employeeID;
            public int _orderNo;
            public string _shipName;
            public string _shipCity;
            public string _shipAddress;
            public string _shipRegion;
            public string _shipPostalCode;
            public string _shipCountry;
            public double _freight;

            public EmployeeData(int _orderID, string _customerID, int _employeeID, int _orderNo, string _shipName, string _shipCity, string _shipAddress, string _shipRegion, string _shipPostalCode, string _shipCountry, double _freight)
            {
                this._orderID = _orderID;
                this._customerID = _customerID;
                this._employeeID = _employeeID;
                this._orderNo = _orderNo;
                this._shipName = _shipName;
                this._shipCity = _shipCity;
                this._shipAddress = _shipAddress;
                this._shipRegion = _shipRegion;
                this._shipPostalCode = _shipPostalCode;
                this._shipCountry = _shipCountry;
                this._freight = _freight;
            }
            public int OrderID
            {
                get
                {
                    return _orderID;
                }
                set
                {
                    _orderID = value;
                }
            }
            public string CustomerID
            {
                get
                {
                    return _customerID;
                }
                set
                {
                    _customerID = value;
                }
            }
            public int EmployeeID
            {
                get
                {
                    return _employeeID;
                }
                set
                {
                    _employeeID = value;
                }
            }
            public int OrderNo
            {
                get
                {
                    return _orderNo;
                }
                set
                {
                    _orderNo = value;
                }
            }
            public string ShipName
            {
                get
                {
                    return _shipName;
                }
                set
                {
                    _shipName = value;
                }
            }
            public string ShipCity
            {
                get
                {
                    return _shipCity;
                }
                set
                {
                    _shipCity = value;
                }
            }
            public string ShipAddress
            {
                get
                {
                    return _shipAddress;
                }
                set
                {
                    _shipAddress = value;
                }
            }
            public string ShipRegion
            {
                get
                {
                    return _shipRegion;
                }
                set
                {
                    _shipRegion = value;
                }
            }
            public string ShipPostalCode
            {
                get
                {
                    return _shipPostalCode;
                }
                set
                {
                    _shipPostalCode = value;
                }
            }
            public string ShipCountry
            {
                get
                {
                    return _shipCountry;
                }
                set
                {
                    _shipCountry = value;
                }
            }
            public double Freight
            {
                get
                {
                    return _freight;
                }
                set
                {
                    _freight = value;
                }
            }
        }
    }
}