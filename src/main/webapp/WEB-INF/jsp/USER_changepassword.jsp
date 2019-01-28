<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>改变密码</title>
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <style>
        .passwordform td{
            border: none;
        }
    </style>
</head>
<body>
<div class="password">
    <form id="passwordForm123">
        <table class="form passwordform">
            <tr>
                <td style="text-align: right;">
                    <label class="labelsize">旧密码</label>
                </td>
                <td style="width: 4%;"></td>
                <td>
                    <input type="password" class="medium" id="oldPassword" name="oldPassword" placeholder="旧密码"/>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">
                    <label class="labelsize">新密码</label>
                </td>
                <td style="width: 4%;"></td>
                <td>
                    <input type="password" class="medium" id="newPassword" name="newPassword" placeholder="新密码"/>
                </td>
            </tr>
            <tr>
                <td style="text-align: right;">
                    <label class="labelsize">新密码确认</label>
                </td>
                <td style="width: 4%;"></td>
                <td>
                    <input type="password" class="medium" id="newPasswordComfirm" name="newPasswordComfirm" placeholder="新密码确认"/>
                </td>
            </tr>
        </table>
        <div class="btnnew" >
            <input class="btn btn-primary" value="修改" onclick="changePassword($('#oldPassword').val(),$('#newPassword').val())" style="width: 30px"/>
        </div>
    </form>



</div>
</body>
<script src="/js/jquery.min.js" type="text/javascript"></script>
<script src="/js/jquery.validate.min.js"></script>
<script>
    $(document).ready(function() {
        $('#passwordForm123').validate({
            rules:{
                oldPassword:{
                    required:true,
                    minlength: 6, //最少2个字符
                    maxlength: 30,//最多20个字符
                },
                newPassword:{
                    required:true,
                    minlength: 6, //最少2个字符
                    maxlength: 30,//最多20个字符
                },
                newPasswordComfirm:{
                    equalTo: "#newPassword"
                }
            },
            messages:{
                oldPassword:{
                    required:"请输入您的密码",
                    minlength: "旧密码最少6位哦！", //最少2个字符
                    maxlength: "旧密码最多30位哦！",//最多30个字符
                },
                newPassword:{
                    required:"请输入您的密码",
                    minlength: "新密码最少6位哦！", //最少2个字符
                    maxlength: "新密码最多30位哦！",//最多30个字符
                },
                newPasswordComfirm:{
                    equalTo: "两次输入的密码不相同！"
                }
            }
        });
    });
</script>
<script>
    function changePassword (oldPassword,newPassword) {
        if ($("#passwordForm123").valid()){    //校验通过
            $.ajax({
                "type":"POST",
                "url":"/api/admin/user/changePassword",	//传输路径
                "data":{
                    "oldPassword":oldPassword,
                    "newPassword":newPassword,
                },
                "success":function(data){
                    if( "OK" == data){
                        alert("密码修改成功，请重新登录！");
                        parent.location.href = "/"
                    } else {
                        alert(data);
                    }
                }
            })
        }
    }
</script>
</html>