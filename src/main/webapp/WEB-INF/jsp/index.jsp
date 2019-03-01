<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 首页 -->
<!DOCTYPE html>
<html>
<head>
    <title>环评管理系统</title>
    <link rel="stylesheet" href="css/drag.css">
    <link href="assets/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/animate.css">
    <link rel="stylesheet" href="css/bootstrap-modal-carousel.css">
    <link href="css/theme.css" rel="stylesheet">
    <link rel="stylesheet" href="css/responsive.css">
    <link rel="stylesheet" href="css/font-awesome.min.css">
    <link rel="stylesheet" href="css/line-icons.min.css">
    <link rel="stylesheet" href="css/htmlcss.css">

    <link rel="stylesheet" href="css/index.css">
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-fixed-top">
<nav class="navbar navbar-custom navbar-fixed-top">
    <div class="container">
        <!-- 左上角Logo -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-main-collapse"><i
                    class="fa fa-bars"></i></button>
            <a class="navbar-brand page-scroll" href="#page-top">
                <img src="images/logo.png" alt="" class="img-responsive">
            </a>
        </div>

        <!-- 导航条 -->
        <div class="collapse navbar-collapse navbar-right navbar-main-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#section-intro" class="page-scroll">首页</a></li>
                <li><a class="page-scroll" href="#section-features">特色介绍</a></li>
                <li><a class="page-scroll" href="#section-services">功能介绍</a></li>
                <li><a class="page-scroll" href="#section-portfolio">演示视频</a></li>
                <li><a class="page-scroll" href="#section-contact">登录</a></li>
            </ul>
        </div>
    </div>
</nav>


<section id="section-intro">
    <div class="bg-overlay"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-5">
                <div class="carousel slide" id="banner-slider" data-ride="carousel">
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#banner-slider" data-slide-to="0" class="active"></li>
                        <li data-target="#banner-slider" data-slide-to="1"></li>
                        <li data-target="#banner-slider" data-slide-to="2"></li>
                    </ol>
                    <div class="carousel-inner">
                        <div class="item active">
                            <div class="intro-caption">
                                <div class="subtitle" style="font-size: 35px;">环评单位管理问题一站式解决</div>
                                <h1>提升人工管理效率</h1>
                                <div class="btn-container wow fadeInUp">
                                    <a href="#section-contact" class="btn btn-white ">登录</a>
                                    <a href="#" class="btn btn-black">联系我们</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="intro-caption">
                                <div class="subtitle" style="font-size: 35px;">环评单位管理问题一站式解决</div>
                                <h1>规范环评项目存档</h1>
                                <div class="btn-container wow fadeInUp">
                                    <a href="#section-contact" class="btn btn-white ">登录</a>
                                    <a href="#" class="btn btn-black">联系我们</a>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <div class="intro-caption">
                                <div class="subtitle" style="font-size: 35px;">环评单位管理问题一站式解决</div>
                                <h1>及时掌握经营状况</h1>
                                <div class="btn-container wow fadeInUp">
                                    <a href="#section-contact" class="btn btn-white ">登录</a>
                                    <a href="#" class="btn btn-black">联系我们</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- row end  -->
    </div><!-- container end  -->
</section>

