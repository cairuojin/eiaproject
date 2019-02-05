<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />
    <script src="/js/jquery.min.js" type="text/javascript"></script>
    <script src="/js/dateFormat.js" type="text/javascript"></script>
</head>
<body>
<div class="info" >
    <div  >
        <form id="projectForm">
            <table class="form">
                <tr>
                    <td class="col11 tdcss1">
                        <label class="labelsize">项目编号</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="number" disabled="disabled"/>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize">项目名称</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="name" name="name" />
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >建设方</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="builder" />
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >所在区域</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <select id="province" name="province">
                            <option value="-1">==== 请选择 ====</option>
                            <c:forEach items="${provinces}" var="province">
                                <option value="${province.provinceid}">${province.province}</option>
                            </c:forEach>
                            <%--<option value="0">广东省</option>--%>
                        </select>
                        <select id="cities" name="cities" >
                        </select>
                        <select id="areas" name="areas" >
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >审批/备案部门</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="filingDepartment" />
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >建设地点</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="constructionSite" />
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >文件类型</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <select id="fileType" name="fileType">
                            <option value="-1">==== 请选择 ====</option>
                            <c:forEach items="${fileTypeList}" var="fileType">
                                <option value="${fileType.id}" shortname="${fileType.shortname}">${fileType.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >评价范围类别</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <select id="evaluationScope" name="evaluationScope">
                            <option value="-1">————</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >项目联系人</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="contacts" name="contacts"/>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >建设方联系电话</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="builderContact" name="builderContact"/>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >所属部门</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <select id="subordinateDepartmentId" name="subordinateDepartmentId">
                                <option value="-1">====请选择====</option>
                            <c:forEach items="${departments}" var="department">
                                <option value="${department.id}">${department.parentName} - ${department.name}</option>
                            </c:forEach>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >项目承接人</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <select id="projectUndertakerUserId" name="projectUndertakerUserId">
                            <option value="-1">————</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >预估合同款(万元)</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="contractMoney" name="contractMoney"/>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >备注</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <textarea   id="remarks" name="remarks" clos="500" rows="6"  width="500px" style="width:100%;"></textarea>
                    </td>
                </tr>
            </table>
        </form>
        <div class="btnnew" >
            <input type="submit" class="btn btn-primary" value="添加" onclick="addProject()" >
            </input>&nbsp;&nbsp;&nbsp;&nbsp;
            <a onclick="back()" class="btn btn-primary">返回</a>
        </div>
    </div>

</div>
</body>

<script src="/js/jquery.min.js" type="text/javascript"></script>
<script src="/js/jquery.validate.min.js"></script>

<!-- 表单校验 -->
<script>
    $(document).ready(function() {
        //赋值项目编号
        var time = (new Date()).Format("yyyyMMddhhmmss")
        $('#number').val(time);


        //自定义区域校验
        jQuery.validator.addMethod("notEquilTo_1", function(value, element) {
            return value == -1 ? false : true;
        }, "请选择");

        //添加文件校验
        $('#projectForm').validate({
            rules:{
                name:{
                    required:true,
                    maxlength:30,
                },
                builder:{
                    maxlength: 30,
                },
                areas:{
                    required:true,
                    notEquilTo_1: true
                },
                filingDepartment:{
                    maxlength: 30
                },
                constructionSite:{
                    maxlength: 30
                },
                fileType:{
                    required:true,
                    notEquilTo_1: true
                },
                evaluationScope:{
                    required:true,
                    notEquilTo_1: true
                },
                contacts:{
                    maxlength: 30
                },
                builderContact:{
                    maxlength: 30
                },
                subordinateDepartmentId:{
                    required:true,
                    notEquilTo_1: true
                },
                projectUndertakerUserId:{
                    required:true,
                    notEquilTo_1: true
                },
                contractMoney:{
                    number:true
                }
            },
            messages:{
                name:{
                    required:"必须填写项目名称",
                    maxlength:"项目名称最多30位哦！",
                },
                builder:{
                    maxlength: "建设方最多30位哦！",//最多30个字符
                },
                areas:{
                    required:"请选择区域",
                    areaNotEqualTo: "请选择区域"
                },
                filingDepartment:{
                    maxlength:"部门最多30位哦！"
                },
                constructionSite:{
                    maxlength:"建设地点最多30位哦！"
                },
                fileType:{
                    required:"请选择文件类型！",
                    notEquilTo_1: "请选择文件类型！"
                },
                evaluationScope:{
                    required:"请先选择文件类型！",
                    notEquilTo_1: "请先选择文件类型！"
                },
                contacts:{
                    maxlength: "项目联系人最多30位哦！"
                },
                builderContact:{
                    maxlength: "建设方联系电话最多30位哦！"
                },
                subordinateDepartmentId:{
                    required:"必须选择所属部门！",
                    notEquilTo_1: "必须选择所属部门！"
                },
                projectUndertakerUserId:{
                    required:"请先选择所属部门！",
                    notEquilTo_1: "请先选择所属部门！"
                },
                contractMoney:{
                    number:"必须填写合法的数字"
                }
            }
        });
    });
</script>

<!-- 添加项目 -->
<script type="text/javascript">
    function addProject() {
        if ($("#projectForm").valid()) {
            var data = {
                "number": $('#number').val(),
                "name": $('#name').val(),
                "builder": $('#builder').val(),
                "province": $('#province').val(),
                "city": $('#cities').val(),
                "area": $('#areas').val(),
                "filingdepartment": $('#filingDepartment').val(),
                "constructionsite": $('#constructionSite').val(),
                "filetype": $('#fileType').val(),
                "evaluationscope": $('#evaluationScope').val(),
                "contacts": $('#contacts').val(),
                "buildercontact": $('#builderContact').val(),
                "subordinatedepartmentid": $('#subordinateDepartmentId').val(),
                "projectundertakeruserid": $('#projectUndertakerUserId').val(),
                "contractmoney": $('#contractMoney').val(),
                "remarks": $('#remarks').val(),
            }

            $.ajax({
                "type": "POST",
                "url": "/api/admin/project/addProject",	//传输路径
                "data": data,
                "success": function (data) {
                    if ("OK" == data) {
                        alert("添加成功");
                        parent.location.reload();
                    } else {
                        alert(data);
                    }
                }
            })
        }
    }
</script>

<!-- 文件类型change 加载评价范围类别 -->
<script type="text/javascript">
    $('#fileType').change(function () {
        $.ajax({
            "type": "GET",
            "url": "/api/admin/assist/getEvaluationScope",	//传输路径
            "data": {"fileTypeId": $('#fileType').val()},
            "success": function (data) {
                //修改项目编号
                var str = $('#number').val();
                var shortname = $('#fileType option:selected').attr('shortname');
                var number = str.split('_')[0] + '_' + shortname;
                $('#number').val(number);


                var evaluationScope = $('#evaluationScope');
                evaluationScope.empty();   //清除原有内容
                for (var i = 0; i < data.length; i++) {
                    evaluationScope.append(
                        "<option value=" + data[i].id + ">" + data[i].name + "</option>"
                    );
                }
            }
        })
    })
</script>

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

<!-- 根据部门获得其员工 -->
<script type="text/javascript">
    $('#subordinateDepartmentId').change(function () {
        $.ajax({
            "type": "GET",
            "url": "/api/admin/user/getUsersListByDepartment",	//传输路径
            "data": {"departmentId": $('#subordinateDepartmentId').val()},
            "success": function (data) {
                if(data.length == 0){
                    alert("该部门下还没有员工，请联系管理员添加。");
                }
                var userSelect = $('#projectUndertakerUserId');
                userSelect.empty();
                userSelect.append("<option value='-1'>== 请选择 ==</option>");
                for (var i = 0; i < data.length; i++) {
                    userSelect.append(
                        "<option value=" + data[i].id + ">" + data[i].name + " - " + data[i].roleName +  "</option>"
                    );
                }
            }
        })
    })
</script>

<!-- 返回 -->
<script type="text/javascript">
    function back() {
        window.location.href=document.referrer;
    }
</script>
</html>