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
            <th class="sorting" style="width: 10%;">所在区域</th>
            <th class="sorting" style="width: 15%;">文件类型</th>
            <th class="sorting" style="width:15%;">评价范围类别 </th>
            <th class="sorting" style="width:10%;">承接人 </th>
            <th class="sorting" style="width:10%;">主持人 </th>
            <th class="sorting" style="width: 10%;">组织人</th>
            <th class="sorting" style="width:10%;">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${projectListVo.projectInfos}" var="projectInfo">
            <tr class="odd gradeX">
                <td>${projectInfo.id}</td>
                <td>[${projectInfo.number}]${projectInfo.name}</td>
                <td>${projectInfo.provinceName}-${projectInfo.cityName}-${projectInfo.areaName}</td>
                <td class="center">${projectInfo.filetypeName}</td>
                <td class="center">${projectInfo.evaluationscopeName}</td>
                <td class="center">${projectInfo.projectundertakeruser.name}</td>
                <td class="center">${projectInfo.hostuser.name}</td>
                <td class="center">${projectInfo.organizinguser.name}</td>
                <td class="center">
                    <a class="box" style="background-color: transparent; cursor: pointer;" onclick="showDiv('${projectInfo.id}','${projectInfo.name}','${projectInfo.createuser.department}')">提交初版报告</a>&nbsp;&nbsp;
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
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>项目名称：</div ><div style="width:50%; float:left; text-align:left;" id="projectName">绑定数据库信息</div></li>
                <li><div style="width:30%; float:left; text-align:right; margin-top: 10px;"><font color="#ff0000">* </font>初审版报告：</div ><div style="width:60%; float:left; text-align:left; margin-top: 10px;">
                    <input type="file" id="firstTrialFile" name="firstTrialFile" style="width: 90%; border: 1px solid rgba(144,144,144,.8); " /></div>
                </li>
                <li ><div style="width:30%; float:left; text-align:right;margin-top: 10px;"><font color="#ff0000">* </font>选择初审人：</div ><div style="width:50%; float:left; text-align:left; margin-top: 10px;">
                    <select  id="firsttrialuserid" name="firsttrialuserid" style="width: 90%; border: 1px solid rgba(144,144,144,.8); " >
                        <option>1</option>
                    </select>
                </div></li>
                <li  style="margin-top: 10px;"><input type="button" value="提交" class="submitBtn" id="initialButton"/></li>
            </ul>
        </form>
    </div>
</div>
<div class="block" style="text-align: center">
    <c:forEach begin="1" end="${projectListVo.pageTotal}" var="index">
        <c:if test="${index == projectListVo.pageNow}">
            <a href="javascript:0" onclick="page(${index})" style="color: red"> ${index}</a>
        </c:if>
        <c:if test="${index != projectListVo.pageNow}">
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
                firstTrialFile:{
                    required:true,
                },
                firsttrialuserid:{
                    required:true,
                }
            },
            messages:{
                firstTrialFile:{
                    required:"该项为必填",
                },
                firsttrialuserid:{
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
    function showDiv(id,projectName,departmentId) {
        className = $(this).attr('class');
        $('#dialogBg').fadeIn(300);
        $('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();

        $('#projectName').text(projectName);    //置入项目名
        $('#initialButton').attr('onclick','initial(' + id + ')');  //添加按钮 保存函数

        var arr = new Array();
        arr.push(2);
        arr.push(3);
        arr.push(4);    //搜索身份为环评经理 部门经理  总工办的人员 ， 加载人员
        $.ajax({
            "type": "POST",
            "url": "/api/admin/assist/getUserListByDepartmentIdAndRole",	//传输路径
            "data": {
                "departmentId":departmentId,
                "roleList":arr
            },
            "success": function (data) {
                var firsttrialuserid = $('#firsttrialuserid');
                firsttrialuserid.empty();
                if(data.length==0){
                    alert('该部门下没有环评经理、部门经理或总工办，请联系管理员添加');
                }
                for (var i = 0; i < data.length; i++) {
                    firsttrialuserid.append(
                        "<option value=" + data[i].id + ">" + data[i].name + "(" + data[i].roleName + ")</option>"
                    );
                }
            },
            "error": function (data) {
                alert(data);
            }
        })
    }

    //关闭弹窗
    function hiddenDiv() {
        $('#dialogBg').fadeOut(300,function(){
            $('#dialog').addClass('bounceOutUp').fadeOut();
        });
    }

    //保存到数据库
    function initial(id) {
        if (!$("#editForm").valid()) {
            return;
        }
        if (!confirm("您确定提交初版报告吗?")) {
            return
        }

        var formFile = new FormData();
        formFile.append("id", id);
        formFile.append("action", "UploadVMKImagePath");    //必须
        formFile.append("firsttrialuserid", $('#firsttrialuserid').val());
        formFile.append("firstTrialFile", $('#firstTrialFile')[0].files[0]); //附件对象
        var data = formFile;
        $.ajax({
            "type": "POST",
            "url": "/api/admin/matter/initialReport",	//传输路径
            "data": formFile,
            "processData": false,//用于对data参数进行序列化处理 这里必须false
            "contentType": false, //必须
            "success": function (data) {
                if (data == "OK") {
                    alert("您已提交初版报告");
                    window.location.href = "/api/admin/iframe/initialReportsList";
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

        window.location.href = '/api/admin/iframe/initialReportsList?' +
            'name=' + queryname +
            '&number=' + queryNumber
    }
</script>

<!-- 分页 -->
<script type="text/javascript">
    function page(pageNow) {
        queryname = $('#name').val();
        queryNumber = $('#number').val();
        window.location.href = '/api/admin/iframe/initialReportsList?' +
            'name=' + queryname +
            '&number=' + queryNumber +
            '&pageNow=' + pageNow
    }
</script>
</html>