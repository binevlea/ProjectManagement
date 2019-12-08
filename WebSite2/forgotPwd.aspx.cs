using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forgotPwd : System.Web.UI.Page
{
    proManaDataContext db = new proManaDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        var results = from r in db.member
                      where r.email == txtEmail.Text.Trim()
                      select r;
        if (results.ToList().Count == 1)
        {
            foreach (member m in results)
            {
                m.passwd = txtPwd.Text.Trim();
            }
            db.SubmitChanges();
        }
        Response.Redirect("login.aspx");
    }
}