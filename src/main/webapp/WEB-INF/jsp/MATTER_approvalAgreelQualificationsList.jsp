<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>报批资质</title>
    <link rel="stylesheet" href="/css/maincss.css">
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/common.css">
</head>
<body>
<div class="grid_100">
    <table class="data display datatable table1">
        <thead>
        <tr>
            <th class="sorting searchbar"  style="width: 100%;"> 搜索</th>

        </tr>
        </thead>
        <tbody>
        <tr class="gradeX odd1">
            <td><label class="labelsize" >
                项目编号</label> <input type="text" id="number" name="number" style="border: 1px solid rgba(144,144,144,.8);" />
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize" >
                    项目名称</label> <input type="text" id="name" name="name" style="border: 1px solid rgba(144,144,144,.8);"/>
            </td>
        </tr>
        <tr class=" gradeX odd2">
            <td style="text-align: right;">
                <input type="submit" class="btn btn-primary" value="查询" onclick="queryProjects()" />&nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr class="tr1"></tr>
        </tbody>
    </table>
    <table class="data display datatable table1">
        <thead>
        <tr>

            <th class="sorting" style="width: 5%;">序号</th>
            <th class="sorting" style="width: 15%;">项目名称</th>
            <th class="sorting" style="width: 15%;">文件类型</th>
            <th class="sorting" style="width:15%;">评价范围类别 </th>
            <th class="sorting" style="width:10%;">承接人 </th>
            <th class="sorting" style="width:10%;">主持人 </th>
            <th class="sorting" style="width: 10%;">组织人</th>
            <th class="sorting" style="width: 10%;">资质状态</th>
            <th class="sorting" style="width:10%;">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${projectListVo.projectInfos}" var="projectInfo">
        <tr class="odd gradeX">
            <td>${projectInfo.id}</td>
            <td>[${projectInfo.number}]${projectInfo.name}</td>
            <td class="center">${projectInfo.filetypeName}</td>
            <td class="center">${projectInfo.evaluationscopeName}</td>
            <td class="center">${projectInfo.projectundertakeruser.name}</td>
            <td class="center">${projectInfo.hostuser.name}</td>
            <td class="center">${projectInfo.organizinguser.name}</td>
            <td class="center">未提交</td>
            <td class="center">
                <a class="box" style="background-color: transparent; cursor: pointer;" onclick="showDiv('${projectInfo.id}','${projectInfo.number}','${projectInfo.name}','${projectInfo.filingdepartment}')">申请</a>&nbsp;&nbsp;
            </td>
        </tr>
        </c:forEach>
    </table>
    <div id="dialogBg"></div>
    <div id="dialog" class="animated">
        <img class="dialogIco" width="50" height="50" src="/images/ico.png" alt="" />
        <div class="dialogTop">
            <a href="javascript:0" class="claseDialogBtn" onclick="hiddenDiv()">关闭</a>
        </div>
        <form id="editForm">
            <ul class="editInfos">
                <li><div style="width:30%; float:left; text-align:right; margin-top: 10px; font-weight: bold;"><font color="#ff0000">* </font>项目名称：</div ><div style="width:60%; float:left; text-align:left; margin-top: 10px;" id="projectName">绑定数据</div></li>
                <li><div style="width:30%; float:left; text-align:right; margin-top: 10px; font-weight: bold;"><font color="#ff0000">* </font>审批/备案部门：</div ><div style="width:60%; float:left; text-align:left; margin-top: 10px;" id="projectfilingdepartment">绑定数据</div></li>
                <li><div style="width:30%; float:left; text-align:right; margin-top: 10px; font-weight: bold;"><font color="#ff0000">* </font>资质版本：</div ><div style="width:60%; float:left; text-align:left; margin-top: 10px;">报批版</div></li>
                <li ><div style="width:30%; float:left; text-align:right;margin-top: 10px; font-weight: bold;"><font color="#ff0000">* </font>资质份数：</div ><div style="width:70%; float:left; text-align:left; margin-top: 10px;"><input style="width: 99%; height: 20px; border: 1px solid rgba(144,144,144,.8); " id="qualificationNumber" name="qualificationNumber"/></div></li>
                <%--<li><div style="width:30%; float:left; text-align:right; margin-top: 10px; font-weight: bold;"></div ><div style="width:60%; float:left; text-align:left; margin-top: 10px;"><font color="#ff0000">份数可选范围为1到30</font></div></li>--%>
                <li><div style="width:30%; float:left; text-align:right; margin-top: 10px; font-weight: bold;"><font color="#ff0000">* </font>申请说明：</div ><div style="width:70%; float:left; text-align:left; margin-top: 10px;"><textarea style="width: 99%; height: 50px; border: 1px solid rgba(144,144,144,.8); " id="qualificationRemarks" name="qualificationRemarks"></textarea></div></li>
                <li  style="margin-top: 10px;"><input type="button" value="提交" class="submitBtn" id="saveButton"/></li>
            </ul>
        </form>
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
                qualificationNumber:{
                    required:true,
                    min:1,
                    max:30
                },
                qualificationRemarks:{
                    required:true,
                }
            },
            messages:{
                qualificationNumber:{
                    required:"该项为必填",
                    min:"份数可选范围为1到30",
                    max:"份数可选范围为1到30"
                },
                qualificationRemarks:{
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

    //显示弹框
    function showDiv(id,number,name,projectfilingdepartment) {
        className = $(this).attr('class');
        $('#dialogBg').fadeIn(300);
        $('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
        $('#projectName').text('[' + number + ']' + name);  //取值
        $('#projectfilingdepartment').text(projectfilingdepartment);  //取值
        $('#saveButton').attr('onclick','save(' + id + ')');
    }

    //关闭弹窗
    function hiddenDiv() {
        $('#dialogBg').fadeOut(300,function(){
            $('#dialog').addClass('bounceOutUp').fadeOut();
        });
    }

    //保存到数据库
    function save(id) {
        if (!$("#editForm").valid()) {
            return;
        }
        if (!confirm("您确定申请报批资质吗?")) {
            return;
        }
        $.ajax({
            "type": "POST",
            "url": "/api/admin/matter/approvalAgreelQualifications",	//传输路径
            "data": {
                "id":id,
                "qualificationnumber":$('#qualificationNumber').val(),
                "qualificationremarks":$('#qualificationRemarks').val()
            },
            "success": function (data) {
                if (data == "OK") {
                    alert("申请报批资质成功");
                    window.location.href = "/api/admin/iframe/approvalAgreelQualificationsList?pageNow="+'${projectListVo.pageNow}';
                }
            },
            "error": function (data) {
                alert(data);
            }
        })
    }


</script>



<!-- 数据回显与赋值 -->
<script type="text/javascript">
    var pageNow = "${projectListVo.pageNow}";
    $(function () {
        $('#name').val("${projectListVo.name}");
        $('#number').val("${projectListVo.number}");
    });
</script>

<!-- 点击查询按钮 -->
<script type="text/javascript">
    function queryProjects() {
        queryname = $('#name').val();
        queryNumber = $('#number').val();

        window.location.href = '/api/admin/iframe/approvalAgreelQualificationsList?' +
            'name=' + queryname +
            '&number=' + queryNumber
    }
</script>

<!-- 分页 -->
<script type="text/javascript">
    function page(pageNow) {
        queryname = $('#name').val();
        queryNumber = $('#number').val();
        window.location.href = '/api/admin/iframe/approvalAgreelQualificationsList?' +
            'name=' + queryname +
            '&number=' + queryNumber +
            '&pageNow=' + pageNow
    }
</script>
</html>