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
    <style>
        label.error{
            float: right;
        }
    </style>
</head>
<body>
<p><h4>一、收款计划 </h4></p>
<table class="data display datatable table1">
    <thead>
    <tr>
        <th class="sorting" style="width: 16.6%;">计划收款日期</th>
        <th class="sorting" style="width:16.6%;">计划收款金额（元） </th>
        <th class="sorting" style="width:16.6%;">已收款金额（元）  </th>
        <th class="sorting" style="width:16.6%;">未收款金额（元） </th>
        <th class="sorting" style="width: 16.6%;">收款状态</th>
        <th class="sorting" style="width:17%;">备注</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd gradeX">
        <td><fmt:formatDate value="${collectionPlan.collectiontime}" pattern="yyyy年MM月dd日" /></td>
        <td class="center">${collectionPlan.collectionmoney}</td>
        <td class="center">${collectionPlan.collectionmoney - collectionPlan.collectionbepaidmoney}</td>
        <td class="center">${collectionPlan.collectionbepaidmoney}</td>
        <c:if test="${collectionPlan.collectionmoney == collectionPlan.collectionbepaidmoney}">
            <td class="center">未收款</td>
        </c:if>
        <c:if test="${collectionPlan.collectionmoney != collectionPlan.collectionbepaidmoney}">
            <td class="center">部分收款</td>
        </c:if>
        <td class="center">${collectionPlan.remarks}</td>
    </tr>
</table>
<p><h4>二、收款记录</h4></p>
<table class="data display datatable table1">
    <thead>
    <tr>
        <th class="sorting" style="width: 5%;">序号</th>
        <th class="sorting" style="width: 18%;">收款日期</th>
        <th class="sorting" style="width:18%;">收款金额（元） </th>
        <th class="sorting" style="width:18%;">操作人</th>
        <th class="sorting" style="width:18%;">操作人角色</th>
        <th class="sorting" style="width:23%;">备注</th>
    </tr>
    </thead>
    <tbody>
        <c:forEach items="${collectionRecords}" var="collectionRecord" varStatus="index">
            <tr class="odd gradeX">
                <td class="center">${index.index + 1}</td>
                <td><fmt:formatDate value='${collectionRecord.recordtime}' pattern='yyyy-MM-dd'></fmt:formatDate></td>
                <td class="center">${collectionRecord.collectionmoney}</td>
                <td class="center">${collectionRecord.user.name}</td>
                <td class="center">${collectionRecord.user.roleName}</td>
                <td class="center">${collectionRecord.remarks}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
<p><h4>三、新增收款记录</h4></p>

<form id="collectionRecordForm">
    <div class="risktable6">
        <div class="td_risk bg_risk undertake1">项目名称&nbsp;&nbsp;</div>
        <div class="td_risk  undertake2 textcss">${projectInfo.name}</div>
    </div>
    <div class="risktable6">
        <div class="td_risk bg_risk undertake1">计划金额（元）：&nbsp;&nbsp;</div>
        <div class="td_risk  undertake2 textcss">${collectionPlan.collectionmoney}</div>
    </div>
    <div class="risktable6">
        <div class="td_risk bg_risk undertake1">已收款金额（元）&nbsp;&nbsp;</div>
        <div class="td_risk  undertake2 textcss">${collectionPlan.collectionmoney - collectionPlan.collectionbepaidmoney}</div>
    </div>
    <div class="risktable6">
        <div class="td_risk bg_risk undertake1">收款日期&nbsp;&nbsp;</div>
        <div class="td_risk  undertake2 textcss">  <input type="date"  id="recordtime" name="recordtime"/></div>
    </div>
    <div class="risktable6">
        <div class="td_risk bg_risk undertake1">本次收款金额（元）&nbsp;&nbsp;</div>
        <div class="td_risk  undertake2 textcss">  <input type="text"  id="collectionmoney" name="collectionmoney"/></div>
    </div>
    <div class="risktable4"  >
        <div class="risk_div bg_risk" style="width:30%;   ">备注</div>
        <div class="risk_div " style="width:70%; text-align: left; ">
            <div class="td_risk " style="height: 78px;" >
                <textarea id="remarks" name="remarks"  style="width:80%; height: 60px; margin-top: 5px;" ></textarea>
            </div>
        </div>

    </div>
    <div class="btnnew" >
        <input type="button" class="btn btn-primary" value="提交"  onclick="collectionManage()"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a class="btn btn-primary"  onclick="back()">返回</a>
        &nbsp;&nbsp;&nbsp;

    </div>
</form>

</body>

<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.validate.min.js"></script>

<!-- 表单校验 -->
<script>
    $(document).ready(function() {
        //添加表单校验
        $('#collectionRecordForm').validate({
            rules:{
                collectionmoney:{
                    required:true,
                    number:true,
                    min:0,
                    max:${collectionPlan.collectionbepaidmoney}
                },
                recordtime:{
                    required:true,
                    dateISO:true
                }
            },
            messages:{
                collectionmoney:{
                    required:"该项为必填",
                    number:"必须填写正确的数字",
                    min:"必须输入正数",
                    max:"本次收款金额不能大于待收款金额"
                },
                recordtime:{
                    required:"该项为必填",
                    dateISO:"请输入正确格式的日期"
                }
            }
        });
    });
</script>

<script type="text/javascript">
    function collectionManage() {
        if ($("#collectionRecordForm").valid()) {
            if (!confirm("您确定提交本次收款记录吗?")) {
                return
            }
            $.ajax({
                "type": "POST",
                "url": "/api/admin/matter/collectionManage",	//传输路径
                "data": {
                    "projectid":${projectInfo.id},
                    "recordtime":$('#recordtime').val(),
                    "collectionmoney":$('#collectionmoney').val(),
                    "remarks":$('#remarks').val()
                },
                "success": function (data) {
                    if (data == "OK") {
                        alert("您已提交收款记录");
                        window.location.href = "/api/admin/matter/collectionManageInput?projectInfoId=${projectInfo.id}";
                    } else {
                        alert("该项目收款已经完成，进入项目执行状态");
                        window.location.href = "/api/admin/iframe/collectionManageList";
                    }
                },
                "error": function (data) {
                    alert(data);
                }
            })
        }
    }

    function back() {
        window.location.href="/api/admin/iframe/collectionManageList";
    }
</script>
</html>