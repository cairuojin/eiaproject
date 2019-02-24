<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>出资质</title>
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
            <th class="sorting" style="width: 10%;">文件类型</th>
            <th class="sorting" style="width: 5%;">资质版本</th>
            <th class="sorting" style="width:5%;">资质份数 </th>
            <th class="sorting" style="width:10%;">资质状态 </th>
            <th class="sorting" style="width: 5%;">申请人</th>
            <th class="sorting" style="width: 15%;">申请时间</th>
            <th class="sorting" style="width:10%;">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${projectListVo.projectInfos}" var="projectInfo">
            <tr class="odd gradeX">
                <td>${projectInfo.id}</td>
                <td>[${projectInfo.number}]${projectInfo.name}</td>
                <td class="center">${projectInfo.filetypeName}</td>
                <c:if test="${projectInfo.subObject['qualifications'].status == 0}">
                    <td class="center">报审版 </td>
                </c:if>
                <c:if test="${projectInfo.subObject['qualifications'].status == 1}">
                    <td class="center">报批版 </td>
                </c:if>
                <td class="center">${projectInfo.subObject['qualifications'].qualificationnumber}</td>
                <td class="center"> 已提交</td>
                <td class="center">${projectInfo.subObject['qualifications'].user.name}</td>
                <td class="center"><fmt:formatDate value="${projectInfo.subObject['qualifications'].createtime}" pattern="yyyy年MM月dd日" /></td>
                <td class="center">
                        <a class="box" style="background-color: transparent; cursor: pointer;" onclick="showDiv(
                                '${projectInfo.id}','${projectInfo.number}','${projectInfo.name}','${projectInfo.filingdepartment}','${projectInfo.subObject['qualifications'].status}',
                                '${projectInfo.subObject['qualifications'].qualificationnumber}','${projectInfo.subObject['qualifications'].qualificationremarks}')
                        ">出资质</a>
                    &nbsp;&nbsp;
                </td>
            </tr>
        </c:forEach>
        </tbody>
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
                <li><div style="width:30%; float:left; text-align:right; margin-top: 10px; font-weight: bold;"><font color="#ff0000">* </font>审批/备案部门：</div ><div style="width:60%; float:left; text-align:left; margin-top: 10px;" id="filingDepartment">绑定数据</div></li>
                <li><div style="width:30%; float:left; text-align:right; margin-top: 10px; font-weight: bold;"><font color="#ff0000">* </font>资质版本：</div ><div style="width:60%; float:left; text-align:left; margin-top: 10px;" id="qualificationsStatus">绑定数据</div></li>
                <li ><div style="width:30%; float:left; text-align:right;margin-top: 10px; font-weight: bold;"><font color="#ff0000">* </font>资质份数：</div ><div style="width:70%; float:left; text-align:left; margin-top: 10px;" id="qualificationnumber">绑定数据</div></li>
                <li><div style="width:30%; float:left; text-align:right; margin-top: 10px; font-weight: bold;"><font color="#ff0000">*</font>申请说明:</div ><div style="width:60%; float:left; text-align:left; margin-top: 10px;" id="qualificationremarks">绑定数据</div></li>
                <li><div style="width:30%; float:left; text-align:right; margin-top: 10px; font-weight: bold;"><font color="#ff0000">* </font>资质流水号：</div ><div style="width:70%; float:left; text-align:left; margin-top: 10px;"><input style="width: 99%; height: 26px; border: 1px solid rgba(144,144,144,.8); " id="qualificationserialnumber" name="qualificationserialnumber"/></div></li>
                <li><div style="width:30%; float:left; text-align:right; margin-top: 10px; font-weight: bold;"></div ><div style="width:70%; float:left; text-align:left; margin-top: 10px;"><font color="#ff0000">格式：1200001-1200009,1200012  </font></div></li>
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
                qualificationserialnumber:{
                    required:true,
                    remote:{    //资质号是否存在
                        url: "/api/admin/assist/qualificationserialnumberExist",
                        type:"get",
                        data:{"qualificationserialnumber":function() {return $('#qualificationserialnumber').val();}}  //传入后台的值
                    }
                }
            },
            messages:{
                qualificationserialnumber:{
                    required:"该项为必填",
                    remote:"该资质号已存在"
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
    function showDiv(id,number,name,filingDepartment,qualificationsStatus,qualificationnumber,qualificationremarks) {
        className = $(this).attr('class');
        $('#qualificationserialnumber').val('');
        $('#dialogBg').fadeIn(300);
        $('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
        $('#projectName').text('[' + number + ']' + name);  //取值
        $('#filingDepartment').text(filingDepartment);
        if(qualificationsStatus == 0)
            $('#qualificationsStatus').text('报审版');
        else
            $('#qualificationsStatus').text('报批版');
        $('#qualificationnumber').text(qualificationnumber);
        $('#qualificationremarks').text(qualificationremarks);
        $('#saveButton').attr('onclick','save(' + id + ',' + qualificationsStatus + ')');
    }

    //关闭弹窗
    function hiddenDiv() {
        $('#dialogBg').fadeOut(300,function(){
            $('#dialog').addClass('bounceOutUp').fadeOut();
        });
    }

    //保存到数据库
    function save(id,qualificationsStatus) {
        if (!$("#editForm").valid()) {
            return;
        }
        if (!confirm("您确定出资质吗?")) {
            return;
        }

        $.ajax({
            "async":false,
            "type": "POST",
            "url": "/api/admin/matter/projectQualifications",	//传输路径
            "data": {
                "id":id,
                "qualificationserialnumber":$('#qualificationserialnumber').val(),
                "qualificationsStatus":qualificationsStatus
            },
            "success": function (data) {
                if (data == "OK") {
                    alert("您已出资质");
                    window.location.href = "/api/admin/iframe/projectQualificationsList?pageNow="+'${projectListVo.pageNow}';
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

        window.location.href = '/api/admin/iframe/projectQualificationsList?' +
            'name=' + queryname +
            '&number=' + queryNumber
    }
</script>

<!-- 分页 -->
<script type="text/javascript">
    function page(pageNow) {
        queryname = $('#name').val();
        queryNumber = $('#number').val();
        window.location.href = '/api/admin/iframe/projectQualificationsList?' +
            'name=' + queryname +
            '&number=' + queryNumber +
            '&pageNow=' + pageNow
    }
</script>
</html>