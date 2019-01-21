;$(function () {

    // 注册滑块事件
    var registerSlider = new SliderUnlock("#register-slider", {
        successLabelTip: "验证成功"
    }, function () {


        function showRegisterModal() {
            // 验证成功弹出模态框
            $('#registerModal').modal({
                show: true
            })

            // 触发点击按钮的事件

            $("#register-data input[name = getCode]").bind("click", function () {
                setTime(this);
            });
            $('#register-data input[name = getCode]').trigger("click");
        }

        function initregisterSlider() {
            $("#labelTip").html("验证失败,数据有误");
            $("#labelTip").css("color", "#ad2828");
            registerSlider.init();
        }

        validateRegister(showRegisterModal, initregisterSlider);
        // if (validateRegister(showRegisterModal,initregisterSlider)) {
        //     //ajax请求发送验证码
        // } else {
        //     $("#labelTip").html("验证失败,数据有误");
        //     $("#labelTip").css("color", "#ad2828");
        //     registerSlider.init();
        // }

    });
    registerSlider.init();

    // 关闭模态框的时候初始化滑块
    $("#close").click(function () {
        // setTimeout(function () {
        $("#labelTip").html("拖动滑块验证");
        $("#labelTip").css("color", "#787878");
        // }, 2000);
        registerSlider.init();
    });
    $("#closeBtn").click(function () {
        // setTimeout(function () {
        $("#labelTip").html("拖动滑块验证");
        $("#labelTip").css("color", "#787878");
        // }, 2000);
        registerSlider.init();
    });
    $(".modal-content").click(function () {
        // setTimeout(function () {
        $("#labelTip").html("拖动滑块验证");
        $("#labelTip").css("color", "#787878");
        // }, 2000);
        registerSlider.init();
    });


    // 登录滑块事件
    var loginSlider = new SliderUnlock("#login-slider", {
        successLabelTip: "验证成功"
    }, function () {
        // alert("验证成功,即将跳转至#");
        // window.location.href = "#";
        //以下四行设置恢复初始，不需要可以删除
        // setTimeout(function () {
        //     $("#labelTip").html("拖动滑块验证");
        //     $("#labelTip").css("color", "#787878");
        // }, 2000);

        // slider.init();

        // 提交登录的表单
        submitLoginForm();
        // 初始化滑块
        // setTimeout(function () {
        $("#login-slider .tooltip-tips").html("拖动滑块验证");
        $("#login-slider .tooltip-tips").css("color", "#787878");
        // $("#labelTip").html("拖动滑块验证");
        // $("#labelTip").css("color", "#787878");
        // }, 2000);
        loginSlider.init();
    });
    // 生成滑块后必须初始化
    loginSlider.init();


    // 校验用户名
    // 焦点事件
    // 离焦事件
    // 改变事件
    // 禁用启用
    // _form.find('input[type=text],textarea')


    /**
     *  监听用户名输入框
     */
    $("#register input[name=username]").bind("input", function () {
        if (!checkLoginNameFormat(this.value)) {
            //校验用户名格式
            showTips(this.name, false, msgs.USERNAME_INVALID_FORMAT);
        } else {
            showTips(this.name, true);
        }
    });
    /**
     *  监听邮箱email输入框
     */
    $("#register input[name=email]").bind("input", function () {
        // 校验邮箱格式
        if (!checkEmailFormat(this.value)) {
            //校验用户名格式
            showTips(this.name, false, msgs.EMAIL_INVALID_FORMAT);
        } else {
            showTips(this.name, true);
        }
    });
    /**
     *  监听密码password输入框
     */
    $("#register input[name=password]").bind("input", function () {
        // 校验密码格式
        if (!checkPasswordFormat(this.value)) {
            //校验用户名格式
            showTips(this.name, false, msgs.PASSWORD_INVALID_FORMAT);
        } else {
            showTips(this.name, true);
        }
    });

    /**
     * 监听请求发送验证码的按钮
     */
    $("#register input[name=getCode]").bind("click", function () {
        // 请求验证码
        $.ajax({
            type: "POST",
            dataType: 'json',
            url: ctx + "/sign/sendCode",
            success: function (data) {
                if (data.statusCode == "200") {
                } else {
                }
            }
        });
    });

});

// 校验注册数据
function validateRegister(successCallback, errorCallback) {
    // 校验用户名
    var username = $("#register input[name=username]").val();
    // 校验密码
    var password = $("#register input[name=password]").val();
    // 校验邮箱
    var email = $("#register input[name=email]").val();

    if (checkLoginNameFormat(username) && checkEmailFormat(email) && checkPasswordFormat(password)) {
        // 验证成功

        // 往模态框插入数据
        // 用户名
        $("#register-data input[name=username]").val(username);
        // 邮箱
        $("#register-data input[name=email]").val(email);
        // 密码
        $("#register-data input[name=password]").val(password);
        // 验证码
        $("#register-data input[name=code]").val("");

        user = {
            "username": username,
            "email": email
        };
        checkData(user, successCallback, errorCallback);
        return false;
    } else {
        // 验证失败
        if (!checkLoginNameFormat(username)) {
            showTips("username", false, msgs.USERNAME_INVALID_FORMAT);
        }
        if (!checkEmailFormat(email)) {
            showTips("email", false, msgs.EMAIL_INVALID_FORMAT);
        }
        if (!checkPasswordFormat(password)) {
            showTips("password", false, msgs.PASSWORD_INVALID_FORMAT);
        }
        errorCallback();
        return false;
    }
}

