<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>合同信息录入</title>
    <link rel="stylesheet" type="text/css" href="/css/reset.css" media="screen" />
    <link rel="stylesheet" type="text/css" href="/css/layout.css" media="screen" />
</head>
<body>
<div class="info" >
    <div  >
        <form>
            <table class="form">
                <tr>
                    <td class="col11 tdcss1"  >
                        <label class="labelsize">
                            项目名称</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            [${projectInfo.number}]${projectInfo.name}</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            文件类型</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            ${projectInfo.filetypeName}</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            建设方</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <label class="labelsize" style="font-weight: normal;">
                            ${projectInfo.builder}</label>
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            合同编号</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="grumble" />
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            合同签订日期</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="grumble" />
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            合同份数</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="grumble" />
                    </td>
                </tr>
                <tr>
                    <td class="col1 tdcss1" >
                        <label class="labelsize" >
                            合同附件</label>
                    </td>
                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="file"  id="grumble" />
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" >
                        <label class="labelsize" >
                            合同款（万元）</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <input type="text" id="grumble" />
                    </td>
                </tr>
                <tr>
                    <td class="col11 tdcss1" style="vertical-align: middle;" >
                        <label class="labelsize" >
                            合同摘要</label>
                    </td>

                    <td class="col2 tdcss2" style="padding-left: 30px;" >
                        <textarea   name="txt" clos="500" rows="6"  width="500px" style="width:100%;"></textarea>
                    </td>
                </tr>


            </table>
        </form>
        <div class="btnnew" >
            <input type="submit" class="btn btn-primary" value="保存"  >
            </input>&nbsp;&nbsp;&nbsp;&nbsp;

        </div>
    </div>

</div>
</body>
</html>