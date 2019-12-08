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
                    <%--<span class="<i></i>nput-group-text">账&nbsp;&nbsp;号</span>--%>
                    <input runat="server" type="search" class="form-control" placeholder="邮箱" id="txtUsr" name="username"/>
                </div>
                <%--<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>--%>
                <div class="input-group-prepend mb-3">
                    <%--<span class="input-group-text">密&nbsp;&nbsp;码</span>--%>
                    <input runat="server" type="password" class="form-control" placeholder="密码" id="txtPwd" name="password"/>
                </div>
            </div>
            <!--手机号登录-->
            <div id="teleNumberLogin">
                <div class="input-group-prepend mb-3">
                    <%--<span class="input-group-text">手机号</span>--%>
                    <input runat="server" type="search" class="form-control" placeholder="手机号" id="txtTeleNum" name="username"/>
                </div>
        
                <div class="input-group-prepend mb-3" id="getcode">
                    <%--<span class="input-group-text">验证码</span>--%>
                    <input runat="server" type="text" class="form-control" placeholder="验证码" id="txtCode" name="password"/>
                </div>
                <button type="button" class="btn btn-light" id="btnGetCode" style="width: 120px;">获取验证码</button>
            </div>
        </div>
        <%--<div class="btnlogin">
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        </div>--%>
        <!--登录按钮-->
        <div class="btnlogin">
            <asp:Button ID="btnLogin" runat="server" type="submit" 
                class="btn btn-primary btn-lg btn-block" Text="登录" OnClick="btnLogin_Click" />
        </div>
        <!--注册 忘记密码按钮-->
            
        <div class="btnSignUp" >
            <asp:Button ID="btnForgot" runat="server" type="submit" 
                class="btn btn-link  btn-sm"  Text="忘记密码"  style="float: left" OnClick="btnForgot_Click"/>
            <asp:Button ID="btnSignUp" runat="server" type="submit" 
                class="btn btn-link  btn-sm"  Text="立即注册" OnClick="btnSignUp_Click" />
        </div>
        <asp:Button ID="btnHidden" runat="server" OnClick="btnHidden_Click" style="display:none" />
    </form>
    <%--<asp:Label ID="isSelected" runat="server" Text="email"></asp:Label>--%>
    

    
     
    <script>
        var code = "";
        $(document).ready(function () {
            $(".tab1")
                .click(function () {
                    code = "";
                    $(".tab1").css("color", "#1890FF");
                    $(".tab2").css("color", "black");
                    $("#selected").animate({ left: '0px' });
                    $("#accountLogin").animate({opacity:1})
                    $("#teleNumberLogin").css("display", "none");
                    $("#accountLogin").css("display", "initial");
                    $("#teleNumberLogin").animate({ opacity: 0 })
                    $("#txtTeleNum").val("");
                    $("#txtCode").val("");
                    //$("#isSelected").text("email");
                    //console.log($("#isSelected").text());
            });

            $(".tab2")
                .click(function () {
                    code = "";
                    $(".tab1").css("color", "black");     
                    $(".tab2").css("color", "#1890FF");
                    $("#selected").animate({ left: '140px' });
                    $("#accountLogin").animate({ opacity: 0 });
                    $("#teleNumberLogin").animate({ opacity: 1 });
                    $("#accountLogin").css("display", "none");
                    $("#teleNumberLogin").css("display", "initial");
                    $("#isSelected").text("phone");
                    $("#txtUsr").val("");
                    $("#txtPwd").val("");
                });
            
            $("#btnGetCode").click(function () {
                var count = 60;
                var phone = $("#txtTeleNum").val();
                var reg_phone = /1\d{10}/
                if (!reg_phone.test(phone)) {
                    alert("请输入正确手机号码");
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
            });
            $("#btnLogin").click(function () {
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
