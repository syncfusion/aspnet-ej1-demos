using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel;
using System.Web.Script.Serialization;
using System;

[Serializable]
public class Lanuages
{
	public string Skills { get; set; }
	public Lanuages(string _skill)
	{
		this.Skills = _skill;
	}
}