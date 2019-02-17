<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>合同信息录入</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />
</head>
<body>
<div class="info" >
    <div  >
        <form id="contractForm">
            <table class="form">
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            项目名称</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            [${projectInfo.number}]${projectInfo.name}</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            文件类型</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            ${projectInfo.filetypeName}</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            建设方</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            ${projectInfo.builder}</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            合同编号</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="contractnumber" name="contractnumber"/>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            合同签订日期</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="date" id="contractsigntime" name="contractsigntime"/>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            合同份数</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="contractamount" name="contractamount"/>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >
                            合同附件</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="file"  id="contractannexurl" name="contractannexurl"/>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            合同款（万元）</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="contractmoney" name="contractmoney"/>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" style="vertical-align: middle;" >
                        <label class="labelsize" >
                            合同摘要</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <textarea  id="contractsummary" name="contractsummary" clos="500" rows="6"  width="500px" style="width:100%;"></textarea>
                    </td>
                </tr>


            </table>
        </form>
        <div class="btnnew" >
            <input type="submit" class="btn btn-primary" value="保存"  onclick="contractMessageInput()"/>
            &nbsp;&nbsp;&nbsp;&nbsp;

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
        $('#contractForm').validate({
            rules:{
                contractnumber:{
                    required:true,
                },
                contractsigntime:{
                    required:true,
                    dateISO:true
                },
                contractamount:{
                    required: true,
                    digits: true
                },
                contractannexurl: {
                    required: true,
                },
                contractmoney: {
                    required: true,
                    number:true
                },
            },
            messages:{
                contractnumber:{
                    required:"该项为必填",
                },
                contractsigntime:{
                    required:"该项为必填",
                    dateISO:"请输入正确格式的日期"
                },
                contractamount:{
                    required:"该项为必填",
                    digits:"必须填写整数"
                },
                contractannexurl: {
                    required:"该项为必填",
                },
                contractmoney: {
                    required: "该项为必填",
                    number:"必须填写正确的数字"
                },
            }
        });
    });
</script>

<!-- 保存合同信息 -->
<script type="text/javascript">
    function contractMessageInput() {
        if ($("#contractForm").valid()) {
            if (!confirm("您确定录入合同信息吗?")) {
                return
            }
            var formFile = new FormData();
            formFile.append("id", '${projectInfo.id}');
            formFile.append("action", "UploadVMKImagePath");    //必须
            formFile.append("contractnumber", $('#contractnumber').val());
            formFile.append("contractsigntime", $('#contractsigntime').val());
            formFile.append("contractamount", $('#contractamount').val());
            formFile.append("contractmoney", $('#contractmoney').val());
            formFile.append("contractsummary", $('#contractsummary').val());
            formFile.append("annexFile", $('#contractannexurl')[0].files[0]); //附件对象

            var data = formFile;
            $.ajax({
                "type": "POST",
                "url": "/api/admin/matter/contractEntry",	//传输路径
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                "data": data,
                "success": function (data) {
                    if (data == "OK") {
                        alert("录入合同信息成功");
                        window.location.href = "/api/admin/iframe/contractEntryList";
                    }
                },
                "error": function (data) {
                    alert(data);
                }
            })
        }
    }
</script>


</html>