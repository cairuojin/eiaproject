<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/maincss.css">

</head>
<body>
<div class="grid_100">
    <table class="data display datatable table1">
        <tbody>
        <tr class=" gradeX odd2">
            <td style="text-align: right; border-bottom: 1px solid rgba(144,144,144,.7);">
                <input type="button" class="btn btn-primary" value="导出工作进度" onclick="exportExcel()"/> &nbsp;&nbsp;&nbsp;
                <a class="btn btn-primary" onclick="back()"/>返回
                </a>
            </td>
        </tr>
        <tr class="tr1"></tr>
        </tbody>
    </table>
    <table class="data display datatable table1">
        <thead>
        <tr>
            <th class="sorting" style="width: 5%;">序号</th>
            <th class="sorting" style="width: 20%;">计划日期</th>
            <th class="sorting" style="width: 25%;">工作内容</th>
            <th class="sorting" style="width: 10%;">乙方责任人 </th>
            <th class="sorting" style="width:10%;">责任方  </th>
            <th class="sorting" style="width:15%;">备注  </th>
            <th class="sorting" style="width:15%;">落实情况  </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${projectWorkPlans}" var="projectWorkPlan" varStatus="index">
            <tr class="odd gradeX">
                <td>${index.index + 1}</td>
                <td><fmt:formatDate value="${projectWorkPlan.workplantime}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></td>
                <td class="center">${projectWorkPlan.workplancontent}</td>
                <td class="center">${projectWorkPlan.partybperson} </td>
                <td class="center"> ${projectWorkPlan.responsibleparty}  </td>
                <td class="center"> ${projectWorkPlan.remarks}</td>
                <c:if test="${projectWorkPlan.status == 0}">
                <td class="center">未落实</td>
                </c:if>
                <c:if test="${projectWorkPlan.status == 1}">
                <td class="center">[<fmt:formatDate value="${projectWorkPlan.implementsplantime}" pattern="yyyy年MM月dd日" />][${projectWorkPlan.implementsplanuser.name}]已落实</td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="block"></div>




</div>
<div class="clear">
</div>
</div>
</body>
<script src="/js/jquery.min.js"></script>
<!-- 返回 -->
<script type="text/javascript">
    function back() {
        window.location.href=document.referrer;
    }

    function exportExcel() {
        alert('仍在开发中');
    }
</script>
</html>