﻿//
// //jquery.validate表单验证
// $(document).ready(function(){
// 	//登陆表单验证
// 	$("#contactForm").validate({
// 		rules:{
// 			username:{
// 				required:true,//必填
// 				minlength:6, //最少6个字符
// 				maxlength:20,//最多20个字符
//                 remote:{	//查看此用户名是否存在
//                     url: "/checkExistAuthor",
//                     type:"post",
//                     data:{"nickname":function() {return $('#username').val();}}  //传入后台的值
//                 },
// 			},
// 			password:{
// 				required:true,
// 				minlength:6,
// 				maxlength:20,
// 			},
// 		},
// 		//错误信息提示
// 		messages:{
// 			username:{
// 				required:"必须填写用户名",
// 				minlength:"用户名至少为6个字符",
// 				maxlength:"用户名至多为20个字符",
// 				remote: "该用户名已存在",
// 			},
// 			password:{
// 				required:"必须填写密码",
// 				minlength:"密码至少为6个字符",
// 				maxlength:"密码至多为20个字符",
// 			},
// 		},
//
// 	});
//
//     $.validator.setDefaults({
//         submitHandler:function(form){
//             form.submit();//提交时拦截
//         },
//         errorElement:'div',
//         highlight: function(element, errorClass) {
//             $(element).addClass(errorClass);
//         },
//         unhighlight:function(element, errorClass){
//             $(element).removeClass(errorClass);
//         }
//     });
//
//
//
//
//
//     // //注册表单验证
// 	// $("#registerForm").validate({
// 	// 	rules:{
// 	// 		username:{
// 	// 			required:true,//必填
// 	// 			minlength:6, //最少6个字符
// 	// 			maxlength:20,//最多20个字符
// 	// 			remote:{
// 	// 				url: "/checkExistUsername",
// 	// 				type:"post",
//      //                data:{"username":function() {return $('#username').val();}}  //传入后台的值
// 	// 			},
// 	// 		},
// 	// 		password:{
// 	// 			required:true,
// 	// 			minlength:6,
// 	// 			maxlength:20,
// 	// 		},
// 	// 		nickname:{
// 	// 			required:true,
//      //            minlength:1,
//      //            maxlength:20,
// 	// 		},
// 	// 		email:{
// 	// 			required:true,
// 	// 			email:true,
// 	// 		},
// 	// 		confirm_password:{
// 	// 			required:true,
// 	// 			minlength:6,
// 	// 			equalTo:'.password'
// 	// 		},
// 	// 		phone_number:{
// 	// 			required:true,
// 	// 			phone_number:true,//自定义的规则
// 	// 			digits:true,//整数
// 	// 		}
// 	// 	},
// 	// 	//错误信息提示
// 	// 	messages:{
// 	// 		username:{
// 	// 			required:"必须填写用户名",
// 	// 			minlength:"用户名至少为6个字符",
// 	// 			maxlength:"用户名至多为20个字符",
// 	// 			remote: "用户名已存在",
// 	// 		},
//      //        nickname:{
//      //            required:"必须填写昵称",
//      //            minlength:"昵称至少为1个字符",
//      //            maxlength:"密码至多为20个字符",
//      //        },
// 	// 		password:{
// 	// 			required:"必须填写密码",
// 	// 			minlength:"密码至少为6个字符",
// 	// 			maxlength:"密码至多为20个字符",
// 	// 		},
// 	// 		email:{
// 	// 			required:"请输入邮箱地址",
// 	// 			email: "请输入正确的email地址"
// 	// 		},
// 	// 		confirm_password:{
// 	// 			required: "请再次输入密码",
// 	// 			minlength: "确认密码不能少于6个字符",
// 	// 			equalTo: "两次输入密码不一致",//与另一个元素相同
// 	// 		},
// 	// 		phone_number:{
// 	// 			required:"请输入手机号码",
// 	// 			digits:"请输入正确的手机号码",
// 	// 		},
//     //
// 	// 	},
// 	// });
// 	// //添加自定义验证规则
// 	// jQuery.validator.addMethod("phone_number", function(value, element) {
// 	// 	var length = value.length;
// 	// 	var phone_number = /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/
// 	// 	return this.optional(element) || (length == 11 && phone_number.test(value));
// 	// }, "手机号码格式错误");
// });
