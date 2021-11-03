<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>无标题文档</title>
    <link href="css/style.css" rel="stylesheet" type="text/css"/>
    <script src="js/jquery-2.1.0.js"></script>
</head>

<body>
<div id="web">
    <p style="height:180px;"></p>
    <p align="center"><img src="img/logzi.png"/></p>
    <p style="height:40px;"></p>
    <div class="login">
        <div class="banner">
            <iframe id="frame_banner" src="sban/banner.html" height="218" width="100%" allowtransparency="true"
                    title="test" scrolling="no" frameborder="0"></iframe>
        </div>
        <form action="login" method="post" onsubmit="return checkSub()">
            <div class="logmain">
                <h1>&nbsp;</h1>
                <div class="logdv">
                    <span class="logzi">账 号：</span>
                    <input name="ename" type="text" id="ename" class="ename"/>
                </div>
                <div class="logdv">
                    <span class="logzi">密 码：</span>
                    <input name="epass" type="password" id="epass" class="epass"/>
                </div>
                <div class="logdv">
                    <p class="logzi">&nbsp;</p>
                    <a href="#" class="more">忘记密码</a>
                    <input name="" type="checkbox" value="" class="cex"/>记住密码
                </div>
                <div class="logdv" style="height:40px;">
                    <p class="logzi">&nbsp;</p>
                    <input name="提交" type="submit" class="btnbg" value="点击登录"/>
                </div>

                <div>
                    <a href="#" class="more">注册</a>
                </div>

            </div>
        </form>
    </div>
    <p style="height:100px;"></p>
<%--<script>--%>
<%--var bname = false; //默认账号验证失败，如果bname为true，则账号验证成功。--%>
<%--var bpass = false; // 默认密码验证失败，如果bpass为true，则密码验证成功。--%>
<%--var reg = /[^A-z0-9]/;//正则表达式（数字和字母组成）--%>
<%--$(function () {--%>
<%--    $("#ename").blur(function () {--%>
<%--        //1.获取账号文本框的值--%>
<%--        var eName =$("#ename").val().trim();--%>
<%--        //2 判断长度--%>
<%--        if(eName.length >=2 && eName.length <=20){--%>
<%--            //3 判断是否为字母和数字组成--%>
<%--            if(!reg.test(eName)){--%>
<%--                //4 判断账号是否存在--%>
<%--                $.ajax({--%>
<%--                    method: "GET", //ajax请求方式，分为get和post--%>
<%--                    url: "getUserName",//请求地址--%>
<%--                    data:{--%>
<%--                        ename:eName,//请求数据，传入到后台的数据--%>
<%--                    },--%>
<%--                    success: function (result) {--%>
<%--                        if(result){--%>
<%--                            debugger--%>
<%--                            console.log("是否存在用户名:"+result);--%>
<%--                            bname = true;--%>
<%--                        }else {--%>
<%--                            debugger;--%>
<%--                            console.log("是否存在用户名:"+result);--%>
<%--                            bname = false;--%>
<%--                        }--%>
<%--                    }--%>
<%--                });--%>
<%--            }--%>
<%--        }else {--%>
<%--            bname = false;--%>
<%--        }--%>
<%--    });--%>


<%--    $("#epass").blur(function () {--%>
<%--        //对密码进行验证--%>
<%--        var epass = $("#epass").val().trim();//获取密码文本框输入的值--%>
<%--        if(epass.length >=2 && epass.length <=20){//密码验证成功--%>
<%--            if(!reg.test(epass)){//密码不包含非数字和字母字符--%>
<%--                bpass =true;--%>
<%--            }else {//密码包含非数字和字母字符--%>
<%--                bpass = false;--%>
<%--            }--%>
<%--        }else {//密码验证失败--%>
<%--            bpass = false;--%>
<%--        }--%>
<%--    });--%>
<%--});--%>

<%--function checkSub() {--%>
<%--    if(bname && bpass) {--%>
<%--        return true;--%>
<%--    }else{--%>
<%--        alert("用户名或密码错误！！！")--%>
<%--        console.log(bname+"--->"+bpass);--%>
<%--        return  false;--%>
<%--    }--%>
<%--}--%>
<%--</script>--%>
</div>
</body>
</html>
