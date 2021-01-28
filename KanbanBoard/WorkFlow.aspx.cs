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
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebSampleBrowser.Kanban
{
    public partial class WorkFlow : System.Web.UI.Page
    {

        List<Pizza> pizzadata = new List<Pizza>();
        protected void Page_Load(object sender, EventArgs e)
        {
            BindDataSource();
        }
        private void BindDataSource()
        {
            pizzadata.Add(new Pizza(1, "Mexican Green Wave", "Vegetarian", "Small", "Order", "Stromboli sandwich with chili sauce.", "Onions, Pepper, Cheese", "../content/images/kanban/menu_09.png"));
            pizzadata.Add(new Pizza(2, "Milan Veg Fantasy", "Vegetarian", "Medium", "Order", "Zucchini wrapped in spicy grilled seasoning along with tomato and jalapeno.", "Onions, Pepper, Tomato, Zucchini", "../content/images/kanban/menu_01.png"));
            pizzadata.Add(new Pizza(3, "Peppy Paneer", "Vegetarian", "Large", "Ready to Serve", "It's made using toppings of tomato, mozzarella cheese and fresh basil, which represent the red, white and green of the Italian flag.", "Onions, Pepper, Cheese", "../content/images/kanban/menu_02.png"));
            pizzadata.Add(new Pizza(4, "Margherita", "Vegetarian", "Small", "Ready to Delivery", "Lebanese Pizza topped with tomato sauce.", "Onions, Pepper, Cheese", "../content/images/kanban/menu_03.png"));
            pizzadata.Add(new Pizza(5, "Farm House", "Vegetarian", "Small", "Delivered", "Stromboli sandwich with chili sauce.", "Onions, Pepper, Cheese", "../content/images/kanban/menu_04.png"));
            pizzadata.Add(new Pizza(6, "BBQ Chicken", "Non-Vegetarian", "Medium", "Ready to Delivery", "BBQ Chicken with chili sauce.", "Onions, Pepper, Chicken, BBQ", "../content/images/kanban/menu_05.png"));
            pizzadata.Add(new Pizza(7, "Tandoori Chicken", "Non-Vegetarian", "Large", "Ready to Serve", "Tandoori Chicken with chili sauce.", "Onions, Tandoori, Pepper, Chicken", "../content/images/kanban/menu_06.png"));
            pizzadata.Add(new Pizza(8, "BBQ Prawn", "Non-Vegetarian", "Large", "Order", "BBQ Prawn with chili sauce.", "Onions, BBQ, Pepper, Prawn", "../content/images/kanban/menu_07.png"));
            pizzadata.Add(new Pizza(9, "Italian Chicken", "Non-Vegetarian", "Medium", "Ready to Delivery", "Italian Chicken with White sauce.", "Onions, Pepper, Italian, Chicken", "../content/images/kanban/menu_08.png"));
            pizzadata.Add(new Pizza(10, "Garlic Prawn", "Non-Vegetarian", "Small", "Delivered", "Prawn with chili sauce.", "Onions, Garlic, Pepper, Prawn", "../content/images/kanban/menu_19.png"));
            pizzadata.Add(new Pizza(11, "Double Cheese Margherita", "Vegetarian", "Medium", "Delivered", "Margherita with chili sauce and double Cheese.", "Onions, Pepper, Cheese", "../content/images/kanban/menu_13.png"));
            pizzadata.Add(new Pizza(12, "Veggie Delight", "Vegetarian", "Large", "Ready to Delivery", "Veggie Delight with chili sauce and extra toppings.", "Onions, Capsicum, Pepper, Cheese", "../content/images/kanban/menu_10.png"));
            pizzadata.Add(new Pizza(13, "Paneer Tikka", "Vegetarian", "Large", "Order", "Paneer Tikka with chili sauce.", "Onions, Paneer, Pepper, Tikka", "../content/images/kanban/menu_11.png"));
            pizzadata.Add(new Pizza(14, "Chicken Tikka", "Non-Vegetarian", "Medium", "Ready to Serve", "Chicken Tikka with White sauce.", "Onions, Pepper, Chicken, Tikka, Boneless", "../content/images/kanban/menu_12.png"));
            pizzadata.Add(new Pizza(15, "Kadai Chicken", "Non-Vegetarian", "Small", "Served", "Kadai Chicken with chili sauce.", "Onions, Pepper, Chicken", "../content/images/kanban/menu_14.png"));
            pizzadata.Add(new Pizza(16, "Hot Vege", "Vegetarian", "Medium", "Ready to Delivery", "Capsicum with chili sauce and Double Cheese with extra toppings.", "Onions, Pepper, Capsicum, Cheese", "../content/images/kanban/menu_15.png"));
            pizzadata.Add(new Pizza(17, "Kadai Paneer", "Vegetarian", "Large", "Order", "Kadai Paneer with chili sauce and extra toppings.", "Onions, Capsicum, Pepper, Paneer", "../content/images/kanban/menu_16.png"));
            pizzadata.Add(new Pizza(18, "Tomato Pizza", "Vegetarian", "Large", "Ready to Serve", "Tomato Pizza with chili sauce and extra toppings.", "Onions, Tomato, Pepper, Capsicum", "../content/images/kanban/menu_17.png"));
            pizzadata.Add(new Pizza(19, "Mushroom Pizza", "Vegetarian", "Medium", "Served", "Mushroom pizza with White sauce.", "Onions, Pepper, Cheese, Mushroom", "../content/images/kanban/menu_18.png"));
            this.KanbanBoard.DataSource = pizzadata;
            this.KanbanBoard.DataBind();
        }
        [Serializable]
        public class Pizza
        {
            public Pizza()
            {
            }
            public Pizza(int Id, string Title, string Type, string Size, string Category, string Description, string Tags, string ImageURL)
            {
                this.Id = Id;
                this.Title = Title;
                this.Size = Size;
                this.Type = Type;
                this.Category = Category;
                this.Tags = Tags;
                this.Description = Description;
                this.ImageURL = ImageURL;

            }
            public int Id { get; set; }
            public string Title { get; set; }
            public string Size { get; set; }
            public string Type { get; set; }
            public string Category { get; set; }
            public string Tags { get; set; }
            public string Description { get; set; }
            public string ImageURL { get; set; }

        }
    }
}