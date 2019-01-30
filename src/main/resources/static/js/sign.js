;$(function () {
    // 注册滑块事件
    registerSlider = new SliderUnlock("#register-slider", {
        successLabelTip: "验证成功"
    }, function () {
        validateRegister(showRegisterModal, initregisterSlider); //校验函数，成功调成功函数，失败调失败函数
    });
    registerSlider.init();
});

//成功函数
function showRegisterModal() {
    // 验证成功弹出模态框
    $('#registerModal').modal({
        show: true
    })

    $('#register-data input[name = getCode]').trigger("click");

    validateSucceed = true;
}

//失败函数
function initregisterSlider() {
    $("#labelTip").html("验证失败,数据有误");
    $("#labelTip").css("color", "#ad2828");
    registerSlider.init();
}


// 校验数据
function validateRegister(successCallback, errorCallback) {
    var username = $("#contactForm input[name=username]").val();
    var password = $("#contactForm input[name=password]").val();
    var validate = true;
    if (username.length < 6 || username.length >= 30) {
        showTips("username", false, msgs.USERNAME_INVALID_FORMAT);
        validate = false;
    } else {
        showTips("username", true, "");
    }
    if (password.length < 6 || password.length >= 30) {
        showTips("password", false, msgs.PASSWORD_INVALID_FORMAT);
        validate = false;
    } else {
        showTips("password", true, "");
    }

    // 校验用户名是否存在
    $.ajax({
        "async": false,  //同步
        "url": "/api/open/person/usernameExist",	//传输路径
        "data": {"username": username},             //传入后台的值 json对象
        "type": "POST",
        "success": function (data) {
            if (data) {   //校验用户名是否存在,返回true为不存在，校验失败
                showTips("username", false, msgs.USERNAME_EXISTENT);
                validate = false;
            }
        }
    });

    if (validate == false)
        errorCallback()
    else
        successCallback();  //调用成功函数，登录
}

const msgs = {
    "USERNAME_EXISTENT": "用户名不存在，请重新确认",
    "USERNAME_INVALID_FORMAT": "用户名必须长度6-30位",
    "PASSWORD_INVALID_FORMAT": "密码必须长度6-30位",
    "PASSWORD_NOT_RIGHT": "用户名和密码不匹配，请您重新确认"
}

/**
 * 输入框校验标签显示
 * 显示正确提示
 * name 为标签name
 * value 为true显示正确 为false显示错误
 *
 */
function showTips(name, value, msg) {
// 输入校验提示标签
    var iTips = '<i class="formTips glyphicon glyphicon-exclamation-sign"></i>';
    var errSpan = '<span class="errspan">输入错误，请重新输入</span>';

    // 如果提示信息不存在，添加
    if ($("#contactForm input[name=" + name + "] + i").length == 0) {
        $("#contactForm input[name=" + name + "]").after(iTips);
        $("#contactForm input[name=" + name + "]  + i + span").css("color", "#ad2828");
    }

    if (value) {
        // value为true
        // 移除感叹号样式
        $("#contactForm input[name=" + name + "] + i").removeClass("glyphicon-exclamation-sign");
        // 添加ok样式
        $("#contactForm input[name=" + name + "] + i").addClass("glyphicon-ok-sign");
        // 修改颜色
        $("#contactForm input[name=" + name + "] + i").css("color", "#28ad33");

        if ($("#contactForm input[name=" + name + "] + i + span").length > 0) {
            // 如果提示信息存在，移除
            $("#contactForm input[name=" + name + "]  + i + span").remove();
        }
    } else {
        // 如果提示信息存在，添加提示信息
        if ($("#contactForm input[name=" + name + "]  + i + span").length == 0) {
            switch (name) {
                case "username":
                    errSpan = '<span class="errspan">' + msg + '</span>';
                    break;
                case "email":
                    errSpan = '<span class="errspan">' + msg + '</span>';
                    break;
                case "password":
                    errSpan = '<span class="errspan">' + msg + '</span>';
                    break;
                default:
                    break;
            }
            $("#contactForm input[name=" + name + "] + i").after(errSpan);
        }
        // 移除ok图标样式
        $("#contactForm input[name=" + name + "] + i").removeClass("glyphicon-ok-sign");
        // 增加！图标样式
        $("#contactForm input[name=" + name + "] + i").addClass("glyphicon-exclamation-sign");
        // 修改颜色
        $("#contactForm input[name=" + name + "] + i").css("color", "#ad2828");
    }
}