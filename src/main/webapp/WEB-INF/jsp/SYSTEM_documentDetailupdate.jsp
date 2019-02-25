<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tbume</title>
    <link rel="stylesheet" type="text/css" href="/css/maincss.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />
    <style>

    </style>
</head>
<body>



<form id="documentRequirementForm">
    <table class="form">
        <tr>
            <td class="col1 tdcss1" >
                <label class="labelsize">
                    文件类型：</label>
            </td>

            <td class="col2 tdcss2" style="padding-left: 30px;" >
                ${fileType.name}
            </td>
        </tr>

        <tr>
            <td class="col1 tdcss1">
                <label class="labelsize">
                    存档要求：</label>
            </td>
            <td class="col2 tdcss2" style="padding-left: 30px;">
                <textarea cols="100" rows="100" style="width:95%;height: 80px;" id="requirements" name="requirements">${projectInfoFileTypeDocument.requirements}</textarea>
            </td>
        </tr>
        <tr>
            <td class="col1 tdcss1">
                <label class="labelsize">
                    项目存档清单：</label>
            </td>
            <td class="col2 tdcss2" style="padding-left: 30px;">
                <textarea cols="100" rows="100" style="width:95%;height: 80px;" id="archivelist" name="archivelist">${projectInfoFileTypeDocument.archivelist}</textarea>
            </td>
        </tr>
        <tr>
            <td class="col1 tdcss1" >
                <label class="labelsize" >
                    存档份数</label>
            </td>

            <td class="col2 tdcss2" style="padding-left: 30px;" >
                <input type="number"  id="archivenumber" name="archivenumber" value="${projectInfoFileTypeDocument.archivenumber}"/>
            </td>
        </tr>
    </table>
</form>
<div class="btnnew" >
    <input type="submit" class="btn btn-primary" value="修改"  onclick="updateDocumentRequirement()"/>&nbsp;&nbsp;
    <a   class="btn btn-primary"   onclick="back()">返回
    </a>
</div>


</body>


<script src="/js/jquery.min.js" type="text/javascript"></script>
<script src="/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#documentRequirementForm').validate({
            rules:{
                requirements:{
                    required:true
                },
                archivelist:{
                    required:true
                },
                archivenumber:{
                    digits:true,
                    required:true,
                    min:1
                }
            },
            messages:{
                requirements:{
                    required:"存档要求不能为空"
                },
                archivelist:{
                    required:"项目存档清单不能为空"
                },
                archivenumber:{
                    digits:"存档份数必须为正整数",
                    required:"存档份数不能为空",
                    min:"存档份数必须为正整数"
                }
            }
        })
    });
</script>

<script type="text/javascript">
    function updateDocumentRequirement() {
        if ($("#documentRequirementForm").valid()){
            if($('#requirements').val() == "" || $.trim($('#requirements').val()).length == 0){
                alert("存档要求不能为空");
            }
            else if($('#archivelist').val() == "" || $.trim($('#archivelist').val()).length == 0){
                alert("项目存档清单不能为空");
            }
            else {
                var data = {
                    "id":${projectInfoFileTypeDocument.id},
                    "requirements":$('#requirements').val(),
                    "archivelist":$('#archivelist').val(),
                    "archivenumber":$('#archivenumber').val()
                }
                $.ajax({
                    "type":"POST",
                    "url":"/api/admin/system/updateRequirement",	//传输路径
                    "data":data,
                    "success":function(data){
                        if( "OK" == data){
                            alert("修改成功");
                            parent.location.reload();
                        } else {
                            alert(data);
                        }
                    }
                })
            }
        }
    }
</script>

<!-- 返回 -->
<script type="text/javascript">
    function back() {
        window.location.href=document.referrer;
    }
</script>
</html>