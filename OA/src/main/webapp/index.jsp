<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <!-- Meta, title, CSS, favicons, etc. -->
    <meta charset="utf-8">
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="css/bootstrap.min.css">
    <link href="css/cropper.min.css" rel="stylesheet">
    <link href="css/sitelogo.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/font-awesome.min.css">

    <script src="js/bootstrap.min.js"></script>
    <script src="js/cropper.js"></script>
    <script src="js/sitelogo.js"></script>
    <!-- Theme CSS -->
    <link rel="stylesheet" type="text/css" href="css/vendor.css">
    <link rel="stylesheet" type="text/css" href="css/theme.css">
    <link rel="stylesheet" type="text/css" href="css/utility.css">
    <link rel="stylesheet" type="text/css" href="css/custom.css">
    <link rel="stylesheet" href="css/amazeui.min.css">
    <link rel="stylesheet" href="css/admin.css">
    <!-- Favicon -->
    <link rel="shortcut icon" href="../../img/favicon.ico">

    <style>
        .nav li {
            border-bottom: 1px solid #eee;
        }

        .glyphicons-facebook {
            margin-right: 40px;
        }

        .admin-main {
            padding-top: 0px;
        }
    </style>

</head>

<!-- Start: Header -->
<header class="navbar navbar-fixed-top">
    <div class="navbar-branding"><span id="toggle_sidemenu_l" class="glyphicons glyphicons-show_lines"></span>
        <a class="navbar-brand" style="padding-top: 7px;">OA管理系统</a>
    </div>
    <div class="navbar-left">
        <div class="navbar-divider"></div>
        <div id="settings_menu">
            <ul class="dropdown-menu" role="menu">
                <li>
                    <a href="javascript:void(0);"><span class="glyphicons glyphicons-bell text-purple mr15"></span>Users</a>
                </li>
                <li>
                    <a href="javascript:void(0);"><span class="glyphicons glyphicons-notes text-blue mr15"></span>Servers</a>
                </li>
                <li>
                    <a href="javascript:void(0);"><span class="glyphicons glyphicons-facebook text-orange mr15"></span>Crons</a>
                </li>
            </ul>
        </div>

    </div>
    <div class="navbar-right">

        <div class="navbar-menus">
            <div class="btn-group" id="alert_menu">
                <button type="button" class="dropdown-toggle" data-toggle="dropdown"><span
                        class="glyphicons glyphicons-bell"></span> <b>3</b></button>

            </div>
            <div class="btn-group" id="comment_menu">

            </div>
            <div class="btn-group" id="toggle_sidemenu_r">
                <button type="button"><span class="glyphicons glyphicons-parents"></span></button>
            </div>
        </div>
    </div>
