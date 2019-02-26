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
            <th class="sorting" style="width: 40%;">存档要求清单</th>
            <th class="sorting" style="width: 40%;">项目存档清单</th>
            <th class="sorting" style="width: 15%;">数量 (份/套)</th>
        </tr>
        </thead>
        <tbody id="specialtable">
        <c:forEach items="${fileTypeDocuments}" var="fileTypeDocument" varStatus="index">
            <tr class="odd gradeX">
                <td style="vertical-align: middle;">${index.index + 1}</td>
                <td style="vertical-align: middle;">${fileTypeDocument.requirements} </td>
                <td style="vertical-align: middle;"><textarea style="width: 97%; height:60px;" id="archivelist${index.index}" name="archivelist${index.index}"> ${fileTypeDocument.archivelist} </textarea>
                </td>
                <td class="center" style="vertical-align: middle;"><input type="number" value="${fileTypeDocument.archivenumber}" id="archivenumber${index.index}" name="archivenumber${index.index}"/></td>
                <input type="hidden" id="documentid${index.index}" name="documentid${index.index}" value="${fileTypeDocument.id}">
            </tr>
        </c:forEach>
        </tbody>

    </table>
    <div class="block"></div>
</div>
<div style="width: 80%; margin: 10px auto;">
    <form id="documentForm">
        <table class="form">
            <tr>
                <td class="col1 tdcss1" >
                    <label class="labelsize" >
                        <font color="#ff0000">* </font>关键字</label>
                </td>

                <td class="col2 tdcss2" style="padding-left: 30px;" >
                    <input type="text" style="width:100%;" placeholder="多个关键字用逗号隔开" id="keyword" name="keyword"/>
                </td>
            </tr>
            <tr>
                <td class="col1 tdcss1" style="vertical-align: middle;" >
                    <label class="labelsize" >
                        <font color="#ff0000">* </font>摘要</label>
                </td>
                <td  style="padding-left: 30px;" >
                    <textarea   clos="500" rows="6"   style="width:100%;" id="summary" name="summary"></textarea>
                </td>
            </tr>
            <tr>
                <td class="col1 tdcss1" style="vertical-align: middle;" >
                    <label class="labelsize" >
                        <font color="#ff0000">* </font>存档描述</label>
                </td>
                <td  style="padding-left: 30px;" >
                    <textarea clos="500" rows="6"  style="width:100%;" placeholder="例如：存档材料齐全、暂缺批文等" id="archivedescription" name="archivedescription"></textarea>
                </td>
            </tr>
            <tr>
                <td class="col1 tdcss1" style="vertical-align: middle;" >
                    <label class="labelsize" >
                        <font color="#ff0000">* </font>最终版报告</label>
                </td>
                <td  style="padding-left: 30px;" >
                    <input type="file" style="width:100%;" id="finalreportannex" name="finalreportannex"/>
                </td>
            </tr>
        </table>
    </form>

    <div class="btnnew" >
        <input type="submit" class="btn btn-primary" value="确定"  onclick="saveDocumentApplication()"/>
        &nbsp; &nbsp;
        <a class="btn btn-primary"  onclick="back()" >返回</a>
    </div>
</div>
</body>
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.validate.min.js"></script>

<!-- 表单校验 -->
<script>
    $(document).ready(function() {
        //添加表单校验
        $('#documentForm').validate({
            rules:{
                keyword:{
                    required:true,
                },
                summary:{
                    required:true,
                },
                archivedescription:{
                    required:true,
                },
                finalreportannex:{
                    required:true,
                }
            },
            messages:{
                keyword:{
                    required:"该项为必填",
                },
                summary:{
                    required:"该项为必填",
                },
                archivedescription:{
                    required:"该项为必填",
                },
                finalreportannex:{
                    required:"该项为必填",
                }
            }
        });
    });
</script>

<!-- 保存合同信息 -->
<script type="text/javascript">
    function saveDocumentApplication() {
        if ($("#documentForm").valid()) {
            if (!confirm("您确定申请存档吗?")) {
                return
            }

            var arr = new Array();//工作计划数组
            for (var i = 0; i < ${fileTypeDocuments.size()}; i++) {
                var map = {};
                map['archivelist'] = $('#archivelist' + i).text();
                map['archivenumber'] = $('#archivenumber' + i).val();
                map['documentid'] = $('#documentid' + i).val();
                map['projectid'] = ${projectInfo.id};
                arr.push(map);
            }
            var formFile = new FormData();
            formFile.append("id", '${projectInfo.id}');
            formFile.append("action", "UploadVMKImagePath");    //必须
            formFile.append("keyword", $('#keyword').val());
            formFile.append("summary", $('#summary').val());
            formFile.append("archivedescription", $('#archivedescription').val());
            formFile.append("finalreportannexFile", $('#finalreportannex')[0].files[0]); //附件对象
            formFile.append("documentApplications",JSON.stringify(arr));

            $.ajax({
                "type": "POST",
                "url": "/api/admin/matter/documentApplication",	//传输路径
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                "data": formFile,
                "success": function (data) {
                    if (data == "OK") {
                        alert("申请存档成功");
                        window.location.href = "/api/admin/iframe/documentApplicationList";
                    }
                },
                "error": function (data) {
                    alert(data);
                }
            })
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