<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tbume</title>
    <link rel="stylesheet" type="text/css" href="/css/maincss.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />

</head>
<body>
<div class="firminfo_2" id="abc">
    <div class="firmmenu2">
        <a href="javascript:0" id="departmentInfo">本部门信息</a>
        <a id="departmentAdd" style="background-color:lightslategray;  ">新增下级部门</a>
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
                                <input type="text" id="name" name="name" value="${department.name}" />
                            </td>
                        </tr>

                        <tr>
                            <td class="col1 tdcss1">
                                <label class="labelsize">机构类型</label>
                            </td>
                            <td class="col2 tdcss2" style="padding-left: 30px;">
                                <c:if test="${department.type== 0}">
                                    <input type="radio" id="type" name="type" value="0" checked="checked"  style="font-size: 14px;"/>公司
                                    <input type="radio" id="type" name="type" value="1" style="font-size: 14px;" />部门
                                </c:if>
                                <c:if test="${department.type== 1}">
                                    <input type="radio" id="type" name="type" value="0" style="font-size: 14px;"/>公司
                                    <input type="radio" id="type" name="type" value="1" checked="checked" style="font-size: 14px;" />部门
                                </c:if>
                            </td>
                        </tr>




                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >顺序号</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="sortOrder" name="sortOrder"  value="${department.sortOrder}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >部门电话</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="phonenum" name="phonenum" value="${department.phonenum}" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >部门传真</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="fax" name="fax" value="${department.fax}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >部门邮箱</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="email" name="email" value="${department.email}"/>
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >联系地址</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="contactaddress" name="contactaddress" value="${department.contactaddress}" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >公司网址</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="website" name="website" value="${department.website}" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >备注</label>
                            </td>

                            <td  style="padding-left: 30px;" >
                                <textarea   id="remarks" name="remarks" clos="500" rows="8"  width="500px" style="width:100%;">${department.remarks}</textarea>
                            </td>
                        </tr>

                    </table>
                </form>
                <div class="btnnew" >
                    <input onclick="updateDepartment()" type="submit" class="btn btn-primary" value="修改"/>
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
<script type="text/javascript">
    $(function () {
        $('#departmentAdd').attr('href','/api/admin/iframe/department/add');
    });

    function updateDepartment() {
        if ($("#departmentForm").valid()){
            if($('#name').val() == "" || $.trim($('#name').val()).length == 0){
                alert("部门名称不能为空");
            } else {
                var data = {
                    "id":Number(parent.selectDepartment),
                    "name":$('#name').val(),
                    "type":$('#type').val(),
                    "sortOrder":$('#sortOrder').val(),
                    "phonenum":$('#phonenum').val(),
                    "fax":$('#fax').val(),
                    "email":$('#email').val(),
                    "contactaddress":$('#contactaddress').val(),
                    "website":$('#website').val(),
                    "remarks":$('#remarks').val(),
                }

                $.ajax({
                    "type":"POST",
                    "url":"/api/admin/system/updateDepartment",	//传输路径
                    "data":data,
                    "success":function(data){
                        if( "OK" == data){
                            alert("修改成功");
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
</html>
