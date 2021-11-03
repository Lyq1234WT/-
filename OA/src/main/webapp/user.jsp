<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="css/amazeui.min.css"/>
    <link rel="stylesheet" href="css/admin.css"/>
</head>

<body>
<div class="admin-content-body">
    <div class="am-cf am-padding am-padding-bottom-0">
        <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">员工管理</strong><small></small></div>
    </div>

    <hr>

    <div class="am-g">
        <div class="am-u-sm-12 am-u-md-6">
            <div class="am-btn-toolbar">
                <div class="am-btn-group am-btn-group-xs">
                    <button type="button" class="am-btn am-btn-default btnAdd"><span class="am-icon-plus"></span> 新增
                    </button>
                    <button type="button" style="margin-left: 20px;" class="am-btn am-btn-default btnIn"><span
                            class="am-icon-child"></span> 在职员工
                    </button>
                    <button type="button" style="margin-left: 20px;" class="am-btn am-btn-default btnOut"><span
                            class="am-icon-child"></span> 离职员工
                    </button>
                </div>
            </div>

        </div>
        <div class="am-u-sm-12 am-u-md-3">

        </div>
        <div class="am-u-sm-12 am-u-md-3">
            <form>
                <div class="am-input-group am-input-group-sm">
                    <input type="hidden" name="page" value="1">
                    <input type="hidden" name="length" value="4">
                    <input type="hidden" class="am-form-field" name="estatus" value="${estatus}">
                    <input type="text" class="am-form-field" name="realname" placeholder="请输入用户姓名" id="realname" value="${realname}">
                    <span class="am-input-group-btn">
						<button class="am-btn am-btn-default" type="submit" onclick="getRealname(${estatus})">搜索</button>
					</span>
                </div>
            </form>
        </div>
    </div>
    <div class="am-g">
        <div class="am-u-sm-12">
            <form class="am-form">
                <table class="am-table am-table-striped am-table-hover table-main">
                    <thead>
                    <tr>
                        <th class="table-check"><input type="checkbox" id="chkAll"></th>
                        <th class="table-id" style="width:100px;">ID</th>
                        <th class="table-type">用户名</th>
                        <th class="table-title">姓名</th>
                        <th class="table-author am-hide-sm-only">性别</th>
                        <th class="table-dname">入职时间</th>
                        <c:if test="${estatus == 1}">
                            <th class="table-dname">离职时间</th>
                        </c:if>
                        <th class="table-dname">职位</th>
                        <th class="table-dname">底薪</th>
                        <th class="table-dname">员工状态</th>
                        <th class="table-dname">所属部门</th>
                        <th class="table-set">操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:if test="${totalLine != 0 }">
                        <c:forEach items="${emps}" var="emp">
                            <tr>
                                <td><input type="checkbox" name="chk"></td>
                                <td>${emp.eid}</td>
                                <td>${emp.ename}</td>
                                <td>
                                    <a href="#">${emp.realname}</a>
                                </td>
                                <c:if test="${emp.esex == 0}">
                                    <td class="am-hide-sm-only"><span class="am-badge  am-badge-primary">男</span></td>
                                </c:if>
                                <c:if test="${emp.esex== 1}">
                                    <td class="am-hide-sm-only"><span class="am-badge  am-badge-danger">女</span></td>
                                </c:if>
                                <td><fmt:formatDate value="${emp.entrydate}" pattern="yyyy年MM月dd日"/></td>
                                <c:if test="${estatus==1}">
                                    <td><fmt:formatDate value="${emp.leavedate}" pattern="yyyy年MM月dd日"/></td>
                                </c:if>
                                <td>${emp.position == 0 ? 'boss':emp.position == 1?'经理':'普通员工'}</td>
                                <td>${emp.sal}元</td>
                                <td>${emp.estatus==0?'在职':'离职'}</td>
                                <td>${emp.dname}</td>
                                <td>
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <c:if test="${estatus==0}">
                                                <button type="button" id="depart_24"
                                                        class="am-btn am-btn-default am-btn-xs am-text-secondary btnedit"
                                                        onclick="editUser(${emp.eid})"><span
                                                        class="am-icon-pencil-square-o"></span> 编辑
                                                </button>
                                                <button type="button"
                                                        class="am-btn am-btn-default am-btn-xs am-text-danger amt-hide-sm-only"
                                                        onclick="deleteDepart(${emp.eid},1)"><span
                                                        class="am-icon-trash-o"></span> 删除
                                                </button>
                                            </c:if>
                                            <c:if test="${estatus == 1}">
                                                <button type="button"
                                                        class="am-btn am-btn-default am-btn-xs am-text-danger amt-hide-sm-only"
                                                        onclick="deleteDepart(${emp.eid},0)"><span
                                                        class="am-icon-trash-o"></span> 恢复
                                                </button>
                                            </c:if>

                                        </div>
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                    <c:if test="${totalLine == 0}">
                        <tr>
                            <td colspan="12" style="text-align: center;">暂无数据！</td>
                        </tr>
                    </c:if>

                    </tbody>
                </table>
                <c:if test="${isLike != 1}">
                    <div class="am-cf">
                        <c:if test="${totalLine != 0}">
                            共 ${totalLine} 条记录
                            <div class="am-fr">
                                <ul class="am-pagination">
                                    <c:if test="${page>1}">
                                        <li>
                                                <%--<a href="findEmpByPage?page=${page - 1}&length=4&estatus=${estatus}">«</a>--%>
                                            <a href="#" onclick="findEmpByPage(${page - 1}, 4, ${estatus});return false;">«</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${page == 1}">
                                        <li class="am-disabled">
                                            <%--<a href="findEmpByPage?page=${page - 1}&length=4&estatus=${estatus}">«</a>--%>
                                                <a href="#" onclick="findEmpByPage(${page - 1}, 4, ${estatus});return false;">«</a>
                                        </li>
                                    </c:if>
                                    <c:forEach begin="1" end="${totalPage}" step="1" var="i">
                                        <c:if test="${page == i}">
                                            <li class="am-active">
                                                    <a href="#" onclick="findEmpByPage(${i}, 4, ${estatus});return false;">${i}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${page != i}">
                                            <li>
                                                <%--<a href="findEmpByPage?page=${i}&length=4&estatus=${estatus}">${i}</a>--%>
                                                    <a href="#" onclick="findEmpByPage(${i}, 4, ${estatus});return false;">${i}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                    <c:if test="${page < totalPage}">
                                        <li>
                                            <%--<a href="findEmpByPage?page=${page + 1}&length=4&estatus=${estatus}">»</a>--%>
                                                <a href="#" onclick="findEmpByPage(${page + 1}, 4, ${estatus});return false;">»</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${page == totalPage}">
                                        <li class="am-disabled">
                                            <%--<a href="findEmpByPage?page=${page + 1}&length=4&estatus=${estatus}">»</a>--%>
                                            <a href="#" onclick="findEmpByPage(${page + 1}, 4, ${estatus});return false;">»</a>
                                        </li>
                                    </c:if>
                                </ul>
                            </div>
                        </c:if>
                    </div>
                </c:if>
                <hr>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" src="myplugs/js/plugs.js"></script>
