<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>部门管理</title>
    <link rel="stylesheet" type="text/css" href="/css/maincss.css" media="screen"/>


    <link rel="stylesheet" href="/css/jsTree/style.min.css"/>


</head>
<body>


<div class="firmmenu" style="font-size: 20px;">
    <div class="topmenu">部门导航</div>

    <div id="jstree" class="firmmenu1"></div>

</div>
<div class="firminfo">
    <div class="block" style="height:560px;">

        <iframe id="menuIframe" class="menu-iframe" frameborder="0" src="/api/admin/iframe/department/add" width="100%" height="99%"></iframe>


    </div>


</div>

</body>
<script src="/js/jquery.min.js" type="text/javascript"></script>
<script src="/js/jstree.min.js"></script>
<script type="text/javascript">
    $(function () {
        $('#jstree').jstree
        ({
            plugins: ["types", "themes", "state"],  // state保存选择状态
            "types": {
                "default": {
                    "icon": false  // 关闭默认图标
                },
            },
            'core': {
                "themes": {"stripes": true},  // 条纹主题
                'data': [
                    <c:forEach items="${departments}" var="department">
                    <c:if test="${department.parentId == -1}">
                    {"id": '${department.id}', "parent": '#', "text": '${department.name}'},
                    </c:if>
                    <c:if test="${department.parentId != -1}">
                    {"id": '${department.id}', "parent": '${department.parentId}', "text": '${department.name}'},
                    </c:if>
                    </c:forEach>
                ]
            }
        });
    });

    var selectDepartment = 1;  //当前选择的id
    var selectDepartmentName = -1;
    <!-- 点击导航加载相应部门页面 -->
    $('#jstree').on("changed.jstree", function (e, data) {
        selectDepartment = data.selected;
        selectDepartmentName = data.instance.get_node(data.selected[0]).text;
        $('#menuIframe').attr('src','/api/admin/iframe/department/info?id='+ selectDepartment);
    });

</script>
</html>