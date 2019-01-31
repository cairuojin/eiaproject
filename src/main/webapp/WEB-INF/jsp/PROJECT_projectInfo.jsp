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


    <script type="text/javascript">
        $(document).ready(function () {
            setupLeftMenu();
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            setupTinyMCE();
            setupProgressbar('progress-bar');
            setDatePicker('date-picker');
            setDatePicker('date-picker2');


        });
    </script>

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
                项目编号</label> <input type="text" id="grumble"/>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">
                    项目名称</label> <input type="text" id="grumble"/>
                &nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;
                <span class="span_search">+高级搜索</span>
            </td>

        </tr>

        <tr class="gradeX odd1 k">
            <td><label class="labelsize">
                文件类型</label> <select id="select" name="select">
                <option value="0">全部</option>
                <option value="1">建设项目环境影响报告书</option>
                <option value="2">建设项目环境影响报告表</option>
                <option value="3">建设项目环境影响报告表-专项</option>
                <option value="4">规划类环境影响报告书</option>
                <option value="5">地下水评价</option>
                <option value="6">排污许可技术报告</option>
                <option value="7">应急预案</option>
                <option value="8">验收报告</option>
                <option value="9">变更补充报告</option>
                <option value="10">现状评估报告</option>
                <option value="11">建设项目安全预评价</option>

            </select>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">
                    项目状态</label>
                <select id="select1" name="select" style="width:220px;">
                    <option value="0">全部</option>
                    <option value="1">待分配人员</option>
                    <option value="2">待录入踏勘信息</option>
                    <option value="3">待录入风险分析</option>
                    <option value="4">待部门承接判定</option>
                    <option value="5">待总工办承接判定</option>
                    <option value="6">待总经理承接判定</option>
                    <option value="7">待录入合同信息</option>
                    <option value="8">待合同信息领导签字</option>
                    <option value="9">待合同信息财务签字</option>
                    <option value="10">待合同盖章签字</option>
                    <option value="11">待制定收款计划</option>
                    <option value="12">待进行项目收款管理</option>
                    <option value="13">待执行工作计划</option>
                    <option value="14">待完成工作计划</option>
                    <option value="15">待提交监测方案</option>
                    <option value="16">待提交初版报告</option>
                    <option value="17">待初审</option>
                    <option value="18">待初审后修改</option>
                    <option value="19">待落实初审</option>
                    <option value="20">待定稿审核</option>
                    <option value="21">待定稿审核后修改</option>
                    <option value="22">待落实定稿</option>
                    <option value="23">待申请报审资质</option>
                    <option value="24">待出报审资质</option>
                    <option value="25">待进行会议总结</option>
                    <option value="26">待提交报批/最终版报告</option>
                    <option value="27">待录入评审会意见</option>
                    <option value="28">待申请报批资质</option>
                    <option value="29">待出报批资质</option>
                    <option value="30">待录入批复信息</option>
                    <option value="31">待申请存档</option>
                    <option value="32">待领导签字存档清单</option>
                    <option value="33">待存档</option>
                    <option value="34">已存档</option>

                </select>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">
                    角色姓名</label> <select id="select2" name="select">
                    <option value="0">全部</option>
                    <option value="1">组织人</option>
                    <option value="2">承接人</option>
                    <option value="3">主持人</option>
                </select>
                <input type="text" class="nputname" id="inputname" disabled="disabled">
                <script>
                    $(document).ready(function () {
                        $("#select2").bind("change", function () {
                            if ($("#select2 option:selected").index() == 0)

                                $("#inputname").attr("disabled", "disabled");

                            else
                                $("#inputname").removeAttr("disabled");
                        })
                    });
                </script>
                &nbsp;&nbsp;&nbsp;
                <label class="labelsize">
                    所属部门</label> <select id="select3" name="select">
                    <option value="0">全部</option>
                    <option value="1">组织人</option>
                    <option value="2">承接人</option>
                    <option value="3">主持人</option>
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
                    项目地域</label> <select id="select5" name="select">
                <option value="0">全部</option>
                <option value="0">广东省</option>
            </select>
                <select id="select6" name="select">
                    <option value="0">——</option>
                    <option value="0">广州市</option>
                </select>
                <select id="select7" name="select">
                    <option value="0">——</option>
                    <option value="0">白云区</option>
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
        <tr class="odd gradeX">

            <td>1</td>
            <td>环保</td>
            <td class="center"> 第二部门</td>
            <td class="center">应急报告</td>
            <td class="center"> 环评主任</td>
            <td>管理员</td>
            <td>管理员</td>
            <td class="center"> 管理员</td>
            <td class="center">待人员分配</td>

            <td class="center">
                <a href="">修改</a>&nbsp;&nbsp;
                <a href="">删除</a>
                <a href="">详细</a>&nbsp;
            </td>
        </tr>


    </table>
    <div class="block"></div>


</div>
<div class="clear">
</div>
</div>
</body>
</html>