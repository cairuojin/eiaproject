<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />
    <link rel="stylesheet" href="/css/maincss.css">
</head>
<body>
<p><h4>一、现场踏勘部分</h4></p>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">踏勘人员&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">${projectReconnaissance.user.name}</div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">收集资料清单&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">${projectReconnaissance.informationlist}</div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">现场踏勘情况&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">${projectReconnaissance.siteconditions}</div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">踏勘存在问题&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">${projectReconnaissance.existingproblems}</div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">踏勘附件&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss"><a href="/${projectReconnaissance.annex}" download="/${projectReconnaissance.annex}" alt="下载附件">下载附件</a></div>
</div>
<div class="risktable6">
    <div class="td_risk bg_risk undertake1">坐标&nbsp;&nbsp;</div>
    <div class="td_risk  undertake2 textcss">经度：${projectReconnaissance.maplng}&nbsp;&nbsp;&nbsp;&nbsp;纬度：${projectReconnaissance.maplat}&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="">在地图中查看</a>
    </div>
</div>
<div class="risktable6 risktable7">
    <div class=" bg_risk undertake1 risktable7" style="float: left;">地址&nbsp;&nbsp;</div>
    <div class=" undertake2 textcss risktable7" style="float: left;" >
        <div class="divimg" >
            <div style="width:114px; height: 104px;" > <img src="/${projectReconnaissance.filepic1}" class="imgcss"></div>
            <div style="width:114px; height: 26px; line-height: 26px;" >${projectReconnaissance.filepicname1}</div>

        </div>
        <div class="divimg" >
            <div style="width:114px; height: 104px;" > <img src="/${projectReconnaissance.filepic2}" class="imgcss"></div>
            <div style="width:114px; height: 26px; line-height: 26px;" >${projectReconnaissance.filepicname2}</div>

        </div>
        <div class="divimg" >
            <div style="width:114px; height: 104px;" > <img src="/${projectReconnaissance.filepic3}" class="imgcss"></div>
            <div style="width:114px; height: 26px; line-height: 26px;" >${projectReconnaissance.filepicname3}</div>

        </div>
        <div class="divimg" >
            <div style="width:114px; height: 104px;" > <img src="/${projectReconnaissance.filepic4}" class="imgcss"></div>
            <div style="width:114px; height: 26px; line-height: 26px;" >${projectReconnaissance.filepicname4}</div>
        </div>
        <div class="divimg" >
            <div style="width:114px; height: 104px;" > <img src="/${projectReconnaissance.filepic5}" class="imgcss"></div>
            <div style="width:114px; height: 26px; line-height: 26px;" >${projectReconnaissance.filepicname5}</div>

        </div>
    </div>
</div>
<p><h4>二、风险分析判定部分 </h4></p>
<div class="risktable1">
    <div  class="risk_div"   style="width: 15%;  "> </div>
    <div  class="risk_div" style="width: 20%; ">内容 </div>
    <div  class="risk_div" style="width: 45%; "> 判定</div>
    <div  class="risk_div" style="width: 20%; ">备注及说明 </div>
