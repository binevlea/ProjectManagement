using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    proManaDataContext db = new proManaDataContext();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtUsr.Attributes["onblur"] = ClientScript.GetPostBackEventReference(btnHidden, null);
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        //如何获取元素颜色（js）
        var results1 = from c in db.member
                      where c.email == txtUsr.Value.Trim()
                      && c.passwd == txtPwd.Value.Trim()
                      select c;
        if(results1.ToList().Count != 0)
        {
            Response.Redirect("main.aspx");
        }
        else
        {
            var results2 = from c in db.member
                           where c.phoneNum == txtTeleNum.Value.Trim()
                           select c;
            if (results2.ToList().Count != 0)
            {
                Response.Redirect("main.aspx");
            }
            else
            {

            }
        }
        //Response.Write(isSelected.Text);

    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        Response.Redirect("signUp.aspx");
    }

    protected void btnForgot_Click(object sender, EventArgs e)
    {
        Response.Redirect("forgotPwd.aspx");
    }

    protected void btnHidden_Click(object sender, EventArgs e)
    {

    }
}