const msgs = {
    "USERNAME_EXISTENT": "用户名已存在",
    "EMAIL_EXISTENT": "邮箱已存在",
    "PHONE_EXISTENT": "手机已存在",
    "USERNAME_INVALID_FORMAT": "中文、英文、数字",
    "EMAIL_INVALID_FORMAT": "输入错误，请重新输入",
    "PHONE_INVALID_FORMAT": "手机号码不支持",
    "PASSWORD_INVALID_FORMAT": "英文、数字、标点符号，长度6-12位"
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
    if ($("#register input[name=" + name + "] + i").length == 0) {
        $("#register input[name=" + name + "]").after(iTips);
        $("#register input[name=" + name + "]  + i + span").css("color", "#ad2828");
    }

    if (value) {
        // value为true
        // 移除感叹号样式
        $("#register input[name=" + name + "] + i").removeClass("glyphicon-exclamation-sign");
        // 添加ok样式
        $("#register input[name=" + name + "] + i").addClass("glyphicon-ok-sign");
        // 修改颜色
        $("#register input[name=" + name + "] + i").css("color", "#28ad33");

        if ($("#register input[name=" + name + "] + i + span").length > 0) {
            // 如果提示信息存在，移除
            $("#register input[name=" + name + "]  + i + span").remove();
        }
    } else {
        // 如果提示信息存在，添加提示信息
        if ($("#register input[name=" + name + "]  + i + span").length == 0) {
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
            $("#register input[name=" + name + "] + i").after(errSpan);
        }
        // 移除ok图标样式
        $("#register input[name=" + name + "] + i").removeClass("glyphicon-ok-sign");
        // 增加！图标样式
        $("#register input[name=" + name + "] + i").addClass("glyphicon-exclamation-sign");
        // 修改颜色
        $("#register input[name=" + name + "] + i").css("color", "#ad2828");
    }
}

/**
 * 校验用户名或邮箱是否存在
 * user对象
 * callback成功后的回调函数
 */
function checkData(user, successCallback, errorCallback) {
    $.ajax({
        type: "POST",
        dataType: 'json',
        url: ctx + "sign/cheakUser",
        data: user,
        success: function (result) {
            if (result.statusCode == "200") {
                successCallback();
            } else {
                // 判断那条数据重复
                $.each(result.data, function (index, value) {
                    switch (value) {
                        case "username":
                            showTips("username", false, msgs.USERNAME_EXISTENT);
                            break;
                        case "email":
                            showTips("email", false, msgs.EMAIL_EXISTENT);
                            break;
                        case "phone":
                            showTips("phone", false, msgs.PHONE_EXISTENT);
                            break;
                        default:
                            break;
                    }
                });

                errorCallback();
            }
        }
    });
}

/**
 *按钮点击后倒计时
 * object为jq对象
 */
var startTime = 10;
var countdown = startTime;

function setTime(object) {
    object.setAttribute("disabled", true);
    object.value = "重新发送(" + countdown + ")";
    countdown--;

    setTimeout(function () {
        if (countdown > 0) {
            setTime(object)
        } else if (countdown == 0) {
            object.removeAttribute("disabled");
            object.value = "免费获取验证码";
            countdown = startTime;
        } else {
            object.setAttribute("disabled", true);
            object.value = "重新发送(" + countdown + ")";
            countdown--;
        }
    }, 1000)
}

/**
 * 1.提交登录报表，判断记住密码是否勾选
 * 2.若勾选，存入localstorage
 */
function submitLoginForm() {
    console.log("登录");
    var loginName = $.trim($("#login input[name=loginName]").val());
    var password = $.trim($("#login input[name=password]").val());
    var user = {
        "password": password
    };

    var type = null;

    // 判断是否勾选，然后存入账户到localstorage
    if ($("#brand1").prop('checked')) {
        var storage = window.localStorage;
        if (!$.trim(loginName)) {
            // "",null,undefined
        } else {
            storage.setItem("loginName", loginName);
        }
    }

    // 判断账户为用户名，邮箱，还是手机
    if (checkLoginNameFormat(loginName)) {
        // 用户名
        type = "0";
        user.username = loginName;
    } else if (checkEmailFormat(loginName)) {
        // 邮箱
        type = "1";
        user.email = loginName;
    } else if (checkPhoneFormat(loginName)) {
        // 手机号
        type = "2";
        user.phone = loginName;
    } else {

    }

    // 提交验证登录
    $.ajax({
        type: "POST",
        dataType: "json",
        data: user,
        url: ctx + "sign/signIn",
        success: function (data) {
            if (data.statusCode == "200") {
                // 登录成功
                window.location.href = ctx;
            }
        }
    });
}