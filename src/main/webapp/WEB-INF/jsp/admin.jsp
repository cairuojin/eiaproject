<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>环评管理系统</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/grid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" /><!--与折叠菜单有关-->
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="/css/ie6.css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie.css" media="screen" /><![endif]-->
    <!-- BEGIN: load jquery -->
    <script src="/js/jquery.min.js" type="text/javascript"></script>
</head>
<body>

<style>
    .li01{
        background: url(/img/sidemenu-repeat.jpg);
        line-height: 40px;
        color: #0012c7;
        font-weight: bold;
        text-align: center;
    }
    .li-01{
        background: #ddd;
        line-height: 30px;
        color: #000;
    }
    .li-01:hover {
        background: rgb(117, 171, 199);
        line-height: 30px;
        color: #ffffff;
    }

</style>

<div class="container_12">
    <!-- 上面横向导航条 -->

    <jsp:include page="admin-header.jsp"></jsp:include>

    <div class="clear"></div>
    <!-- 竖向导航条 -->
    <div class="grid_2">
        <div class="box sidemenu">
            <div class="block" id="section-menu">
                <ul class="section menu" id = "category">
                </ul>
            </div>
        </div>
    </div>


    <div class="grid_10">
        <div class="box round first" >
            <h2 id="iframeTitle">Buttons</h2><!--绑定标题-->
            <div class="block" style="height:600px;">


                <%--src ="/api/admin/iframe/personalInfo"--%>
                <iframe src ="/api/admin/iframe/department" id="menuIframe" class="menu-iframe" frameborder="0"  width="100%" height="99%"></iframe>   <!-- ifram位置 todo -->



            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
<div class="clear"></div>
<div id="site_info">
    <p style="text-align: center;">
        环评管理系统&nbsp;&nbsp;技术支持：广东技术师范大学&nbsp;教育科学与技术学院
    </p>
</div>


<!-- 切换横向导航时获取竖向导航 -->
<script>
    function changePage(headerPage) {

        $("#category").empty(); //清除旧的导航

        $.ajax({                //获得导航
            "async": false,  //同步
            "url": "/api/admin/getCategory?headerPage=" + headerPage,	//传输路径
            "success": function (data) {
                var array = JSON.parse(data);
                $.each(array,function(index, item) {
                    if(array[index].isParent != 0){ //isParent == 0为横向导航
                        if(array[index].isParent == 1){ //父级

                            $('#category').append("<li class='li01'>" + array[index].name + "<ul class='submenu' id=category_P" + array[index].id  +"> </ul> </li>");
                        } else {    //子级
                            $('#category_P' + array[index].parentId).append("<li class='li-01' onclick=iframePage('" + array[index].engname + "','" + array[index].name + "')>" + array[index].name + "</li>");
                        }
                    }
                });
            }
        });

        //清除无儿子的ul
        var firstPage = false;
        $("#category  li ul").each(function (index, item) {
            if ($(item).find('li').length == 0) {   //没有儿子的删除
                $(item).parent().remove();
            } else if(firstPage == false){          //todo 默认展示第一个
                //$(item).children(':first').click();
                firstPage = true;
            }
        });

        $('#category > li').mouseover(function(e) {
            $(this).children().stop().slideDown(300);
        });
        $('#category > li').mouseout(function(e) {
            $(this).children().stop().slideUp(300);
        });
        $('#category > li').children().stop().slideUp(300);
    }
</script>

<!-- 页面加载函数 -->
<script type="text/javascript">
    $(function(){
        changePage(1);  //默认获得第一个页面的下拉条
        $('#category > li').children().stop().slideUp(300);

        setTimeout(function(){  //扩充页面到100%
            var height = $(document).height();
            $('.grid_12').each(function () {
                height -= $(this).outerHeight();
            });
            height -= $('#site_info').outerHeight();
            height-=1;
            //salert(height);
            $('.sidemenu').css('height', height);
        },100);
    })
</script>

<!-- 点击按钮iframe -->
<script type="text/javascript">
    function iframePage(engname, name) {
        $.ajax({
            "async": false,  //同步
            "success": function (data) {
                $('#menuIframe').attr('src','/api/admin/iframe/'+engname);
                $('#iframeTitle').text(name);
            }
        });
    }
</script>

<!-- 登出 -->
<script type="text/javascript">
    function logout() {
        $.ajax({
            "url": "/api/open/person/logout",	//传输路径
            "success": function (data) {
                if(data == "OK")
                    window.location.href = "/"
            }
        });
    }
</script>
</body>
</html>
