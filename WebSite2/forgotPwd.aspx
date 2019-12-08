<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgotPwd.aspx.cs" Inherits="forgotPwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>
    <link rel="stylesheet" type="text/css" href="css/forgotPwd.css" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <div class="top">
        <a class="title_a" href="login.aspx">
            <img src="img/logo.f48685b4.png" alt="logo" class="logo" />
            <span class="title">XXX Project</span>
        </a>
        <sup class="supTitle">Beta1.0</sup>
        <div class="desc">欢迎使用XXX Project项目管理系统</div>
    </div>
    <form id="form1" runat="server">
        <div class="forgotGroup">
            <h5 class="mb-4">
                <span>用邮箱找回密码</span>
            </h5>
            <!--输入邮箱-->
            <div class="input-group-prepend">
                <asp:TextBox class="form-control" placeholder ="请输入注册邮箱" runat="server"
                    id="txtEmail" name="email"></asp:TextBox>
            </div>
            <div class="mb-4">
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="请输入邮箱号"
                    Display="Dynamic" ForeColor="Red" ControlToValidate="txtEmail" SetFocusOnError="False"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="邮箱格式不正确"
                    Display="Dynamic" ForeColor="Red" ControlToValidate="txtEmail"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <!--获取验证码-->
            <div class="input-group-prepend" id="getcode">
                <%--<span class="input-group-text">验证码</span>--%>
                <asp:TextBox type="text" class="form-control" placeholder="code" id="txtCode" name="password" runat="server"></asp:TextBox>
            </div>
            <button type="button" class="btn btn-light" id="btnGetCode" style="width: 150px;">获取验证码</button>
            <div class="mb-4" style="clear:both">
                 <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="请输入验证码"
                    Display="Dynamic" ForeColor="Red" ControlToValidate="txtCode" SetFocusOnError="False"></asp:RequiredFieldValidator>
            </div>
            <!--输入密码-->
            <div class="input-group">
                <asp:TextBox type="password" class="form-control" placeholder="输入密码" 
                    id="txtPwd" name="password" runat="server"></asp:TextBox>
            </div>
            <div class="mb-4">
                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ErrorMessage="请输入至少6位密码"
                    Display="Dynamic" ForeColor="Red" ControlToValidate="txtPwd" SetFocusOnError="False"></asp:RequiredFieldValidator>
            </div>
            <!--确认密码-->
            <div class="input-group-prepend">
                <asp:TextBox type="password" class="form-control " placeholder="确认密码" 
                    id="txtPwdConfirm" name="password" runat="server"></asp:TextBox>
            </div>
            <div class="mb-4">
                <asp:CompareValidator ID="cvPwd" runat="server" ErrorMessage="两次密码输入不匹配"
                    ForeColor="Red" Display="Dynamic" ControlToCompare="txtPwdConfirm" ControlToValidate="txtPwd"> </asp:CompareValidator>
            </div>

            
            <!--提交按钮-->
            <div class="btnDown" >
                <div class="btnGetCode">
                    <asp:Button ID="btnSubmit" runat="server" Text="提交" class="btn btn-primary  btn-block" style="float: left;" OnClick="btnSubmit_Click"/>
                </div>
                 <asp:Button ID="btnlogin" runat="server" type="submit" 
                class="btn btn-link "  Text="使用已有账号登录" 
                 style=" float:right;" CausesValidation="False" OnClick="btnlogin_Click"/>
            </div>
            
        </div>
    </form>
    <script>
        var code = "";
         $(document).ready(function () {
            $("#btnGetCode").click(function () {
                var count = 60;
                var email = $("#txtEmail").val();
                var reg_email = /\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/
                if (!reg_email.test(email)) {
                    alert("请输入正确邮箱号");
                    return false;
                }
                code = parseInt(Math.random() * (9999 - 1000 + 1) + 1000);
                alert("验证码获取成功，您的验证码为：" + code);
                
                $("#btnGetCode").attr("disabled", true);
                $("#btnGetCode").html(count + "s");
                var timer = setInterval(function () {
                    count--;
                    $("#btnGetCode").html(count + "s")
                    if (count == 0) {
                        clearInterval(timer);
                        $("#btnGetCode").attr("disabled", false);
                        $("#btnGetCode").html("获取验证码");
                    }
                },1000)
             })
             $("#btnSubmit").click(function () {
                 var inputCode = $("#txtCode").val();
                 if (code != inputCode) {
                     alert("验证码错误！");
                     return false;
                 }
             })
        });
    </script>
</body>
</html>
