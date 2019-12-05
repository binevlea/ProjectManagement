<%@ Page Language="C#" AutoEventWireup="true" CodeFile="signUp.aspx.cs" Inherits="signUP" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>注册</title>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>    
    <link rel="stylesheet" type="text/css" href="css/signUp.css"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script src="Scripts/jquery-3.4.1.js"></script>
    
    <script src="Scripts/bootstrap.min.js"></script>
</head>
<body>
    <!--标题-->
    <div class="top">
        <a class="title_a" href="login.aspx">
            <img src="img/logo.f48685b4.png" alt="logo" class="logo" />
            <span class="title">XXX Project</span>
        </a>
        <sup class="supTitle">Beta1.0</sup>
        <div class="desc">欢迎使用XXX Project项目管理系统</div>
    </div>
    <!--输入事项-->
    <form id="form1" runat="server">
        <div class="signUpGroup">
            <h5 class="mb-3">
                <span>注册</span>
            </h5>
            <!--输入邮箱-->
            <div class="input-group-prepend">
                <span class="input-group-text">邮&nbsp;&nbsp;箱</span>
                <asp:TextBox class="form-control" placeholder ="mailbox" runat="server"
                    id="txtEmail" name="email"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="请输入邮箱号"
                    Display="Dynamic" ForeColor="Red" ControlToValidate="txtEmail" SetFocusOnError="False"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" ErrorMessage="邮箱格式不正确"
                    Display="Dynamic" ForeColor="Red" ControlToValidate="txtEmail"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <!--输入姓名-->
            <div class="input-group-prepend">
                <span class="input-group-text">姓&nbsp;名</span>
                <asp:TextBox class="form-control" placeholder ="name" runat="server"
                    id="txtName" name="email"></asp:TextBox>
            </div>
            <div class="mb-3">
                 <asp:RequiredFieldValidator ID="rfvName" runat="server" ErrorMessage="请输入姓名"
                    Display="Dynamic" ForeColor="Red" ControlToValidate="txtName" SetFocusOnError="False"></asp:RequiredFieldValidator>
            </div>
            <!--输入密码-->
            <div class="input-group-prepend ">
                <span class="input-group-text">密&nbsp;&nbsp;码</span>
                <asp:TextBox type="password" class="form-control" placeholder="password" 
                    id="txtPwd" name="password" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:RequiredFieldValidator ID="rfvPwd" runat="server" ErrorMessage="请输入至少6位密码"
                    Display="Dynamic" ForeColor="Red" ControlToValidate="txtPwd" SetFocusOnError="False"></asp:RequiredFieldValidator>
            </div>
            
            <!--确认密码-->
            <div class="input-group-prepend">
                <span class="input-group-text">确认密码</span>
                <asp:TextBox type="password" class="form-control" placeholder="ConfirmPassword" 
                    id="txtPwdConfirm" name="password" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                <asp:CompareValidator ID="cvPwd" runat="server" ErrorMessage="两次密码输入不匹配"
                    ForeColor="Red" Display="Dynamic" ControlToCompare="txtPwdConfirm" ControlToValidate="txtPwd"> </asp:CompareValidator>
            </div>
            
            <!--输入手机号-->
            <div class="input-group-prepend">
                <div class="dropdown">  
                    <button class="btn btn-secondary dropdown-toggle" id="dropdownMenu1" data-toggle="dropdown">
                       +86
                    </button>
                </div>
                <asp:TextBox class="form-control" placeholder="11位手机号" id="txtTeleNumber" name="teleNumber" runat="server"></asp:TextBox>
            </div>
            <div class="mb-3">
                 <asp:RequiredFieldValidator ID="rfvTeleNumbers" runat="server" ErrorMessage="请输入手机号码"
                    Display="Dynamic" ForeColor="Red" ControlToValidate="txtTeleNumber" SetFocusOnError="False"></asp:RequiredFieldValidator>
            </div>
            <!--获取验证码-->
            <div class="input-group-prepend" id="getcode">
                <span class="input-group-text">验证码</span>
                <asp:TextBox type="text" class="form-control" placeholder="code" id="txtCode" name="password" runat="server"></asp:TextBox>
            </div>
            <button type="button" class="btn btn-light" id="btnGetCode">获取验证码</button>
            <div class="mb-3" style="clear:both">
                 <asp:RequiredFieldValidator ID="rfvCode" runat="server" ErrorMessage="请输入验证码"
                    Display="Dynamic" ForeColor="Red" ControlToValidate="txtCode" SetFocusOnError="False"></asp:RequiredFieldValidator>
            </div>
            
            <!--注册按钮-->
            <div class="btnDown" >
                <asp:Button ID="btnSignUp" runat="server" Text="注册" class="btn btn-primary btn-block" style="float: left;"/>
            </div>
            <!--已有账号登录按钮-->
            <asp:Button ID="btnlogin" runat="server" type="submit" 
            class="btn btn-link  btn-sm"  Text="使用已有账号登录" 
            OnClick="btnlogin_Click" style=" float:right;" CausesValidation="False"/>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <ajaxToolkit:PasswordStrength ID="PasswordStrength1" DisplayPosition="RightSide" MinimumNumericCharacters="6" runat="server" TargetControlID="txtPwd"  TextStrengthDescriptions="弱; 中; 强" PrefixText="强度：" />
        </div>
        
    </form>
    <script>
        
        $(document).ready(function () {
            $("#btnGetCode").click(function () {
                var code = parseInt(Math.random() * (9999 - 1000 + 1) + 1000);
                alert("验证码获取成功，您的验证码为：" + code);
            })
        });
    </script>
</body>
</html>
