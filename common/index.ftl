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


<script type="text/javascript" src="${base}/resources/resource/js/jquery.mousewheel.js"></script>

<div class="page">

 <div class="fixed-bar">
    <div class="item-title">
     <h3>${message("dashboard_wel_system_info")}</h3>
    </div>
  </div>

  <div class="fixed-empty"></div>
  
  
   <div class="info-panel">
    <dl class="member">
      <dt>
        <div class="ico"><i></i><sub title="${message("dashboard_wel_total_member")}"><span><em id="statistics_member"></em></span></sub></div>
        <h3>${message("nc_member")}</h3>
        <h5>${message("dashboard_wel_member_des")}</h5>
      </dt>
      <dd>
        <ul>
          <li class="w50pre normal"><a href="index.php?act=member&op=member">${message("dashboard_wel_new_add")}<sub><em id="statistics_week_add_member"></em></sub></a></li>
          <li class="w50pre none"><a href="index.php?act=predeposit&op=pd_cash_list">${message("dashboard_wel_predeposit_get")}<sub><em id="statistics_cashlist">0</em></sub></a></li>
        </ul>
      </dd>
    </dl>
    <dl class="shop">
      <dt>
        <div class="ico"><i></i><sub title="${message("dashboard_wel_count_store_add")}<span><em id="statistics_store"></em></span></sub></div>
        <h3>${message("nc_store")}</h3>
        <h5>${message("dashboard_wel_store_des")}</h5>
      </dt>
      <dd>
        <ul>
          <li class="w20pre none"><a href="index.php?act=store&op=store_joinin">开店审核<sub><em id="statistics_store_joinin">0</em></sub></a></li>
          <li class="w20pre none"><a href="index.php?act=store&op=store_bind_class_applay_list&state=0">类目申请<sub><em id="statistics_store_bind_class_applay">0</em></sub></a></li>
          <li class="w20pre none"><a href="index.php?act=store&op=reopen_list&re_state=1">续签申请<sub><em id="statistics_store_reopen_applay">0</em></sub></a></li>
          <li class="w20pre none"><a href="index.php?act=store&op=store&store_type=expired">${message("dashboard_wel_expired")}<sub><em id="statistics_store_expired">0</em></sub></a></li>
          <li class="w20pre none"><a href="index.php?act=store&op=store&store_type=expire">${message("dashboard_wel_expire")}<sub><em id="statistics_store_expire">0</em></sub></a></li>
        </ul>
      </dd>
    </dl>
    <dl class="goods">
      <dt>
        <div class="ico"><i></i><sub title="${message("dashboard_wel_total_goods")}"><span><em id="statistics_goods"></em></span></sub></div>
        <h3>${message("nc_goods")}</h3>
        <h5>${message("dashboard_wel_goods_des")}</h5>
      </dt>
      <dd>
        <ul>
          <li class="w25pre normal"><a href="index.php?act=goods&op=goods">${message("dashboard_wel_new_add")}<sub title="${message("dashboard_wel_count_goods")}"><em id="statistics_week_add_product"></em></sub></a></li>
          <li class="w25pre none"><a href="">商品审核<sub><em id="statistics_product_verify">0</em></sub></a></li>
          <li class="w25pre none"><a href="index.php?act=inform&op=inform_list">${message("dashboard_wel_inform")}<sub><em id="statistics_inform_list">0</em></sub></a></li>
          <li class="w25pre none"><a href="index.php?act=brand&op=brand_apply">${message("dashboard_wel_brnad_applay")}<sub><em id="statistics_brand_apply">0</em></sub></a></li>
        </ul>
      </dd>
    </dl>
    <dl class="trade">
      <dt>
        <div class="ico"><i></i><sub title="${message("dashboard_wel_total_order")}"><span><em id="statistics_order"></em></span></sub></div>
        <h3>${message("nc_trade")}</h3>
        <h5>${message("dashboard_wel_trade_des")}</h5>
      </dt>
      <dd>
        <ul>
          <li class="w18pre none"><a href="index.php?act=refund&op=refund_manage">退款<sub><em id="statistics_refund"></em></sub></a></li>
          <li class="w18pre none"><a href="index.php?act=return&op=return_manage">退货<sub><em id="statistics_return"></em></sub></a></li>
          <li class="w25pre none"><a href="index.php?act=vr_refund&op=refund_manage">虚拟订单退款<sub><em id="statistics_vr_refund"></em></sub></a></li>
          <li class="w18pre none"><a href="index.php?act=complain&op=complain_new_list">${message("dashboard_wel_complain")}<sub><em id="statistics_complain_new_list">0</em></sub></a></li>
          <li class="w20pre none"><a href="index.php?act=complain&op=complain_handle_list">${message("dashboard_wel_complain_handle")}<sub><em id="statistics_complain_handle_list">0</em></sub></a></li>
        </ul>
      </dd>
    </dl>
    <dl class="operation">
      <dt>
        <div class="ico"><i></i></div>
        <h3>${message("nc_operation")}</h3>
        <h5>${message("dashboard_wel_stat_des")}</h5>
      </dt>
      <dd>
        <ul>
          <li class="w15pre none"><a href="index.php?act=groupbuy&op=groupbuy_verify_list">${message("dashboard_wel_groupbuy")}<sub><em id="statistics_groupbuy_verify_list">0</em></sub></a></li>
          <li class="w17pre none"><a href="index.php?act=pointorder&op=pointorder_list&porderstate=waitship">${message("dashboard_wel_point_order")}<sub><em id="statistics_points_order">0</em></sub></a></li>
          <li class="w17pre none"><a href="index.php?act=bill&op=show_statis&os_month=&query_store=&bill_state=2">${message("dashboard_wel_check_billno")}<sub><em id="statistics_check_billno">0</em></sub></a></li>
          <li class="w17pre none"><a href="index.php?act=bill&op=show_statis&os_month=&query_store=&bill_state=3">${message("dashboard_wel_pay_billno")}<sub><em id="statistics_pay_billno">0</em></sub></a></li>
          <li class="w17pre none"><a href="">平台客服<sub><em id="statistics_mall_consult">0</em></sub></a></li>
          <li class="w17pre none"><a href="">服务站<sub><em id="statistics_delivery_point">0</em></sub></a></li>
        </ul>
      </dd>
    </dl>

    
    <dl class="cms">
      <dt>
        <div class="ico"><i></i></div>
        <h3>CMS</h3>
        <h5>资讯文章/图片画报/会员评论</h5>
      </dt>
      <dd>
        <ul>
          <li class="w33pre none"><a href="">文章审核<sub><em id="statistics_cms_article_verify">0</em></sub></a></li>
          <li class="w33pre none"><a href="">画报审核<sub><em id="statistics_cms_picture_verify">0</em></sub></a></li>
          <li class="w34pre none"><a href="">评论<sub></sub></a></li>
        </ul>
      </dd>
    </dl>
   
   
    <dl class="circle">
      <dt>
        <div class="ico"><i></i></div>
        <h3>圈子</h3>
        <h5>申请开通/圈内话题及举报</h5>
      </dt>
      <dd>
        <ul>
          <li class="w33pre none"><a href="">圈子申请<sub><em id="statistics_circle_verify">0</em></sub></a></li>
          <li class="w33pre none"><a href="">话题</a></li>
          <li class="w34pre none"><a href="">举报</a></li>
        </ul>
      </dd>
    </dl>
  
    
    <dl class="microshop">
      <dt>
        <div class="ico"><i></i></div>
        <h3>微商城</h3>
        <h5>随心看/个人秀/店铺街</h5>
      </dt>
      <dd>
        <ul>
          <li class="w33pre none"><a href="">随心看</a></li>
          <li class="w33pre none"><a href="">个人秀</a></li>
          <li class="w34pre none"><a href="">店铺街</a></li>
        </ul>
      </dd>
    </dl>
 
 
 
    <dl class="system">
      <dt>
        <div class="ico"><i></i></div>
        <h3>${message("dashboard_welcome_sys_info")}</h3>
        <div id="system-info">
          <ul>
            <li>多用户商城 ${message("dashboard_welcome_version")}<span>20150315</span></li>
            <li> ${message("dashboard_welcome_install_date")}<span></span></li>
            <li> ${message("dashboard_welcome_server_os")}<span></span></li>
            <li>WEB  ${message("dashboard_welcome_server")}<span></span></li>
            <li>PHP  ${message("dashboard_welcome_version")}<span></span></li>
            <li>MYSQL  ${message("dashboard_welcome_version")}<span></span></li>
          </ul>
        </div>
      </dt>
      <dd>
        <ul>
          <li class="w50pre none"><a href="#" target="_blank">官方网站<sub></sub></a></li>
          <li class="w50pre none"><a href="#" target="_blank">官方论坛<sub></sub></a></li>
        </ul>
      </dd>
    </dl>
    <div class="clear"></div>
    <div class="system-info"></div>
  </div>
</div>
<script type="text/javascript">
var normal = ['week_add_member','week_add_product'];
var work = ['store_joinin','store_bind_class_applay','store_reopen_applay','store_expired','store_expire','brand_apply','cashlist','groupbuy_verify_list','points_order','complain_new_list','complain_handle_list', 'product_verify','inform_list','refund','return','vr_refund','cms_article_verify','cms_picture_verify','circle_verify','check_billno','pay_billno','mall_consult','delivery_point','offline'];
$(document).ready(function(){
	$.getJSON("index.php?act=dashboard&op=statistics", function(data){
	  $.each(data, function(k,v){
		  $("#statistics_"+k).html(v);
		  if (v!= 0 && $.inArray(k,work) !== -1){
			$("#statistics_"+k).parent().parent().parent().removeClass('none').addClass('high');
		  }else if (v == 0 && $.inArray(k,normal) !== -1){
			$("#statistics_"+k).parent().parent().parent().removeClass('normal').addClass('none');
		  }
	  });
	});
	//自定义滚定条
	$('#system-info').perfectScrollbar();
});
</script>
  
  
  
  
  </div>
</body>
</html>
[/#escape]