</header>
<!-- End: Header -->
<!-- Start: Main -->
<div id="main">
    <!-- Start: Sidebar -->
    <aside id="sidebar_left">

        <div class="user-info">
            <div class="media">
                <div class="pull-left">
                    <div class="media-object border border-purple br64 bw2 p2" data-toggle="modal"
                         data-target="#avatar-modal">
                        <img id="photo" class="br64" src="img/timg.gif" alt="...">
                    </div>
                </div>
                <div class="mobile-link"><span class="glyphicons glyphicons-show_big_thumbnails"></span></div>
                <div class="media-body">
                    <h5 class="media-heading mt5 mbn fw700 cursor">
                        <a href="myinfo.jsp" target="right">${emp.ename}</a>
                    </h5>
                    <div class="media-links fs11">

                        <a href="#">${emp.ename}</a><i class="fa fa-circle text-muted fs3 p8 va-m"></i>
                        <form>
                        <a href="screen">退出</a>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="user-divider"></div>
        <div class="user-menu">
            <div class="row text-center mb15">
                <div class="col-xs-4">
                    <a href="dashboard.html"> <span class="glyphicons glyphicons-home fs22 text-blue2"></span>
                        <h5 class="fs11">Home</h5>
                    </a>
                </div>
                <div class="col-xs-4">
                    <a href="messages.html"> <span class="glyphicons glyphicons-inbox fs22 text-orange2"></span>
                        <h5 class="fs11">Inbox</h5>
                    </a>
                </div>
                <div class="col-xs-4">
                    <a href="tables.html"> <span class="glyphicons glyphicons-bell fs22 text-purple2"></span>
                        <h5 class="fs11">Data</h5>
                    </a>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-xs-4 text-center">
                    <a href="timeline.html"> <span class="glyphicons glyphicons-imac fs22 text-grey3"></span>
                        <h5 class="fs11">Views</h5>
                    </a>
                </div>
                <div class="col-xs-4">
                    <a href="profile.html"> <span class="glyphicons glyphicons-settings fs22 text-green2"></span>
                        <h5 class="fs11">Settings</h5>
                    </a>
                </div>
                <div class="col-xs-4">
                    <a href="gallery.html"> <span class="glyphicons glyphicons-restart fs22 text-light6"></span>
                        <h5 class="fs11">Images</h5>
                    </a>
                </div>
            </div>
        </div>
        <div class="sidebar-menu">
            <ul class="nav sidebar-nav">
                <li>
                    <a class="accordion-toggle" href="findAllDept?dstatus=0" target="right"> <span
                            class="glyphicons glyphicons-user"></span><span class="sidebar-title">部门管理</span><span
                            class="caret"></span></a>
                </li>
                <li>
                        <a class="accordion-toggle" href="findEmpByPage?page=1&length=4&estatus=0" target="right"><span
                            class="glyphicons glyphicons-user"></span><span class="sidebar-title">员工管理</span><span
                            class="caret"></span></a>
                </li>

                <li>
                    <a class="accordion-toggle" href="findNoteByPage?page=1&length=4&type=0&eid=${emp.eid}"
                       target="right"><span class="glyphicons glyphicons-user"></span><span
                            class="sidebar-title">请假管理</span><span class="caret"></span></a>
                </li>
                <li>
                    <a class="accordion-toggle" href="javascript:void(0)" data-toggle="modal"
                       data-target="#update-modal"
                       target="right"><span class="glyphicons glyphicons-user"></span><span
                            class="sidebar-title">修改密码</span><span class="caret"></span></a>
                </li>
            </ul>
        </div>
    </aside>
    <!-- End: Sidebar -->
    <!-- Start: Content -->
    <div style="position: absolute;left: 230px;width:67%;">
        <iframe scrolling="yes" frameborder="0" name="right" src="myinfo.jsp" width="100%" height="900"></iframe>
    </div>
</div>
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="myplugs/js/plugs.js"></script>
<div class="user_pic" style="margin: 10px;">
    <img src="">
</div>