</div>
<div class="risktable2">
    <div class="risk_div bg_risk" style="width:15%;   ">资质</div>
    <div class="risk_div bg_risk" style="width:20%; ">
        <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">环评类别</div>
        <div class="td_risk" >公司资质范围是否含盖</div>
    </div>
    <div class="risk_div" style="width:45%;   background-color: rgba(255,255,255,1); text-align: left; color: black;">
        <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
            <c:if test="${projectRiskAnalysis.eiacategory == 1}">
                报告书
            </c:if>
            <c:if test="${projectRiskAnalysis.eiacategory == 2}">
                报告表
            </c:if>
        </div>
        <div class="td_risk" >
            <c:if test="${projectRiskAnalysis.companyqualification == 1}">
                是
            </c:if>
            <c:if test="${projectRiskAnalysis.companyqualification == 2}">
                否
            </c:if>
        </div>

    </div>
    <div class="risk_div" style="width:20%; text-align: left;   ">
        <div class="td_risk textcss" style="border-bottom: rgba(144,144,144,.8) 1px solid; ">
            ${projectRiskAnalysis.remarks1}
        </div>
        <div class="td_risk textcss" style="border-bottom: rgba(144,144,144,.8) 1px solid;">
            ${projectRiskAnalysis.remarks2}
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
        <div class="td_risk" >改扩建企业是否存在问题</div>
    </div>
    <div class="risk_div" style="width:45%;   background-color: rgba(255,255,255,1); text-align: left; color: black;">
        <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
            ${projectRiskAnalysis.projectinformation}
        </div>
        <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
            ${projectRiskAnalysis.projectinvestment}
        </div>
        <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
            <c:if test="${projectRiskAnalysis.natureconstruction == 1}">
                新建
            </c:if>
            <c:if test="${projectRiskAnalysis.natureconstruction == 2}">
                技改
            </c:if>
            <c:if test="${projectRiskAnalysis.natureconstruction == 3}">
                扩建
            </c:if>
            <c:if test="${projectRiskAnalysis.natureconstruction == 4}">
                搬迁
            </c:if>
            <c:if test="${projectRiskAnalysis.natureconstruction == 5}">
                现状评估
            </c:if>
        </div>
        <div class="td_risk  specialtd" >
                <textarea style="width: 100%;height: 52px;" disabled="disabled">${projectRiskAnalysis.contentsofconstruction}</textarea>
        </div>
        <div class="td_risk  specialtd">
            <textarea style="width: 100%;height: 52px;" disabled="disabled">${projectRiskAnalysis.processroute}</textarea>
        </div>
        <div class="td_risk"  >
            ${projectRiskAnalysis.constructionscale}
        </div>
        <div class="td_risk">
            ${projectRiskAnalysis.geographicalposition}
        </div>
        <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
            <c:if test="${projectRiskAnalysis.projectcategory == 1}">
                审批制
            </c:if>
            <c:if test="${projectRiskAnalysis.projectcategory == 2}">
                备案制
            </c:if>
            <c:if test="${projectRiskAnalysis.projectcategory == 3}">
                核准制
            </c:if>
        </div>
        <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
            <c:if test="${projectRiskAnalysis.projectgrade == 1}">
                国家级
            </c:if>
            <c:if test="${projectRiskAnalysis.projectgrade == 2}">
                省级
            </c:if>
            <c:if test="${projectRiskAnalysis.projectgrade == 3}">
                市级
            </c:if>
            <c:if test="${projectRiskAnalysis.projectgrade == 4}">
                县级
            </c:if>
        </div>
        <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
            <c:if test="${fn:contains(projectRiskAnalysis.extension,'1')}">
                企业限批
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.extension,'2')}">
                未批先建
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.extension,'3')}">
                限期治理
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.extension,'4')}">
                落后淘汰
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.extension,'5')}">
                其他
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.extension,'6')}">
                不涉及
            </c:if>
        </div>
    </div>
    <div class="risk_div" style="width:20%; text-align: left;   ">
        <div class="td_risk textcss" >
            ${projectRiskAnalysis.remarks3}
        </div>
        <div class="td_risk textcss " >
            ${projectRiskAnalysis.remarks4}
        </div>
        <div class="td_risk textcss" >
            ${projectRiskAnalysis.remarks5}
        </div>
        <div class="td_risk specialtd textcss" >
            ${projectRiskAnalysis.remarks6}
        </div>
        <div class="td_risk specialtd textcss " >
            ${projectRiskAnalysis.remarks7}
        </div>
        <div class="td_risk textcss">
            ${projectRiskAnalysis.remarks8}
        </div>
        <div class="td_risk textcss ">
            ${projectRiskAnalysis.remarks9}
        </div>
        <div class="td_risk textcss ">
            ${projectRiskAnalysis.remarks10}
        </div>
        <div class="td_risk textcss ">
            ${projectRiskAnalysis.remarks11}
        </div>
        <div class="td_risk textcss" >
            ${projectRiskAnalysis.remarks12}
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
    <div class="risk_div" style="width:45%;   background-color: rgba(255,255,255,1); text-align: left; color: black;">
        <div class="td_risk" >
            <c:if test="${projectRiskAnalysis.drainage == 1}">
                有
            </c:if>
            <c:if test="${projectRiskAnalysis.drainage == 2}">
                无
            </c:if>
            <c:if test="${projectRiskAnalysis.drainage == 3}">
                不排水
            </c:if>
        </div>
        <div class="td_risk" >
            <c:if test="${projectRiskAnalysis.environmental == 1}">
                有
            </c:if>
            <c:if test="${projectRiskAnalysis.environmental == 2}">
                无
            </c:if>
            <c:if test="${projectRiskAnalysis.environmental == 3}">
                不确定
            </c:if>
        </div>
        <div class="td_risk" >
            <c:if test="${projectRiskAnalysis.contaminants == 1}">
                有
            </c:if>
            <c:if test="${projectRiskAnalysis.contaminants == 2}">
                无
            </c:if>
            <c:if test="${projectRiskAnalysis.contaminants == 3}">
                不确定
            </c:if>
        </div>
    </div>
    <div class="risk_div" style="width:20%; text-align: left;   ">
        <div class="td_risk textcss " >
            ${projectRiskAnalysis.remarks13}
        </div>
        <div class="td_risk textcss " >
            ${projectRiskAnalysis.remarks14}
        </div>
        <div class="td_risk textcss " >
            ${projectRiskAnalysis.remarks15}
        </div>
    </div>
    <div class="risktable4">
        <div class="risk_div bg_risk" style="width:15%;   ">产业政策</div>
        <div class="risk_div bg_risk" style="width:20%; ">
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">行业准入条件符合</div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">其他相关产业政策、环保政策符合性</div>
            <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">有两高一资项目</div>
        </div>
        <div class="risk_div" style="width:45%;   background-color: rgba(255,255,255,1); text-align: left; color: black;">
            <div class="td_risk" >
                <c:if test="${projectRiskAnalysis.entrycriteria == 1}">
                    符合
                </c:if>
                <c:if test="${projectRiskAnalysis.entrycriteria == 2}">
                    不符合
                </c:if>
                <c:if test="${projectRiskAnalysis.entrycriteria == 3}">
                    无准入条件
                </c:if>
            </div>
            <div class="td_risk" >
                <c:if test="${projectRiskAnalysis.otherpolicies == 1}">
                    符合
                </c:if>
                <c:if test="${projectRiskAnalysis.otherpolicies == 2}">
                    不符合
                </c:if>
                <c:if test="${projectRiskAnalysis.otherpolicies == 3}">
                    无要求
                </c:if>
            </div>
            <div class="td_risk" >
                <c:if test="${projectRiskAnalysis.twohighandonecapital == 1}">
                    是
                </c:if>
                <c:if test="${projectRiskAnalysis.twohighandonecapital == 2}">
                    否
                </c:if>
            </div>
        </div>
        <div class="risk_div" style="width:20%; text-align: left;   ">
            <div class="td_risk textcss " >
                ${projectRiskAnalysis.remarks16}
            </div>
            <div class="td_risk textcss " >
                ${projectRiskAnalysis.remarks17}
            </div>
            <div class="td_risk textcss " >
                ${projectRiskAnalysis.remarks18}
            </div>
        </div>
    </div>
