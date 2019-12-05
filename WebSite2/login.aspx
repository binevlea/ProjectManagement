<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="css/login.css"/>
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>

</head>
<body>
        <!-- 顶部标题 -->
        <div class="top">
            <a class="title_a" href="login.aspx">
                <img src="img/logo.f48685b4.png" alt="logo" class="logo" />
                <span class="title">XXX Project</span>
            </a>
            <sup>
                <span class="badge badge-pill badge-danger">Beta1.0</span>
            </sup>
            
            <div class="desc">欢迎使用XXX Project项目管理系统</div>
        </div>
        <!-- 切换登录 -->
        <div class="tabgroup">
            <div class="tab1">账号密码登录</div>
            <div class="tab2">手机号登录</div>
            <div id="selected"></div>
        </div>
        <!--登录-->
        <form runat="server">
            <div class="logingroup"> 
                <!-- 账号密码登录 -->
                <div id="accountLogin">
                    <div class="input-group-prepend mb-3">
                        <span class="input-group-text">账&nbsp;&nbsp;号</span>
                        <input type="text" class="form-control" placeholder="username" id="txtUsr" name="username"/>
                    </div>
                    <div class="input-group-prepend mb-3">
                        <span class="input-group-text">密&nbsp;&nbsp;码</span>
                        <input type="password" class="form-control" placeholder="password" id="txtPwd" name="password"/>
                    </div>
                </div>
                <!--手机号登录-->
                <div id="teleNumberLogin">
                    <div class="input-group-prepend mb-3">
                        <span class="input-group-text">手机号</span>
                        <input type="text" class="form-control" placeholder="number" id="txtTeleNum" name="username"/>
                    </div>
        
                    <div class="input-group-prepend mb-3" id="getcode">
                        <span class="input-group-text">验证码</span>
                        <input type="text" class="form-control" placeholder="code" id="txtCode" name="password"/>
                    </div>
                    <button type="button" class="btn btn-light" id="btnGetCode">获取验证码</button>
                </div>
            </div>
            <!--登录按钮-->
            <div class="btnlogin">
                <asp:Button ID="btnLogin" runat="server" type="submit" 
                    class="btn btn-primary btn-lg btn-block" Text="登录" OnClick="btnLogin_Click" />
            </div>
            <!--注册按钮-->
            <div class="btnSignUp" >
                <asp:Button ID="btnSignUp" runat="server" type="submit" 
                    class="btn btn-link  btn-sm"  Text="立即注册" OnClick="btnSignUp_Click" />
            </div>
        </form>
     
    <script>
        $(document).ready(function () {
            $(".tab1")
                .click(function () {
                    $(".tab1").css("color", "#1890FF");
                    $(".tab2").css("color", "black");
                    $("#selected").animate({ left: '0px' });
                    $("#accountLogin").animate({opacity:1})
                    $("#teleNumberLogin").css("display", "none");
                    $("#accountLogin").css("display", "initial");
                    $("#teleNumberLogin").animate({opacity:0})
                    
            });

            $(".tab2")
                .click(function () {
                    $(".tab1").css("color", "black");     
                    $(".tab2").css("color", "#1890FF");
                    $("#selected").animate({ left: '140px' });
                    $("#accountLogin").animate({ opacity: 0 });
                    $("#teleNumberLogin").animate({ opacity: 1 });
                    $("#accountLogin").css("display", "none");
                    $("#teleNumberLogin").css("display", "initial");
                });
            
            $("#btnGetCode").click(function () {
                var code = parseInt(Math.random() * (9999 - 1000 + 1) + 1000);
                alert("验证码获取成功，您的验证码为：" + code);
            
            });
        });
        
    </script>
    
</body>
</html>
