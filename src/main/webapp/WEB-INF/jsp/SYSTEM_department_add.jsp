<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tbume</title>
    <link rel="stylesheet" type="text/css" href="/css/maincss.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />

    <script src="/js/jquery.min.js" type="text/javascript"></script>
</head>
<body>
<div class="firminfo_3"  id="abc">
    <div class="firmmenu2">
        <a id="departmentInfo">本部门信息</a>
        <a href="javascript:0"  id="departmentAdd" style="background-color:lightslategray;  ">新增下级部门</a>
    </div>
    <div class="firminfo_1">
        <div class="info">
            <div class="info1">
                <form>
                    <table class="form">
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize">
                                    部门名称</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="grumble" />
                            </td>
                        </tr>

                        <tr>
                            <td class="col1 tdcss1">
                                <label class="labelsize">
                                    机构类型</label>
                            </td>
                            <td class="col2 tdcss2" style="padding-left: 30px;">
                                <input type="radio" name="rd1" style="font-size: 14px;"/>
                                公司
                                <input type="radio" name="rd1" style="font-size: 14px;" />
                                部门
                            </td>
                        </tr>

                        <tr>
                            <td class="col1 tdcss1">
                                <label class="labelsize">
                                    上级部门</label>
                            </td>
                            <td class="col2 tdcss2" style="padding-left: 30px;">
                                <select id="select" name="select">
                                    <option value="1">广东广州</option>
                                    <option value="2">Value 2</option>
                                    <option value="3">Value 3</option>
                                </select>
                            </td>
                        </tr>


                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >
                                    顺序号</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="grumble" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >
                                    部门电话</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="grumble" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >
                                    部门传真</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="grumble" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >
                                    部门邮箱</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="grumble" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >
                                    联系地址</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="grumble" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >
                                    公司网址</label>
                            </td>

                            <td class="col2 tdcss2" style="padding-left: 30px;" >
                                <input type="text" id="grumble" />
                            </td>
                        </tr>
                        <tr>
                            <td class="col1 tdcss1" >
                                <label class="labelsize" >
                                    备注</label>
                            </td>

                            <td  style="padding-left: 30px;" >
                                <textarea   name="txt" clos="500" rows="6"  width="500px" style="width:100%;"></textarea>

                            </td>
                        </tr>

                    </table>
                </form>
                <div class="btnnew" >
                    <input type="submit" class="btn btn-primary" value="确定"  >
                    </input>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
    $(function () {
        $('#departmentInfo').attr('href','/api/admin/iframe/department/info?id='+ parent.selectDepartment);
    })
</script>
</html>