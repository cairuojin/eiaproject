<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>风险信息录入</title>
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
                项目编号</label> <input type="text" id="number" name="number"/>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize" >
                    项目名称</label> <input type="text" id="name" name="name"/>
            </td>
        </tr>
        <tr class=" gradeX odd2">
            <td style="text-align: right;">
                <input type="submit" class="btn btn-primary" value="查询"  onclick="queryProjects()"/>&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr class="tr1"></tr>
        </tbody>
    </table>
    <table class="data display datatable table1">
        <thead>
        <tr>

            <th class="sorting" style="width: 5%;">序号</th>
            <th class="sorting" style="width: 20%;">项目名称</th>
            <th class="sorting" style="width: 15%;">所在区域</th>
            <th class="sorting" style="width: 15%;">文件类型</th>
            <th class="sorting" style="width: 15%;">评价范围类别 </th>
            <th class="sorting" style="width: 5%;">承接人</th>
            <th class="sorting" style="width: 5%;">主持人</th>
            <th class="sorting" style="width: 5%;">组织人</th>
            <th class="sorting" style="width: 5%;">风险判定状态</th>
            <th class="sorting" style="width: 10%;">操作</th>
        </tr>
        </thead>
        <tbody>

            <c:forEach items="${projectListVo.projectInfos}" var="projectInfo">
                <tr class="odd gradeX">

                    <td>${projectInfo.id}</td>
                    <td>[${projectInfo.number}]${projectInfo.name}</td>
                    <td>${projectInfo.provinceName}-${projectInfo.cityName}-${projectInfo.areaName}</td>
                    <td class="center">${projectInfo.filetypeName}</td>
                    <td class="center">${projectInfo.evaluationscopeName}</td>
                    <td class="center">${projectInfo.projectundertakeruser.name}</td>
                    <td class="center">${projectInfo.hostuser.name}</td>
                    <td class="center">${projectInfo.organizinguser.name}</td>
                    <td class="center"> 未录入</td>
                    <td class="center">
                        <a href="/api/admin/matter/riskAnalysisInput?projectInfoId=${projectInfo.id}" >风险录入</a>&nbsp;&nbsp;

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

        window.location.href = '/api/admin/iframe/riskAnalysisList?' +
            'name=' + queryname +
            '&number=' + queryNumber
    }
</script>

<!-- 分页 -->
<script type="text/javascript">
    function page(pageNow) {
        queryname = $('#name').val();
        queryNumber = $('#number').val();
        window.location.href = '/api/admin/iframe/riskAnalysisList?' +
            'name=' + queryname +
            '&number=' + queryNumber +
            '&pageNow=' + pageNow
    }
</script>
</html>