<script>
    $(function () {
        $("#chkAll").chkAll({
            /*name: "chk"*/
        });

        $(".btnAdd").click(function () {
            $.jq_Panel({
                title: "添加员工",
                iframeWidth: 500,
                iframeHeight: 300,
                url: "addUserFindInfo?dstatus=0"
            });
        });
        $(".btnIn").click(function () {
            window.location.href = "findEmpByPage.do?page=1&length=4&estatus=0";
        });

        $(".btnOut").click(function () {
            window.location.href = "findEmpByPage.do?page=1&length=4&estatus=1";
        });


    });

    function getRealname(estatus) {
        var realname = $("#realname").val();
        window.open.href = "findEmpByPage?page=1&length=4&estatus=" + estatus + "&realname=" + realname;
    }

    function findEmpByPage(page, length, estatus) {
        var realname = $("#realname").val();
        window.location.href = "findEmpByPage?page="+ page +"&length=" + length + "&estatus=" + estatus + "&realname=" + realname;
    }

    function editUser(eid) {
        $.jq_Panel({
            title: "编辑员工",
            iframeWidth: 500,
            iframeHeight: 300,
            url: "findUserAndDepts?eid=" + eid
        });
    }

    function deleteDepart(eid, estatus) {
        window.location.href = "deleteUser?eid=" + eid + "&estatus=" + estatus;
    }
</script>
</body>

</html>