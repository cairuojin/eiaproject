<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />
</head>
<body>
<div class="info" >
    <div  >
        <form id="monitoringForm">
            <table class="form">
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            项目名称：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        [${projectInfo.number}]${projectInfo.name}
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            建设方：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        ${projectInfo.builder}
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            监测方案指定人员：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" class="large" id="designatedperson" name="designatedperson"/>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" style="vertical-align: middle;" >
                        <label class="labelsize" >
                            监测方案、编写方案：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <textarea name="monitoringprogramme" id="monitoringprogramme" clos="500" rows="6"  width="600px" style="width:100%;"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            方案附件：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="file" id="annex" name="annex"/>
                    </td>
                </tr>
            </table>
        </form>
        <div class="btnnew" >
            <input type="submit" class="btn btn-primary" value="提交"  onclick="addMonitoring()"/>
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
        $('#monitoringForm').validate({
            rules:{
                designatedperson:{
                    required:true,
                },
                monitoringprogramme:{
                    required:true,
                },
                annex:{
                    required:true,
                }
            },
            messages:{
                designatedperson:{
                    required:"该项为必填",
                },
                monitoringprogramme:{
                    required:"该项为必填",
                },
                annex:{
                    required:"该项为必填",
                }
            }
        });
    });
</script>

<script type="text/javascript">
    function addMonitoring() {
        if ($("#monitoringForm").valid()) {
            if (!confirm("您确定提交监控方案吗?")) {
                return
            }
            var formFile = new FormData();
            formFile.append("id", '${projectInfo.id}');
            formFile.append("action", "UploadVMKImagePath");    //必须
            formFile.append("designatedperson", $('#designatedperson').val());
            formFile.append("monitoringprogramme", $('#monitoringprogramme').val());
            formFile.append("annexFile", $('#annex')[0].files[0]); //附件对象

            var data = formFile;
            $.ajax({
                "type": "POST",
                "url": "/api/admin/matter/monitoringProgramme",	//传输路径
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                "data": data,
                "success": function (data) {
                    if (data == "OK") {
                        alert("提交监控方案成功");
                        window.location.href = "/api/admin/iframe/monitoringProgrammeList";
                    }
                },
                "error": function (data) {
                    alert(data);
                }
            })
        }
    }

    function back() {
        window.location.href=document.referrer;
    }
</script>
</html>