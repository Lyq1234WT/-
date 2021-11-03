<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/amazeui.min.css">
    <link rel="stylesheet" href="css/admin.css">
    <style>
        .table-id {
            width: 200px;
        }

        .table-remark {
            width: 450px;
        }
    </style>
</head>

<body>
<div class="admin-content-body" style="">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">部门管理</strong><small></small></div>
    </div>
    <hr>
    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
            <div class="am-btn-toolbar">
                <div class="am-btn-group am-btn-group-xs">
                    <button type="button" class="am-btn am-btn-default btnAdd"><span class="am-icon-plus"></span> 新增
                    </button>
                    <button type="button" style="margin-left: 20px;" class="am-btn am-btn-default btnFindEnable"><span
                            class="am-icon-archive"></span> 查询正在使用的部门
                    </button>
                    <button type="button" style="margin-left: 20px;" class="am-btn am-btn-default btnFindDisable"><span
                            class="am-icon-archive"></span> 查询已撤销的部门
                    </button>
                </div>
            </div>
        </div>

    </div>

    <div class="am-g" style="margin-top: -30px;">
        <div class="am-u-sm-12">
            <form class="am-form">
                <table class="am-table am-table-striped am-table-hover table-main">
                    <thead>
                    <tr>
                        <th class="table-check">
                            <input id="chkAll" type="checkbox">
                        </th>
                        <th class="table-did">
                            ID
                        </th>
                        <th class="table-dname">
                            部门名称
                        </th>
                        <th class="table-duty">
                            部门职责
                        </th>
                        <th class="table-credate">
                            部门创建时间
                        </th>
                        <th class="table-dstatus">
                            部门状态
                        </th>
                        <th class="table-set">
                            操作
                        </th>
                    </tr>
                    </thead>
                    <tbody id="tUser">
                    <c:forEach items="${dep}" var="departs">
                        <tr>
                            <td><input name="chks" value="27" type="checkbox"></td>
                            <td>${departs.did}</td>
                            <td>${departs.dname}</td>
                            <td>${departs.duty}</td>
                            <td><fmt:formatDate value="${departs.credate}" pattern="yyyy年MM月dd日"/></td>
                            <td>${departs.dstatus==0?'使用':'撤销'}</td>
                            <td>
                                <div class="am-btn-toolbar">
                                    <div class="am-btn-group am-btn-group-xs">
                                        <button type="button" id="depart_27"
                                                class="am-btn am-btn-default am-btn-xs am-text-secondary btnedit"
                                                onclick="findDeptById(${departs.did})"><span
                                                class="am-icon-pencil-square-o"></span> 编辑
                                        </button>
                                        <c:if test="${departs.dstatus == 0}">
                                            <button type="button"
                                                    class="am-btn am-btn-default am-btn-xs am-text-danger amt-hide-sm-only"
                                                    onclick="deleteDepart(${departs.did}, ${departs.dstatus})"><span
                                                    class="am-icon-trash-o"></span> 删除
                                            </button>
                                        </c:if>
                                        <c:if test="${departs.dstatus == 1}">
                                            <button type="button"
                                                    class="am-btn am-btn-default am-btn-xs am-text-danger amt-hide-sm-only"
                                                    onclick="deleteDepart(${departs.did}, ${departs.dstatus})"><span
                                                    class="am-icon-trash-o"></span> 恢复
                                            </button>
                                        </c:if>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </form>
        </div>
    </div>
</div>
</div>
<!-- content end -->
</div>
</div>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->


<!--[if (gte IE 9)|!(IE)]><!-->
<script src="js/jquery-1.11.3.min.js"></script>
<!--<![endif]-->
<script type="text/javascript" src="myplugs/js/plugs.js"></script>

<script>

    function findDeptById(did) {
        $.jq_Panel({
            title: "修改部门",
            iframeWidth: 500,
            iframeHeight: 300,
            url: "findDeptById?did=" + did
        });
    };

    $(function () {
        $("#chkAll").chkAll({});

        $(".btnAdd").click(function () {
            $.jq_Panel({
                title: "添加部门",
                iframeWidth: 500,
                iframeHeight: 600,
                url: "addDepart.jsp"
            });
        });

        $(".btnFindEnable").click(function () {
            window.location.href = "findAllDept?dstatus=0";
        });
        $(".btnFindDisable").click(function () {
            window.location.href = "findAllDept?dstatus=1";
        });
    });

    function deleteDepart(did, dstatus) {
        if(dstatus==0){
            dstatus=1;
            window.location.href = "deleteDepart.do?did=" + did + "&dstatus=" + dstatus;
            return null;
        }
        if(dstatus==1){
            dstatus=0;
            window.location.href = "deleteDepart.do?did=" + did + "&dstatus=" + dstatus;
            return null;
        }

    }

    function updateDepart(did, dstatus) {
        window.location.href = "deleteDepart.do?did=" + did + "&dstatus=" + dstatus;
    }
</script>
</body>

</html>