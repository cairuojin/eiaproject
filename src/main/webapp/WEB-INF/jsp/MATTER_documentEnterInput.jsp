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
    <style>
        .tab1 td{
            border: 1px solid rgba(144,144,144,.7);
        }
    </style>
</head>
<body>
<div class="grid_100">
    <table class="data display datatable table1">
        <tbody>
        <tr class="gradeX odd1" style=" font-weight: bold; text-align: center;" >
            <td><label class="labelsize"  style="font-size: 26px;">
                [${projectInfo.number}]${projectInfo.name}</label> <label class="labelsize" style="font-size:26px;">
                存档清单 </label>
            </td>
        </tr>
        <tr class="tr1"></tr>
        </tbody>
    </table>
    <table class="data display datatable table1">
        <thead>
        <tr>

            <th class="sorting" style="width: 5%;">序号</th>
            <th class="sorting" style="width: 40%;">存档要求清单 </th>
            <th class="sorting" style="width: 40%;">项目存档清单 </th>
            <th class="sorting" style="width: 15%;">数量 (份/套) </th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${documentApplications}" var="documentApplication" varStatus="index">
            <tr class="odd gradeX">
                <td style="vertical-align: middle;">${index.index + 1}</td>
                <td style="vertical-align: middle;">${documentApplication.requirements}</td>
                <td style="vertical-align: middle;">${documentApplication.archivelist}</td>
                <td class="center" style="vertical-align: middle;"> ${documentApplication.archivenumber} </td>
            </tr>
        </c:forEach>
    </table>
    <div class="block"></div>
</div>
<div style="width: 80%; margin: 10px auto;">
    <form id="editForm">
    <table  class="form tab1" style="font-size: 14px;">
        <tr>
            <td class="col1 tdcss1" >
                <label class="labelsize" >
                    关键字：</label>
            </td>

            <td class="col2 tdcss2" style="padding-left: 30px;  " >
                ${documentRepertoire.keyword}
            </td>
        </tr>
        <tr>
            <td class="col1 tdcss1" style="vertical-align: middle;" >
                <label class="labelsize" >
                    摘要：</label>
            </td>
            <td  style="padding-left: 30px; " >
                ${documentRepertoire.summary}
            </td>
        </tr>
        <tr>
            <td class="col1 tdcss1" style="vertical-align: middle;" >
                <label class="labelsize" >
                    存档描述：</label>
            </td>
            <td  style="padding-left: 30px; " >
                ${documentRepertoire.archivedescription}
            </td>
        </tr>
        <tr>
            <td class="col1 tdcss1" style="vertical-align: middle;" >
                <label class="labelsize" >
                    存档人：</label>
            </td>
            <td  style="padding-left: 30px;  " >
                ${documentRepertoire.applicantuser.name}(<fmt:formatDate value='${documentRepertoire.applicanttime}' pattern='yyyy年MM月dd日HH点mm分ss秒'></fmt:formatDate>)
            </td>
        </tr>
        <tr>
            <td class="col1 tdcss1" style="vertical-align: middle;" >
                <label class="labelsize" >
                    领导意见：</label>
            </td>
            <td  style="padding-left: 30px;" >
                ${documentRepertoire.leadershipopinion}<br>
                签字：${documentRepertoire.leaderuser.name}(<fmt:formatDate value='${documentRepertoire.leadertime}' pattern='yyyy年MM月dd日HH点mm分ss秒'></fmt:formatDate>)
            </td>
        </tr>
        <tr>
            <td class="col1 tdcss1" style="vertical-align: middle;" >
                <label class="labelsize" >
                    审批/备案部门:</label>
            </td>
            <td  style="padding-left: 30px; " >
                ${projectInfo.filingdepartment}
            </td>
        </tr>
        <tr>
            <td class="col1 tdcss1" style="vertical-align: middle;" >
                <label class="labelsize" >
                    档案编号:</label>
            </td>
            <td  style="padding-left: 30px; " >
                <input type="text" style="width:95%;" id="fileNumber" name="fileNumber"/>
            </td>
        </tr>
        <tr>
            <td class="col1 tdcss1" style="vertical-align: middle;" >
                <label class="labelsize"  >
                    档案存放位置:</label>
            </td>
            <td  style="padding-left: 30px;" >
                <input type="text" style="width:95%;" id="fileLocation" name="fileLocation"/>
            </td>
        </tr>
        <tr>
            <td class="col1 tdcss1" style="vertical-align: middle;" >
                <label class="labelsize" >
                    档案管理员意见:</label>
            </td>
            <td  style="padding-left: 30px;" >
                <input type="text" style="width:95%;" id="archivistOpinion" name="archivistOpinion"/>
            </td>
        </tr>
    </table>
    </form>
    <div class="btnnew" >
        <input type="button" class="btn btn-primary" value="存档"  onclick="documentSave()">
        </input>
        &nbsp; &nbsp;
        <input type="button" class="btn btn-primary" value="退回"  onclick="documentBack()">
        </input>
    </div>
</div>
<h1>退回历史</h1>
<table class="data display datatable table1">
    <thead>
    <tr>
        <th class="sorting" style="width: 50%;">退回原因</th>
        <th class="sorting" style="width: 40%;">退回时间</th>
        <th class="sorting" style="width: 10%;">操作人</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${records}" var="record">
        <tr class="odd gradeX">
            <c:if test="${record.projectinfostatus == 31}">
                <td>存档清单领导签字退回</td>
            </c:if>
            <c:if test="${record.projectinfostatus == 32}">
                <td>存档管理员退回</td>
            </c:if>
            <td><fmt:formatDate value="${record.time}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></td>
            <td class="center">  ${record.user.name} </td>
        </tr>
    </c:forEach>
</table>
</body>

<script src="/js/jquery.min.js" type="text/javascript"></script>
<script src="/js/jquery.validate.min.js"></script>
<script>
    $(document).ready(function() {
        $('#editForm').validate({
            rules:{
                fileNumber:{
                    required:true,
                },
                fileLocation:{
                    required:true,
                },
                archivistOpinion:{
                    required:true,
                }
            },
            messages:{
                fileNumber:{
                    required:"该项为必填",
                },
                fileLocation:{
                    required:"该项为必填",
                },
                archivistOpinion:{
                    required:"该项为必填",
                }
            }
        });
    });
</script>

<script type="text/javascript">
    function documentSave() {
        if (!$("#editForm").valid()) {
            return;
        }
        if (!confirm("您确定进行存档吗?")) {
            return;
        }

        $.ajax({
            "type": "POST",
            "url": "/api/admin/matter/documentEnter",	//传输路径
            "data": {
                "id":${projectInfo.id},
                "filenumber":$('#fileNumber').val(),
                "filelocation":$('#fileLocation').val(),
                "archivistopinion":$('#archivistOpinion').val(),
            },
            "success": function (data) {
                if (data == "OK") {
                    alert("您已存档成功");
                    window.location.href = "/api/admin/iframe/documentEnterList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        })
    }

    function documentBack() {
        if (!confirm("您确定退回该存档吗?")) {
            return;
        }

        $.ajax({
            "type": "POST",
            "url": "/api/admin/matter/documentEnterBack",	//传输路径
            "data": {
                "projectId":${projectInfo.id}
            },
            "success": function (data) {
                if (data == "OK") {
                    alert("您已退回该存档");
                    window.location.href = "/api/admin/iframe/documentEnterList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        })
    }
</script>
</html>