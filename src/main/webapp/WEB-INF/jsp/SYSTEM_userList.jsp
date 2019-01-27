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
            <td><label class="labelsize">
                用户名</label> <input type="text" id="grumble"/>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">
                    部门</label> <input type="text" id="grumble"/>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">
                    角色</label> <select id="select" name="select">
                    <option value="1">管理员</option>
                    <option value="2">总经理</option>
                    <option value="3">总工办</option>
                    <option value="1">部门经理</option>
                    <option value="2">环评经理</option>
                    <option value="3">合同管理员</option>
                    <option value="1">市场人员</option>
                    <option value="2">档案管理员</option>
                    <option value="3">资质管理员</option>
                    <option value="3">财务人员</option>
                </select>
                &nbsp;&nbsp;&nbsp;
            </td>

        </tr>
        <tr class=" gradeX odd2">
            <td style="text-align: right;">
                <input type="submit" class="btn btn-primary" value="查询">&nbsp;&nbsp;&nbsp;
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
            <th class="sorting" style="width: 10%;">性别</th>
            <th class="sorting" style="width: 20%;">部门</th>
            <th class="sorting" style="width: 20%;">角色</th>
            <th class="sorting" style="width: 25%;">操作</th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd gradeX">
            <td><input type="checkbox" class="inputcss"></td>
            <td>1</td>
            <td>黄晓欣</td>
            <td class="center"> 女</td>
            <td class="center">广东广州</td>
            <td class="center"> 管理员</td>
            <td class="center">
                <a href="">修改资料</a>&nbsp;&nbsp;
                <a href="">删除</a>
            </td>
        </tr>


    </table>
    <div class="block"></div>


</div>
<div class="clear">
</div>
</div>

</body>
</html>