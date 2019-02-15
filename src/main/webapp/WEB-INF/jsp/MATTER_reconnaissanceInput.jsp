<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <title>踏勘信息录入</title>
    <link rel="stylesheet" href="/css/reset.css">
    <link rel="stylesheet" href="/css/layout.css">
    <!-- 高德地图所需 -->
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
    <style>
        #container {
            position: absolute;
            top: 50px;
            left: 10px;
            right: 0;
            bottom: 0;
        }
        #myPageTop {

            position: absolute;
            top: 0px;
            left: 10px;

            font-size: 14px;
            background-color: transparent;
            border: transparent solid 0;
        }
    </style>
</head>

<body>
<div class="info" >
    <div>
        <form id="reconnaissanceFrom">
            <table class="form">
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            踏勘人员</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            ${user.name}</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  style="vertical-align: middle;" >
                        <label class="labelsize"  >
                            收集资料清单</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <textarea cols="20" rows="20" style="width:80%;height: 60px;" id="informationList" name="informationList"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  style="vertical-align: middle;" >
                        <label class="labelsize"  >
                            现场踏勘情况</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <textarea cols="20" rows="20" style="width:80%;height: 60px;" id="siteConditions" name="siteConditions"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1"  style="vertical-align: middle;" >
                        <label class="labelsize"  >
                            踏勘存在问题</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <textarea cols="20" rows="20" style="width:80%;height: 60px;" id="existingProblems" name="existingProblems"></textarea>
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >
                            上传踏勘附件</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="file" class="large" id="annex" name="annex"/>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            坐标</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="maplng" placeholder="经度" name="maplng"/>
                        <input type="text" id="maplat"  placeholder="纬度" name="maplat"/>
                        <input type="button" class="btn btn-primary map" id="box1" value="在地图中选择" >

                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >
                            现场踏勘照片</label><br>
                        <label class="labelsize speciallabel1"  >
                            (请上传5张，包括周边关系图、4周厂界图，上传时对图片名进行描述修改，如“东厂界.jpg”)   </label>

                    </td>
                    <td class="col2 tdcss2 tt" id="td" style="padding-left: 30px;" >
                        <input type="file" id="filePic1" name="filePic1"/> <br>
                        <input type="file" id="filePic2" name="filePic2"/><br>
                        <input type="file" id="filePic3" name="filePic3"/><br>
                        <input type="file" id="filePic4" name="filePic4"/><br>
                        <input type="file" id="filePic5" name="filePic5"/><br>
                    </td>
                </tr>
            </table>
        </form>




        <div class="btnnew" >
            <input type="submit" class="btn btn-primary" value="保存" onclick="reconnaissanceInput()"/>
            &nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </div>

</div>

<!-- 地图div -->
<div id="mapDiv" style="width: 450px;height: 500px; display: none;">
    <div id="container" style="width: 450px;height: 460px;">
    </div>
    <div id="myPageTop" style="height: 40px; " class="t1">
        <table>
            <tr>
                <td>
                    <label>按关键字搜索：</label>
                </td>
            </tr>
            <tr>
                <td>
                    <input type="text" placeholder="请输入关键字进行搜索" id="tipinput">
                </td>
            </tr>
        </table>
    </div>
</div>

</body>

<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.validate.min.js"></script>
<!-- 高德地图所需 -->
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.5&key=45cb58339388d022eb47b3b7f9413a10&plugin=AMap.Autocomplete"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>

<!-- 点击显示地图 -->
<script type="text/javascript">
    $(document).ready(function() {
        $("#box1").bind("click", function () {
            $("#mapDiv").toggle();
        });
    });
</script>

