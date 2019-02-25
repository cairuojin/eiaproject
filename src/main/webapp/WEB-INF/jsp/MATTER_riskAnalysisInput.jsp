<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>风险信息录入</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen"/>
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen"/>
    <link rel="stylesheet" href="/css/maincss.css">
    <style>
        * {
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
    </style>
</head>
<body>

<form id="riskAnalysisForm" onsubmit="riskAnalysis()">
    <input type="hidden" name="id" value="${projectInfo.id}">
    <div class="risktable1">
        <div class="risk_div" style="width: 15%;  "></div>
        <div class="risk_div" style="width: 20%; ">内容</div>
        <div class="risk_div" style="width: 45%; "> 判定</div>
        <div class="risk_div" style="width: 20%; ">备注及说明</div>
    </div>
    <div class="risktable2">
        <div class="risk_div bg_risk" style="width:15%;   ">资质</div>
        <div class="risk_div bg_risk" style="width:20%; ">
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">环评类别*</div>
            <div class="td_risk">公司资质范围是否含盖*</div>
        </div>
        <div class="risk_div"
             style="width:45%;   background-color: rgba(255,255,255,1); text-align: left; color: black;">
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
                <input type="radio" name="eiacategory"  required="required" value="1"/>
                报告书
                <input type="radio" name="eiacategory"  value="2"/>
                报告表
            </div>
            <div class="td_risk">
                <input type="radio" name="companyqualification"  required="required" value="1"/>
                是
                <input type="radio" name="companyqualification"  value="2"/>
                否
            </div>

        </div>
        <div class="risk_div" style="width:20%; text-align: left;   ">
            <div class="td_risk" style="border-bottom: rgba(144,144,144,.8) 1px solid;">
                <input type="text" id="remarks1" name="remarks1" style="width: 99%;"/>
            </div>
            <div class="td_risk" style="border-bottom: rgba(144,144,144,.8) 1px solid;">
                <input type="text" id="remarks2" name="remarks2" style="width: 99%;"/>
            </div>
        </div>
    </div>
    <div class="risktable3">
        <div class="risk_div bg_risk" style="width:15%;   ">项目基本情况</div>
        <div class="risk_div bg_risk" style="width:20%; ">
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">项目所属行业</div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">工程投资（万元）：</div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">项目建设性质</div>
            <div class="td_risk specialtd" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">建设内容</div>
            <div class="td_risk specialtd" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">主要工艺路线</div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">建设规模</div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">地理位置</div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">立项类别</div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">立项等级</div>
            <div class="td_risk">改扩建企业是否存在问题</div>
        </div>
        <div class="risk_div"
             style="width:45%;   background-color: rgba(255,255,255,1); text-align: left; color: black;">
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
                <input type="text" name="projectinformation" id="projectinformation"  required="required" class="input_css"/>
            </div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
                <input type="text" name="projectinvestment" id="projectinvestment"  required="required" class="input_css"/>
            </div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
                <input type="radio" name="natureconstruction"  required="required" value="1"/>
                新建
                <input type="radio" name="natureconstruction" value="2"/>
                技改
                <input type="radio" name="natureconstruction" value="3"/>
                扩建
                <input type="radio" name="natureconstruction" value="4"/>
                搬迁
                <input type="radio" name="natureconstruction" value="5"/>
                现状评估
            </div>
            <div class="td_risk  specialtd">
                <textarea name="contentsofconstruction" id="contentsofconstruction"  required="required"
                          style="width:80%; height: 48px;"></textarea>
            </div>
            <div class="td_risk  specialtd">
                <textarea name="processroute" id="processroute"  required="required" style="width:80%; height: 48px;"></textarea>
            </div>
            <div class="td_risk">
                <input type="text" name="constructionscale" id="constructionscale"  required="required" class="input_css"/>
            </div>
            <div class="td_risk">
                <input type="text" name="geographicalposition" id="geographicalposition"  required="required" class="input_css"/>
            </div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
                <input type="radio" name="projectcategory"  required="required" value="1"/>
                审批制
                <input type="radio" name="projectcategory" value="2"/>
                备案制
                <input type="radio" name="projectcategory" value="3"/>
                核准制
            </div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
                <input type="radio" name="projectgrade"  required="required" value="1"/>
                国家级
                <input type="radio" name="projectgrade" value="2"/>
                省级
                <input type="radio" name="projectgrade" value="3"/>
                市级
                <input type="radio" name="projectgrade" value="4"/>
                县级
            </div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
                <input type="checkbox" name="extension" value="1"/>
                企业限批
                <input type="checkbox" name="extension" value="2"/>
                未批先建
                <input type="checkbox" name="extension" value="3"/>
                限期治理
                <input type="checkbox" name="extension" value="4"/>
                落后淘汰
                <input type="checkbox" name="extension" value="5"/>
                其他
                <input type="checkbox" name="extension" value="6"/>
                不涉及
            </div>
        </div>
        <div class="risk_div" style="width:20%; text-align: left;   ">
            <div class="td_risk">
                <input type="text" id="remarks3" name="remarks3" style="width: 99%;"/>
            </div>
            <div class="td_risk">
                <input type="text" id="remarks4" name="remarks4" style="width: 99%;"/>
            </div>
            <div class="td_risk">
                <input type="text" id="remarks5" name="remarks5" style="width: 99%;"/>
            </div>
            <div class="td_risk specialtd">
                <input type="text" id="remarks6" name="remarks6" style="width: 99%;"/>
            </div>
            <div class="td_risk specialtd">
                <input type="text" id="remarks7" name="remarks7" style="width: 99%;"/>
            </div>
            <div class="td_risk">
                <input type="text" id="remarks8" name="remarks8" style="width: 99%;"/>
            </div>
            <div class="td_risk">
                <input type="text" id="remarks9" name="remarks9" style="width: 99%;"/>
            </div>
            <div class="td_risk">
                <input type="text" id="remarks10" name="remarks10" style="width: 99%;"/>
            </div>
            <div class="td_risk">
                <input type="text" id="remarks11" name="remarks11" style="width: 99%;"/>
            </div>
            <div class="td_risk">
                <input type="text" id="remarks12" name="remarks12" style="width: 99%;"/>
            </div>

        </div>

    </div>
    <div class="risktable4">
        <div class="risk_div bg_risk" style="width:15%;   ">污染物排放</div>
        <div class="risk_div bg_risk" style="width:20%; ">
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">有无排水去向</div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">有无环境容量</div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">有无污染物排放总量</div>
        </div>
        <div class="risk_div"
             style="width:45%;   background-color: rgba(255,255,255,1); text-align: left; color: black;">
            <div class="td_risk">
                <input type="radio" name="drainage"  required="required" value="1"/>
                有
                <input type="radio" name="drainage" value="2"/>
                无
                <input type="radio" name="drainage" value="3"/>
                不排水
            </div>
            <div class="td_risk">
                <input type="radio" name="environmental"  required="required" value="1"/>
                有
                <input type="radio" name="environmental" value="2"/>
                无
                <input type="radio" name="environmental" value="3"/>
                不确定
            </div>
            <div class="td_risk">
                <input type="radio" name="contaminants"  required="required" value="1"/>
                有
                <input type="radio" name="contaminants" value="2"/>
                无
                <input type="radio" name="contaminants" value="3"/>
                不确定
            </div>
        </div>
        <div class="risk_div" style="width:20%; text-align: left;   ">
            <div class="td_risk">
                <input type="text" id="remarks13" name="remarks13" style="width: 99%;"/>
            </div>
            <div class="td_risk">
                <input type="text" id="remarks14" name="remarks14" style="width: 99%;"/>
            </div>
            <div class="td_risk">
                <input type="text" id="remarks15" name="remarks15" style="width: 99%;"/>
            </div>
        </div>
        <div class="risktable4">
            <div class="risk_div bg_risk" style="width:15%;   ">产业政策</div>
            <div class="risk_div bg_risk" style="width:20%; ">
                <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">行业准入条件符合</div>
                <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">其他相关产业政策、环保政策符合性</div>
                <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">有两高一资项目</div>
            </div>
            <div class="risk_div"
                 style="width:45%;   background-color: rgba(255,255,255,1); text-align: left; color: black;">
                <div class="td_risk">
                    <input type="radio" name="entrycriteria"  required="required" value="1"/>
                    符合
                    <input type="radio" name="entrycriteria" value="2"/>
                    不符合
                    <input type="radio" name="entrycriteria" value="3"/>
                    无准入条件
                </div>
                <div class="td_risk">
                    <input type="radio" name="otherpolicies"  required="required" value="1"/>
                    符合
                    <input type="radio" name="otherpolicies" value="2"/>
                    不符合
                    <input type="radio" name="otherpolicies" value="3"/>
                    无要求
                </div>
                <div class="td_risk">
                    <input type="radio" name="twohighandonecapital"  required="required" value="1"/>
                    是
                    <input type="radio" name="twohighandonecapital" value="2"/>
                    否
                </div>
            </div>
            <div class="risk_div" style="width:20%; text-align: left;   ">
                <div class="td_risk">
                    <input type="text" id="remarks16" name="remarks16" style="width: 99%;"/>
                </div>
                <div class="td_risk">
                    <input type="text" id="remarks17" name="remarks17" style="width: 99%;"/>
                </div>
                <div class="td_risk">
                    <input type="text" id="remarks18" name="remarks18" style="width: 99%;"/>
                </div>
            </div>
        </div>
    </div>
    <div class="risktable5">
        <div class="risk_div bg_risk" style="width:15%;   ">厂址选择</div>
        <div class="risk_div bg_risk" style="width:20%; ">
            <div class="td_risk">所在区域地方产业政策</div>
            <div class="td_risk">所在区域地方环保政策</div>
            <div class="td_risk">卫生防护距离要求</div>
            <div class="td_risk">园区产业定位、布局要求</div>
            <div class="td_risk">其他选址规定要求</div>
            <div class="td_risk" style="height: 78px; line-height: 78px;">涉及保护区</div>
            <div class="td_risk specialtd">其它敏感目标</div>
        </div>
        <div class="risk_div"
             style="width:45%;   background-color: rgba(255,255,255,1); text-align: left; color: black;">
            <div class="td_risk">
                <input type="radio" name="industry"  required="required" value="1"/>
                符合
                <input type="radio" name="industry" value="2"/>
                不符合
                <input type="radio" name="industry" value="3"/>
                无要求
            </div>
            <div class="td_risk">
                <input type="radio" name="environmentalprotection"  required="required" value="1"/>
                符合
                <input type="radio" name="environmentalprotection" value="2"/>
                不符合
                <input type="radio" name="environmentalprotection" value="3"/>
                无要求
            </div>
            <div class="td_risk">
                <input type="radio" name="hygiene"  required="required" value="1"/>
                满足
                <input type="radio" name="hygiene" value="2"/>
                不满足
                <input type="radio" name="hygiene" value="3"/>
                无要求
            </div>
            <div class="td_risk">
                <input type="radio" name="park"  required="required" value="1"/>
                满足
                <input type="radio" name="park" value="2"/>
                不满足
                <input type="radio" name="park" value="3"/>
                无要求
            </div>
            <div class="td_risk">
                <input type="radio" name="otherlocation"  required="required" value="1"/>
                满足
                <input type="radio" name="otherlocation" value="2"/>
                不满足
                <input type="radio" name="otherlocation" value="3"/>
                无要求
            </div>
            <div class="td_risk" style="height: 78px;">
                <input type="checkbox" name="involvingprotectedareas" value="1"/>
                南水北调&nbsp;
                <input type="checkbox" name="involvingprotectedareas" value="2"/>
                地下水源保护区&nbsp;
                <input type="checkbox" name="involvingprotectedareas" value="3"/>
                地表水源保护区&nbsp;
                <input type="checkbox" name="involvingprotectedareas" value="4"/>
                自然保护区&nbsp;
                <input type="checkbox" name="involvingprotectedareas" value="5"/>
                风景名胜区&nbsp;
                <input type="checkbox" name="involvingprotectedareas" value="6"/>
                文物古迹&nbsp;
                <input type="checkbox" name="involvingprotectedareas" value="7"/>
                基本农田保护区&nbsp;
                <input type="checkbox" name="involvingprotectedareas" value="8"/>
                水土流失区&nbsp;
                <input type="checkbox" name="involvingprotectedareas" value="9"/>
                其他保护区&nbsp;
                <input type="checkbox" name="involvingprotectedareas" value="10"/>
                不涉及&nbsp;
            </div>
            <div class="td_risk" style="height: 52px;">
                <input type="checkbox" name="othersensitivetargets" value="1"/>
                军事设施&nbsp;
                <input type="checkbox" name="othersensitivetargets" value="2"/>
                机场&nbsp;
                <input type="checkbox" name="othersensitivetargets" value="3"/>
                敏感企业(如食品厂) &nbsp;
                <input type="checkbox" name="othersensitivetargets" value="4"/>
                电力及通讯设施&nbsp;
                <input type="checkbox" name="othersensitivetargets" value="5"/>
                铁路、交通干道&nbsp;
                <input type="checkbox" name="othersensitivetargets" value="6"/>
                河道、泛洪区 &nbsp;
                <input type="checkbox" name="othersensitivetargets" value="7"/>
                其他&nbsp;
                <input type="checkbox" name="othersensitivetargets" value="8"/>
                不涉及&nbsp;
            </div>
        </div>
        <div class="risk_div" style="width:20%; text-align: left;   ">
            <div class="td_risk">
                <input type="text" id="remarks19" name="remarks19" style="width: 99%;"/>
            </div>
            <div class="td_risk">
                <input type="text" id="remarks20" name="remarks20" style="width: 99%;"/>
            </div>
            <div class="td_risk">
                <input type="text" id="remarks21" name="remarks21" style="width: 99%;"/>
            </div>
            <div class="td_risk">
                <input type="text" id="remarks22" name="remarks22" style="width: 99%;"/>
            </div>
            <div class="td_risk">
                <input type="text" id="remarks23" name="remarks23" style="width: 99%;"/>
            </div>
            <div class="td_risk " style="height: 78px; line-height: 78px;">
                <input type="text" id="remarks24" name="remarks24" style="width: 99%;"/>
            </div>
            <div class="td_risk specialtd">
                <input type="text" id="remarks25" name="remarks25" style="width: 99%;"/>
            </div>
        </div>

    </div>
    <div class="risktable6">
        <div class="risk_div bg_risk" style="width:15%;">其他问题</div>
        <div class="risk_div " style="width:85%; text-align: left; ">

            <input type="text" id="otherquestions" name="otherquestions"  required="required" style="width: 80%;"/>
        </div>

    </div>
    <div class="risktable4">
        <div class="risk_div bg_risk" style="width:15%;   ">项目组意见</div>
        <div class="risk_div " style="width:85%; text-align: left; ">
            <div class="td_risk " style="height: 78px;">
                <textarea name="projectgroupcomments" id="projectgroupcomments"  required="required"
                          style="width:80%; height: 60px; margin-top: 5px;"></textarea>
            </div>
        </div>

    </div>
    <div class="btnnew">
        <input type="submit" class="btn btn-primary" value="提交"/>
        &nbsp;&nbsp;&nbsp;&nbsp;

    </div>
</form>
</body>


<script src="/js/jquery.min.js" type="text/javascript"></script>
<!--  红色星号  -->   
<script>       
    $('input[required]').before('<span style="color:red">*</span>');
    $('textarea[required]').before('<span style="color:red">*</span>');
</script>

<!-- 提交数据 -->
<script type="text/javascript">
    function riskAnalysis() {
        if (!confirm("您确定录入风险分析信息吗?")) {
            return
        }
        $.ajax({
            url:"/api/admin/matter/riskAnalysis",
            type:"post",
            data:$('#riskAnalysisForm').serialize(),	//表单内所有信息
            "success": function (data) {
                if (data == "OK") {
                    alert("录入风险分析信息成功");
                     window.location.href = "/api/admin/iframe/riskAnalysisList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        });
        return false;
    };
</script>
</html>