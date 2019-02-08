<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>

    <script src="/js/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".span_search").bind("click", function () {
                $(".k").slideToggle();
                var con = $(".span_search").html();
                if (con.toString() == "+高级搜索")
                    $(".span_search").html("-高级搜索");
                else
                    $(".span_search").html("+高级搜索");
            });
        });
    </script>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/layout.css">
    <link rel="stylesheet" href="/css/maincss.css">
    <link rel="stylesheet" href="/css/ie.css">
    <link rel="stylesheet" href="/css/ie6.css">
    <link href="/css/themes/base/jquery.ui.all.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="/js/jquery-ui/jquery.ui.core.min.js"></script>
    <script src="/js/jquery-ui/jquery.ui.widget.min.js"></script>
    <script src="/js/jquery-ui/jquery.ui.datepicker.min.js" type="text/javascript"></script>
    <script src="/js/jquery-ui/jquery.ui.accordion.min.js"></script>
    <script src="/js/jquery-ui/jquery.ui.progressbar.min.js" type="text/javascript"></script>

    <script src="/js/setup.js"></script>
    <script src="/js/tiny-mce/jquery.tinymce.js" type="text/javascript"></script>

</head>
<body>

<div class="grid_100">
    <table class="data display datatable table1">
        <thead>
        <tr>
            <th class="sorting searchbar" style="width: 100%;"> 搜索</th>

        </tr>
        </thead>
        <tbody>
        <tr class="gradeX odd1">
            <td><label class="labelsize">
                项目编号</label> <input type="text" id="number" name="number"/>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">
                    项目名称</label> <input type="text" id="name" name="name"/>
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                <span class="span_search">+高级搜索</span>
            </td>

        </tr>

        <tr class="gradeX odd1 k">
            <td><label class="labelsize">
                文件类型</label> <select id="filetype" name="filetype">
                <option value="-1">==== 全部 ====</option>
                <c:forEach items="${projectInfoFileTypes}" var="fileType">
                    <option value="${fileType.id}" shortname="${fileType.shortname}">${fileType.name}</option>
                </c:forEach>

            </select>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">
                    项目状态</label>
                <select id="status" name="status" style="width:220px;">
                    <option value="-1">全部</option>
                    <c:forEach items="${projectInfoStatuses}" var="status">
                        <option value="${status.id}">${status.name}</option>
                    </c:forEach>

                </select>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">
                    角色姓名</label> <select id="roleType" name="roleType">    <!-- todo -->
                    <option value="0">全部</option>
                    <option value="1">组织人</option>
                    <option value="2">承接人</option>
                    <option value="3">主持人</option>
                </select>
                <input type="text" class="nputname" id="roleName" disabled="disabled">
                <script>
                    $(document).ready(function () {
                        $("#roleType").bind("change", function () {
                            if ($("#roleType option:selected").index() == 0)

                                $("#roleName").attr("disabled", "disabled");

                            else
                                $("#roleName").removeAttr("disabled");
                        })
                    });
                </script>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">
                    所属部门</label> <select id="subordinateDepartmentId" name="subordinateDepartmentId">
                    <option value="-1">全部</option>
                    <c:forEach items="${departments}" var="department">
                        <option value="${department.id}">${department.parentName} - ${department.name}</option>
                    </c:forEach>
                </select>
                &nbsp;&nbsp;&nbsp;
            </td>

        </tr>
        <tr class="gradeX odd1 k">
            <td>
                <label class="labelsize">
                    审批级别</label> <select id="select4" name="select" style="width:200px;">
                <option value="0">全部</option>
                <option value="1">待定</option>
                <option value="2">部级（国家级）</option>
                <option value="3">省级（自治区/直辖市）</option>
                <option value="4">市级（市区/自治州）</option>
                <option value="5">县级</option>
            </select>
                &nbsp;&nbsp;&nbsp;

                <label class="labelsize">
                    项目地域</label> <select id="province" name="province">
                <option value="-1">==== 全部 ====</option>
                <c:forEach items="${provinces}" var="province">
                    <option value="${province.provinceid}">${province.province}</option>
                </c:forEach>
            </select>
                <select id="cities" name="cities">
                </select>
                <select id="areas" name="areas">
                </select>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">
                    合同编号</label> <input type="text" id="grumble"/>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">
                    档案编号</label> <input type="text" id="grumble"/>
                &nbsp;&nbsp;&nbsp;
            </td>
        </tr>
        <tr class="gradeX odd1 k">
            <td class="col1 tdcss1" style="text-align: left;">
                <label class="labelsize">
                    承接时间</label>
                &nbsp;&nbsp;从
                <input type="text" id="date-picker"/>到
                <input type="text" id="date-picker2"/>

            </td>
        </tr>
        <tr class=" gradeX odd2">
            <td style="text-align: right;">
                <input type="submit" class="btn btn-primary" value="查询">&nbsp;&nbsp;&nbsp;
                <a href="/api/admin/iframe/projectInfo_add" class="btn btn-primary"
                   style="margin-top:2px; height: 30px; line-height: 30px; ">新建项目</a>
                &nbsp;
                <input type="submit" class="btn btn-primary" value="导出excel">&nbsp;&nbsp;&nbsp;
                </input>
            </td>
        </tr>
        <tr class="tr1"></tr>
        </tbody>
    </table>

    <table class="data display datatable table1">
        <thead>
        <tr>
            <th class="sorting" style="width: 2.5%;"> 序号</th>
            <th class="sorting" style="width: 20%;">项目名称</th>
            <th class="sorting" style="width: 7.5%;">所属部门</th>
            <th class="sorting" style="width: 10%;">文件类型</th>
            <th class="sorting" style="width: 7.5%;">承接人</th>
            <th class="sorting" style="width: 7.5%;">主持人</th>
            <th class="sorting" style="width: 7.5%;">组织人</th>
            <th class="sorting" style="width: 7.5%;">创建人</th>
            <th class="sorting" style="width: 10%;">项目状态</th>
            <th class="sorting" style="width: 20%;">操作</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${projectListVo.projectInfos}" var="projectInfo">
            <tr class="odd gradeX">
                <td>${projectInfo.id}</td>
                <td>[${projectInfo.number}]${projectInfo.name}</td>
                <td class="center">${projectInfo.department.parentName} - ${projectInfo.department.name}</td>
                <td class="center">${projectInfo.filetypeName}</td>
                <td class="center">${projectInfo.projectundertakeruser.name}</td>
                <td class="center">${projectInfo.hostuser.name}</td>
                <td class="center">${projectInfo.organizinguser.name}</td>
                <td class="center">${projectInfo.createuser.name}</td>
                <td class="center">${projectInfo.statusName}</td>

                <td class="center">
                    <a href="">修改</a>&nbsp;&nbsp;
                    <a href="">删除</a>
                    <a href="">详细</a>&nbsp;
                </td>
            </tr>
        </c:forEach>

    </table>
    <div class="block"></div>


