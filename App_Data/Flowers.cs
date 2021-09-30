#region Copyright Syncfusion Inc. 2001-2021.
// Copyright Syncfusion Inc. 2001-2021. All rights reserved.
// Use of this code is subject to the terms of our license.
// A copy of the current license can be obtained at any time by e-mailing
// licensing@syncfusion.com. Any infringement will be prosecuted under
// applicable laws. 
#endregion
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel;
using System.Web.Script.Serialization;

public class Flowers
{
	public string text { get; set; }
	public static List<Flowers> GetFlowers()
	{
		List<Flowers> flower = new List<Flowers>();
		flower.Add(new Flowers { text = "Anemone Galilee" });
		flower.Add(new Flowers { text = "Allium drumstick" });
		flower.Add(new Flowers { text = "Artichoke thistle" });
		flower.Add(new Flowers { text = "Boronia" });
		flower.Add(new Flowers { text = "Bouvardia" });
		flower.Add(new Flowers { text = "Blue lace flower" });
		flower.Add(new Flowers { text = "Bird of paradise" });
		flower.Add(new Flowers { text = "Cone flower" });
		flower.Add(new Flowers { text = "Cosmos" });
		flower.Add(new Flowers { text = "Calla lily white" });
		flower.Add(new Flowers { text = "Common Yarrow" });
		flower.Add(new Flowers { text = "Delphinium Belladonna" });
		flower.Add(new Flowers { text = "Daffodil" });
		flower.Add(new Flowers { text = "Freesia" });
		flower.Add(new Flowers { text = "Foxtail fern" });
		flower.Add(new Flowers { text = "Gayfeather" });
		flower.Add(new Flowers { text = "Gardenia" });
		flower.Add(new Flowers { text = "Heather" });
		flower.Add(new Flowers { text = "Hydrangea" });
		flower.Add(new Flowers { text = "Ivy" });
		flower.Add(new Flowers { text = "Japhette orchid" });
		flower.Add(new Flowers { text = "Kangaroo paw yellow" });
		flower.Add(new Flowers { text = "Lace fern" });
		flower.Add(new Flowers { text = "Lumex" });
		flower.Add(new Flowers { text = "Mimosa" });
		flower.Add(new Flowers { text = "Moon orchid" });
		flower.Add(new Flowers { text = "Nerine" });
		flower.Add(new Flowers { text = "Paper Reed" });
		flower.Add(new Flowers { text = "Pincushion" });
		flower.Add(new Flowers { text = "Queen Anne's lace" });
		flower.Add(new Flowers { text = "Red Rover" });
		flower.Add(new Flowers { text = "Rice flower" });
		flower.Add(new Flowers { text = "Strawberry banksia" });
		flower.Add(new Flowers { text = "Saponaria" });
		flower.Add(new Flowers { text = "Thorow-wax" });
		flower.Add(new Flowers { text = "Telstar" });
		flower.Add(new Flowers { text = "Waxflower" });
		flower.Add(new Flowers { text = "Watsonia" });
		return flower;
	}
}
