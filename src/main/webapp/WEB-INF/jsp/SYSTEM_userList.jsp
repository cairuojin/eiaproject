<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>用户管理</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen"/>
    <!--[if IE 6]>
    <link rel="stylesheet" type="text/css" href="/css/ie6.css" media="screen"/><![endif]-->
    <!--[if IE 7]>
    <link rel="stylesheet" type="text/css" href="/css/ie.css" media="screen"/><![endif]-->
    <script src="/js/jquery.min.js" type="text/javascript"></script>


</head>
<body>
<div class="grid_100">
    <table class="data display datatable table1">
        <thead>
        <tr>
            <th class="sorting searchbar" style="width: 100%;"> 搜索</th>

        </tr>
        </thead>
        <tbody>
        <tr class="gradeX odd1">
            <td>
                <label class="labelsize">姓名</label>
                <input type="text" id="name"/>&nbsp;&nbsp;&nbsp;

                <label class="labelsize">部门</label>
                <input type="text" id="departmentString"/>&nbsp;&nbsp;&nbsp;

                <label class="labelsize">角色</label>
                <select id="roleId" name="role">
                    <option value="-1" selected="selected">任意角色</option>
                    <c:forEach items="${roleList}" var="role">
                        <option value="${role.id}">${role.rolename}</option>
                    </c:forEach>
                </select>
                &nbsp;&nbsp;&nbsp;

            </td>

        </tr>
        <tr class=" gradeX odd2">
            <td style="text-align: right;">
                <input type="submit" class="btn btn-primary" value="查询" onclick="queryUsers()">&nbsp;&nbsp;&nbsp;
                <a href="adduser.html" class="btn btn-primary"
                   style="margin-top:2px; height: 30px; line-height: 30px; ">添加用户</a>
                &nbsp;&nbsp;&nbsp;
                <input type="submit" class="btn btn-primary" value="批量删除">&nbsp;&nbsp;&nbsp;
                <input type="submit" class="btn btn-primary" value="按部门排序" onclick="orderby('department')">&nbsp;&nbsp;&nbsp;
                <input type="submit" class="btn btn-primary" value="按角色排序" onclick="orderby('role')">&nbsp;&nbsp;&nbsp;
                </input>
            </td>
        </tr>
        <tr class="tr1"></tr>
        </tbody>
    </table>
    <table class="data display datatable table1">
        <thead>
        <tr>
            <th class="sorting" style="width: 5%;"></th>
            <th class="sorting" style="width: 5%;">序号</th>
            <th class="sorting" style="width: 15%;">用户名</th>
            <th class="sorting" style="width: 10%;">姓名</th>
            <th class="sorting" style="width: 10%;">性别</th>
            <th class="sorting" style="width: 20%;">部门</th>
            <th class="sorting" style="width: 20%;">角色</th>
            <th class="sorting" style="width: 15%;">操作</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${userListVo.users}"  var="user">
                <tr class="odd gradeX">
                    <td><input type="checkbox" class="inputcss"></td>
                    <td>${user.id}</td>
                    <td>${user.username}</td>
                    <td>${user.name}</td>
                    <c:if test="${user.sex == 0 || user.sex == null}">
                    <td class="center"> 未知</td>
                    </c:if>
                    <c:if test="${user.sex == 1}">
                    <td class="center"> 男</td>
                    </c:if>
                    <c:if test="${user.sex == 2}">
                    <td class="center"> 女</td>
                    </c:if>
                    <td class="center">${user.departmentName}</td>
                    <td class="center"> ${user.roleName}</td>
                    <td class="center">
                        <a href="">修改资料</a>&nbsp;&nbsp;
                        <a href="">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="block" style="text-align: center">
        <c:forEach begin="1" end="${userListVo.pageTotal}" var="index">
            <c:if test="${index == userListVo.pageNow}">
                <a href="javascript:0" onclick="page(${index})" style="color: red"> ${index}</a>
            </c:if>
            <c:if test="${index != userListVo.pageNow}">
                <a href="javascript:0" onclick="page(${index})"> ${index}</a>
            </c:if>
        </c:forEach>
    </div>


</div>
<div class="clear">
</div>
</div>
<!-- 数据回显与赋值 -->
<script type="text/javascript">
    //数据回显赋值
    var orderString = "${userListVo.orderString}";      //后端返回来的排序回顾
    var pageNow = "${userListVo.pageNow}";              //后端返回来的当前页回顾

    $(function () {
        $('#name').val("${userListVo.name}");           //数据回显
        $('#departmentString').val("${userListVo.departmentString}");
        if('${userListVo.roleId}' != '')
            $('#roleId').val("${userListVo.roleId}");
    });
</script>

<!-- 点击查询按钮 -->
<script type="text/javascript">
    function queryUsers() {
        queryname = $('#name').val();
        departmentString = $('#departmentString').val();
        roleId = $('#roleId').val();    //获得当前页面值（刷新）

        window.location.href = '/api/admin/iframe/userList?' +
            'name=' + queryname +
            '&departmentString=' + departmentString +
            '&roleId=' + roleId +
            '&orderString=' + orderString +
            '&pageNow=' + pageNow
    }
</script>
<!-- 点击排序按钮 -->
<script type="text/javascript">
    function orderby(string) {
        queryname = $('#name').val();
        departmentString = $('#departmentString').val();
        roleId = $('#roleId').val();    //获得当前页面值（刷新）

        if(orderString == string)       //第二次点击置空
            string = null;

        window.location.href = '/api/admin/iframe/userList?' +
            'name=' + queryname +
            '&departmentString=' + departmentString +
            '&roleId=' + roleId +
            '&orderString=' + string +          //修改排序字段
            '&pageNow=' + pageNow
    }
</script>
<script type="text/javascript">
    function page(pageNow) {
        queryname = $('#name').val();
        departmentString = $('#departmentString').val();
        roleId = $('#roleId').val();    //获得当前页面值（刷新）
        window.location.href = '/api/admin/iframe/userList?' +
            'name=' + queryname +
            '&departmentString=' + departmentString +
            '&roleId=' + roleId +
            '&orderString=' + orderString +
            '&pageNow=' + pageNow       //修改排序字段
    }
</script>

</body>
</html>