<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>添加部门</title>
    <link rel="stylesheet" type="text/css" href="/css/maincss.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />


</head>
<body>
<div class="firminfo_3"  id="abc">
    <div class="firmmenu2">
        <a id="departmentInfo">本部门信息</a>
        <a href="javascript:0"  id="departmentAdd" style="background-color:lightslategray;color: #ff9278">新增下级部门</a>
    </div>
    <div class="firminfo_1">
        <div class="info">
            <div class="info1">
                <form id="departmentForm">
                    <table class="form">
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize">部门名称</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="name" name="name" />
                            </td>
                        </tr>

                        <tr>
                            <td class="col1 tdcss1">
                                <label class="labelsize">机构类型</label>
                            </td>
                            <td class="col2 tdcss2" style="padding-left: 30px;">
                                <input type="radio" name="type" value="0" style="font-size: 14px;"/>公司
                                <input type="radio" name="type" value="1" style="font-size: 14px;" />部门
                            </td>
                        </tr>

                        <tr>
                            <td class="col1 tdcss1">
                                <label class="labelsize">上级部门</label>
                            </td>
                            <td class="col2 tdcss2" style="padding-left: 30px;">
                                <select id="select" name="select">
                                    <option id="parentId" name="parentId"></option>
                                </select>
                            </td>
                        </tr>


                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >顺序号</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="sortNum" name="sortNum" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >部门电话</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="phonenum" name="phonenum" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >部门传真</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="fax" name="fax" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >部门邮箱</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="email" name="email" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >联系地址</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="contactaddress" name="contactaddress"  />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >公司网址</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="website" name="website" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >备注</label>
                            </td>

                            <td  style="padding-left: 30px;" >
                                <textarea  id="remarks" name="remarks" clos="500" rows="6"  width="500px" style="width:100%;"></textarea>

                            </td>
                        </tr>

                    </table>
                </form>
                <div class="btnnew" >
                    <input onclick="addDepartment()" type="submit" class="btn btn-primary" value="确定" />
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="/js/jquery.min.js" type="text/javascript"></script>
<script src="/js/jquery.validate.min.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        $('#departmentForm').validate({
            rules:{
                name:{
                    required:true
                },

                sortNum:{
                    digits:true
                },
                type:{
                    required:true
                }
            },
            messages:{
                name:{
                    required:"部门名称不能为空"
                },
                sortNum:{
                    digits:"顺序号必须为数字"
                },
                type:{
                    required:"机构类型为必选"
                }
            }
        });
    });
</script>

<script type="text/javascript">
    $(function () {
        $('#departmentInfo').attr('href','/api/admin/iframe/department/info?id='+ parent.selectDepartment);
        $('#parentId').attr('value',parent.selectDepartment);
        $('#parentId').text(parent.selectDepartmentName);   //获取父页面的值
    })

    function addDepartment() {
        if ($("#departmentForm").valid()){
            if($('#name').val() == "" || $.trim($('#name').val()).length == 0){
                alert("部门名称不能为空");
            } else {
                var data = {
                    "name":$('#name').val(),
                    "type":$('input:radio[name="type"]:checked').val(),
                    "parentId":$('#parentId').val(),
                    "sortNum":$('#sortNum').val(),
                    "phonenum":$('#phonenum').val(),
                    "fax":$('#fax').val(),
                    "email":$('#email').val(),
                    "contactaddress":$('#contactaddress').val(),
                    "website":$('#website').val(),
                    "remarks":$('#remarks').val(),
                }

                $.ajax({
                    "type":"POST",
                    "url":"/api/admin/system/addDepartment",	//传输路径
                    "data":data,
                    "success":function(data){
                        if( "OK" == data){
                            alert("添加成功");
                            parent.location.reload();
                        } else {
                            alert(data);
                        }
                    }
                })
            }
        }
    }
</script>
<!-- 表单校验 -->
<script type="text/javascript">
    $(document).ready(function() {
        $('#departmentForm').validate({
            rules:{
                name:{
                    required:true
                }
            },
            messages:{
                name:{
                    required:"部门名称不能为空"
                }
            }
        });
    });
</script>
</html>