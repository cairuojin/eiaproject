<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>收款计划录入</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />
</head>
<body>
<div class="info" >
    <div  >
        <form id="collectionForm">
            <table class="form">
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            项目名称：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            [${projectInfo.number}]${projectInfo.name}</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            文件类型：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            ${projectInfo.filetypeName}</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            承接人：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            ${projectInfo.projectundertakeruser.name}</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            承接日期：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            <fmt:formatDate value="${projectInfo.undertaketime}" pattern="yyyy年MM月dd日HH点mm分ss秒" /></label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            合同额（元）：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            ${contractMessage.contractmoney}</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            合同状态：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            已录合同信息</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            已收款金额：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            0.00  </label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            未收金额：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            ${contractMessage.contractmoney}  </label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            收款状态：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            未收款  </label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            计划收款日期：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="date" id="collectiontime" name="collectiontime"/>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            计划收款金额（元）：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="collectionmoney" name="collectionmoney"/>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            备注</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <textarea  id="remarks" name="remarks" clos="500" rows="6"  width="500px" style="width:100%;"></textarea>
                    </td>
                </tr>
            </table>
        </form>
        <div class="btnnew" >
            <input type="submit" class="btn btn-primary" value="提交"  onclick="collectionPlan()"/>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a class="btn btn-primary" onclick="back()">返回</a>
        </div>
    </div>

</div>
</body>

<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.validate.min.js"></script>

<!-- 表单校验 -->
<script>
    $(document).ready(function() {
        //添加表单校验
        $('#collectionForm').validate({
            rules:{
                collectionmoney:{
                    required:true,
                    number:true,
                    min:0
                },
                collectiontime:{
                    required:true,
                    dateISO:true
                }
            },
            messages:{
                collectionmoney:{
                    required:"该项为必填",
                    number:"必须填写正确的数字",
                    min:"必须输入正数"
                },
                collectiontime:{
                    required:"该项为必填",
                    dateISO:"请输入正确格式的日期"
                }
            }
        });
    });
</script>



<script type="text/javascript">
    function collectionPlan() {
        if ($("#collectionForm").valid()) {
            if (!confirm("您确定制定收款计划吗?")) {
                return
            }
            $.ajax({
                "type": "POST",
                "url": "/api/admin/matter/collectionPlan",	//传输路径
                "data": {
                    "id":${projectInfo.id},
                    "financeopinions":$('#financeopinions').val(),
                    "collectiontime":$('#collectiontime').val(),
                    "collectionmoney":$('#collectionmoney').val(),
                    "remarks":$('#remarks').val()
                },
                "success": function (data) {
                    if (data == "OK") {
                        alert("您已制定收款计划");
                        window.location.href = "/api/admin/iframe/collectionPlanList";
                    }
                },
                "error": function (data) {
                    alert(data);
                }
            })
        }
    }
    <!-- 返回 -->
    function back() {
        window.location.href=document.referrer;
    }
</script>
</html>