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

<script type="text/javascript" src="${base}/resources/admin/js/common.js" charset="utf-8"></script>
<script type="text/javascript" src="${base}/resources/admin/js/list.js" charset="utf-8"></script>

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
          <li><a href="../role/add.jhtml" [#if current==3] class="current" [/#if]><span>${message("admin_add_limit_gadmin")}</span></a></li>
       
       </ul>
    </div>
  </div>

  <div class="fixed-empty"></div>
   
   
   
    <form  id='listForm' action="list.jhtml" method="get">
       <input type="hidden" name="form_submit" value="ok" />
    <table class="table tb-type2">
      <thead>
        <tr class="space">
          <th colspan="15" class="nobg">${message("nc_list")}</th>
        </tr>
        <tr class="thead">
          <th><input type="checkbox" class="checkall" id="checkallBottom" name="chkVal"></th>
          <th>${message("admin_index_username")}</th>
          <th class="align-center">${message("admin_index_last_login")}</th>
          <th class="align-center">${message("admin_index_login_times")}</th>
          <th class="align-center">${message("gadmin_name")}</th>
          <th class="align-center">${message("nc_handle")}</th>
        </tr>
      </thead>
      
      <tbody>
       
       
         [#if (page.content?size>0)  ]  
         
             [#list page.content as admin]
             
                   <tr class="hover">
                   
                       <td class="w24">
                            <input name="del_id[]" type="checkbox" value="" disabled="disabled">
                       </td>
                       <td>${admin.name}</td>
                       <td class="align-center">
						[#if admin.loginDate??]
							${admin.loginDate?string("yyyy-MM-dd HH:mm:ss")}
						[#else]
							-
						[/#if]
					   </td>
					   <td class="align-center"></td>
					   
					   <td class="align-center"></td>
					   
					   <td class="w150 align-center"></td>
                   
                   
                   
                   
                   </tr>
             
             
             [/#list]
         
         
	          
         [#else] 
         
         
              <tr class="no_data">
	             <td colspan="10">${message("nc_no_record")}</td>
	          </tr>

         [/#if]  
       
         
       

      </tbody>
      
      
       <tfoot>
	       [#if (page.content?size>0)  ]  
	       
	          <tr class="tfoot">
	       
	                  <td><input type="checkbox" class="checkall" id="checkallBottom" name="chkVal"></td>
	       
	                   <td colspan="16"><label for="checkallBottom">${message("nc_select_all")}</label>
	                    &nbsp;&nbsp;<a href="JavaScript:void(0);" class="btn" onclick="if(confirm('${message("nc_ensure_del")}')){$('#listForm').submit();}"><span>${message("nc_del")}</span></a>
	                   
	                    <div class="pagination">  
	                    
	                    
	                     [#if page.total??]
  [@pagination pageNumber = page.pageNumber totalPages = page.totalPages]
			[#include "/admin/include/pagination.ftl"]
		[/@pagination]
     
 
  [/#if]
  
  
	                    </div></td>
	                   </td>
	          </tr>
	       [/#if]  
      </tfoot>
     
    </table>
  </form>
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   

</div>
</body>
</html>
[/#escape]