<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>环评管理系统</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/text.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/grid.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" /><!--与折叠菜单有关-->
    <link rel="stylesheet" type="text/css" href="/css/nav.css" media="screen" /><!--与横向菜单有关-->
    <!--[if IE 6]><link rel="stylesheet" type="text/css" href="/css/ie6.css" media="screen" /><![endif]-->
    <!--[if IE 7]><link rel="stylesheet" type="text/css" href="/css/ie.css" media="screen" /><![endif]-->
    <!-- BEGIN: load jquery -->
    <script src="/js/jquery-1.6.4.min.js" type="text/javascript"></script>
    <script src="/js/jquery-ui/jquery.ui.widget.min.js" type="text/javascript"></script><!--与折叠菜单有关-->
    <script src="/js/jquery-ui/jquery.ui.accordion.min.js" type="text/javascript"></script><!--与折叠菜单有关-->
    <!-- END: load jquery -->
    <!-- END: load jqplot -->
    <script src="/js/setup.js" type="text/javascript"></script><!--与折叠菜单有关-->
</head>
<body>
<div class="container_12">
    <!-- 上面横向导航条 -->
    <div  class="grid_12" >
        <div style="background:url(/img/nav-repeat2.jpg) repeat-x !important;max-width: 100%;height: 3.7em;">
            <div class="floatleft">
                <img src="/img/img-profile.jpg" alt="Profile Pic" class="imgcss" /></div>   <!-- todo 用户头像，名字 -->
            <div class="floatleft marginleft10">
                <ul class="inline-ul floatleft">
                    <li>Hello Admin</li>
                    <li ><a style="color: white;" href="#">退出</a></li>
                </ul>

            </div>

            <ul class="nav main">
                <li class="ic-charts"><a href=""><span>Charts & Graphs</span></a></li>
                <li class="ic-grid-tables"><a href=""><span>Data Table</span></a></li>
                <li class="ic-gallery dd"><a href="javascript:"><span>Image Galleries</span></a></li>
                <li class="ic-notifications"><a href="notifications.html"><span>Notifications</span></a></li><!--绑定菜单-->
            </ul>

        </div>
    </div>
    <div class="clear"></div>
    <!-- 竖向导航条 -->
    <div class="grid_2">
        <div class="box sidemenu">
            <div class="block" id="section-menu">
                <ul class="section menu">
                    <li><a class="menuitem">Menu 1</a>
                        <ul class="submenu">
                            <li><a>Submenu 1</a> </li>
                            <li><a>Submenu 2</a> </li>
                            <li><a class="active">Submenu 3</a> </li>
                            <li><a>Submenu 4</a> </li>
                            <li><a>Submenu 5</a> </li>
                        </ul>
                    </li>
                    <li><a class="menuitem">Menu 2</a>
                        <ul class="submenu">
                            <li><a>Submenu 1</a> </li>
                            <li><a>Submenu 2</a> </li>
                            <li><a>Submenu 3</a> </li>
                            <li><a>Submenu 4</a> </li>
                            <li><a>Submenu 5</a> </li>
                        </ul>
                    </li>
                    <li><a class="menuitem">Menu 3</a>
                        <ul class="submenu">
                            <li><a>Submenu 1</a> </li>
                            <li><a>Submenu 2</a> </li>
                            <li><a>Submenu 3</a> </li>
                            <li><a>Submenu 4</a> </li>
                            <li><a>Submenu 5</a> </li>
                        </ul>
                    </li>
                    <li><a class="menuitem">Menu 4</a>
                        <ul class="submenu">
                            <li><a>Submenu 1</a> </li>
                            <li><a>Submenu 2</a> </li>
                            <li><a>Submenu 3</a> </li>
                            <li><a>Submenu 4</a> </li>
                            <li><a>Submenu 5</a> </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="grid_10">
        <div class="box round first" >
            <h2>Buttons</h2><!--绑定标题-->
            <div class="block" style="height:600px;">

                <iframe id="menuIframe" class="menu-iframe" frameborder="0" src="/user.html" width="100%" height="99%"  ></iframe>



            </div>
        </div>
    </div>
    <div class="clear">
    </div>
</div>
<div class="clear">
</div>
<div id="site_info">
    <p style="text-align: center;">
        环评管理系统&nbsp;&nbsp;技术支持：广东技术师范大学&nbsp;教育科学与技术学院
    </p>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        setupLeftMenu();

        setSidebarHeight();
    });
</script>
</body>
</html>
