using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Web.Configuration;
using proba4.Model;

namespace proba4
{
    public partial class Page1 : System.Web.UI.Page
    {
        List<Product> ProductsList = new List<Product>();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Calendar1.Visible = false;
                ProductTableGV.DataSource = ProductsList;
                ProductTableGV.DataBind();
                SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionStrin‌​g);
                con.Open();
                string selectFirstCategoryIdCommand = "select TOP 1 Id from [myDb].[dbo].[Category]";
                SqlCommand com = new SqlCommand(selectFirstCategoryIdCommand, con);
                int firstCategoryId = Convert.ToInt32(com.ExecuteScalar().ToString());
                con.Close();
                string newSqlCommand = "SELECT * FROM [Product] WHERE CategoryId = " + firstCategoryId;
                SqlDataSource2.SelectCommand = newSqlCommand;

                LabelProductName.Visible = false;
                LabelProductCalories.Visible = false;
            }

           
          
        }


        protected void ImageButtonCalendar_Click(object sender, ImageClickEventArgs e)
        {
            if (Calendar1.Visible == false)
            {
                Calendar1.Visible = true;
            }
            else
            {
                Calendar1.Visible = false;
            }
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBoxDate.Text = Calendar1.SelectedDate.ToShortDateString();
        }


        protected void CategorySelectBoxChange(object sender, EventArgs e)
        {
            string categoryId = DropDownListCategory.SelectedValue;
            string newSqlCommand = "SELECT * FROM [Product] WHERE CategoryId = " + categoryId;
            SqlDataSource2.SelectCommand = newSqlCommand;
        }

        protected void AddProductBtnClick(object sender, EventArgs e)
        {
            string productId = DropDownListProduct.SelectedValue;
            string newSqlCommand = "SELECT [Name], [Amount], [Calories], [Sugar], [Carbs] FROM [Product] WHERE Id = " + productId;
            //SqlDataSource3.SelectCommand = newSqlCommand;
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionStrin‌​g);
            con.Open();

            SqlCommand findOneProductByIdCmd = con.CreateCommand();
            findOneProductByIdCmd.CommandText = newSqlCommand;
            findOneProductByIdCmd.CommandType = CommandType.Text;

            SqlDataReader reader = findOneProductByIdCmd.ExecuteReader(CommandBehavior.KeyInfo);
            reader.Read();

            Product newProduct = new Product();

            newProduct.Id = long.Parse(productId);
            newProduct.Name = reader.GetString(0);

            newProduct.Calories = reader.GetDecimal(2);
            newProduct.Sugar = reader.GetDecimal(3);
            newProduct.Carbs = reader.GetDecimal(4);

            int newAmount = Int32.Parse(DropDownListAmount.SelectedValue);
            newProduct.Amount = newAmount;

            newProduct.CalculateTotal();

            if (ViewState["ProductsList"] != null)
            {
                ProductsList = (List<Product>)ViewState["ProductsList"];
            }

            ProductsList.Add(newProduct);

            ProductTableGV.DataSource = ProductsList;
            ProductTableGV.DataBind();

            reader.Close();
            con.Close();

            ViewState["ProductsList"] = ProductsList;

        }

        protected void ProductSelectBoxChange(object sender, EventArgs e)
        {
            string productId = DropDownListProduct.SelectedValue;
            string newSqlCommand = "SELECT [Name], [Amount], [Calories], [Sugar], [Carbs] FROM [Product] WHERE Id = " + productId;
            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionStrin‌​g);
            con.Open();

            SqlCommand cmd = new SqlCommand(newSqlCommand, con);
            SqlDataReader rdr = cmd.ExecuteReader();
            rdr.Read();

            string prodName = rdr.GetString(0);
            LabelProductName.Text = "Product: " + prodName;

            decimal prodCalories = rdr.GetDecimal(2);
            LabelProductCalories.Text = "Total calories: " + prodCalories + "";

            rdr.Close();
            con.Close();

            LabelProductName.Visible = true;
            LabelProductCalories.Visible = true;
        }


        protected void ButtonSave_Click(object sender, EventArgs e)
        {

            if (ViewState["ProductsList"] != null)
            {
                ProductsList = (List<Product>)ViewState["ProductsList"];
            }


            SqlConnection con = new SqlConnection(WebConfigurationManager.ConnectionStrings["MyDbConnectionString"].ConnectionStrin‌​g);
            con.Open();
            foreach (Product prod in ProductsList)
            {
                SqlCommand cmd = con.CreateCommand();
                cmd.CommandText = "insert into [UserProducts] values (@UserId, @ProductId, @Date, @Amount, @TotalCalories, @TotalSugar, @TotalCarbs)";
                cmd.CommandType = CommandType.Text;

                cmd.Parameters.Add("@UserId", SqlDbType.Int).Value = 1;
                cmd.Parameters.Add("@ProductId", SqlDbType.Int).Value = prod.Id;
                cmd.Parameters.Add("@Date", SqlDbType.Date).Value = new DateTime().Date;
                cmd.Parameters.Add("@Amount", SqlDbType.Int).Value = prod.Amount;
                cmd.Parameters.Add("@TotalCalories", SqlDbType.Decimal).Value = prod.TotalCalories;
                cmd.Parameters.Add("@TotalSugar", SqlDbType.Decimal).Value = prod.TotalSugar;
                cmd.Parameters.Add("@TotalCarbs", SqlDbType.Decimal).Value = prod.TotalCarbs;

                cmd.ExecuteNonQuery();

            }
            con.Close();
        }

    }
}
