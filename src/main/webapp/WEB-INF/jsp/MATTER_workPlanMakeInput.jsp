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
    <style>
        .deleteid {
            cursor: pointer;
        }
    </style>
</head>
<body>
<div class="grid_100">
    <table class="data display datatable table1">
        <thead>
        <tr>
            <th class="sorting searchbar" style="width: 100%;"> 制定工作计划</th>
        </tr>
        </thead>
        <tbody>
        <tr class=" gradeX odd2">
            <td style="text-align: right; padding-top: 5px; ">
                <p>新增工作计划后，点击提交才会保存。</p>
                <input type="submit" class="btn btn-primary" onclick="showDiv()" value="新增"/>&nbsp;&nbsp;&nbsp;
                <input type="submit" class="btn btn-primary" value="提交"/>
                &nbsp;&nbsp; <a href="JavaScript:0" class="btn btn-primary" onclick="back()" >返回</a>
            </td>
        </tr>
        <tr class="tr1"></tr>
        </tbody>
    </table>
    <table class="data display datatable table1" id="specialtable">
        <thead>
        <tr>
            <th class="sorting" style="width: 5%;">序号</th>
            <th class="sorting" style="width: 10%;">日期</th>
            <th class="sorting" style="width: 30%;">工作内容</th>
            <th class="sorting" style="width: 10%;">乙方责任人</th>
            <th class="sorting" style="width:10%;">责任方</th>
            <th class="sorting" style="width:20%;">备注</th>
            <th class="sorting" style="width:15%;">操作</th>
        </tr>
        </thead>
    </table>
    <div id="dialogBg"></div>
    <div id="dialog" class="animated">
        <img class="dialogIco" width="50" height="50" src="/images/ico.png" alt=""/>
        <div class="dialogTop">
            <a href="javascript:;" class="claseDialogBtn" onclick="hiddenDiv()">关闭</a>
        </div>
        <form id="editForm">
            <ul class="editInfos">
                <li>
                    <div style="width:30%; float:left; text-align:right;">项目名称：</div>
                    <div style="width:50%; float:left; text-align:left;">${projectInfo.name}</div>
                </li>
                <li>
                    <div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>日期：</div>
                    <div style="width:50%; float:left; text-align:left;"><input type="date" id="workPlanTime" name="workPlanTime" class="html1"
                                                                                style="width: 90%; border: 1px solid rgba(144,144,144,.8); "/>
                    </div>
                </li>
                <li>
                    <div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>工作内容：</div>
                    <div style="width:50%; float:left; text-align:left;"><input type="text" id="workPlanContent" name="workPlanContent" class="html2"
                                                                                style="width: 90%; border: 1px solid rgba(144,144,144,.8); "/>
                    </div>
                </li>
                <li>
                    <div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>乙方责任人：</div>
                    <div style="width:50%; float:left; text-align:left;"><input type="text" id="partyBperson" name="partyBperson" class="html3"
                                                                                style="width: 90%; border: 1px solid rgba(144,144,144,.8); "/>
                    </div>
                </li>
                <li>
                    <div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>责任方：</div>
                    <div style="width:50%; float:left; text-align:left;"><input type="text" id="responsibleParty" name="responsibleParty" class="html4"
                                                                                style="width: 90%; border: 1px solid rgba(144,144,144,.8); "/>
                    </div>
                </li>
                <li>
                    <div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>备注：</div>
                    <div style="width:50%; float:left; text-align:left;"><input type="text" id="remarks" name="remarks" class="html5"
                                                                                style="width: 90%; border: 1px solid rgba(144,144,144,.8); "/>
                    </div>
                </li>
                <li><input type="button" value="确认增加" onclick="addNewPlan()" class="submitBtn"/></li>
            </ul>
        </form>
    </div>
</div>

</div>
<div class="block"></div>
</div>
<div class="clear">
</div>

</div>
</body>


<script src="/js/jquery.min.js"></script>
<script type="text/javascript">
    var w, h, className;
    function getSrceenWH() {
        w = $(window).width();
        h = $(window).height();
        $('#dialogBg').width(w).height(h);
    }

    window.onresize = function () {
        getSrceenWH();
    }
    $(window).resize();

    $(function () {
        getSrceenWH();
        //删除按钮绑定移除函数
        $("#specialtable tbody").on("click", ".deleteid", function () {
            $(this).parent().remove();
        });

    });

    //显示弹框
    function showDiv() {
        className = $(this).attr('class');
        $('#dialogBg').fadeIn(300);
        $('#dialog').removeAttr('class').addClass('animated ' + className + '').fadeIn();
    }

    //隐藏弹框
    function hiddenDiv() {
        $('#dialogBg').fadeOut(300, function () {
            $('#dialog').addClass('bounceOutUp').fadeOut();
        });
    }

    //添加新行
    function addNewPlan() {
        // 设置序列号, 如果tbody里存在元素, 则按顺序递增序列号, 否则从1开始
        if ($('#specialtable tbody').html()) {
            $index = Number($('#specialtable tbody tr td:first-child').last().text()) + 1
        } else {
            $index = 1;
        }
        ;

        var $html1 = $(".html1").val();   // 日期
        var $html2 = $(".html2").val();   // 工作内容
        var $html3 = $(".html3").val();   // 乙方责任人
        var $html4 = $(".html4").val();   // 责任方
        var $html5 = $(".html5").val();   // 备注
        // 设置添加内容
        $append_tr = $(
            "<tr class=\"odd gradeX\"><td>" + $index + "</td><td>" + $html1 + "</td><td>" + $html2 + "</td><td class=\"center\">" + $html3 + "</td><td class=\"center\">" + $html4 + "</td><td class=\"center\">" + $html5 + "</td><td class='center deleteid'>删除</td></tr>");
        // 添加标签
        $("#specialtable tbody").append($append_tr);
    }
</script>

</html>

