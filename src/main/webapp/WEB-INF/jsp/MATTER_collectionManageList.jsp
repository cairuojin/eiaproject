<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>收款管理录入</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/maincss.css">
</head>
<body>
<div class="grid_100">
    <table class="data display datatable table1">
        <thead>
        <tr>
            <th class="sorting searchbar"  style="width: 100%;"> 搜索</th>

        </tr>
        </thead>
        <tbody>
        <tr class="gradeX odd1">
            <td><label class="labelsize" >
                项目编号</label> <input type="text" id="number" name="number" />
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize" >
                    项目名称</label> <input type="text" id="name" name="name" />  &nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr class=" gradeX odd2">
            <td style="text-align: right;">
                <input type="submit" class="btn btn-primary" value="查询" onclick="queryProjects()" />&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr class="tr1"></tr>
        </tbody>
    </table>
    <table class="data display datatable table1">
        <thead>
        <tr>

            <th class="sorting" style="width: 5%;">序号</th>
            <th class="sorting" style="width: 18%;">项目名称</th>
            <th class="sorting" style="width: 18%;">计划收款日期</th>
            <th class="sorting" style="width: 9%;">承接人</th>
            <th class="sorting" style="width:10%;">计划收款金额 </th>
            <th class="sorting" style="width:10%;">已收款金额 </th>
            <th class="sorting" style="width:10%;">未收款金额 </th>
            <th class="sorting" style="width: 10%;">收款状态</th>
            <th class="sorting" style="width:10%;">操作</th>
        </tr>
        </thead>
        <tbody>
            <c:forEach items="${projectListVo.projectInfos}" var="projectInfo">
                <tr class="odd gradeX">

                    <td>${projectInfo.id}</td>
                    <td>[${projectInfo.number}]${projectInfo.name}</td>
                    <td><fmt:formatDate value="${projectInfo.subObject['collectionPlan'].collectiontime}" pattern="yyyy年MM月dd日" /></td>
                    <td class="center">${projectInfo.projectundertakeruser.name}</td>
                    <td class="center">${projectInfo.subObject['collectionPlan'].collectionmoney}</td>
                    <td class="center">${projectInfo.subObject['collectionPlan'].collectionmoney - projectInfo.subObject['collectionPlan'].collectionbepaidmoney}</td>
                    <td class="center"><fmt:formatNumber value="8.8888888E10" pattern="#.##" minFractionDigits="2" > </fmt:formatNumber> </td>
                    <c:if test="${projectInfo.subObject['collectionPlan'].collectionmoney == projectInfo.subObject['collectionPlan'].collectionbepaidmoney}">
                        <td class="center">未收款</td>
                    </c:if>
                    <c:if test="${projectInfo.subObject['collectionPlan'].collectionmoney != projectInfo.subObject['collectionPlan'].collectionbepaidmoney}">
                        <td class="center">部分收款</td>
                    </c:if>
                    <td class="center">
                        <a href="/api/admin/matter/collectionManageInput?projectInfoId=${projectInfo.id}">收款</a>&nbsp;&nbsp;

                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div class="block" style="text-align: center">
        <c:forEach begin="1" end="${projectListVo.pageTotal}" var="index">
            <c:if test="${index == projectListVo.pageNow}">
                <a href="javascript:0" onclick="page(${index})" style="color: red"> ${index}</a>
            </c:if>
            <c:if test="${index != projectListVo.pageNow}">
                <a href="javascript:0" onclick="page(${index})"> ${index}</a>
            </c:if>
        </c:forEach>
    </div>


</div>
<div class="clear">
</div>
</div>
</body>

<script src="/js/jquery.min.js" type="text/javascript"></script>
<!-- 数据回显与赋值 -->
<script type="text/javascript">
    var pageNow = "${projectListVo.pageNow}";
    $(function () {
        $('#name').val("${projectListVo.name}");
        $('#number').val("${projectListVo.number}");
    });
</script>


<!-- 点击查询按钮 -->
<script type="text/javascript">
    function queryProjects() {
        queryname = $('#name').val();
        queryNumber = $('#number').val();

        window.location.href = '/api/admin/iframe/collectionManageList?' +
            'name=' + queryname +
            '&number=' + queryNumber
    }
</script>

<!-- 分页 -->
<script type="text/javascript">
    function page(pageNow) {
        queryname = $('#name').val();
        queryNumber = $('#number').val();
        window.location.href = '/api/admin/iframe/collectionManageList?' +
            'name=' + queryname +
            '&number=' + queryNumber +
            '&pageNow=' + pageNow
    }
</script>
</html>