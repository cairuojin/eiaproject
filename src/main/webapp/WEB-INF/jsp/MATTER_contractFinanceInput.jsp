<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>合同财务审核</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/maincss.css">
</head>
<body>
<p><h4>一、合同信息</h4></p>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">项目名称&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">[${projectInfo.number}]${projectInfo.name}</div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">文件类型&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">${projectInfo.filetypeName}</div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">建设方&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">${projectInfo.builder}</div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">合同编号&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">${contractMessage.contractnumber}</div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">合同签订日期&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss"><fmt:formatDate value="${contractMessage.contractsigntime}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">合同份数&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">${contractMessage.contractamount}</div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">合同附件&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss"><a href="/${contractMessage.contractannexurl}" download="/${contractMessage.contractannexurl}" alt="下载附件">下载附件</a></div>
</div>

<div class="risktable6">
    <div class="td_risk bg_risk undertake1">合同款&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">${contractMessage.contractmoney}</div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">合同摘要&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">${contractMessage.contractsummary}</div>
</div>
<p><h4>二、领导审核信息</h4></p>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">审核人&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">${contractLeader.user.name}(${contractLeader.user.roleName})</div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">审核时间&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss"><fmt:formatDate value="${contractLeader.createtime}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">审核意见&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">${contractLeader.leaderopinions}</div>
</div>
<p><h4>三、财务审核信息</h4></p>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">审核人&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">${user.name}(${user.roleName})</div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">审核意见&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss"><input type="text" class="large" id="financeopinions"/></div>
</div>
<div class="btnnew">
    <input type="submit" class="btn btn-primary" value="提交" onclick="contractFinance()"/>
    &nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" class="btn btn-primary" value="退回" onclick="contractFinanceBack()"/>
    &nbsp;&nbsp;&nbsp;&nbsp;
</div>
</body>

<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
    function contractFinance() {
        if (!confirm("您确定同意该合同审核吗?")) {
            return
        }
        $.ajax({
            "type": "POST",
            "url": "/api/admin/matter/contractFinance",	//传输路径
            "data": {
                "id":${projectInfo.id},
                "financeopinions":$('#financeopinions').val()
            },
            "success": function (data) {
                if (data == "OK") {
                    alert("您已同意该合同审核");
                    window.location.href = "/api/admin/iframe/contractFinanceList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        })
    }

    function contractFinanceBack() {
        if (!confirm("您确定退回该合同吗?")) {
            return
        }
        $.ajax({
            "url": "/api/admin/matter/contractFinanceBack?projectId=${projectInfo.id}",	//传输路径
            "success": function (data) {
                if (data == "OK") {
                    alert("您已退回该合同审核");
                    window.location.href = "/api/admin/iframe/contractFinanceList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        })
    }
</script>
</html>