<div class="modal fade" id="avatar-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog"
     tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <form class="avatar-form">
                <!-- 模态框头部 -->
                <div class="modal-header">
                    <!-- 关闭按钮 -->
                    <button class="close" data-dismiss="modal" type="button">&times;</button>
                    <!-- 模态框标题 -->
                    <h4 class="modal-title" id="avatar-modal-label">更换头像</h4>
                </div>
                <!-- 模态框内容 -->
                <div class="modal-body">
                    <div class="avatar-body">
                        <!-- 选择头像区域 -->
                        <div class="avatar-upload">
                            <input class="avatar-src" name="avatar_src" type="hidden">
                            <input class="avatar-data" name="avatar_data" type="hidden">
                            <!--<label for="avatarInput" style="line-height: 35px;">选择图片</label>-->
                            <button class="btn btn-danger" type="button" style="height: 35px;"
                                    onClick="$('input[id=avatarInput]').click();">请选择图片
                            </button>
                            <span id="avatar-name"></span>
                            <input class="avatar-input hide" id="avatarInput" name="avatar_file" type="file">
                        </div>
                        <div class="row">
                            <div class="col-md-9">
                                <div class="avatar-wrapper"></div>
                            </div>
                            <div class="col-md-3">
                                <div class="avatar-preview preview-lg" id="imageHead"></div>
                            </div>
                        </div>
                        <div class="row avatar-btns">
                            <div class="col-md-4">
                                <div class="btn-group">
                                    <button class="btn btn-danger fa fa-undo" data-method="rotate" data-option="-90"
                                            type="button" title="Rotate -90 degrees"> 向左旋转
                                    </button>
                                </div>
                                <div class="btn-group">
                                    <button class="btn  btn-danger fa fa-repeat" data-method="rotate" data-option="90"
                                            type="button" title="Rotate 90 degrees"> 向右旋转
                                    </button>
                                </div>
                            </div>
                            <div class="col-md-5" style="text-align: right;">
                                <button class="btn btn-danger fa fa-arrows" data-method="setDragMode" data-option="move"
                                        type="button" title="移动">
								<span class="docs-tooltip" data-toggle="tooltip" title=""
                                      data-original-title="$().cropper(&quot;setDragMode&quot;, &quot;move&quot;)">
								</span>
                                </button>
                                <button type="button" class="btn btn-danger fa fa-search-plus" data-method="zoom"
                                        data-option="0.1" title="放大图片">
								<span class="docs-tooltip" data-toggle="tooltip" title=""
                                      data-original-title="$().cropper(&quot;zoom&quot;, 0.1)">
								</span>
                                </button>
                                <button type="button" class="btn btn-danger fa fa-search-minus" data-method="zoom"
                                        data-option="-0.1" title="缩小图片">
								<span class="docs-tooltip" data-toggle="tooltip" title=""
                                      data-original-title="$().cropper(&quot;zoom&quot;, -0.1)">
								</span>
                                </button>
                                <button type="button" class="btn btn-danger fa fa-refresh" data-method="reset"
                                        title="重置图片">
                                    <span class="docs-tooltip" data-toggle="tooltip" title=""
                                          data-original-title="$().cropper(&quot;reset&quot;)"
                                          aria-describedby="tooltip866214"></span>
                                </button>
                            </div>
                            <div class="col-md-3">
                                <button class="btn btn-danger btn-block avatar-save fa fa-save" type="button"
                                        data-dismiss="modal"> 保存修改
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="modal fade" id="update-modal" aria-hidden="true" aria-labelledby="avatar-modal-label" role="dialog"
     tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="admin-content">
            <div class="admin-content-body">
                <div class="am-g">
                    <form action="" class="am-form am-form-horizontal"
                          method="post" data-am-validator>
                        <!-- 模态框头部 -->
                        <div class="modal-header">
                            <!-- 关闭按钮 -->
                            <button class="close" data-dismiss="modal" type="button">&times;</button>
                            <!-- 模态框标题 -->
                            <h4 class="modal-title">修改密码</h4>
                        </div>
                        <div class="modal-body">
                            <div class="am-form-group">
                                <label for="password" class="am-u-sm-2 am-form-label">
                                    新密码 </label>
                                <div class="am-u-sm-10">
                                    <input type="password" id="password" required placeholder="请输入新密码"
                                           name="password"> <small>输入新密码。</small>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <label for="pwd" class="am-u-sm-2 am-form-label">
                                    重复密码</label>
                                <div class="am-u-sm-10">
                                    <input type="password" id="pwd" required placeholder="请输入重复密码"
                                           name="pwd" data-equal-to="#doc-vld-pwd-1" required> <small>输入重复密码。</small>
                                </div>
                            </div>
                            <div class="am-form-group">
                                <div class="am-u-sm-9 am-u-sm-push-3">
                                    <input type="button" id="btns" onclick="btnclose()" class="am-btn am-btn-success"
                                           value="修改密码"/>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
<script src="js/html2canvas.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    var pass1 = false;
    var pass2 = false;
    var reg = /[^A-z0-9]/;
    $(function () {
        $("#password").blur(function () {
            var password = $("#password").val().trim();
            if (password.length >= 6 && password.length <= 20) {
                if (!reg.test(password)) {
                    pass1 = true;
                } else {
                    pass1 = false;
                }
            } else {
                pass1 = false;
            }
        });
        $("#pwd").blur(function () {
            var password = $("#password").val().trim();
            var pwd = $("#pwd").val().trim();
            if (password === pwd) {
                pass2 = true;
            } else {
                pass2 = false;
            }
        });
    });

    function btnclose() {
        debugger
        if (pass1 && pass2) {
            $.ajax({
                method: "POST",
                url: "updatePwd",
                data: {
                    password: $("#password").val(),
                },
                success: function (result) {
                    debugger
                    if (result == "true") {
                        alert("修改成功")
                    } else if (result == "false1") {
                        alert("")
                    } else if (result == "false2") {
                        alert("格式不正确")
                    } else if (result == "false3") {
                        alert("不在6-20区间")
                    } else if (result == "false4") {
                        alert("不能为空")
                    } else {
                        alert("我也不知道什么原因")
                    }
                }
            });
        } else {
            alert("密码不正确")
        }
    }
</script>
</body>

</html>