</div>
<div class="risktable5">
    <div class="risk_div bg_risk" style="width:15%;   ">厂址选择</div>
    <div class="risk_div bg_risk" style="width:20%; ">
        <div class="td_risk">所在区域地方产业政策</div>
        <div class="td_risk" >所在区域地方环保政策</div>
        <div class="td_risk">卫生防护距离要求</div>
        <div class="td_risk" >园区产业定位、布局要求</div>
        <div class="td_risk" >其他选址规定要求</div>
        <div class="td_risk"  style="height: 78px; line-height: 78px;">涉及保护区</div>
        <div class="td_risk specialtd" >其它敏感目标</div>
    </div>
    <div class="risk_div" style="width:45%;   background-color: rgba(255,255,255,1); text-align: left; color: black;">
        <div class="td_risk" >
            <c:if test="${projectRiskAnalysis.industry == 1}">
                符合
            </c:if>
            <c:if test="${projectRiskAnalysis.industry == 2}">
                不符合
            </c:if>
            <c:if test="${projectRiskAnalysis.industry == 3}">
                无要求
            </c:if>
        </div>
        <div class="td_risk" >
            <c:if test="${projectRiskAnalysis.environmentalprotection == 1}">
                符合
            </c:if>
            <c:if test="${projectRiskAnalysis.environmentalprotection == 2}">
                不符合
            </c:if>
            <c:if test="${projectRiskAnalysis.environmentalprotection == 3}">
                无要求
            </c:if>
        </div>
        <div class="td_risk" >
            <c:if test="${projectRiskAnalysis.hygiene == 1}">
                满足
            </c:if>
            <c:if test="${projectRiskAnalysis.hygiene == 2}">
                不满足
            </c:if>
            <c:if test="${projectRiskAnalysis.hygiene == 3}">
                无要求
            </c:if>
        </div>
        <div class="td_risk" >
            <c:if test="${projectRiskAnalysis.park == 1}">
                满足
            </c:if>
            <c:if test="${projectRiskAnalysis.park == 2}">
                不满足
            </c:if>
            <c:if test="${projectRiskAnalysis.park == 3}">
                无要求
            </c:if>
        </div>
        <div class="td_risk" >
            <c:if test="${projectRiskAnalysis.otherlocation == 1}">
                满足
            </c:if>
            <c:if test="${projectRiskAnalysis.otherlocation == 2}">
                不满足
            </c:if>
            <c:if test="${projectRiskAnalysis.otherlocation == 3}">
                无要求
            </c:if>
        </div>
        <div class="td_risk"  style="height: 78px;">
            <c:if test="${fn:contains(projectRiskAnalysis.involvingprotectedareas,'1')}">
                南水北调
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.involvingprotectedareas,'2')}">
                地下水源保护区
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.involvingprotectedareas,'3')}">
                地表水源保护区
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.involvingprotectedareas,'4')}">
                自然保护区
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.involvingprotectedareas,'5')}">
                风景名胜区
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.involvingprotectedareas,'6')}">
                文物古迹
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.involvingprotectedareas,'7')}">
                基本农田保护区
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.involvingprotectedareas,'8')}">
                水土流失区
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.involvingprotectedareas,'9')}">
                其他保护区
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.involvingprotectedareas,'10')}">
                不涉及
            </c:if>
        </div>
        <div class="td_risk"  style="height: 52px;">
            <c:if test="${fn:contains(projectRiskAnalysis.othersensitivetargets,'1')}">
                军事设施
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.othersensitivetargets,'2')}">
                机场
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.othersensitivetargets,'3')}">
                敏感企业(如食品厂)
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.othersensitivetargets,'4')}">
                电力及通讯设施
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.othersensitivetargets,'5')}">
                铁路、交通干道
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.othersensitivetargets,'6')}">
                河道、泛洪区
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.othersensitivetargets,'7')}">
                其他
            </c:if>
            <c:if test="${fn:contains(projectRiskAnalysis.othersensitivetargets,'8')}">
                不涉及
            </c:if>
        </div>
    </div>
    <div class="risk_div" style="width:20%; text-align: left;   ">
        <div class="td_risk textcss " >
            ${projectRiskAnalysis.remarks19}
        </div>
        <div class="td_risk textcss " >
            ${projectRiskAnalysis.remarks20}
        </div>
        <div class="td_risk textcss " >
            ${projectRiskAnalysis.remarks21}
        </div>
        <div class="td_risk textcss " >
            ${projectRiskAnalysis.remarks22}
        </div>
        <div class="td_risk textcss " >
            ${projectRiskAnalysis.remarks23}
        </div>
        <div class="td_risk textcss " style="height: 78px; line-height: 78px;" >
            ${projectRiskAnalysis.remarks24}
        </div>
        <div class="td_risk specialtd textcss " >
            ${projectRiskAnalysis.remarks25}
        </div>
    </div>