<!-- section features start -->
<section id="section-features" class="section-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-sm-12">
                <div class="feature-wrap">
                    <ul class="feature-list">
                        <li class="col-md-6 col-sm-6">
                            <div class="feature-box">
                                <div class="feature-icon"><i class="icon icon-mobile"></i></div>
                                <div class="feature-inner">
                                    <h4>针对环评更专业</h4>
                                    <p>33个流程节点逻辑结构清晰明了有序，由环评编制中的逻辑关系串接，环环相扣。</p>
                                </div>
                            </div>
                        </li>
                        <li class="col-md-6 col-sm-6">
                            <div class="feature-box">
                                <div class="feature-icon"><i class="icon icon-wallet"></i></div>
                                <div class="feature-inner">
                                    <h4>员工角色权限可设定</h4>
                                    <p>对公司来说，数据安全是第一位。不同的角色分配不同的权限，确定了每个人可处理、查询的事情等，使信息更加保密，从根本上杜绝信息外漏的问题。</p>
                                </div>
                            </div>
                        </li>
                        <li class="col-md-6 col-sm-6">
                            <div class="feature-box">
                                <div class="feature-icon"><i class="icon icon-flag"></i></div>
                                <div class="feature-inner">
                                    <h4>地图显示更直观</h4>
                                    <p>在系统中，可通过地图查看项目的地理位置，或者通过纬度经度等来查看项目在地图上哪个位置创办。</p>
                                </div>
                            </div>
                        </li>
                        <li class="col-md-6 col-sm-6">
                            <div class="feature-box">
                                <div class="feature-icon"><i class="icon icon-shield"></i></div>
                                <div class="feature-inner">
                                    <h4>分类存储更安全</h4>
                                    <p>系统采用数据分类存储策略，用户的全部数据存储在本部门中，其他部门无法查询到，不易被窃取。</p>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
                <!--  feature wrap end -->
            </div>
            <!--  col end -->
        </div>
        <!-- row end -->
    </div>
    <!-- container end -->
</section>
<!-- section features end -->

<!--  section services start -->
<section id="section-services" class="section-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-6">
                <div class="service-box active"><i class="icon icon-anchor"></i>
                    <h4>环评质量控制功能</h4>
                    <p style="text-align:left; text-indent: 2em;">该功能通过对环评编制过程中各个环节进行控制，进而保证环评报告质量，是系统的主要功能。</p>
                    <p style="text-align:left; text-indent: 2em;">    环评编制主要环节包括项目风险判定、项目承接、主持人确定、项目组成员确定、现场调查、监 测方案确定、报告编制、审核、修改、资质管理、报告印刷、审查会、专家意见、报批、存档等。 系统对各环节操作进行记录，做到痕迹化管理，所有事项可追溯。</p>

                </div>
                <div class="service-box active"><i class="icon icon-mic"></i>
                    <h4>主动申请审批</h4>
                    <p> 可主动申请上级领导审核批准项目，省去不必要的麻烦。</p>
                    <div class="line"></div>
                </div>

            </div>
            <div class="col-md-4 col-sm-6">
                <div class="service-box"><i class="icon icon-layers"></i>
                    <h4 >多条件项目查询功能</h4>
                    <p style="text-align:left; text-indent: 2em;">用户可以根据需要设定查询条件，从而得到满足要求的查询结果。</p>
                    <p style="text-align:left; text-indent: 2em;">   系统提供的查询条件包括项目名称、文件类型、评价类别、审批级别、合同状态、项目状态、资质状态、批文状态、存档状态、存放位置、所属部门、项目地域、承接时间、批复时间等。</p>
                    <p style=" text-align:left;text-indent: 2em;"> 可以进行各种组合进行查询，可以将查询结果以EXCEL格式导出。</p>
                </div>
                <div class="service-box"><i class="icon icon-chat"></i>
                    <h4>添加反馈功能</h4>
                    <p>可为项目提供反馈，及时通知项目所属部门进行修改、复审。</p>
                    <div class="line"></div>
                </div>

            </div>
            <div class="col-md-4 col-sm-6">
                <div class="service-box"><i class="icon icon-laptop"></i>
                    <h4>多维度信息统计功能</h4>
                    <p style="text-align:left; text-indent: 2em;">系统提供了多种条件组合对项目数量及合同款进行统计，包括区域、完成部门、时段、文件类型、主持人、定审人等，以满足不同需求。</p>
                    <p style=" text-align:left;text-indent: 2em;"> 统计时对项目进行分类，可以根据不同的身份或资格，对项目进行分配管理。提供多种数据筛选分类模式，完成对各个地区或者对各个用户的绩效评估。</p>
                    <p style=" text-align:left;text-indent: 2em;"> 全部信息经过其安全化管理，保障您的项目安全。</p>
                </div>
                <div class="service-box"><i class="icon icon-mobile"></i>
                    <h4>手机云端工作</h4>
                    <p>允许用户通过手机检测项目状态，随时随地进行云端工作，远程提交自己的意见。</p>
                    <div class="line"></div>
                </div>
            </div>
        </div>
        <!--  row end -->
    </div>
    <!--  container end -->
