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
                <input type="text" id="department"/>&nbsp;&nbsp;&nbsp;

                <label class="labelsize">角色</label>
                <select id="role" name="role">
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
                <input type="submit" class="btn btn-primary" value="按部门排序">&nbsp;&nbsp;&nbsp;
                <input type="submit" class="btn btn-primary" value="按角色排序">&nbsp;&nbsp;&nbsp;
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
            <c:forEach items="${userList}"  var="user">
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
    <div class="block"></div>


</div>
<div class="clear">
</div>
</div>
<script type="text/javascript">
    $(function () {
        $('#name').val(parent.userQueryName);
        $('#department').val(parent.userQueryDepartment);
        $('#role').val(parent.userQueryRole);
    });
</script>
<script type="text/javascript">
    function queryUsers() {
        parent.userQueryName = ($('#name').val());
        parent.userQueryDepartment = ($('#department').val());
        parent.userQueryRole= $('#role').val();
        if(parent.userQueryRole == null){
            parent.userQueryRole = -1;
        }
        window.location.href = '/api/admin/iframe/userList?name=' + parent.userQueryName + '&departmentString=' + parent.userQueryDepartment + '&roleId=' + parent.userQueryRole;
    }
</script>
</body>
</html>