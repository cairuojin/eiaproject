<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加用户</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="css/ie6.css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="css/ie.css" media="screen" /><![endif]-->
    <script src="js/jquery.min.js" type="text/javascript"></script>
</head>
<body>
<div class="info">
    <div class="info1">
        <form id="userForm">
            <table class="form">
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize">账号</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="username" name="username"/>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >姓名</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="name"/>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1">
                        <label class="labelsize">性别</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <input type="radio" name="sex" style="font-size: 14px;" value="1" checked="checked"/>男
                        <input type="radio" name="sex" style="font-size: 14px;" value="2"/>女
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1">
                        <label class="labelsize">部门</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <select id="department" name="department">
                            <c:forEach items="${departments}" var="department">
                                <option value="${department.id}">${department.parentName} - ${department.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1">
                        <label class="labelsize">角色</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <select id="role" name="role">
                            <c:forEach items="${roleList}" var="role" varStatus="index">
                                <option value="${index.index}">${role.rolename}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >密码</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="password" name="newPassword" id="newPassword"/>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >确认密码</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="password" name="newPasswordComfirm" id="newPasswordComfirm" />
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1">
                        <label class="labelsize">入职时间</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;">
                        <input type="date" id="hiredate" name="hiredate" value="2015-01-01">
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >联系方式</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="contactway" />
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >微信</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="wechat" />
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >公司邮箱</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="email"/>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >办公地点</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" class="large" id="officelocation"/>
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
            <input type="submit" class="btn btn-primary" value="添加" onclick="addUser()" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a onclick="back()" class="btn btn-primary"  style="height:30px;line-height: 29px; text-decoration: none;">返回</a>
        </div>

    </div>
    <div style="text-align: center;">
        <img class="personalimg" id="cropedBigImg" src="/未标题-3.png">
    </div>
</div>
</body>

<script src="/js/jquery.min.js" type="text/javascript"></script>
<script src="/js/jquery.validate.min.js"></script>
<script>
    $(document).ready(function() {
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

        $('#userForm').validate({
            rules:{
                username:{
                    required:true,//必填
                    minlength:6, //最少6个字符
                    maxlength:20,//最多20个字符
                    remote:{
                        url: "/api/open/person/usernameExist",
                        type:"post",
                        data:{"username":function() {return $('#username').val();}}  //传入后台的值
                    },
                },
                newPassword:{
                    required:true,
                    minlength: 6, //最少2个字符
                    maxlength: 30,//最多20个字符
                },
                newPasswordComfirm:{
                    equalTo: "#newPassword"
                },
                role:{
                    required:true
                },
                department:{
                    required:true
                },
                hiredate:{
                    required:true
                }
            },
            messages:{
                username:{
                    required:"必须填写用户名",//必填
                    minlength:"用户名最少6位哦！", //最少6个字符
                    maxlength:"用户名最多20位哦！",//最多20个字符
                    remote:"该用户名已经存在",
                },
                newPassword:{
                    required:"必须填写密码",
                    minlength: "密码最少6位哦！", //最少2个字符
                    maxlength: "密码最多30位哦！",//最多30个字符
                },
                newPasswordComfirm:{
                    equalTo: "两次输入的密码不相同！"
                },
                role:{
                    required:"必须选择身份"
                },
                department:{
                    required:"必须选择部门"
                },
                hiredate:{
                    required:"必须填写入职时间"
                }
            }
        });
    });
</script>


<script type="text/javascript">
    function addUser() {
        if($('#userForm').valid()){
            var formFile = new FormData();
            formFile.append("username", $('#username').val());
            formFile.append("password", $('#newPassword').val());
            formFile.append("action", "UploadVMKImagePath");
            formFile.append("file", $('#chooseImage')[0].files[0]); //加入文件对象
            formFile.append("name", $('#name').val());
            formFile.append("sex", $('input[name="sex"]:checked').val());
            formFile.append("department", $('#department').val());
            formFile.append("role", $('#role').val());
            formFile.append("hiredate", $('#hiredate').val());<!-- todo date校验 -->
            formFile.append("contactway", $('#contactway').val());
            formFile.append("wechat", $('#wechat').val());
            formFile.append("email", $('#email').val());
            formFile.append("officelocation", $('#officelocation').val());
            var data = formFile;
            $.ajax({
                "type": "POST",
                "url": "/api/admin/system/addUser",	//传输路径
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                "data": data,
                "success": function (data) {
                    if (data == "OK") {
                        alert("添加用户成功");
                        window.location.href = '/api/admin/iframe/userList'
                    }
                },
                "error": function (data) {
                    alert(data);
                }
            })
        }
    }
</script>

<!-- 返回 -->
<script type="text/javascript">
    function back() {
        window.location.href=document.referrer;
    }
</script>



</html>
