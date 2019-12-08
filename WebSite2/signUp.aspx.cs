using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class signUP : System.Web.UI.Page
{
    proManaDataContext db = new proManaDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("login.aspx");
    }

    protected void btnSignUp_Click(object sender, EventArgs e)
    {
        var newMember = new member
        {
            email = txtEmail.Text.Trim(),
            phoneNum = txtTeleNumber.Text.Trim(),
            name = txtName.Text.Trim(),
            passwd = txtPwd.Text.Trim()
        };
        db.member.InsertOnSubmit(newMember);
        db.SubmitChanges();

        Response.Redirect("login.aspx");
    }
}

//beta1.0风格不一致
//加密密码