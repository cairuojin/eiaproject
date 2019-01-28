<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="/css/ie6.css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie.css" media="screen" /><![endif]-->
    <!--Jquery UI CSS-->



    <!-- BEGIN: load jquery -->
    <script src="/js/jquery.min.js" type="text/javascript"></script>

    <script type="text/javascript" src="/js/jquery-ui/jquery.ui.core.min.js"></script>
    <!-- END: load jquery -->
    <!--jQuery Date Picker-->
    <script src="/js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script>
    <script src="/js/jquery-ui/jquery.ui.datepicker.min.js" type="text/javascript"></script>
    <script src="/js/jquery-ui/jquery.ui.progressbar.min.js" type="text/javascript"></script>
    <!--Fancy Button-->
    <script src="/js/setup.js" type="text/javascript"></script>
    <!-- Load TinyMCE -->
    <script src="/js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            //添加文件校验
            $('#chooseImage').on('change',function(){
                var filePath = $(this).val();
                fileFormat = $(this).val().substring(filePath.lastIndexOf(".")).toLowerCase();
                src = window.URL.createObjectURL(this.files[0]); //转成可以在本地预览的格式
                // 检查是否是图片
                if( !fileFormat.match(/.png|.jpg|.jpeg/) ) {
                    alert('上传错误,文件格式必须为：png/jpg/jpeg');
                    $(this).val('');
                    return;
                }
                $('#cropedBigImg').attr('src',src);
            });
            setupTinyMCE();
            setupProgressbar('progress-bar');
            setDatePicker('date-picker');
            setupDialogBox('dialog', 'opener');
            $('input[type="checkbox"]').fancybutton();
            $('input[type="radio"]').fancybutton();
        });
    </script>


</head>
<body>
<div class="info">
    <div class="info1">
        <form>
            <table class="form">
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize">账号</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="username" disabled="disabled" value="${user.username}"/>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >姓名</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="name" value="${user.name}"/>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1">
                        <label class="labelsize">性别</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <c:if test="${user.sex == 0}">
                            <input type="radio" id="sex" value="1" style="font-size: 14px;" />男
                            <input type="radio" id="sex" value="2" style="font-size: 14px;" />女
                        </c:if>
                        <c:if test="${user.sex == 1}">
                            <input type="radio" id="sex" value="1" style="font-size: 14px;" checked="checked"/>男
                            <input type="radio" id="sex" value="2" style="font-size: 14px;" />女
                        </c:if>
                        <c:if test="${user.sex == 2}">
                            <input type="radio" id="sex" value="1" style="font-size: 14px;" />男
                            <input type="radio" id="sex" value="2" style="font-size: 14px;" checked="checked"/>女
                        </c:if>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1">
                        <label class="labelsize">部门</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <select id="department">
                            <c:forEach items="${departments}" var="department">
                                <c:if test="${user.department == department.id}">
                                    <option value="${department.id}" selected="selected">${department.parentName} - ${department.name}</option>
                                </c:if>
                                <c:if test="${user.department != department.id}">
                                    <option value="${department.id}">${department.parentName} - ${department.name}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1">
                        <label class="labelsize">角色</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <select id="role">
                            <c:forEach items="${roleList}" var="role" varStatus="index">
                                <c:if test="${user.role == role.id}">
                                    <option value="${index.index}" selected="selected">${role.rolename}</option>
                                </c:if>
                                <c:if test="${user.role != role.id}">
                                    <option value="${index.index}">${role.rolename}</option>
                                </c:if>
                            </c:forEach>
                            <%--<option value="1">管理员</option>--%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1">
                        <label class="labelsize">入职时间</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <input type="date" id="hiredate" value="<fmt:formatDate value='${user.hiredate}' pattern='yyyy-MM-dd'></fmt:formatDate>">
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >联系方式</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="contactway" value="${user.contactway}" />
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >微信</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="wechat" value="${user.wechat}"  />
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >公司邮箱</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="email" value="${user.email}"/>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >办公地点</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" class="large" id="officelocation" value="${user.officelocation}"/>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >上传照片</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="file" class="large" id="chooseImage" />
                    </td>
                </tr>
            </table>
        </form>
        <div class="btnnew" >
            <input type="button" class="btn btn-primary" value="修改" onclick="updatePersonInfo()">
        </div>
    </div>
    <div style="text-align: center;">
        <img class="personalimg" id="cropedBigImg" src="/${user.imgurl}">
    </div>
</div>
</body>
<script type="text/javascript">
    function updatePersonInfo() {
        var fileObj = $('#chooseImage')[0].files[0];
        var formFile = new FormData();
        formFile.append("action", "UploadVMKImagePath");
        formFile.append("file", fileObj); //加入文件对象
        formFile.append("name",$('#name').val());
        formFile.append("sex",$('#sex').val());
        formFile.append("department",$('#department').val());
        formFile.append("role",$('#role').val());
        formFile.append("hiredate",$('#hiredate').val());    <!-- todo date校验 -->
        formFile.append("contactway",$('#contactway').val());
        formFile.append("wechat",$('#wechat').val());
        formFile.append("email",$('#email').val());
        formFile.append("officelocation",$('#officelocation').val());
        var data = formFile;
        $.ajax({
            "type":"POST",
            "url":"/api/admin/user/updatePersonalInfo",	//传输路径
            processData: false,//用于对data参数进行序列化处理 这里必须false
            contentType: false, //必须
            "data":data,
            "success":function(data){
                if(data == "OK"){
                    alert("更新成功");
                }
            },
            "error":function (data) {
                alert(data);
            }
        })
    }
</script>
</html>