</div>
<div class="risktable6">
    <div class="risk_div bg_risk" style="width:15%;   ">其他问题</div>
    <div class="risk_div textcss " style="width:85%; text-align: left; ">
        <textarea style="width: 100%; height: 26px;" disabled="disabled">${projectRiskAnalysis.otherquestions}</textarea>
    </div>

</div>
<div class="risktable4"  >
    <div class="risk_div bg_risk" style="width:15%;   ">项目组意见</div>
    <div class="risk_div " style="width:85%; text-align: left; ">
        <div class="td_risk textcss " style="height: 78px;" >
            <textarea style="width: 100%; height: 48px;" disabled="disabled">${projectRiskAnalysis.projectgroupcomments}</textarea>
            签字：${projectRiskAnalysis.user.name} &nbsp;&nbsp;签字时间：${projectRiskAnalysis.createtime}
        </div>
    </div>
</div>

<form id="departmentUndertakeForm">
    <input type="hidden" name="id" value="${projectRiskAnalysis.id}">
    <div class="risktable4"  >
        <div class="risk_div bg_risk" style="width:15%;   ">承接意见</div>
        <div class="risk_div " style="width:85%; text-align: left; ">
            <div class="td_risk textcss " style="height: 78px;" >
                <input type="radio" name="undertakingsituation" value="1"/>
                承接
                <input type="radio" name="undertakingsituation" value="2"/>
                不承接
                <input type="radio" name="undertakingsituation" value="3"/>
                上报<br>
                <textarea name="undertakingopinions"  style="width:99%; height: 48px;" placeholder="请输入意见......" ></textarea>
            </div>
        </div>
    </div>
    <div class="btnnew" >
        <input type="button" class="btn btn-primary" onclick="departmentUndertakeInput()" value="提交"  />
        &nbsp;&nbsp;&nbsp;&nbsp;
    </div>
</form>

</body>

<script src="/js/jquery.min.js"></script>
<!-- 保存踏勘信息 -->
<script type="text/javascript">
    function departmentUndertakeInput() {
        if($("input[name='undertakingsituation']:checked").val() == undefined){
            alert("请选择承接意见");
            return;
        }

        if (!confirm("您确定录入部门承接信息吗?")) {
            return
        }
        $.ajax({
            "type": "POST",
            "url": "/api/admin/matter/departmentUndertake",	//传输路径
            "data": $('#departmentUndertakeForm').serialize(),
            "success": function (data) {
                if (data == "OK") {
                    alert("录入部门承接信息成功");
                    window.location.href = "/api/admin/iframe/departmentUndertakeList";
                }
            },
            "error": function (data) {
                alert(data);
            }
        })
    }
</script>

</html>
