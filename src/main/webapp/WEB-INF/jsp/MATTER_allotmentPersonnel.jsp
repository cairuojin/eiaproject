<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />
    <script src="/js/jquery.min.js" type="text/javascript"></script>
</head>
<body>
<div class="info" >
    <div  >
        <form>
            <table class="form">
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            所在区域</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            ${projectInfo.provinceName}-${projectInfo.cityName}-${projectInfo.areaName}</label>
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
                            环评范围类别</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            ${projectInfo.evaluationscopeName}</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            项目承接人</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            ${projectInfo.projectundertakeruser.name}</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            编制主持人</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <select id="hostUserId" name="hostUserId">
                            <c:forEach items="${userList}" var="user">
                                <option value="${user.id}">${user.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            项目组织人</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <select id="organizingUserId" name="organizingUserId">
                            <c:forEach items="${userList}" var="user">
                                <option value="${user.id}">${user.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>

            </table>
        </form>
        <div class="btnnew" >
            <input type="submit" class="btn btn-primary" value="保存"  onclick="allotment()">
            </input>&nbsp;&nbsp;&nbsp;&nbsp;

        </div>
    </div>

</div>
</body>
<script type="text/javascript">
    function allotment() {
        var hostUserName = $('#hostUserId option:selected').text();//选中的文本
        var organizingUserName = $('#organizingUserId option:selected').text();//选中的文本
        if(confirm("您确定分别将" + hostUserName + "和" + organizingUserName +"设置为主持人和组织人吗？")){
            var data = {
                "id":${projectInfo.id},
                "hostUserId": $('#hostUserId option:selected').val(),
                "organizingUserId": $('#organizingUserId option:selected').val(),
            }

            $.ajax({
                "type": "POST",
                "url": "/api/admin/matter/allotment",	//传输路径
                "data": data,
                "success": function (data) {
                    if ("OK" == data) {
                        alert("人员分配成功");
                        window.location.href = "/api/admin/matter/allotmentList";
                    } else {
                        alert(data);
                    }
                }
            })
        }
    }
</script>
</html>
