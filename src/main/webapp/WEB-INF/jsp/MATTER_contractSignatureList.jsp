<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>合同盖章</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/maincss.css">
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
            <td><label class="labelsize">项目编号</label> <input type="text" id="number" name="number"/>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">项目名称</label> <input type="text" id="name" name="name"/>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">所属部门</label>
                <select id="subordinateDepartmentId" name="subordinateDepartmentId">
                    <option value="-1">全部</option>
                    <c:forEach items="${departments}" var="department">
                        <option value="${department.id}">${department.parentName} - ${department.name}</option>
                    </c:forEach>
                </select>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">
                    文件类型</label>
                <select id="filetype" name="filetype">
                    <option value="-1">==== 全部 ====</option>
                    <c:forEach items="${projectInfoFileTypes}" var="fileType">
                        <option value="${fileType.id}" shortname="${fileType.shortname}">${fileType.name}</option>
                    </c:forEach>
                </select>
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

            <th class="sorting" style="width: 4%;">序号</th>
            <th class="sorting" style="width: 15%;">项目名称</th>
            <th class="sorting" style="width: 15%;">所属部门</th>
            <th class="sorting" style="width: 12%;">文件类型</th>
            <th class="sorting" style="width: 12%;">评价范围类别</th>
            <th class="sorting" style="width: 7%;">承接人</th>
            <th class="sorting" style="width: 7%;">主持人</th>
            <th class="sorting" style="width: 8%;">组织人</th>
            <th class="sorting" style="width:10%;">承接时间</th>
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
                    <td class="center"><fmt:formatDate value="${projectInfo.undertaketime}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></td>
                    <td class="center">
                        <a href="/api/admin/matter/contractSignatureInput?projectInfoId=${projectInfo.id}">盖章</a>&nbsp;&nbsp;
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
        $('#subordinateDepartmentId').val("${projectListVo.subordinateDepartmentId}");
        $('#filetype').val("${projectListVo.filetype}");
    });
</script>


<!-- 点击查询按钮 -->
<script type="text/javascript">
    function queryProjects() {
        queryname = $('#name').val();
        queryNumber = $('#number').val();
        subordinateDepartmentId = $('#subordinateDepartmentId').val();
        filetype = $('#filetype').val();
        window.location.href = '/api/admin/iframe/contractSignatureList?' +
            'name=' + queryname +
            '&number=' + queryNumber +
            '&subordinateDepartmentId=' + subordinateDepartmentId +
            '&filetype=' + filetype
    }
</script>

<!-- 分页 -->
<script type="text/javascript">
    function page(pageNow) {
        queryname = $('#name').val();
        queryNumber = $('#number').val();
        subordinateDepartmentId = $('#subordinateDepartmentId').val();
        filetype = $('#filetype').val();
        window.location.href = '/api/admin/iframe/contractSignatureList?' +
            'name=' + queryname +
            '&number=' + queryNumber +
            '&subordinateDepartmentId=' + subordinateDepartmentId +
            '&filetype=' + filetype +
            '&pageNow=' + pageNow
    }
</script>
</html>
