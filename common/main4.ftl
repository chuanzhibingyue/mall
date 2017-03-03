[#assign shiro = JspTaglibs["/WEB-INF/tld/shiro.tld"] /]
[#escape x as x?html]
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>${html_title} - Powered By JSHOP</title>
<link href="${base}/resources/admin/css/skin_0.css" rel="stylesheet" type="text/css" id="cssfile"/>

<script type="text/javascript" src="${base}/resources/resource/js/jquery.js"></script>
<script type="text/javascript" src="${base}/resources/resource/js/jquery.validation.min.js"></script>
<script type="text/javascript" src="${base}/resources/resource/js/jquery.cookie.js"></script>
<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
      <script src="${base}/resources/resource/js/html5shiv.js"></script>
      <script src="${base}/resources/resource/js/respond.min.js"></script>
<![endif]-->

<script>

$(document).ready(function () {
    $('span.bar-btn').click(function () {
	$('ul.bar-list').toggle('fast');
    });
});

$(document).ready(function(){
	var pagestyle = function() {
		var iframe = $("#workspace");
		var h = $(window).height() - iframe.offset().top;
		var w = $(window).width() - iframe.offset().left;
		if(h < 300) h = 300;
		if(w < 973) w = 973;
		iframe.height(h);
		iframe.width(w);
	}
	pagestyle();
	$(window).resize(pagestyle);
	//turn location
	if($.cookie('now_location_act') != null){
		openItem($.cookie('now_location_op')+','+$.cookie('now_location_act')+','+$.cookie('now_location_nav'));
	}else{
		$('#mainMenu>ul').first().css('display','block');
		//第一次进入后台时，默认定到欢迎界面
		$('#item_welcome').addClass('selected');
	
		$('#workspace').attr('src','index.jhtml');
	}
	$('#iframe_refresh').click(function(){
		var fr = document.frames ? document.frames("workspace") : document.getElementById("workspace").contentWindow;;
		fr.location.reload();
	});

});
//收藏夹
function addBookmark(url, label) {
    if (document.all)
    {
        window.external.addFavorite(url, label);
    }
    else if (window.sidebar)
    {
        window.sidebar.addPanel(label, url, '');
    }
}


function openItem(args){
    closeBg();
	//cookie

	//if($.cookie('<?php echo COOKIE_PRE?>sys_key') === null){
	//	location.href = 'index.php?act=login&op=login';
	//	return false;
	//}

	spl = args.split(',');
	op  = spl[0];
	link=spl[3];
	
	if (typeof(link)=='undefined'){link='';}
	
	
	try {
		act = spl[1];
		nav = spl[2];
	}
	
	catch(ex){}
	if (typeof(act)=='undefined'){var nav = args;}
	$('.actived').removeClass('actived');
	$('#nav_'+nav).addClass('actived');

	$('.selected').removeClass('selected');

	//show
	$('#mainMenu ul').css('display','none');
	$('#sort_'+nav).css('display','block');

	if (typeof(act)=='undefined'){
		//顶部菜单事件
		html = $('#sort_'+nav+'>li>dl>dd>ol>li').first().html();
		str = html.match(/openItem\('(.*)'\)/ig);
		arg = str[0].split("'");
		spl = arg[1].split(',');
		op  = spl[0];
		act = spl[1];
		nav = spl[2];
		first_obj = $('#sort_'+nav+'>li>dl>dd>ol>li').first().children('a');
		$(first_obj).addClass('selected');
		//crumbs
		$('#crumbs').html('<span>'+$('#nav_'+nav+' > span').html()+'</span><span class="arrow">&nbsp;</span><span>'+$(first_obj).text()+'</span>');
	}else{
		//左侧菜单事件
		//location
		$.cookie('now_location_nav',nav);
		$.cookie('now_location_act',act);
		$.cookie('now_location_op',op);
		$("a[name='item_"+op+act+"']").addClass('selected');
		//crumbs
		$('#crumbs').html('<span>'+$('#nav_'+nav+' > span').html()+'</span><span class="arrow">&nbsp;</span><span>'+$('#item_'+op+act).html()+'</span>');
	}
	src = link;
	if(op=='welcome'){
	  $('#workspace').attr('src','index.jhtml');
	}else{
	   $('#workspace').attr('src',src);
	}
	

}

$(function(){
		bindAdminMenu();
		})
		function bindAdminMenu(){

		$("[nc_type='parentli']").click(function(){
			var key = $(this).attr('dataparam');
			if($(this).find("dd").css("display")=="none"){
				$("[nc_type='"+key+"']").slideDown("fast");
				$(this).find('dt').css("background-position","-322px -170px");
				$(this).find("dd").show();
			}else{
				$("[nc_type='"+key+"']").slideUp("fast");
				$(this).find('dt').css("background-position","-483px -170px");
				$(this).find("dd").hide();
			}
		});
	}
</script>








<script type="text/javascript">
//显示灰色JS遮罩层
function showBg(ct,content){
var bH=$("body").height();
var bW=$("body").width();
var objWH=getObjWh(ct);
$("#pagemask").css({width:bW,height:bH,display:"none"});
var tbT=objWH.split("|")[0]+"px";
var tbL=objWH.split("|")[1]+"px";
$("#"+ct).css({top:tbT,left:tbL,display:"block"});
$(window).scroll(function(){resetBg()});
$(window).resize(function(){resetBg()});
}
function getObjWh(obj){
var st=document.documentElement.scrollTop;//滚动条距顶部的距离
var sl=document.documentElement.scrollLeft;//滚动条距左边的距离
var ch=document.documentElement.clientHeight;//屏幕的高度
var cw=document.documentElement.clientWidth;//屏幕的宽度
var objH=$("#"+obj).height();//浮动对象的高度
var objW=$("#"+obj).width();//浮动对象的宽度
var objT=Number(st)+(Number(ch)-Number(objH))/2;
var objL=Number(sl)+(Number(cw)-Number(objW))/2;
return objT+"|"+objL;
}
function resetBg(){
var fullbg=$("#pagemask").css("display");
if(fullbg=="block"){
var bH2=$("body").height();
var bW2=$("body").width();
$("#pagemask").css({width:bW2,height:bH2});
var objV=getObjWh("dialog");
var tbT=objV.split("|")[0]+"px";
var tbL=objV.split("|")[1]+"px";
$("#dialog").css({top:tbT,left:tbL});
}
}

//关闭灰色JS遮罩层和操作窗口
function closeBg(){
$("#pagemask").css("display","none");
$("#dialog").css("display","none");
}
</script>








<script type="text/javascript">
$(function(){
    var $li =$("#skin li");
		$li.click(function(){
		$("#"+this.id).addClass("selected").siblings().removeClass("selected");
		$("#cssfile").attr("href","${base}/resources/admin/css/"+ (this.id) +".css");
        $.cookie( "MyCssSkin" ,  this.id , { path: '/', expires: 10 });

        $('iframe').contents().find('#cssfile2').attr("href","${base}/resources/admin/css/"+ (this.id) +".css");
    });

    var cookie_skin = $.cookie( "MyCssSkin");
    if (cookie_skin) {
		$("#"+cookie_skin).addClass("selected").siblings().removeClass("selected");
		$("#cssfile").attr("href","${base}/resources/admin/css/"+ cookie_skin +".css");
		$.cookie( "MyCssSkin" ,  cookie_skin  , { path: '/', expires: 10 });
    }
});
function addFavorite(url, title) {
	try {
		window.external.addFavorite(url, title);
	} catch (e){
		try {
			window.sidebar.addPanel(title, url, '');
        	} catch (e) {
			showDialog("${message("nc_to_favorite")}", 'notice');
		}
	}
}
</script>









</head>
<body style="min-width: 1200px; margin: 0px; ">
<div id="pagemask"></div>
	
<div id="dialog" style="display:none">
  <div class="title">
    <h3>${message("nc_admin_navigation")}</h3>
    <span><a href="JavaScript:void(0);" onclick="closeBg();">${message("nc_close")}</a></span> </div>
  <div class="content">
  
  </div>
</div>
	
	
	
<table style="width: 100%;" id="frametable" height="100%" width="100%" cellpadding="0" cellspacing="0">
  <tbody>
    <tr>
      <td colspan="2" height="90" class="mainhd"><div class="layout-header"> <!-- Title/Logo - can use text instead of image -->
          <div id="title"><a href="index.php"></a></div>
          <!-- Top navigation -->
          <div id="topnav" class="top-nav">
            <ul>
              <li class="adminid" title="${message("nc_hello")}:[@shiro.principal /]">${message("nc_hello")}&nbsp;:&nbsp;<strong>[@shiro.principal /]</strong></li>
              <li><a href="../profile/edit.jhtml" target="workspace" ><span>${message("nc_modifypw")}</span></a></li>
              <li><a href="../logout.jhtml" title="${message("nc_logout")}"><span>${message("nc_logout")}</span></a></li>
              <li><a href="${base}" target="_blank" title="${message("nc_homepage")}"><span>${message("nc_homepage")}</span></a></li>
            </ul>
          </div>
          <!-- End of Top navigation -->
          <!-- Main navigation -->
          <nav id="nav" class="main-nav">
            <ul>
          
          
<li><a class="link actived" id="nav_dashboard" href="javascript:;" onclick="openItem('dashboard');"><span>控制台</span></a></li>
<li><a class="link" id="nav_setting" href="javascript:;" onclick="openItem('setting');"><span>设置</span></a></li>
<li><a class="link" id="nav_goods" href="javascript:;" onclick="openItem('goods');"><span>商品</span></a></li>
<li><a class="link" id="nav_store" href="javascript:;" onclick="openItem('store');"><span>店铺</span></a></li>
<li><a class="link" id="nav_member" href="javascript:;" onclick="openItem('member');"><span>会员</span></a></li>
<li><a class="link" id="nav_trade" href="javascript:;" onclick="openItem('trade');"><span>交易</span></a></li>
<li><a class="link" id="nav_website" href="javascript:;" onclick="openItem('website');"><span>网站</span></a></li>
<li><a class="link" id="nav_operation" href="javascript:;" onclick="openItem('operation');"><span>运营</span></a></li>
<li><a class="link" id="nav_stat" href="javascript:;" onclick="openItem('stat');"><span>统计</span></a></li>
<li><a class="link" id="nav_flea" href="javascript:;" onclick="openItem('flea');"><span>闲置</span></a></li>
<li><a class="link" id="nav_mobile" href="javascript:;" onclick="openItem('mobile');"><span>手机端</span></a></li>
<li><a class="link" id="nav_microshop" href="javascript:;" onclick="openItem('microshop');"><span>微商城</span></a></li>
<li><a class="link" id="nav_cms" href="javascript:;" onclick="openItem('cms');"><span>CMS</span></a></li>
<li><a class="link" id="nav_circle" href="javascript:;" onclick="openItem('circle');"><span>圈子</span></a></li>
          
            </ul>
          </nav>
          <div class="loca"><strong>${message("nc_loca")}:</strong>
            <div id="crumbs" class="crumbs"><span>${message("nc_console")}</span><span class="arrow">&nbsp;</span><span>
            
            ${message("nc_welcome_page")}
            </span> </div>
          </div>
          <div class="toolbar">
            <ul id="skin" class="skin"><span>${message("nc_skin_peeler")} </span>
              <li id="skin_0" class="" title="${message("nc_default_style")} "></li>
              <li id="skin_1" class="" title="${message("nc_mac_style")} "></li>
            </ul>
            <div class="sitemap"><a id="siteMapBtn" href="#rhis" onclick="showBg('dialog','dialog_content');"><span>
            
            
            ${message("nc_sitemap")}
            </span></a></div>
            <div class="toolmenu"><span class="bar-btn"></span>
              <ul class="bar-list">
                <li><a onclick="openItem('clear,cache,setting');" href="javascript:void(0)">
 
                 ${message("nc_update_cache")}
                </a></li>
                <li><a href="${base}" id="iframe_refresh">
              
                ${message("nc_refresh")}${message("nc_admincp")}
                </a></li>
                <li><a href="${base}" title="${message("nc_admincp")}-${html_title}" rel="sidebar" onclick="addFavorite('${base}', '${message("nc_admincp")}-${html_title}');return false;">${message("nc_favorite")}${message("nc_admincp")}</a></li>
                <!--//zmr>v30-->
                <li><a href="index.php?act=setting&op=exetarget" target="_blank">执行计划任务</a></li>
              </ul>
            </div>
          </div>
        </div>
        <div > </div></td>
    </tr>
    <tr>
      <td class="menutd" valign="top" width="161"><div id="mainMenu" class="main-menu">
         
         
         
         
             
          <ul id="sort_dashboard">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_welcomedashboard" id="item_welcomedashboard" onclick="openItem('welcome,dashboard,dashboard');">欢迎页面</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_aboutusdashboard" id="item_aboutusdashboard" onclick="openItem('aboutus,dashboard,dashboard');">关于我们</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_basesetting" id="item_basesetting" onclick="openItem('base,setting,dashboard');">站点设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_membermember" id="item_membermember" onclick="openItem('member,member,dashboard');">会员管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_storestore" id="item_storestore" onclick="openItem('store,store,dashboard');">店铺管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_goodsgoods" id="item_goodsgoods" onclick="openItem('goods,goods,dashboard');">商品管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexorder" id="item_indexorder" onclick="openItem('index,order,dashboard');">实物订单</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>

          <ul id="sort_setting">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_basesetting" id="item_basesetting" onclick="openItem('base,setting,setting,../setting/edit.jhtml');">站点设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_qqaccount" id="item_qqaccount" onclick="openItem('qq,account,setting');">账号同步</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_paramupload" id="item_paramupload" onclick="openItem('param,upload,setting');">上传设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_seosetting" id="item_seosetting" onclick="openItem('seo,setting,setting');">SEO设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_emailmessage" id="item_emailmessage" onclick="openItem('email,message,setting');">消息通知</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_systempayment" id="item_systempayment" onclick="openItem('system,payment,setting');">支付方式</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_adminadmin" id="item_adminadmin" onclick="openItem('admin,admin,setting,../admin/list.jhtml');">权限设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexexpress" id="item_indexexpress" onclick="openItem('index,express,setting');">快递公司</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_waybill_listwaybill" id="item_waybill_listwaybill" onclick="openItem('waybill_list,waybill,setting');">运单模板</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexoffpay_area" id="item_indexoffpay_area" onclick="openItem('index,offpay_area,setting');">配送地区</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_clearcache" id="item_clearcache" onclick="openItem('clear,cache,setting');">清理缓存</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_dbdb" id="item_dbdb" onclick="openItem('db,db,setting');">数据备份</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_performperform" id="item_performperform" onclick="openItem('perform,perform,setting');">性能优化</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_searchsearch" id="item_searchsearch" onclick="openItem('search,search,setting');">搜索设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_listadmin_log" id="item_listadmin_log" onclick="openItem('list,admin_log,setting');">操作日志</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>

          <ul id="sort_goods">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_goods_classgoods_class" id="item_goods_classgoods_class" onclick="openItem('goods_class,goods_class,goods');">分类管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_brandbrand" id="item_brandbrand" onclick="openItem('brand,brand,goods');">品牌管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_goodsgoods" id="item_goodsgoods" onclick="openItem('goods,goods,goods');">商品管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_typetype" id="item_typetype" onclick="openItem('type,type,goods');">类型管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_specspec" id="item_specspec" onclick="openItem('spec,spec,goods');">规格管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_listgoods_album" id="item_listgoods_album" onclick="openItem('list,goods_album,goods');">图片空间</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>

          <ul id="sort_store">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_storestore" id="item_storestore" onclick="openItem('store,store,store');">店铺管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_store_gradestore_grade" id="item_store_gradestore_grade" onclick="openItem('store_grade,store_grade,store');">店铺等级</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_store_classstore_class" id="item_store_classstore_class" onclick="openItem('store_class,store_class,store');">店铺分类</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_store_domain_settingdomain" id="item_store_domain_settingdomain" onclick="openItem('store_domain_setting,domain,store');">二级域名</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_stracelistsns_strace" id="item_stracelistsns_strace" onclick="openItem('stracelist,sns_strace,store');">店铺动态</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_help_storehelp_store" id="item_help_storehelp_store" onclick="openItem('help_store,help_store,store');">店铺帮助</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_edit_infostore_joinin" id="item_edit_infostore_joinin" onclick="openItem('edit_info,store_joinin,store');">开店首页</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_listownshop" id="item_listownshop" onclick="openItem('list,ownshop,store');">自营店铺</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>

          <ul id="sort_member">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_membermember" id="item_membermember" onclick="openItem('member,member,member');">会员管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexmember_grade" id="item_indexmember_grade" onclick="openItem('index,member_grade,member');">会员级别</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexexppoints" id="item_indexexppoints" onclick="openItem('index,exppoints,member');">经验值管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_noticenotice" id="item_noticenotice" onclick="openItem('notice,notice,member');">会员通知</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_addpointspoints" id="item_addpointspoints" onclick="openItem('addpoints,points,member');">积分管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_predepositpredeposit" id="item_predepositpredeposit" onclick="openItem('predeposit,predeposit,member');">预存款</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_sharesettingsns_sharesetting" id="item_sharesettingsns_sharesetting" onclick="openItem('sharesetting,sns_sharesetting,member');">分享绑定</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_class_listsns_malbum" id="item_class_listsns_malbum" onclick="openItem('class_list,sns_malbum,member');">会员相册</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_tracelistsnstrace" id="item_tracelistsnstrace" onclick="openItem('tracelist,snstrace,member');">买家动态</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_member_tagsns_member" id="item_member_tagsns_member" onclick="openItem('member_tag,sns_member,member');">会员标签</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_chat_logchat_log" id="item_chat_logchat_log" onclick="openItem('chat_log,chat_log,member');">聊天记录</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>

          <ul id="sort_trade">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_indexorder" id="item_indexorder" onclick="openItem('index,order,trade');">实物订单</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexvr_order" id="item_indexvr_order" onclick="openItem('index,vr_order,trade');">虚拟订单</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_refund_managerefund" id="item_refund_managerefund" onclick="openItem('refund_manage,refund,trade');">退款管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_return_managereturn" id="item_return_managereturn" onclick="openItem('return_manage,return,trade');">退货管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_refund_managevr_refund" id="item_refund_managevr_refund" onclick="openItem('refund_manage,vr_refund,trade');">虚拟订单退款</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_consultingconsulting" id="item_consultingconsulting" onclick="openItem('consulting,consulting,trade');">咨询管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_inform_listinform" id="item_inform_listinform" onclick="openItem('inform_list,inform,trade');">举报管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_evalgoods_listevaluate" id="item_evalgoods_listevaluate" onclick="openItem('evalgoods_list,evaluate,trade');">评价管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_complain_new_listcomplain" id="item_complain_new_listcomplain" onclick="openItem('complain_new_list,complain,trade');">投诉管理</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>

          <ul id="sort_website">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_article_classarticle_class" id="item_article_classarticle_class" onclick="openItem('article_class,article_class,website');">文章分类</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_articlearticle" id="item_articlearticle" onclick="openItem('article,article,website');">文章管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_documentdocument" id="item_documentdocument" onclick="openItem('document,document,website');">会员协议</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_navigationnavigation" id="item_navigationnavigation" onclick="openItem('navigation,navigation,website');">页面导航</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_ap_manageadv" id="item_ap_manageadv" onclick="openItem('ap_manage,adv,website');">广告管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_web_configweb_config" id="item_web_configweb_config" onclick="openItem('web_config,web_config,website');">首页管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_rec_listrec_position" id="item_rec_listrec_position" onclick="openItem('rec_list,rec_position,website');">推荐位</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_linklink" id="item_linklink" onclick="openItem('link,link,website');">友情连接</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>

          <ul id="sort_operation">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_settingoperation" id="item_settingoperation" onclick="openItem('setting,operation,operation');">基本设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_groupbuy_template_listgroupbuy" id="item_groupbuy_template_listgroupbuy" onclick="openItem('groupbuy_template_list,groupbuy,operation');">抢购管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexvr_groupbuy" id="item_indexvr_groupbuy" onclick="openItem('index,vr_groupbuy,operation');">虚拟抢购设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_xianshi_applypromotion_xianshi" id="item_xianshi_applypromotion_xianshi" onclick="openItem('xianshi_apply,promotion_xianshi,operation');">限时折扣</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_mansong_applypromotion_mansong" id="item_mansong_applypromotion_mansong" onclick="openItem('mansong_apply,promotion_mansong,operation');">满即送</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_bundling_listpromotion_bundling" id="item_bundling_listpromotion_bundling" onclick="openItem('bundling_list,promotion_bundling,operation');">优惠套装</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_goods_listpromotion_booth" id="item_goods_listpromotion_booth" onclick="openItem('goods_list,promotion_booth,operation');">推荐展位</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_voucher_applyvoucher" id="item_voucher_applyvoucher" onclick="openItem('voucher_apply,voucher,operation');">代金券</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexbill" id="item_indexbill" onclick="openItem('index,bill,operation');">结算管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexvr_bill" id="item_indexvr_bill" onclick="openItem('index,vr_bill,operation');">虚拟订单结算</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_activityactivity" id="item_activityactivity" onclick="openItem('activity,activity,operation');">活动管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_pointprodpointprod" id="item_pointprodpointprod" onclick="openItem('pointprod,pointprod,operation');">兑换礼品</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexmall_consult" id="item_indexmall_consult" onclick="openItem('index,mall_consult,operation');">平台客服</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexrechargecard" id="item_indexrechargecard" onclick="openItem('index,rechargecard,operation');">平台充值卡</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexdelivery" id="item_indexdelivery" onclick="openItem('index,delivery,operation');">物流自提服务站</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>

          <ul id="sort_stat">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_generalstat_general" id="item_generalstat_general" onclick="openItem('general,stat_general,stat');">概述及设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_scalestat_industry" id="item_scalestat_industry" onclick="openItem('scale,stat_industry,stat');">行业分析</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_newmemberstat_member" id="item_newmemberstat_member" onclick="openItem('newmember,stat_member,stat');">会员统计</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_newstorestat_store" id="item_newstorestat_store" onclick="openItem('newstore,stat_store,stat');">店铺统计</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_incomestat_trade" id="item_incomestat_trade" onclick="openItem('income,stat_trade,stat');">销量分析</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_pricerangestat_goods" id="item_pricerangestat_goods" onclick="openItem('pricerange,stat_goods,stat');">商品分析</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_promotionstat_marketing" id="item_promotionstat_marketing" onclick="openItem('promotion,stat_marketing,stat');">营销分析</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_refundstat_aftersale" id="item_refundstat_aftersale" onclick="openItem('refund,stat_aftersale,stat');">售后分析</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>

          <ul id="sort_flea">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_flea_indexflea_index" id="item_flea_indexflea_index" onclick="openItem('flea_index,flea_index,flea');">SEO设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_flea_classflea_class" id="item_flea_classflea_class" onclick="openItem('flea_class,flea_class,flea');">分类管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_flea_class_indexflea_class_index" id="item_flea_class_indexflea_class_index" onclick="openItem('flea_class_index,flea_class_index,flea');">首页分类管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_fleaflea" id="item_fleaflea" onclick="openItem('flea,flea,flea');">闲置管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_flea_regionflea_region" id="item_flea_regionflea_region" onclick="openItem('flea_region,flea_region,flea');">地区管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_adv_manageflea_index" id="item_adv_manageflea_index" onclick="openItem('adv_manage,flea_index,flea');">闲置幻灯</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>

          <ul id="sort_mobile">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_index_editmb_special" id="item_index_editmb_special" onclick="openItem('index_edit,mb_special,mobile');">首页编辑</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_special_listmb_special" id="item_special_listmb_special" onclick="openItem('special_list,mb_special,mobile');">专题设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_mb_category_listmb_category" id="item_mb_category_listmb_category" onclick="openItem('mb_category_list,mb_category,mobile');">分类图片设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_mb_appmb_app" id="item_mb_appmb_app" onclick="openItem('mb_app,mb_app,mobile');">下载设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_flistmb_feedback" id="item_flistmb_feedback" onclick="openItem('flist,mb_feedback,mobile');">意见反馈</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_mb_paymentmb_payment" id="item_mb_paymentmb_payment" onclick="openItem('mb_payment,mb_payment,mobile');">手机支付</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>

          <ul id="sort_microshop">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_managemicroshop" id="item_managemicroshop" onclick="openItem('manage,microshop,microshop');">微商城管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_goods_managemicroshop" id="item_goods_managemicroshop" onclick="openItem('goods_manage,microshop,microshop');">随心看管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_goodsclass_listmicroshop" id="item_goodsclass_listmicroshop" onclick="openItem('goodsclass_list,microshop,microshop');">随心看分类</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_personal_managemicroshop" id="item_personal_managemicroshop" onclick="openItem('personal_manage,microshop,microshop');">个人秀管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_personalclass_listmicroshop" id="item_personalclass_listmicroshop" onclick="openItem('personalclass_list,microshop,microshop');">个人秀分类</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_store_managemicroshop" id="item_store_managemicroshop" onclick="openItem('store_manage,microshop,microshop');">店铺街管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_comment_managemicroshop" id="item_comment_managemicroshop" onclick="openItem('comment_manage,microshop,microshop');">评论管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_adv_managemicroshop" id="item_adv_managemicroshop" onclick="openItem('adv_manage,microshop,microshop');">广告管理</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>

          <ul id="sort_cms">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_cms_managecms_manage" id="item_cms_managecms_manage" onclick="openItem('cms_manage,cms_manage,cms');">CMS管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_cms_indexcms_index" id="item_cms_indexcms_index" onclick="openItem('cms_index,cms_index,cms');">首页管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_cms_article_listcms_article" id="item_cms_article_listcms_article" onclick="openItem('cms_article_list,cms_article,cms');">文章管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_cms_article_class_listcms_article_class" id="item_cms_article_class_listcms_article_class" onclick="openItem('cms_article_class_list,cms_article_class,cms');">文章分类</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_cms_picture_listcms_picture" id="item_cms_picture_listcms_picture" onclick="openItem('cms_picture_list,cms_picture,cms');">画报管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_cms_picture_class_listcms_picture_class" id="item_cms_picture_class_listcms_picture_class" onclick="openItem('cms_picture_class_list,cms_picture_class,cms');">画报分类</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_cms_special_listcms_special" id="item_cms_special_listcms_special" onclick="openItem('cms_special_list,cms_special,cms');">专题管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_cms_navigation_listcms_navigation" id="item_cms_navigation_listcms_navigation" onclick="openItem('cms_navigation_list,cms_navigation,cms');">导航管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_cms_tag_listcms_tag" id="item_cms_tag_listcms_tag" onclick="openItem('cms_tag_list,cms_tag,cms');">标签管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_comment_managecms_comment" id="item_comment_managecms_comment" onclick="openItem('comment_manage,cms_comment,cms');">评论管理</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>

          <ul id="sort_circle">
            <li>
              <dl>
                <dd>
                  <ol>
                    <li nc_type=''><a href="JavaScript:void(0);" name="item_indexcircle_setting" id="item_indexcircle_setting" onclick="openItem('index,circle_setting,circle');">圈子设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexcircle_memberlevel" id="item_indexcircle_memberlevel" onclick="openItem('index,circle_memberlevel,circle');">成员头衔设置</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_class_listcircle_class" id="item_class_listcircle_class" onclick="openItem('class_list,circle_class,circle');">圈子分类管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_circle_listcircle_manage" id="item_circle_listcircle_manage" onclick="openItem('circle_list,circle_manage,circle');">圈子管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_theme_listcircle_theme" id="item_theme_listcircle_theme" onclick="openItem('theme_list,circle_theme,circle');">圈子话题管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_member_listcircle_member" id="item_member_listcircle_member" onclick="openItem('member_list,circle_member,circle');">圈子成员管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_inform_listcircle_inform" id="item_inform_listcircle_inform" onclick="openItem('inform_list,circle_inform,circle');">圈子举报管理</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_adv_managecircle_setting" id="item_adv_managecircle_setting" onclick="openItem('adv_manage,circle_setting,circle');">圈子首页广告</a></li><li nc_type=''><a href="JavaScript:void(0);" name="item_indexcircle_cache" id="item_indexcircle_cache" onclick="openItem('index,circle_cache,circle');">更新圈子缓存</a></li>
                  </ol>
                </dd>
              </dl>
            </li>
          </ul>
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
        </div><div class="copyright" style="display:none"></div></td>
      <td valign="top" width="100%"><iframe src="" id="workspace" name="workspace" style="overflow: visible;" frameborder="0" width="100%" height="100%" scrolling="yes" onload="window.parent"></iframe></td>
    </tr>
  </tbody>
</table>
	
	
	
	
</body>
</html>
[/#escape]