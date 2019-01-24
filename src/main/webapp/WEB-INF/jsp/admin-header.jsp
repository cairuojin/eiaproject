<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/nav.css" media="screen"/><!--与横向菜单有关-->
</head>
<div class="grid_12">
    <div style="background:url(/img/nav-repeat2.jpg) repeat-x !important;max-width: 100%;height: 3.7em;">
        <div class="floatleft">
            <img src="/img/img-profile.jpg" alt="Profile Pic" class="imgcss"/></div>   <!-- todo 用户头像，名字 -->
        <div class="floatleft marginleft10">
            <ul class="inline-ul floatleft">
                <li>Hello Admin</li>
                <li><a style="color: white;" href="#">退出</a></li>
            </ul>

        </div>

        <ul class="nav main">
            <li class="ic-charts"><a href="#" onclick="changePage(1)"><span>待办事项</span></a></li>
            <li class="ic-grid-tables"><a href="#" onclick="changePage(2)"><span>项目管理</span></a></li>
            <c:if test="${user.role == 1} || ${user.role == 8}">
                <li class="ic-gallery dd"><a href="#" onclick="changePage(3)"><span>系统管理</span></a></li>
                <!-- 管理员/档案管理员才有系统管理 -->
            </c:if>
            <li class="ic-notifications"><a href="#" onclick="changePage(4)"><span>个人设置</span></a></li>
        </ul>
    </div>
</div>
</html>
