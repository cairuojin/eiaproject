<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/maincss.css">
    <link rel="stylesheet" href="/css/common.css">
    <script src="/js/jquery.min.js"></script>
    <script type="text/javascript">
        var w,h,className;
        function getSrceenWH(){
            w = $(window).width();
            h = $(window).height();
            $('#dialogBg').width(w).height(h);
        }

        window.onresize = function(){
            getSrceenWH();
        }
        $(window).resize();

        $(function(){
            getSrceenWH();

            //显示弹框
            $('.box').bind("click",function(){
                className = $(this).attr('class');
                $('#dialogBg').fadeIn(300);
                $('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
            });

            //关闭弹窗
            $('.claseDialogBtn').click(function(){
                $('#dialogBg').fadeOut(300,function(){
                    $('#dialog').addClass('bounceOutUp').fadeOut();
                });
            });
        });
    </script>
</head>
<body>
<div class="grid_100">
    <table class="data display datatable table1">
        <thead>
        <tr>
            <th class="sorting" style="width: 5%;">序号</th>
            <th class="sorting" style="width: 15%;">计划日期</th>
            <th class="sorting" style="width: 30%;">项目名称</th>
            <th class="sorting" style="width: 40%;">工作内容</th>
            <th class="sorting" style="width:10%;">操作</th>
        </tr>
        </thead>
        <tbody>
        <tr class="odd gradeX">

            <td>1</td>
            <td>2019-10-10 </td>
            <td> [HBHP2019-1101-0008]df  </td>
            <td class="center"> 好好努力 </td>
            <td class="center">
                <a  class="box"  style="cursor: pointer; background-color: transparent;">执行</a>&nbsp;&nbsp;
            </td>
        </tr>
    </table>
    <div id="dialogBg"></div>
    <div id="dialog" class="animated">
        <img class="dialogIco" width="50" height="50" src="../../images/ico.png" alt="" />
        <div class="dialogTop">
            <a href="javascript:;" class="claseDialogBtn">关闭</a>
        </div>
        <form action="" method="post" id="editForm">
            <ul class="editInfos">
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>项目名称：</div ><div style="width:50%; float:left; text-align:left;">绑定数据库信息</div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>计划日期：</div ><div style="width:50%; float:left; text-align:left;">绑定数据</div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>工作内容：</div ><div style="width:50%; float:left; text-align:left;">绑定数据</div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>乙方责任人：</div ><div style="width:50%; float:left; text-align:left;">绑定数据</div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>责任方：</div ><div style="width:50%; float:left; text-align:left;">绑定数据</div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>备注：</div ><div style="width:50%; float:left; text-align:left;">绑定数据</div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>执行日期：</div ><div style="width:50%; float:left; text-align:left;"><input type="text" id="grumble" style="width: 90%; border: 1px solid rgba(144,144,144,.8); " /></div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>执行情况备注：</div ><div style="width:50%; float:left; text-align:left;"><input type="text" id="grumble" style="width: 90%; border: 1px solid rgba(144,144,144,.8); " /></div></li>
                <li><input type="submit" value="落实执行" class="submitBtn" /></li>
            </ul>
        </form>
    </div>
</div>

<div class="block"></div>




</div>
<div class="clear">
</div>
</div>
</body>
</html>