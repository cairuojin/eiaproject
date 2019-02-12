<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />
    <link rel="stylesheet" href="/css/maincss.css">
    <style>
        *{
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
    </style>
</head>
<body>
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
            <input type="radio" name="rd1" />
            报告书
            <input type="radio" name="rd1"  />
            报告表
        </div>
        <div class="td_risk" >
            <input type="radio" name="rd1" />
            是
            <input type="radio" name="rd1"  />
            否</div>

    </div>
    <div class="risk_div" style="width:20%; text-align: left;   ">
        <div class="td_risk" style="border-bottom: rgba(144,144,144,.8) 1px solid;">
            <input type="text" id="grumble" style="width: 99%;" />
        </div>
        <div class="td_risk" style="border-bottom: rgba(144,144,144,.8) 1px solid;">
            <input type="text" id="grumble" style="width: 99%;"/>
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
            <input type="text" name="rd1" class="input_css" />
        </div>
        <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
            <input type="text" name="rd1" class="input_css" />
        </div>
        <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
            <input type="radio" name="rd1" />
            新建
            <input type="radio" name="rd1"  />
            技改
            <input type="radio" name="rd1" />
            扩建
            <input type="radio" name="rd1"  />
            搬迁
            <input type="radio" name="rd1"  />
            现状评估
        </div>
        <div class="td_risk  specialtd" >
            <textarea name="txt"  style="width:99%; height: 48px;" ></textarea>
        </div>
        <div class="td_risk  specialtd">
            <textarea name="txt"  style="width:99%; height: 48px;" ></textarea>
        </div>
        <div class="td_risk"  >
            <input type="text" name="rd1" class="input_css" />
        </div>
        <div class="td_risk">
            <input type="text" name="rd1" class="input_css" />
        </div>
        <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
            <input type="radio" name="rd1" />
            审批制
            <input type="radio" name="rd1"  />
            备案制
            <input type="radio" name="rd1" />
            核准制
        </div>
        <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
            <input type="radio" name="rd1" />
            国家级
            <input type="radio" name="rd1"  />
            省级
            <input type="radio" name="rd1" />
            市级
            <input type="radio" name="rd1" />
            县级
        </div>
        <div class="td_risk" style=" border-bottom: rgba(144,144,144,.8) 1px solid;">
            <input type="checkbox" name="rd11" />
            企业限批
            <input type="checkbox" name="rd11"  />
            未批先建
            <input type="checkbox" name="rd11" />
            限期治理
            <input type="checkbox" name="rd11" />
            落后淘汰
            <input type="checkbox" name="rd11" />
            其他
            <input type="checkbox" name="rd11" />
            不涉及
        </div>
    </div>
    <div class="risk_div" style="width:20%; text-align: left;   ">
        <div class="td_risk" >
            <input type="text" id="grumble" style="width: 99%;" />
        </div>
        <div class="td_risk" >
            <input type="text" id="grumble" style="width: 99%;"/>
        </div>
        <div class="td_risk" >
            <input type="text" id="grumble" style="width: 99%;" />
        </div>
        <div class="td_risk specialtd" >
            <input type="text" id="grumble" style="width: 99%;"/>
        </div>
        <div class="td_risk specialtd" >
            <input type="text" id="grumble" style="width: 99%;" />
        </div>
        <div class="td_risk" >
            <input type="text" id="grumble" style="width: 99%;"/>
        </div>
        <div class="td_risk">
            <input type="text" id="grumble" style="width: 99%;" />
        </div>
        <div class="td_risk">
            <input type="text" id="grumble" style="width: 99%;"/>
        </div>
        <div class="td_risk">
            <input type="text" id="grumble" style="width: 99%;" />
        </div>
        <div class="td_risk">
            <input type="text" id="grumble" style="width: 99%;"/>
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
            <input type="radio" name="rd1" />
            有
            <input type="radio" name="rd1"  />
            无
            <input type="radio" name="rd1" />
            不排水
        </div>
        <div class="td_risk" >
            <input type="radio" name="rd1" />
            有
            <input type="radio" name="rd1"  />
            无
            <input type="radio" name="rd1" />
            不确定
        </div>
        <div class="td_risk" >
            <input type="radio" name="rd1" />
            有
            <input type="radio" name="rd1"  />
            无
            <input type="radio" name="rd1" />
            不确定
        </div>
    </div>
    <div class="risk_div" style="width:20%; text-align: left;   ">
        <div class="td_risk" >
            <input type="text" id="grumble" style="width: 99%;" />
        </div>
        <div class="td_risk" >
            <input type="text" id="grumble" style="width: 99%;"/>
        </div>
        <div class="td_risk" >
            <input type="text" id="grumble" style="width: 99%;" />
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
                <input type="radio" name="rd1" />
                符合
                <input type="radio" name="rd1"  />
                不符合
                <input type="radio" name="rd1" />
                无准入条件
            </div>
            <div class="td_risk" >
                <input type="radio" name="rd1" />
                符合
                <input type="radio" name="rd1"  />
                不符合
                <input type="radio" name="rd1" />
                无要求
            </div>
            <div class="td_risk" >
                <input type="radio" name="rd1" />
                是
                <input type="radio" name="rd1"  />
                否
            </div>
        </div>
        <div class="risk_div" style="width:20%; text-align: left;   ">
            <div class="td_risk" >
                <input type="text" id="grumble" style="width: 99%;" />
            </div>
            <div class="td_risk" >
                <input type="text" id="grumble" style="width: 99%;"/>
            </div>
            <div class="td_risk" >
                <input type="text" id="grumble" style="width: 99%;" />
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
            <input type="radio" name="rd1" />
            符合
            <input type="radio" name="rd1"  />
            不符合
            <input type="radio" name="rd1" />
            无要求
        </div>
        <div class="td_risk" >
            <input type="radio" name="rd1" />
            符合
            <input type="radio" name="rd1"  />
            不符合
            <input type="radio" name="rd1" />
            无要求
        </div>
        <div class="td_risk" >
            <input type="radio" name="rd1" />
            满足
            <input type="radio" name="rd1"  />
            不满足
            <input type="radio" name="rd1" />
            无要求
        </div>
        <div class="td_risk" >
            <input type="radio" name="rd1" />
            满足
            <input type="radio" name="rd1"  />
            不满足
            <input type="radio" name="rd1" />
            无要求
        </div>
        <div class="td_risk" >
            <input type="radio" name="rd1" />
            满足
            <input type="radio" name="rd1"  />
            不满足
            <input type="radio" name="rd1" />
            无要求
        </div>
        <div class="td_risk"  style="height: 78px;">
            <input type="checkbox" name="rd11" />
            南水北调&nbsp;
            <input type="checkbox" name="rd11"  />
            地下水源保护区&nbsp;
            <input type="checkbox" name="rd11" />
            地表水源保护区&nbsp;
            <input type="checkbox" name="rd11" />
            自然保护区&nbsp;
            <input type="checkbox" name="rd11" />
            风景名胜区&nbsp;
            <input type="checkbox" name="rd11" />
            文物古迹&nbsp;
            <input type="checkbox" name="rd11" />
            基本农田保护区&nbsp;
            <input type="checkbox" name="rd11" />
            水土流失区&nbsp;
            <input type="checkbox" name="rd11" />
            其他保护区&nbsp;
            <input type="checkbox" name="rd11" />
            不涉及&nbsp;
        </div>
        <div class="td_risk"  style="height: 52px;">
            <input type="checkbox" name="rd11" />
            军事设施&nbsp;
            <input type="checkbox" name="rd11"  />
            机场&nbsp;
            <input type="checkbox" name="rd11" />
            敏感企业(如食品厂) &nbsp;
            <input type="checkbox" name="rd11" />
            电力及通讯设施&nbsp;
            <input type="checkbox" name="rd11" />
            铁路、交通干道&nbsp;
            <input type="checkbox" name="rd11" />
            河道、泛洪区 &nbsp;
            <input type="checkbox" name="rd11" />
            其他&nbsp;
            <input type="checkbox" name="rd11" />
            不涉及&nbsp;
        </div>
    </div>
    <div class="risk_div" style="width:20%; text-align: left;   ">
        <div class="td_risk" >
            <input type="text" id="grumble" style="width: 99%;" />
        </div>
        <div class="td_risk" >
            <input type="text" id="grumble" style="width: 99%;"/>
        </div>
        <div class="td_risk" >
            <input type="text" id="grumble" style="width: 99%;" />
        </div>
        <div class="td_risk" >
            <input type="text" id="grumble" style="width: 99%;"/>
        </div>
        <div class="td_risk" >
            <input type="text" id="grumble" style="width: 99%;" />
        </div>
        <div class="td_risk " style="height: 78px; line-height: 78px;" >
            <input type="text" id="grumble" style="width: 99%;"/>
        </div>
        <div class="td_risk specialtd" >
            <input type="text" id="grumble" style="width: 99%;" />
        </div>
    </div>

</div>
<div class="risktable6">
    <div class="risk_div bg_risk" style="width:15%;   ">其他问题</div>
    <div class="risk_div " style="width:85%; text-align: left; ">

        <input type="text" id="grumble" style="width: 80%;" />
    </div>

</div>
<div class="risktable4"  >
    <div class="risk_div bg_risk" style="width:15%;   ">项目组意见</div>
    <div class="risk_div " style="width:85%; text-align: left; ">
        <div class="td_risk " style="height: 78px;" >
            <textarea name="txt"  style="width:80%; height: 60px; margin-top: 5px;" ></textarea>
        </div>
    </div>

</div>
<div class="btnnew" >
    <input type="submit" class="btn btn-primary" value="提交"  >
    </input>&nbsp;&nbsp;&nbsp;&nbsp;

</div>
</body>
</html>