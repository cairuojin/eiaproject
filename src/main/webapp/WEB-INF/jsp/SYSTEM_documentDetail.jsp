<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>存档信息</title>
    <link rel="stylesheet" href="/css/maincss.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/common.css">
</head>
<body>
<div class="firminfo_3"  id="abc">
    <div class="firmmenu2" style="text-align: right; border-bottom: #2b81af 3px solid;">
        <a href="/api/admin/iframe/documentDetail/add?id=${fileType.id}" id="btn1" style="background-color:#2b81af; cursor: pointer;"  >添加</a>
    </div>
    <form>
        <table class="data display datatable table1">
            <thead>
            <tr>
                <th class="sorting" style="width:4%; vertical-align: middle;">序号</th>
                <th class="sorting" style="width: 40%;vertical-align: middle;">存档要求</th>
                <th class="sorting" style="width: 40%; vertical-align: middle;">存档清单</th>
                <th class="sorting" style="width:6%; vertical-align: middle;">默认份数 </th>
                <th class="sorting" style="width:10%; vertical-align: middle;">操作 </th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${fileTypeDocuments}" var="fileTypeDocument" varStatus="index">
                <tr class="odd gradeX">
                    <td style="vertical-align: middle;">${index.index + 1}</td>
                    <td>${fileTypeDocument.requirements}</td>
                    <td class="center">${fileTypeDocument.archivelist} </td>
                    <td class="center" style="vertical-align: middle">${fileTypeDocument.archivenumber}</td>
                    <td class="center" style="vertical-align: middle;">
                        <a href="/api/admin/iframe/documentDetail/update?id=${fileTypeDocument.id}" style="background-color: transparent; cursor: pointer; vertical-align: middle;" onclick="updateDepartment()">修改</a>&nbsp;
                        <a  style="background-color: transparent; cursor: pointer; vertical-align: middle;"  onclick="deleteRequirement(${fileTypeDocument.id})">删除</a>&nbsp;&nbsp;&nbsp;
                    </td>
                </tr>
            </c:forEach>
        </table>
    </form>
</div>
<div id="dialogBg"></div>
</body>
<script src="/js/jquery.min.js" type="text/javascript"></script>
<script>
    function deleteRequirement(id) {
        if(confirm("您确定删除该存档要求吗?")){
            $.ajax({
                "type":"POST",
                "url":"/api/admin/system/deleteRequirement",	//传输路径
                "data":{"id":id},
                "success":function(data){
                    if( "OK" == data){
                        alert("删除成功");
                        window.location.reload();
                    } else {
                        alert(data);
                    }
                }
            })
        }
    }
</script>
</html>