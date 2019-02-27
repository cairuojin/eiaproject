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
        <tbody>
        <tr class=" gradeX odd2">
            <td style="text-align: right; border-bottom: 1px solid rgba(144,144,144,.7);">
                <input  type="button" class="btn btn-primary box" value="申请" /> &nbsp;&nbsp;&nbsp;
                <a  class="btn btn-primary" onclick="back()"/>返回
                </a>
            </td>
        </tr>
        <tr class="tr1"></tr>
        </tbody>
    </table>
    <table class="data display datatable table1">
        <thead>
        <tr>
            <th class="sorting" style="width: 5%;">序号</th>
            <th class="sorting" style="width: 5%;">资质版本</th>
            <th class="sorting" style="width: 5%;">资质份数</th>
            <th class="sorting" style="width: 20%;">资质流水号 </th>
            <th class="sorting" style="width:15%;">申请时间  </th>
            <th class="sorting" style="width:15%;">申请人 </th>
            <th class="sorting" style="width:20%;">申请说明 </th>
            <th class="sorting" style="width:15%;">资质状态 </th>
        </tr>
        </thead>
        <tbody>

        <c:if test="${approvalTrialQualifications != null}" >
        <tr class="odd gradeX">
            <td>${approvalTrialQualifications.id}</td>
            <td class="center"> 报审版 </td>
            <td class="center">${approvalTrialQualifications.qualificationnumber}</td>
            <td class="center">${approvalTrialQualifications.qualificationserialnumber}</td>
            <td class="center"><fmt:formatDate value="${approvalTrialQualifications.createtime}" pattern="yyyy年MM月dd日" /></td>
            <td class="center"> ${approvalTrialQualifications.user.name}</td>
            <td class="center">${approvalTrialQualifications.qualificationremarks}</td>
            <c:if test="${approvalTrialQualifications.isQualifications == 0}">
                <td class="center">已提交</td>
            </c:if>
            <c:if test="${approvalTrialQualifications.isQualifications == 1}">
                <td class="center">已出资质</td>
            </c:if>
        </tr>
        </c:if>

        <c:if test="${approvalAgreelQualifications != null}" >
        <tr class="odd gradeX">
            <td>${approvalAgreelQualifications.id}</td>
            <td class="center"> 报批版 </td>
            <td class="center">${approvalAgreelQualifications.qualificationnumber}</td>
            <td class="center">${approvalAgreelQualifications.qualificationserialnumber}</td>
            <td class="center"><fmt:formatDate value="${approvalAgreelQualifications.createtime}" pattern="yyyy年MM月dd日" /></td>
            <td class="center"> ${approvalAgreelQualifications.user.name}</td>
            <td class="center">${approvalAgreelQualifications.qualificationremarks}</td>
            <c:if test="${approvalAgreelQualifications.isQualifications == 0}">
                <td class="center">已提交</td>
            </c:if>
            <c:if test="${approvalAgreelQualifications.isQualifications == 1}">
                <td class="center">已出资质</td>
            </c:if>
        </tr>
        </c:if>



    </table>
    <div id="dialogBg"></div>
    <div id="dialog" class="animated">
        <img class="dialogIco" width="50" height="50" src="/images/ico.png" alt="" />
        <div class="dialogTop">
            <a href="javascript:0" class="claseDialogBtn">关闭</a>
        </div>
        <form id="editForm">
            <ul class="editInfos">
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>项目名称：</div ><div style="width:70%; float:left; text-align:left;">[${projectInfo.number}]${projectInfo.name}</div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>审批/备案部门：</div ><div style="width:70%; float:left; text-align:left;">${projectInfo.filingdepartment}</div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>资质版本：</div >
                    <div style="width:70%; float:left; text-align:left;">
                        <select onchange="onchangeVersion()" id="qualificationsVersion">
                            <c:if test="${approvalAgreelQualifications != null}">
                                <option value="0">报审版</option>
                            </c:if>
                            <c:if test="${approvalAgreelQualifications != null}">
                                <option value="1">报批版</option>
                            </c:if>
                        </select>
                    </div>
                </li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>资质份数：</div ><div style="width:70%; float:left; text-align:left;"><input type="text" id="qualificationnumber" name="qualificationnumber" style="width: 90%; border: 1px solid rgba(144,144,144,.8); " /></div></li>
                <li><div style="width:30%; float:left; text-align:right;"><font color="#ff0000">* </font>申请说明：</div ><div style="width:70%; float:left; text-align:left;"><textarea  style="width: 99%; height: 60px; border: 1px solid rgba(144,144,144,.8); " id="qualificationremarks" name="qualificationremarks"></textarea></div></li>
                <li><input type="button" value="确认申请" class="submitBtn" onclick="save()"/></li>
            </ul>
        </form>
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
                qualificationnumber:{
                    required:true,
                    min:1,
                    max:30
                },
                qualificationremarks:{
                    required:true,
                }
            },
            messages:{
                qualificationnumber:{
                    required:"该项为必填",
                    min:"份数可选范围为1到30",
                    max:"份数可选范围为1到30"
                },
                qualificationremarks:{
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

    //填空弹框
    function changeQualification(qualificationsVersion) {
        if(qualificationsVersion == 0){
            $('#qualificationnumber').val('${approvalTrialQualifications.qualificationnumber}');
            $('#qualificationremarks').text('${approvalTrialQualifications.qualificationremarks}');
        }
        if(qualificationsVersion == 1){
            $('#qualificationnumber').val('${approvalAgreelQualifications.qualificationnumber}');
            $('#qualificationremarks').text('${approvalAgreelQualifications.qualificationremarks}');
        }
    }

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


        //默认填充弹框
        changeQualification($('#qualificationsVersion').val());


    });
</script>

<!-- 返回 -->
<script type="text/javascript">
    function back() {
        window.location.href=document.referrer;
    }
</script>

<script type="text/javascript">
    function onchangeVersion() {
        changeQualification($('#qualificationsVersion').val());
    }


    //保存到数据库
    function save() {
        if (!$("#editForm").valid()) {
            return;
        }
        if (!confirm("您确定申请该资质补办吗?")) {
            return;
        }
        $.ajax({
            "type": "POST",
            "url": "/api/admin/project/qualificationsReissue",	//传输路径
            "data": {
                "id":${projectInfo.id},
                "qualificationsVersion":$('#qualificationsVersion').val(),
                "qualificationnumber":$('#qualificationnumber').val(),
                "qualificationremarks":$('#qualificationremarks').val()
            },
            "success": function (data) {
                if (data == "OK") {
                    alert("申请资质补报成功");
                    window.location.href = "/api/admin/iframe/qualificationsReissueList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        });
    }
</script>
</html>