</section>
<!--  section services end -->

<!-- section portfolio start -->
<section id="section-portfolio" class="section-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading">
                    <h1>EIA环评管理系统</h1>
                    <h2>工作流程</h2>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="row" style="width: 1015px; margin: 0 auto;  ">

                <div style="width:500px; height: 320px; float: left; "><img style="width:500px; height: 320px;" src="images/portfolio/portfolio4.png"></div>
                <div style="width:500px; height: 320px; float: left; margin-left: 15px; "><img style="width:500px; height: 320px;" src="images/portfolio/portfolio2.png"></div>
                <div style="width:500px; height: 320px; float: left;  margin-top: 15px;"><img style="width:500px; height: 320px;" src="images/portfolio/portfolio3.png"></div>
                <div style="width:500px; height: 320px; float: left;  margin-top: 15px; margin-left: 15px;"><img style="width:500px; height: 320px;" src="images/portfolio/portfolio7.png"></div>
                <div style="width:500px; height: 320px; float: left; margin-top: 15px; "><img style="width:500px; height: 320px;" src="images/portfolio/portfolio6.png"></div>
                <div style="width:500px; height: 320px; float: left; margin-top: 15px; margin-left: 13px;"><img style="width:500px; height: 320px;" src="images/portfolio/portfolio1.png"></div>

            </div>
        </div>
    </div>
</section>
<!-- section portfolio end -->


<!-- Section testimonial start -->
<section id="section-testimonial" class="parallax1">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="carousel slide" id="testimonial-carousel">
                    <div class="carousel-inner">
                        <div class="item "><i class="icon icon-quote"></i>
                            <h4>总控模块</h4>
                            <p>总控模块是系统的中枢模块，其作用是协调各模块之间的通讯联系，完成系统整体控制、信息传递、根据用户请求完成相应的处理等任务。</p>
                        </div>
                        <!-- item end -->
                        <div class="item active"><i class="icon icon-quote"></i>
                            <h4>应用模块</h4>
                            <p>应用模块是系统的主功能模块，负责接收用户输入、完成事务处理、呈现处理结果。环评质量控制功能、多条件项目查询功能、多维度信息统计功能由该模块直接处理，系统的其它功能由该模块协助总控模块或防伪模块一起完成。</p>
                        </div>
                        <!-- item end -->
                        <div class="item"><i class="icon icon-quote"></i>
                            <h4>信息模块</h4>
                            <p>信息模块是系统的公共资源模块，主要任务是为用户提供公共信息服务。公共信息的来源为网上公开数据，系统通过数据挖掘与分析技术，循环监视和捕获环评相关信息，如法律法规标准、环评项目信息、环评资讯等，并及时传递给相关用户。</p>
                        </div>
                        <!-- item end -->
                    </div>
                    <!-- caorusel inner end -->
                    <!-- Indicators -->
                    <ol class="carousel-indicators">
                        <li data-target="#testimonial-carousel" data-slide-to="0"></li>
                        <li data-target="#testimonial-carousel" data-slide-to="1" class="active"></li>
                        <li data-target="#testimonial-carousel" data-slide-to="2"></li>
                    </ol>
                </div>
                <!-- caorusel slide end -->
            </div>
        </div>
        <!-- Row end -->
    </div>
    <!-- container end -->
</section>
<!-- section testimonial end -->

