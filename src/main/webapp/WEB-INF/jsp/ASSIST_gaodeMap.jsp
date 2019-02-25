<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 在高德地图中查看标点 -->
<html>
<head>
    <title>环评管理系统</title>
    <!-- 高德地图所需 -->
    <link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no, width=device-width">
</head>

<body>

    <!-- 地图div -->
    <div id="container" style="width: 100%;height: 100%">
    </div>
</body>

<!-- 高德地图所需 -->
<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.5&key=45cb58339388d022eb47b3b7f9413a10&plugin=AMap.Autocomplete"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>

<!-- 高德地图加载函数 -->
<script type="text/javascript">
    var marker = new AMap.Marker({
        position: [${lng}, ${lat}]
    });
    var map = new AMap.Map("container", {
        resizeEnable: true,
        zoom:14,
        center:[${lng}, ${lat}],
    });
    map.add(marker);        //添加新marker
</script>
</html>
