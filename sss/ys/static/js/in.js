var RecordCount;var PageSize=8;function btnSearch_Query(){AjaxPage(1,PageSize)}$(document).ready(function(){AjaxPage(1,PageSize)});function AjaxPage(CurPage,PageSize){$(".list-group li").remove();$("#pageCount").html("0");$("#MainContent_AspNetPager_Msg").html(" <a disabled='disabled' style='margin-right:5px;'>← 上一页</a><span class='cpb' style='margin-right:5px;'>1</span><a disabled='disabled' style='margin-right:5px;'>下一页 →</a>");$("#CurrentPageSize").html(CurPage);var Name=$("#Search_NameContains").val();var req={name:Name,curPage:CurPage,pageSize:PageSize,};var encoded=JSON.stringify(req);$.ajax({type:"POST",async:false,cache:false,url:"8/",dataType:"json",data:encoded,success:function(data){if(data==null){$(".list-group li").html("<li class='list-group-item red'>未查询到数据！</li>")}else{if(data!=null&&data.msg!="login_timeout"){if(data["data"]!=null){var str="";var d=data["data"];for(var i=0;i<d.length;i++){var hot="";if(d[i]["ishot"]==1){hot="<span class='glyphicon glyphicon-fire pull-right' style='color: rgb(234, 51, 65);'> hot</span>"}str+="<li class='list-group-item'><a href='javascript:void(0);' vv='"+d[i]["id"]+"' u='"+d[i]["url"]+"'>"+d[i]["title"]+"</a>"+hot+"</li>"}$(".list-group").html(str);RecordCount=data["count"];$("#pageCount").html(RecordCount);var maxpage=RecordCount%PageSize==0?parseInt(RecordCount/PageSize):(parseInt(RecordCount/PageSize)+1);$("#MainContent_AspNetPager_Msg").html("");var span="<a style='margin-right: 5px; cursor: pointer;' href='javascript:void(0)' onclick='PageIndexClick(this)' id='TopPage' pageindex='0'><button class='btn btn-default'>上一页</button></a>";var firstPage=0;var pagecount=0;if(maxpage>10){pagecount=10}else{pagecount=maxpage}if(CurPage>10){pagecount=CurPage;var firstPage=CurPage-10;if(firstPage>=1){span+="<a style='margin-right: 5px; cursor: pointer;' href='javascript:void(0)'  onclick='CurPageSizeClick("+firstPage+",this)' >...</a>"}}for(var j=firstPage+1;j<pagecount+1;j++){if(j==CurPage){span+="<span class='cpb' style='margin-right: 5px; cursor: pointer;' onclick='CurPageSizeClick("+j+",this)'>"+j+"</span>"}else{span+="<a style='margin-right: 5px; cursor: pointer;' href='javascript:void(0)'  onclick='CurPageSizeClick("+j+",this)' >"+j+"</a>"}}pagecount=pagecount+1;if(maxpage>=pagecount){span+="<a style='margin-right: 5px; cursor: pointer;' href='javascript:void(0)'  onclick='CurPageSizeClick("+pagecount+",this)' >...</a>"}span+="<a style='margin-right: 5px; cursor: pointer;' href='javascript:void(0)' onclick='PageIndexClick(this)' id='NextPage' pageindex='0'><button class='btn btn-default'>下一页</button></a>";$("#MainContent_AspNetPager_Msg").html(span)}else{$("#SearchQuery_Table tbody").html("<tr><td colspan='6' class='red'>未查询到数据！</td></tr>")}}else{if(data.msg=="login_timeout"){LoginTimeout()}}}}})}function PageIndexClick(obj){var CurrenPageSize=$.trim($("#CurrentPageSize").html());if(CurrenPageSize!=""){CurrenPageSize=parseInt(CurrenPageSize)}var type=$(obj).attr("id");if(type=="FirstPage"){CurrenPageSize=1;AjaxPage(CurrenPageSize,PageSize);$("#CurrentPageSize").html("1")}else{if(type=="TopPage"){if(CurrenPageSize>1){CurrenPageSize=CurrenPageSize-1}else{CurrenPageSize=1}AjaxPage(CurrenPageSize,PageSize);$("#CurrentPageSize").html(CurrenPageSize)}else{if(type=="NextPage"){var size=CurrenPageSize+1;var maxpage=RecordCount%PageSize==0?parseInt(RecordCount/PageSize):(parseInt(RecordCount/PageSize)+1);if(size<=maxpage){CurrenPageSize=CurrenPageSize+1}AjaxPage(CurrenPageSize,PageSize);$("#CurrentPageSize").html(CurrenPageSize)}else{if(type=="LastPage"){CurrenPageSize=(RecordCount%PageSize==0?parseInt(RecordCount/PageSize):parseInt(RecordCount/PageSize)+1);AjaxPage(CurrenPageSize,PageSize);$("#CurrentPageSize").html(CurrenPageSize)}}}}}function research(){AjaxPage(1,PageSize)}function CurPageSizeClick(CurPage,obj){$("#CurrentPageSize").html(CurPage);AjaxPage(CurPage,PageSize)}$(function(){$("#search").click(function(){research()});$("#Search_NameContains").on("input",function(){research()});$(".list-group-item a").click(function(){if($(this).attr("vv")<0){window.open($(this).attr("u"))}else{var v=Math.random().toString(36).substr(2)+"%"+$(this).attr("vv")+"%"+Math.random().toString(36).substr(2);window.open(window.location.href+"vidio/?v="+v)}})});