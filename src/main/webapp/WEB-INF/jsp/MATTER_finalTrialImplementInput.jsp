<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>复审意见落实</title>
    <link rel="stylesheet" href="/css/maincss.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/layout.css">
</head>
<body>
<table class="data display datatable table1" style="width: 98%; margin:5px 1%;">
    <thead>
    <tr>
        <th class="sorting" style="width: 4%;">序号</th>
        <th class="sorting" style="width: 47%;">定稿意见</th>
        <th class="sorting" style="width: 47%;">修改内容</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${finalTrialOpinions}" var="finalTrialOpinion" varStatus="index">
        <tr class="odd gradeX">
            <td>${index.index + 1}</td>
            <td class="center">${finalTrialOpinion.finalopinion}</td>
            <td class="center">${finalTrialOpinion.updateopinion}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="opinion_css_vice">
    <div  >
        <form id="editForm">
            <table class="form">
                <tr  >
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            定稿版报告：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <a style="font-size: 14px;" href="/${firstTrialReport.finalopinionannex}" download="/${firstTrialReport.finalopinionannex}">下载定稿版报告</a>
                    </td>
                </tr>
                <tr  >
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            定稿意见附件：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <a style="font-size: 14px;" href="/${finalTrialReport.finalopinionannex}" download="/${finalTrialReport.finalopinionannex}">下载定稿意见附件</a>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            定稿批注版报告：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <a style="font-size: 14px;" href="/${finalTrialReport.finalannotationreport}" download="/${finalTrialReport.finalannotationreport}">下载定稿批注版报告</a>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            落实情况：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="radio" name="status"  value="0"/><font size="14px">已落实</font>
                        <input type="radio" name="status" value="1"/><font size="14px">未落实</font>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            已落实情况备注/未落实原因 ：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" class="large" id="remarks" name="remarks">
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <div class="btnnew" style="margin-bottom: 10px;">
        <input type="submit" class="btn btn-primary" value="提交"  onclick="savefinalTrialImplement()"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
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
                status:{
                    required:true,
                },
                remarks:{
                    required:true
                }
            },
            messages:{
                status:{
                    required:"该项为必填",
                },
                remarks:{
                    required:"该项为必填",
                }
            }
        });
    });
</script>

<script type="text/javascript">
    function savefinalTrialImplement() {
        if(!$("#editForm").valid()){
            return;
        }
        if (!confirm("您确定提交定稿修改情况落实吗?")) {
            return
        }
        $.ajax({
            "type": "GET",
            "url": "/api/admin/matter/finalTrialImplement",	//传输路径
            "data": {
                "id":${projectInfo.id},
                "status":$("input[name='status']:checked").val(),
                "remarks":$('#remarks').val()
            },
            "success": function (data) {
                if (data == "OK") {
                    alert("提交定稿修改情况落实成功");
                    window.location.href = "/api/admin/iframe/finalTrialImplementList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        })
    }
</script>
</html>