<!-- section contact start -->
<section id="section-contact" class="section-padding">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="section-heading text-center">
                    <p>赶紧来体验吧！</p>
                    <h2>用户登录</h2>
                </div>
            </div>
        </div>
        <!--  row heading end -->
        <div class="row">
            <div class="col-md-4">
                <ul class="contact-info">
                    <li class="info-block">
                        <div class="icon-block">
                            <i class="icon icon-mobile"></i>
                        </div>

                        <h4>账户获取</h4>
                        <p>找管理员注册属于你自己的账户吧</p>
                    </li>
                    <li class="info-block">
                        <div class="icon-block">
                            <i class="icon icon-globe"></i>
                        </div>
                        <h4>功能体验</h4>

                        <p>对本网站的操作有疑惑的，可以观看“演示视频”</p>
                    </li>
                    <li class="info-block">
                        <div class="icon-block">
                            <i class="icon icon-map"></i>
                        </div>
                        <h4>联系我们</h4>
                        <p>随时联系我们提供您宝贵的意见</p>
                    </li>
                </ul>
            </div>
            <div class="col-md-8  wow fadeInRight">
                <div class="contact-box">
                    <form id="contactForm">
                        <div class="col-md-12">
                            <div class="form-group">
                                <span class="spancss">用&nbsp;户&nbsp;名&nbsp;&nbsp;</span>
                                <input type="text" name="username" id="username" class="form-control" placeholder="请输入用户名" value="cairuojin">
                            </div>
                        </div>
                        <div class="clearfix" style="height: 110px"></div>
                        <div class="col-md-12">
                            <div class="form-group">
                                <span class="spancss">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码&nbsp;&nbsp;</span>
                                <input type="password" name="password" id="password" class="form-control" placeholder="请输入密码" value="123123">
                            </div>
                        </div>
                        <div class="clearfix" style="height: 110px"></div>
                        <div id="register-slider" class="tooltip-drag">
                            <div id="slider-bg" class="tooltip-bg"></div>
                            <span id="slider-label" class="tooltip-label">>></span>
                            <span id="labelTip" class="tooltip-tips">拖动滑块验证</span>
                        </div>


                        <div class="col-md-12  text-right wow fadeInUp text-center">
                            <button class="btn btn-black " onclick="loginUser()" type="button">登录</button>
                        </div>
                </form>
            </div>
        </div>
    </div>
    <!-- row end -->
    </div>
    <!-- container end -->
</section>
<!-- section contact end -->


<!--  Footer start  -->
<section id="footer" class="section-padding " style="height: 120px; padding: 0 0;">
    <div class="container"  style="text-align: center;">
        <p style="padding-top: 10px;">项目名称：环评管理系统</p>
        <p>地址：广东省广州市白云区江高镇环镇西路155号</p>
        <p>版权所有 ：广东技术师范大学</p>
    </div>
</section>
</body>
<script src="js/jquery.min.js"></script>
<script src="js/jquery.slideunlock.js"></script>    <!-- 滑动解锁js -->
<script src="js/sign.js"></script>                    <!-- 滑动解锁注册：需要配置 -->


<script src="assets/js/bootstrap.min.js"></script>
<!-- form validation -->
<script type="text/javascript" src="js/validator.min.js"></script>
<!-- Plugin JavaScript -->
<script src="js/jquery.easing.min.js"></script>
<!-- isotope -->
<script type="text/javascript" src="js/jquery.isotope.js"></script>
<!-- Waypoints -->
<script type="text/javascript" src="js/jquery.waypoints.min.js"></script>
<!-- Wow Animation -->
<script type="text/javascript" src="js/wow.min.js"></script>
<script src="js/theme.js"></script>
<script>
    $(function () {
        validateSucceed = false;    //判断登录是否得到验证
    })
</script>
<script>
    function loginUser() {
        if(validateSucceed == false){
            $("#labelTip").css("color","rgb(173, 40, 40)").html("您还没有验证");
        } else {
            $.ajax({
                "url": "/api/open/person/login",	//传输路径
                "data": {"username": $('#username').val(),"password": $('#password').val()},             //传入后台的值 json对象
                "type": "POST",
                "success": function (data) {
                    if (data) {     //登录成功，重定向
                        window.location.href = "/api/admin/"
                    } else {
                        initregisterSlider()
                        showTips("username", false, msgs.PASSWORD_NOT_RIGHT);
                        showTips("password", false, msgs.PASSWORD_NOT_RIGHT);
                    }
                }
            });
        }
    }
</script>
</html>
                                                                                                                                                                                                                                                                                                                                                                                                                              