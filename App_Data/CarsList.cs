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
public class CarsList
{
	public string text { get; set; }
	public static List<CarsList> GetCarList()
	{
		List<CarsList> car = new List<CarsList>();
		car.Add(new CarsList { text = "Audi S6" });
		car.Add(new CarsList { text = "Austin-Healey" });
		car.Add(new CarsList { text = "Alfa Romeo" });
		car.Add(new CarsList { text = "Aston Martin" });
		car.Add(new CarsList { text = "BMW 7" });
		car.Add(new CarsList { text = "Bentley Mulsanne" });
		car.Add(new CarsList { text = "Bugatti Veyron" });
		car.Add(new CarsList { text = "Chevrolet Camaro" });
		car.Add(new CarsList { text = "Cadillac" });
		car.Add(new CarsList { text = "Duesenberg J" });
		car.Add(new CarsList { text = "Dodge Sprinter" });
		car.Add(new CarsList { text = "Elantra" });
		car.Add(new CarsList { text = "Excavator" });
		car.Add(new CarsList { text = "Ford Boss 302" });
		car.Add(new CarsList { text = "Ferrari 360" });
		car.Add(new CarsList { text = "Ford Thunderbird" });
		car.Add(new CarsList { text = "GAZ Siber" });
		car.Add(new CarsList { text = "Honda S2000" });
		car.Add(new CarsList { text = "Hyundai Santro" });
		car.Add(new CarsList { text = "Isuzu Swift" });
		car.Add(new CarsList { text = "Infiniti Skyline" });
		car.Add(new CarsList { text = "Jaguar XJS" });
		car.Add(new CarsList { text = "Kia Sedona EX" });
		car.Add(new CarsList { text = "Koenigsegg Agera" });
		car.Add(new CarsList { text = "Lotus Esprit" });
		car.Add(new CarsList { text = "Lamborghini Diablo" });
		car.Add(new CarsList { text = "Mercedes-Benz" });
		car.Add(new CarsList { text = "Mercury Coupe" });
		car.Add(new CarsList { text = "Maruti Alto 800" });
		car.Add(new CarsList { text = "Nissan Qashqai" });
		car.Add(new CarsList { text = "Oldsmobile S98" });
		car.Add(new CarsList { text = "Opel Superboss" });
		car.Add(new CarsList { text = "Porsche 356" });
		car.Add(new CarsList { text = "Pontiac Sunbird" });
		car.Add(new CarsList { text = "Scion SRS/SC/SD" });
		car.Add(new CarsList { text = "Saab Sportcombi" });
		car.Add(new CarsList { text = "Subaru Sambar" });
		car.Add(new CarsList { text = "Suzuki Swift" });
		car.Add(new CarsList { text = "Triumph Spitfire" });
		car.Add(new CarsList { text = "Toyota 2000GT" });
		car.Add(new CarsList { text = "Volvo P1800" });
		car.Add(new CarsList { text = "Volkswagen Shirako" });
		return car;
	}
}