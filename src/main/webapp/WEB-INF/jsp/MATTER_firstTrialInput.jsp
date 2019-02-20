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
    <span class="opinion_span">初审意见</span>
    <textarea id="txt1" cols="50" rows="50" style="width:98%; height: 50px; margin: 2px 1%;"></textarea>
    <span class="span_tips">录入初审意见，回车（enter键）自动保存初审意见。</span>
    <table class="data display datatable table1" style="width: 98%; margin:5px 1%;">
        <thead>
        <tr>
            <th class="sorting" style="width: 5%;">序号</th>
            <th class="sorting" style="width: 73%;">初审意见</th>
            <th class="sorting" style="width: 20%;">操作</th>
        </tr>
        </thead>
        <tbody>
        </tbody>
    </table>
</div>
<div class="opinion_css_vice">
    <div>
        <form>
            <table class="form">
                <tr>
                    <td class="col11 tdcss1">
                        <label class="labelsize">
                            初审版报告：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <a style="font-size: 14px;" href="/${projectInitialReport.firsttrialreportannex}"
                           download="/${projectInitialReport.firsttrialreportannex}">下载初版报告</a>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1">
                        <label class="labelsize">
                            初审意见附件：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <input type="file">
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1">
                        <label class="labelsize">
                            初审批注版报告：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <input type="file">
                    </td>
                </tr>

            </table>
        </form>
    </div>
    <div class="btnnew" style="margin-bottom: 10px;">
        <input type="submit" class="btn btn-primary" value="提交"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <input type="submit" class="btn btn-primary" value="退回"/>
    </div>
</div>

</body>

<script src="/js/jquery.min.js"></script>
<script>
    var count = 0;
    $(document).ready(function () {
        $("#txt1").keyup(function (event) {
            if (event.keyCode == 13) { //回车键
                if ($("#txt1").val().trim() == '') {    //空内容不添加
                    $("#txt1").val("");
                    return;
                }
                count++;
                var index = count.toString();
                var html = $("#txt1").val();
                $(".opinion_css tbody").append("<tr class=\"odd gradeX\" id='" + index + "'><td>" + count + "</td><td>" + html.toString() + "</td><td style='text-align: center;'><a class='deleteid' style='cursor: pointer;'>删除</a></td></tr>");
                $("#txt1").val("");
                $(".deleteid").bind("click", function () {   //删除按钮
                    $(this).parent().parent().remove();
                })
            }
        })

    })
</script>
</html>