</div>
<div class="clear">
</div>
</div>
</body>

<!-- 省份change修改 -->
<script type="text/javascript">
    $('#province').change(function () {
        $.ajax({
            "type": "GET",
            "url": "/api/admin/assist/getCities",	//传输路径
            "data": {"provinceid": $('#province').val()},
            "success": function (data) {
                var citiesSelect = $('#cities');
                citiesSelect.empty();   //清除原有内容
                $('#areas').empty();   //必须清除三级关联
                citiesSelect.append("<option value='-1'>== 请选择 ==</option>");
                for (var i = 0; i < data.length; i++) {
                    citiesSelect.append(
                        "<option value=" + data[i].cityid + ">" + data[i].city + "</option>"
                    );
                }
            }
        })
    })
</script>

<!-- 市change修改 -->
<script type="text/javascript">
    $('#cities').change(function () {
        $.ajax({
            "type": "GET",
            "url": "/api/admin/assist/getAreas",	//传输路径
            "data": {"cityid": $('#cities').val()},
            "success": function (data) {
                var areasSelect = $('#areas');
                areasSelect.empty();
                areasSelect.append("<option value='-1'>== 请选择 ==</option>");
                for (var i = 0; i < data.length; i++) {
                    areasSelect.append(
                        "<option value=" + data[i].areaid + ">" + data[i].area + "</option>"
                    );
                }
            }
        })
    })
</script>


</html>