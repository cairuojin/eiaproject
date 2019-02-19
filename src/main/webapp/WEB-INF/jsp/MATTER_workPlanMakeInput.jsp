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
                <input type="submit" class="btn btn-primary" onclick="showDiv()"  value="新增"/>&nbsp;&nbsp;&nbsp;
                <input type="submit" class="btn btn-primary" onclick="savePlan()" value="提交"/>
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
        <tbody id="specialtbody"></tbody>
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
<script src="/js/jquery.validate.min.js"></script>

<!-- 表单校验 -->
<script>
    $(document).ready(function() {
        //添加表单校验
        $('#editForm').validate({
            rules:{
                workPlanTime:{
                    required:true,
                    dateISO:true
                },
                workPlanContent:{
                    required:true,
                },
                partyBperson:{
                    required:true,
                },
                responsibleParty:{
                    required:true,
                },
            },
            messages:{
                workPlanTime:{
                    required:"该项为必填",
                    dateISO:"请输入正确格式的日期"
                },
                workPlanContent:{
                    required:"该项为必填",
                },
                partyBperson:{
                    required:"该项为必填",
                },
                responsibleParty:{
                    required:"该项为必填",
                },
            }
        });
    });
</script>

<!-- 按钮函数 -->
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
        setTimeout(function () {    //清空现有内容
            $(".html1").val('');
            $(".html2").val('');
            $(".html3").val('');
            $(".html4").val('');
            $(".html5").val('');
            }, 1000);
    }

    //添加新行
    function addNewPlan() {
        if (!$("#editForm").valid()) {
            return;
        }
        // 设置序列号, 如果tbody里存在元素, 则按顺序递增序列号, 否则从1开始
        if ($('#specialtable tbody').html()) {
            index = Number($('#specialtable tbody tr td:first-child').last().text()) + 1
        } else {
            index = 1;
        }

        var html1 = $(".html1").val();   // 日期
        var html2 = $(".html2").val();   // 工作内容
        var html3 = $(".html3").val();   // 乙方责任人
        var html4 = $(".html4").val();   // 责任方
        var html5 = $(".html5").val();   // 备注
        // 设置添加内容
        append_tr = "<tr class=\"odd gradeX\"><td>" + index + "</td><td id='workplantime'>" + html1 + "</td><td id='workplancontent'>" + html2 + "</td><td class=\"center\" id='partybperson'>" + html3 + "</td><td class=\"center\" id='responsibleparty'>" + html4 + "</td><td class=\"center\" id='remarks'>" + html5 + "</td><td class='center deleteid'>删除</td></tr>";
        // 添加标签
        $("#specialtbody").append(append_tr);
        $(".html1").val('');
        $(".html2").val('');
        $(".html3").val('');
        $(".html4").val('');
        $(".html5").val('');
    }

    //保存到数据库
    function savePlan() {
        if (!confirm("您确定制定工作计划吗?")) {
            return
        }

        var arr = new Array();//工作计划数组
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
        if(arr.length == 0){
            alert('您还未添加工作计划');
            return;
        }
        $.ajax({
            "type": "POST",
            "contentType":"application/json;charset=utf-8",
            "url": "/api/admin/matter/workPlanMake",	//传输路径
            "data": JSON.stringify(arr),
            "success": function (data) {
                if (data == "OK") {
                    alert("您已制定工作计划");
                    window.location.href = "/api/admin/iframe/workPlanMakeList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        })

    }

</script>

</html>

