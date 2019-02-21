<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/maincss.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/layout.css">
</head>
<body>
<div class="opinion_css">
    <span class="opinion_span">定稿审核意见</span>
    <textarea id="txt1" cols="50" rows="50" style="width:98%; height: 50px; margin: 2px 1%;"></textarea>
    <span class="span_tips">录入定稿审核意见，回车（enter键）自动保存定稿审核意见。</span>
    <table class="data display datatable table1" style="width: 98%; margin:5px 1%;" id="specialtable">
        <thead>
        <tr>
            <th class="sorting" style="width: 5%;">序号</th>
            <th class="sorting" style="width: 73%;">定稿审核意见</th>
            <th class="sorting" style="width: 20%;">操作</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
<div class="opinion_css_vice">
    <div>
        <form id="editForm">
            <table class="form">
                <tr>
                    <td class="col11 tdcss1">
                        <label class="labelsize">
                            定稿版报告：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <a style="font-size: 14px;" href="/${firstTrialReport.finalopinionannex}"
                           download="/${firstTrialReport.finalopinionannex}">下载定稿版报告</a>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1">
                        <label class="labelsize">
                            定稿意见附件：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <input type="file" id="finalOpinionAnnex" name="finalOpinionAnnex">
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1">
                        <label class="labelsize">
                            定稿批注版报告：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <input type="file" id="finalAnnotationreport" name="finalAnnotationreport">
                    </td>
                </tr>

            </table>
        </form>
    </div>
    <div class="btnnew" style="margin-bottom: 10px;">
        <input type="submit" class="btn btn-primary" value="提交" onclick="finalTrialSave()"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" class="btn btn-primary" value="退回" onclick="finalTrialBack()"/>
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
                finalOpinionAnnex:{
                    required:true,
                },
                finalAnnotationreport:{
                    required:true,
                },
            },
            messages:{
                finalOpinionAnnex:{
                    required:"该项为必填",
                },
                finalAnnotationreport:{
                    required:"该项为必填",
                },
            }
        });
    });
</script>

<!-- 回车前端添加初审意见 -->
<script type="text/javascript">
    var count = 0;
    $(document).ready(function () {
        $("#txt1").keydown(function (event) {
            if (event.keyCode == 13) { //回车键
                if ($("#txt1").val().trim() == '') {    //空内容不添加
                    $("#txt1").val("");
                    return;
                }
                count++;
                var index = count.toString();
                var html = $("#txt1").val();
                $(".opinion_css tbody").append("<tr class=\"odd gradeX\" id='" + index + "'><td>" + count + "</td><td id='finalopinion'>" + html.toString() + "</td><td style='text-align: center;'><a class='deleteid' style='cursor: pointer;'>删除</a></td></tr>");
                $("#txt1").val("");
                $(".deleteid").bind("click", function () {   //删除按钮
                    $(this).parent().parent().remove();
                })
            }
        })

    })
</script>


<script type="text/javascript">
    //保存到数据库
    function finalTrialSave() {

        if($('#specialtable tr').length == 1){
            $("#editForm").valid()
            alert('您还没有添加定稿审核意见');
            return;
        }
        if (!$("#editForm").valid()) {
            return;
        }

        if (!confirm("您确定提交定稿审核吗?")) {
            return
        }

        var arr = new Array();//初审意见数组
        $('#specialtable tr').each(function(i){// 遍历 tr
            if(i != 0){
                var map = {};
                $(this).children('td').each(function(j){  // 遍历 tr 的各个 td
                    if($(this).attr('id') != undefined){
                        map[$(this).attr('id')] = $(this).text()
                    }
                });
                map['projectid'] = ${projectInfo.id}
                    arr.push(map);
            }
        });

        var formFile = new FormData();
        formFile.append("action", "UploadVMKImagePath");    //必须
        formFile.append("opinionJson", JSON.stringify(arr)); //定稿意见
        formFile.append("finalOpinionAnnex", $('#finalOpinionAnnex')[0].files[0]); //定稿意见附件对象
        formFile.append("finalAnnotationreport", $('#finalAnnotationreport')[0].files[0]); //定稿批注版报告附件对象


        $.ajax({
            "type": "POST",
            "url": "/api/admin/matter/finalTrial",	//传输路径
            "processData": false,//用于对data参数进行序列化处理 这里必须false
            "contentType": false, //必须
            "data": formFile,
            "success": function (data) {
                if (data == "OK") {
                    alert("您已提交定稿审核意见");
                    window.location.href = "/api/admin/iframe/finalTrialList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        })
    }

    //退回
    function finalTrialBack() {
        if (!confirm("您确定退回该定稿审核吗?")) {
            return
        }
        $.ajax({
            "url": "/api/admin/matter/finalTrialBack?projectId=${projectInfo.id}",	//传输路径
            "success": function (data) {
                if (data == "OK") {
                    alert("您已退回该定稿审核");
                    window.location.href = "/api/admin/iframe/finalTrialList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        })
    }
</script>

</html>