<!-- 高德地图加载函数 -->
<script type="text/javascript">
    var marker = new AMap.Marker(); //标记对象
    var map = new AMap.Map("container", {
        resizeEnable: true
    });

    //左键地图函数
    var clickEventListener = map.on('click', function(e) {
        $("#tipinput").val('');
        $("#maplng").val(e.lnglat.getLng());
        $("#maplat").val(e.lnglat.getLat());
        map.remove(marker);         //移除原来的marker
        marker = new AMap.Marker({
            position: [e.lnglat.getLng(), e.lnglat.getLat()]
        })
        map.add(marker);        //添加新marker
    });

    //搜索引擎
    var auto = new AMap.Autocomplete({
        input: "tipinput"
    });
    AMap.event.addListener(auto, "select", select);//搜索后选择下拉列表触发函数
    function select(e) {
        if (e.poi && e.poi.location) {
            map.setZoom(15);            //地图跳到该位置
            map.setCenter(e.poi.location);
            map.remove(marker);         //选中该位置以及添加marker
            marker = new AMap.Marker({
                position: [e.poi.location.lng, e.poi.location.lat]
            })
            map.add(marker);
            $("#maplng").val(e.poi.location.lng);
            $("#maplat").val(e.poi.location.lat);
        }
    }
</script>

<!-- 文件校验 -->
<script type="text/javascript">
    $('#filePic1,#filePic2,#filePic3,#filePic4,#filePic5').on('change',function(){
        var filePath = $(this).val();
        fileFormat = $(this).val().substring(filePath.lastIndexOf(".")).toLowerCase();
        // 检查是否是图片
        if( !fileFormat.match(/.png|.jpg|.jpeg/) ) {
            alert('上传错误,文件格式必须为：png/jpg/jpeg');
            $(this).val('');
            return;
        }
    });
</script>

<!-- 表单校验 -->
<script>
    $(document).ready(function() {

        //添加表单校验
        $('#reconnaissanceFrom').validate({
            rules:{
                informationList:{
                    required:true,
                },
                siteConditions:{
                    required:true,
                },
                existingProblems:{
                    required:true,
                },
                annex:{
                    required:true,
                },
                maplng:{
                    required:true,
                },
                maplat:{
                    required:true,
                },
                filePic1:{
                    required:true,
                },
                filePic2:{
                    required:true,
                },
                filePic3:{
                    required:true,
                },
                filePic4:{
                    required:true,
                },
                filePic5:{
                    required:true,
                },
            },
            messages:{
                informationList:{
                    required:"该项为必填",
                },
                siteConditions:{
                    required:"该项为必填",
                },
                existingProblems:{
                    required:"该项为必填",
                },
                annex:{
                    required:"该项为必填",
                },
                maplng:{
                    required:"该项为必填",
                },
                maplat:{
                    required:"该项为必填",
                },
                filePic1:{
                    required:"该项为必填",
                },
                filePic2:{
                    required:"该项为必填",
                },
                filePic3:{
                    required:"该项为必填",
                },
                filePic4:{
                    required:"该项为必填",
                },
                filePic5:{
                    required:"该项为必填",
                },
            }
        });
    });
</script>

<!-- 保存踏勘信息 -->
<script type="text/javascript">
    function reconnaissanceInput() {
        if ($("#reconnaissanceFrom").valid()) {
            var formFile = new FormData();
            if (!confirm("您确定录入踏勘信息吗?")) {
               return
            }

            formFile.append("id", '${projectInfo.id}');
            formFile.append("action", "UploadVMKImagePath");    //必须
            formFile.append("informationlist", $('#informationList').val());
            formFile.append("siteconditions", $('#siteConditions').val());
            formFile.append("existingproblems", $('#existingProblems').val());
            formFile.append("maplng", $('#maplng').val());
            formFile.append("maplat", $('#maplat').val());
            formFile.append("annexFile", $('#annex')[0].files[0]); //附件对象
            formFile.append("filePic1", $('#filePic1')[0].files[0]); //图片
            formFile.append("filePic2", $('#filePic2')[0].files[0]);
            formFile.append("filePic3", $('#filePic3')[0].files[0]);
            formFile.append("filePic4", $('#filePic4')[0].files[0]);
            formFile.append("filePic5", $('#filePic5')[0].files[0]);


            var data = formFile;
            $.ajax({
                "type": "POST",
                "url": "/api/admin/matter/reconnaissance",	//传输路径
                processData: false,//用于对data参数进行序列化处理 这里必须false
                contentType: false, //必须
                "data": data,
                "success": function (data) {
                    if (data == "OK") {
                        alert("录入踏勘信息成功");
                        window.location.href = "/api/admin/iframe/reconnaissanceList";
                    }
                },
                "error": function (data) {
                    alert(data);
                }
            })
        }
    }
</script>
</html>


