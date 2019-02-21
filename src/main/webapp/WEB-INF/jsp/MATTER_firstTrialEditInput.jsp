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
    <link rel="stylesheet" href="/css/common.css">



</head>
<body>
<table class="data display datatable table1" style="width: 98%; margin:5px 1%;">
    <thead>
    <tr>
        <th class="sorting" style="width: 4%;">序号</th>
        <th class="sorting" style="width: 42%;">初审意见</th>
        <th class="sorting" style="width: 42%;">修改内容</th>
        <th class="sorting" style="width: 10%;">操作</th>
    </tr>
    </thead>
    <tbody id="specialtable">
    <c:forEach items="${firstTrialOpinions}" var="firstTrialOpinion" varStatus="index">
        <tr class="odd gradeX">
            <td name="id">${index.index + 1}</td>
            <td class="center">${firstTrialOpinion.firstopinion}</td>
            <td name="updateopinion" class="center" id="updateOpinionInput${firstTrialOpinion.id}"></td>
            <td class="center">
                <a class="box" style="cursor: pointer; background-color: transparent;" onclick="showDiv('${firstTrialOpinion.id}','${firstTrialOpinion.firstopinion}')">编辑修改内容</a>&nbsp;
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<span class="span_tips">  请为每条初审意见填写修改内容，才能提交！</span>
<div id="dialogBg"></div>

<!-- 弹框 -->
<div id="dialog" class="animated">
    <img class="dialogIco" width="50" height="50" src="/images/ico.png" alt="" />
    <div class="dialogTop">
        <a href="javascript:0" class="claseDialogBtn">关闭</a>
    </div>
    <form id="opinionsForm">
        <ul class="editInfos">
            <li><div style="width:30%; float:left; text-align:right; margin-top: 10px; font-weight: bold;"><font color="#ff0000">* </font>初审意见：</div ><div style="width:60%; float:left; text-align:left; margin-top: 10px;" id="firstopinion"></div></li>
            <li ><div style="width:30%; float:left; text-align:right;margin-top: 10px; font-weight: bold;"><font color="#ff0000">* </font>修改内容：</div ><div style="width:70%; float:left; text-align:left; margin-top: 10px;"><textarea style="width: 99%; height: 60px; border: 1px solid rgba(144,144,144,.8); " id="updateOpinionText" name="updateOpinionText"></textarea></div></li>
            <li  style="margin-top: 10px;"><input type="button" value="提交" class="submitBtn" id="updateButton"/></li>
        </ul>
    </form>
</div>

<div class="opinion_css_vice">
    <div  >
        <form id="editForm">
            <table class="form">
                <tr  >
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            初审意见附件：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <a style="font-size: 14px;" href="/${firstTrialReport.firstopinionannex}" download="/${firstTrialReport.firstopinionannex}">下载初版报告</a>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            初审版批注版报告：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <a style="font-size: 14px;" href="/${firstTrialReport.firstannotationreport}" download="/${firstTrialReport.firstannotationreport}">下载初审版批注版报告</a>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            定稿审核报告：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="file" id="finalopinionannex" name="finalopinionannex">
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            定稿审核人：</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <select id="finaltrialuserid" name="finaltrialuserid">
                            <c:forEach items="${userList}" var="user">
                                <option value=${user.id}>${user.name}(${user.roleName})</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>

            </table>
        </form>
    </div>
    <div class="btnnew" style="margin-bottom: 10px;">
        <input type="submit" class="btn btn-primary" value="提交"  onclick="save()"/>
        &nbsp;&nbsp;&nbsp;&nbsp;
    </div>
</div>
</body>

<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.validate.min.js"></script>

<!-- 表单校验 -->
<script>
    $(document).ready(function() {
        //添加表单校验
        $('#opinionsForm').validate({
            rules:{
                updateOpinionText:{
                    required:true,
                }
            },
            messages:{
                updateOpinionText:{
                    required:"该项为必填",
                }
            }
        });

        $('#editForm').validate({
            rules:{
                finalopinionannex:{
                    required:true,
                },
                finaltrialuserid:{
                    required:true
                }
            },
            messages:{
                finalopinionannex:{
                    required:"该项为必填",
                },
                finaltrialuserid:{
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

        //关闭弹窗
        $('.claseDialogBtn').click(function(){
            hiddenDiv();
        });
    });

    //关闭弹窗
    function hiddenDiv() {
        $('#dialogBg').fadeOut(300,function(){
            $('#dialog').addClass('bounceOutUp').fadeOut();
        });
    }

    //显示弹框
    function showDiv(id,firstopinion) {
        className = $(this).attr('class');
        $('#dialogBg').fadeIn(300);
        $('#dialog').removeAttr('class').addClass('animated '+className+'').fadeIn();
        $('#firstopinion').text(firstopinion);

        $('#updateButton').attr('onclick','updateOpinion(' + id + ')')  //更新按钮绑定函数，传递id
    }

    //修改意见
    function updateOpinion(id) {    //将更新意见修改到前端
        if(!$("#opinionsForm").valid()){
            return;
        }
        if ($("#updateOpinionText").val().trim() == ''){
            alert('请输入内容');
            return;
        }
        $('#updateOpinionInput' + id).text($('#updateOpinionText').val())
        $('#updateOpinionText').val('');
        hiddenDiv();
    }

    //保存到数据库
    function save() {
        if(!$("#opinionsForm").valid()){
            return;
        }
        if(!$("#editForm").valid()){
            return;
        }


        var isOK = -1;
        var arr = new Array();//初审意见数组
        $('#specialtable tr').each(function(i){// 遍历 tr
                var map = {};
                $(this).children('td').each(function(j){  // 遍历 tr 的各个 td
                    if($(this).attr('name') != undefined){
                        if($(this).text().trim() == ''){
                            isOK = 1;
                        }
                        map[$(this).attr('name')] = $(this).text()
                    }

                });
                arr.push(map);
        });

        if(isOK ==1){
            alert('请修改完所有的初审意见');
            return;
        }

        if (!confirm("您确定提交初审修改情况吗?")) {
            return
        }


        var formFile = new FormData();
        formFile.append("action", "UploadVMKImagePath");    //必须
        formFile.append("opinionJson", JSON.stringify(arr)); //初审意见
        formFile.append("finaltrialuserid", $('#finaltrialuserid').val()); //复审人
        formFile.append("finalopinionannex", $('#finalopinionannex')[0].files[0]); //复审意见
        formFile.append("projectId",'${projectInfo.id}');

        $.ajax({
            "type": "POST",
            "url": "/api/admin/matter/firstTrialEdit",	//传输路径
            "processData": false,//用于对data参数进行序列化处理 这里必须false
            "contentType": false, //必须
            "data": formFile,
            "success": function (data) {
                if (data == "OK") {
                    alert("您已提交初审修改情况");
                    window.location.href = "/api/admin/iframe/firstTrialEditList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        })
    }
</script>
</html>

