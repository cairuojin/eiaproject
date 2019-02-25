<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 顶端导航 -->
<html>
<head>
    <link rel="stylesheet" type="text/css" href="/css/nav.css" media="screen"/><!--与横向菜单有关-->
</head>
<div class="grid_12">
    <div style="background:url(/img/nav-repeat2.jpg) repeat-x !important;max-width: 100%;height: 3.7em;">
        <div class="floatleft">
            <img src="/${user.imgurl}" alt="Profile Pic" class="imgcss"/>
        </div>
        <div class="floatleft" style="margin-right: 20px">


        </div>

        <ul class="nav main">
            <ul class="floatleft" >
                <li style="color: #ffffff;margin-right: 10px">欢迎您： ${user.username}</li>
                <li class="ic-form-style"><a onclick="logout()"><span>退出登录</span></a></li>
            </ul>
            <li class="ic-charts"><a href="#" onclick="changePage(1)"><span>待办事项</span></a></li>
            <li class="ic-grid-tables"><a href="#" onclick="changePage(2)"><span>项目管理</span></a></li>

            <c:if test="${user.role == 0 || user.role == 7}">
                <li class="ic-gallery dd"><a href="#" onclick="changePage(3)"><span>系统管理</span></a></li>
                <!-- 管理员/档案管理员才有系统管理 -->
            </c:if>
            <li class="ic-notifications"><a href="#" onclick="changePage(4)"><span>个人设置</span></a></li>
        </ul>
    </div>
</div>
</html>
