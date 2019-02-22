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
    <link rel="stylesheet" href="/css/common.css">
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
            <c:forEach items="${projectWorkPlans}" var="projectWorkPlan" varStatus="index">
                <tr class="odd gradeX">
                    <td>${index.index + 1}</td>
                    <td><fmt:formatDate value='${projectWorkPlan.workplantime}' pattern='yyyy-MM-dd'></fmt:formatDate></td>
                    <td>[${projectWorkPlan.projectinfo.number}]${projectWorkPlan.projectinfo.name}</td>
                    <td class="center">${projectWorkPlan.workplancontent}</td>
                    <td class="center">
                        <a class="box"  style="cursor: pointer; background-color: transparent;" onclick="
                                showDiv('${projectWorkPlan.id}',
                            '${projectWorkPlan.projectinfo.number}','${projectWorkPlan.projectinfo.name}',
                            '<fmt:formatDate value='${projectWorkPlan.workplantime}' pattern='yyyy-MM-dd'/>',
                            '${projectWorkPlan.workplancontent}','${projectWorkPlan.partybperson}',
                            '${projectWorkPlan.responsibleparty}','${projectWorkPlan.remarks}'
                                )
                                ">执行</a>&nbsp;&nbsp;
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <div id="dialogBg"></div>
    <div id="dialog" class="animated">
        <img class="dialogIco" width="50" height="50" src="/images/ico.png" alt="" />
        <div class="dialogTop">
            <a href="javascript:;" class="claseDialogBtn" onclick="hiddenDiv()">关闭</a>
        </div>
        <form id="editForm">
            <ul class="editInfos">
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>项目名称：</div ><div style="width:50%; float:left; text-align:left;" id="projectName"></div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>计划日期：</div ><div style="width:50%; float:left; text-align:left;" id="workplantime"></div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>工作内容：</div ><div style="width:50%; float:left; text-align:left;" id="workplancontent"></div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>乙方责任人：</div ><div style="width:50%; float:left; text-align:left;" id="partybperson"></div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>责任方：</div ><div style="width:50%; float:left; text-align:left;" id="responsibleparty"></div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>备注：</div ><div style="width:50%; float:left; text-align:left;" id="remarks"></div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>执行日期：</div ><div style="width:50%; float:left; text-align:left;"><input type="date" id="implementsplantime" name="implementsplantime" style="width: 90%; border: 1px solid rgba(144,144,144,.8); " /></div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>执行情况备注：</div ><div style="width:50%; float:left; text-align:left;"><input type="text" id="implementsremarks" name="implementsremarks" style="width: 90%; border: 1px solid rgba(144,144,144,.8); " /></div></li>
                <li><input type="button" value="落实执行" class="submitBtn" id="implementButton"/></li>
            </ul>
        </form>
    </div>
</div>

<div class="block" style="text-align: center">
    <c:forEach begin="1" end="${pageInfo.pages}" var="index">
        <c:if test="${index == pageInfo.pageNum}">
            <a href="javascript:0" onclick="page(${index})" style="color: red"> ${index}</a>
        </c:if>
        <c:if test="${index != pageInfo.pageNum}">
            <a href="javascript:0" onclick="page(${index})"> ${index}</a>
        </c:if>
    </c:forEach>
</div>




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
                implementsplantime:{
                    required:true,
                    dateISO:true
                },
                implementsremarks:{
                    required:true,
                }
            },
            messages:{
                implementsplantime:{
                    required:"该项为必填",
                    dateISO:"请输入正确格式的日期"
                },
                implementsremarks:{
                    required:"该项为必填",
                }
            }
        });
    });
</script>

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
    });

    //分页
    function page(pageNow) {
        window.location.href = '/api/admin/iframe/workPlanImplement?' +
            '&pageNow=' + pageNow
    }

    //显示弹框
    function showDiv(id,number,name,workplantime,workplancontent,partybperson,responsibleparty,remarks){
        className = $(this).attr('class');
        $('#dialogBg').fadeIn(300);
        $('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
        $('#projectName').text('[' + number + ']' + name);  //取值
        $('#workplantime').text(workplantime);
        $('#workplancontent').text(workplancontent);
        $('#partybperson').text(partybperson);
        $('#responsibleparty').text(responsibleparty);
        $('#remarks').text(remarks);
        $('#implementButton').attr('onclick','implementPlan(' + id + ')');
    }
    //关闭弹窗
    function hiddenDiv() {
        $('#dialogBg').fadeOut(300,function(){
            $('#dialog').addClass('bounceOutUp').fadeOut();
        });
    }

    //保存到数据库
    function implementPlan(id) {
        if (!$("#editForm").valid()) {
            return;
        }
        if (!confirm("您确定执行该计划吗?")) {
            return
        }
        $.ajax({
            "type": "POST",
            "url": "/api/admin/matter/workPlanImplement",	//传输路径
            "data": {
                "id":id,
                "implementsplantime":$('#implementsplantime').val(),
                "implementsremarks":$('#implementsremarks').val()
            },
            "success": function (data) {
                if (data == "OK") {
                    alert("该工作计划已执行");
                    window.location.href = "/api/admin/iframe/workPlanImplement?pageNow="+'${pageInfo.pageNum}';
                }
            },
            "error": function (data) {
                alert(data);
            }
        })

    }
</script>
</html>