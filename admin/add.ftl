[#escape x as x?html]
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge;chrome=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="${base}/resources/resource/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/resource/js/jquery.validation.min.js"></script>
<script type="text/javascript" src="${base}/resources/resource/js/admincp.js"></script>
<script type="text/javascript" src="${base}/resources/resource/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${base}/resources/resource/js/common.js" charset="utf-8"></script>
<link href="${base}/resources/admin/css/skin_0.css" rel="stylesheet" type="text/css" id="cssfile2" />
<link href="${base}/resources/resource/js/perfect-scrollbar.min.css" rel="stylesheet" type="text/css">
<link href="${base}/resources/admin/css/common.css" rel="stylesheet" type="text/css" />
<link href="${base}/resources/admin/css/font/font-awesome/css/font-awesome.min.css" rel="stylesheet" />
<!--[if IE 7]>
  <link rel="stylesheet" href="${base}/resources/admin/css/font/font-awesome/css/font-awesome-ie7.min.css">
<![endif]-->
<script type="text/javascript" src="${base}/resources/resource/js/perfect-scrollbar.min.js"></script>

<script type="text/javascript">
SITEURL ='${base}';
RESOURCE_SITE_URL = '${base}/resources/resource/';
MICROSHOP_SITE_URL ='${base}/micshop';
CIRCLE_SITE_URL = '${base}/circle';
ADMIN_TEMPLATES_URL ='${base}/resources/admin/';
LOADING_IMAGE = "${base}/resources/admin/images/loading.gif";
//换肤
cookie_skin = $.cookie("MyCssSkin");
if (cookie_skin) {
	$('#cssfile2').attr("href","${base}/resources/admin/css/"+ cookie_skin +".css");
}
</script>
</head>
<body>
<div id="append_parent"></div>
<div id="ajaxwaitid"></div>

<div class="page">

 <div class="fixed-bar">
    <div class="item-title">
      <h3>${message("nc_limit_manage")}</h3>
       <ul class="tab-base">
       
           <li><a href="../admin/list.jhtml" [#if current==0] class="current" [/#if]><span>${message("limit_admin")}</span></a></li>
          <li><a href="../admin/add.jhtml"  [#if current==1] class="current" [/#if] ><span>${message("admin_add_limit_admin")}</span></a></li>
          <li><a href="../role/list.jhtml" [#if current==2] class="current" [/#if] ><span>${message("limit_gadmin")}</span></a></li>
          <li><a href="../role/add.jhtml"><span>${message("admin_add_limit_gadmin")}</span></a></li>
       
       </ul>
    </div>
  </div>

  <div class="fixed-empty"></div>
  
  
  <form id="add_form" method="post" action="save.jhtml">
    <input type="hidden" name="form_submit" value="ok" />
    <table class="table tb-type2 nobdb">
      <tbody>
        <tr class="noborder">
          <td colspan="2" class="required"><label class="validation" for="admin_name">${message("admin_index_username")}:</label></td>
        </tr>
        <tr class="noborder">
          <td class="vatop rowform"><input type="text" id="admin_name" name="admin_name" class="txt"></td>
          <td class="vatop tips">${message("admin_add_username_tip")}</td>
        </tr>
        <tr>
          <td colspan="2" class="required"><label class="validation" for="admin_password">${message("admin_index_password")}:</label></td>
        </tr>
        <tr class="noborder">
          <td class="vatop rowform"><input type="password" id="admin_password" name="admin_password" class="txt"></td>
          <td class="vatop tips">${message("admin_add_password_tip")}</td>
        </tr>
        <tr>
          <td colspan="2" class="required"><label class="validation" for="admin_password">${message("admin_rpassword")}:</label></td>
        </tr>
        <tr class="noborder">
          <td class="vatop rowform"><input type="password" id="admin_rpassword" name="admin_rpassword" class="txt"></td>
          <td class="vatop tips">${message("admin_add_password_tip")}</td>
        </tr>
        <tr>
          <td colspan="2" class="required"><label class="validation" for="gadmin_name">${message("gadmin_name")}:</label></td>
        </tr>
        <tr class="noborder">
          <td class="vatop rowform">
          <select name="gid">
        
          </select>
          </td>
          <td class="vatop tips">${message("admin_add_gid_tip")}</td>
        </tr>
      </tbody>
      <tfoot>
        <tr class="tfoot">
          <td colspan="2"><a href="JavaScript:void(0);" class="btn" id="submitBtn"><span>${message("nc_submit")}</span></a></td>
        </tr>
      </tfoot>
    </table>
  </form>
</div>
<script>
//按钮先执行验证再提交表
$(document).ready(function(){
	//按钮先执行验证再提交表单
	$("#submitBtn").click(function(){
	    if($("#add_form").valid()){
	     $("#add_form").submit();
		}
	});
	
	$("#add_form").validate({
		errorPlacement: function(error, element){
			error.appendTo(element.parent().parent().prev().find('td:first'));
        },
        rules : {
            admin_name : {
                required : true,
				minlength: 3,
				maxlength: 20,
				remote	: {
                    url :'check_username.jhtml',
                    type:'get',
                    data:{
                    	admin_name : function(){
                            return $('#admin_name').val();
                        }
                    }
                }
            },
            admin_password : {
                required : true,
				minlength: 6,
				maxlength: 20
            },
            admin_rpassword : {
                required : true,
                equalTo  : '#admin_password'
            },
            gid : {
                required : true
            }        
        },
        messages : {
            admin_name : {
                required : '${message("admin_add_username_null")}',
				minlength: '${message("admin_add_username_max")}',
				maxlength: '${message("admin_add_username_max")}',
				remote	 : '${message("admin_add_admin_not_exists")}'
            },
            admin_password : {
                required : '${message("admin_add_password_null")}',
				minlength: '${message("admin_add_password_max")}',
				maxlength: '${message("admin_add_password_max")}'
            },
            admin_rpassword : {
                required : '${message("admin_add_password_null")}',
                equalTo  : '${message("admin_edit_repeat_error")}'
            },
            gid : {
                required : '${message("admin_add_gid_null")}',
            }
        }
	});
});
</script>
  
  
  
  
   
   
   
   

   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

</div>
</body>
</html>
[/#escape]