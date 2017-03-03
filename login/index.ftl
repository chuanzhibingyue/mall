[#escape x as x?html]
<!DOCTYPE HTML PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>


<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />

<title>${message("login_index_need_login")}</title>

<link href="${base}/resources/admin/font/css/font-awesome.min.css" rel="stylesheet">
<link href="${base}/resources/admin/css/login.css" rel="stylesheet" type="text/css">

<script type="text/javascript" src="${base}/resources/resource/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/resource/js/common.js"></script>
<script type="text/javascript" src="${base}/resources/resource/js/jquery.tscookie.js"></script>
<script type="text/javascript" src="${base}/resources/resource/js/jquery.validation.min.js"></script>
<script src="${base}/resources/admin/js/jquery.supersized.min.js" ></script>
<script src="${base}/resources/admin/js/jquery.progressBar.js" type="text/javascript"></script>


<script type="text/javascript" src="${base}/resources/admin/js/jsbn.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/prng4.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/rng.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/rsa.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/base64.js"></script>
<script type="text/javascript" src="${base}/resources/admin/js/common.js"></script>


</head>
<body>
	
	
  <div class="login-layout">

  <div class="top">

   <h5>${message("login_index_title_01")}<em></em></h5>
    <h2>${message("login_index_title_02")}</h2>
    <h6>${message("login_index_title_03")}</h6>

  </div>

   <form method="post" id="form_login" action="login.jhtml">
  
  
      <input type="hidden" name="form_submit" value="ok" />
      <input type="hidden" name="SiteUrl" id="SiteUrl" value="${base}/shop" />

    <div class="lock-holder">

      <div class="form-group pull-left input-username">

        

         <label>${message("login_index_username")}</label>

          <input name="username" id="username" autocomplete="off" type="text" class="input-text" value="admin" required>

          

      </div>

      <i class="fa fa-ellipsis-h dot-left"></i> <i class="fa fa-ellipsis-h dot-right"></i>

      <div class="form-group pull-right input-password-box">

           <label>${message("login_index_password")}</label>
           <input type="hidden" id="enPassword" name="enPassword" />

                <input name="password" id="password" class="input-password" autocomplete="off" type="password" value="111111" required pattern="[\S]{6}[\S]*"

title="${message("login_index_password_pattern")}">

      </div>

    </div>

    <div class="avatar"><img src="${base}/resources/admin/images/login/admin.png" alt=""></div>

    <div class="submit"> <span>

<div class="code">

        <div class="arrow"></div>

        <div class="code-img"><img src="common/captcha.jhtml?captchaId=${captchaId}" name="captchaImage" id="captchaImage" border="0"/></div>

        <a href="JavaScript:void(0);" id="hide" class="close" title="${message("login_index_close_checkcode")}"><i></i></a><a id="changecodes"   class="change" title="看不清,点击更换验证码"><i></i></a> </div>

           
            
             <input name="captcha" type="text" required class="input-code" id="captcha" placeholder="${message("login_index_checkcode")}" pattern="[A-z0-9]{4}" title="${message("login_index_checkcode_pattern")}" autocomplete="off" value="" />

      </span> <span>

      <input name="nchash" type="hidden" value="" />
      <input name="" class="input-button" type="submit" value="${message("login_index_button_login")}">

      </span> </div>

      <div class="submit2"></div>

  </form>

  <div class="bottom">

</div>

</div>





<script>

$(function(){


    var $loginForm = $("#form_login");
	var $enPassword = $("#enPassword");
	var $username = $("#username");
	var $password = $("#password");
	
	
	var $changecodes = $("#changecodes");
	
	
	var rsaKey = new RSAKey();

		rsaKey.setPublic(b64tohex("${modulus}"), b64tohex("${exponent}"));
		var enPassword = hex2b64(rsaKey.encrypt($password.val()));

		$enPassword.val(enPassword);

	



	

        $.supersized({



        // 功能

        slide_interval     : 4000,    

        transition         : 1,    

        transition_speed   : 1000,    

        performance        : 1,    



        // 大小和位置

        min_width          : 0,    

        min_height         : 0,    

        vertical_center    : 1,    

        horizontal_center  : 1,    

        fit_always         : 0,    

        fit_portrait       : 1,    

        fit_landscape      : 0,    



        // 组件

        slide_links        : 'blank',    

        slides             : [    

                                 {image : '${base}/resources/admin/images/login/1.jpg'},

                                 {image : '${base}/resources/admin/images/login/2.jpg'},

                                 {image : '${base}/resources/admin/images/login/3.jpg'},

				 {image : '${base}/resources/admin/images/login/4.jpg'},

				 {image : '${base}/resources/admin/images/login/5.jpg'}

                       ]



    });

	//显示隐藏验证码

    $("#hide").click(function(){

        $(".code").fadeOut("slow");

    });

    $("#captcha").focus(function(){

        $(".code").fadeIn("fast");

    });

    //跳出框架在主窗口登录

   if(top.location!=this.location)	top.location=this.location;

    $('#username').focus();

    if ($.browser.msie && ($.browser.version=="6.0" || $.browser.version=="7.0")){

        window.location.href='${base}/admin/ie6update.html';

    }

    $("#captcha").nc_placeholder();

	//动画登录

    $('.btn-submit').click(function(e){
    
  
       

            $('.input-username,dot-left').addClass('animated fadeOutRight')

            $('.input-password-box,dot-right').addClass('animated fadeOutLeft')

            $('.btn-submit').addClass('animated fadeOutUp')

            setTimeout(function () {

                      $('.avatar').addClass('avatar-top');

                      $('.submit').hide();

                      $('.submit2').html('<div class="progress"><div class="progress-bar progress-bar-success" aria-valuetransitiongoal="100"></div></div>');

                      $('.progress .progress-bar').progressbar({

                          done : function() {
                          $('#form_login').submit();}

                      }); 

              },

          300);



          });



    // 回车提交表单

    $('#form_login').keydown(function(event){

        if (event.keyCode == 13) {
            $('.btn-submit').click();

        }

    });

});



</script>
	
	
	
</body>
</html>
[/#escape]