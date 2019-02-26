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
                <td style="vertical-align: middle;">${index.index}</td>
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
    <table class="form tab1" style="font-size: 14px;">
        <tr>
            <td class="col1 tdcss1" >
                <label class="labelsize" >
                    关键字：</label>
            </td>

            <td class="col2 tdcss2" style="padding-left: 30px; " >
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
            <td  style="padding-left: 30px; " >
                ${documentRepertoire.applicantuser.name}(<fmt:formatDate value='${documentRepertoire.applicanttime}' pattern='yyyy年MM月dd日'></fmt:formatDate>)
            </td>
        </tr>
        <tr>
            <td class="col1 tdcss1" style="vertical-align: middle;" >
                <label class="labelsize" >
                    最终版报告:</label>
            </td>
            <td  style="padding-left: 30px; " >
                <a href="/${documentRepertoire.finalreportannex}" download="/${documentRepertoire.finalreportannex}" style="cursor: pointer;">下载最终版报告</a>
            </td>
        </tr>
        <tr>
            <td class="col1 tdcss1" style="vertical-align: middle;" >
                <label class="labelsize" >
                    <font color="#ff0000">* </font>领导意见:</label>
            </td>
            <td  style="padding-left: 30px;" >
                <input type="text" style="width:95%;" id="leadershipOpinion" name="leadershipOpinion"/>
            </td>
        </tr>
    </table>
    </form>
    <div class="btnnew" >
        <input type="button" class="btn btn-primary" value="签字"  onclick="documentLeaderSign()"/>
        &nbsp; &nbsp;
        <input type="button" class="btn btn-primary" value="退回"  onclick="documentLeaderSignBack()"/>
    </div>
</div>
</body>



<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.validate.min.js"></script>

<!-- 表单校验 -->
<script>
    $(document).ready(function() {
        //添加表单校验
        $('#editForm').validate({
            rules:{
                leadershipOpinion:{
                    required:true,
                }
            },
            messages:{
                leadershipOpinion:{
                    required:"该项为必填",
                }
            }
        });
    });
</script>

<script type="text/javascript">
    function documentLeaderSign() {
        if (!$("#editForm").valid()) {
            return;
        }
        if (!confirm("您确定签字吗?")) {
            return;
        }

        $.ajax({
            "type": "POST",
            "url": "/api/admin/matter/documentLeaderSign",	//传输路径
            "data": {
                "id":${projectInfo.id},
                "leadershipopinion":$('#leadershipOpinion').val()
            },
            "success": function (data) {
                if (data == "OK") {
                    alert("您已签字成功");
                    window.location.href = "/api/admin/iframe/documentLeaderSignList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        })
    }

    function documentLeaderSignBack() {
        if (!confirm("您确定退回该存档吗?")) {
            return;
        }

        $.ajax({
            "type": "POST",
            "url": "/api/admin/matter/documentLeaderSignBack",	//传输路径
            "data": {
                "projectId":${projectInfo.id}
            },
            "success": function (data) {
                if (data == "OK") {
                    alert("您已退回该存档");
                    window.location.href = "/api/admin/iframe/documentLeaderSignList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        })
    }
</script>
</html>