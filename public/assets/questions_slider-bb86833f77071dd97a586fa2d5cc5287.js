function showSlidePage(e,r){$("#"+r).addClass("hidden").removeClass("current"),$("#"+e).delay(900).removeClass("hidden").addClass("current")}$(document).ready(function(){function e(e,r,s){0==s?(e.next(".error-wrapper").find("span").fadeIn(),$("#"+r).removeClass("answered")):(e.next(".error-wrapper").find("span").fadeOut(),$("#"+r).addClass("answered"))}function r(e){var r=/^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;return r.test(e)}function s(e){var r=new RegExp(/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/);return r.test(e)}function a(e){$("#"+e+" .slide-page .row > .answered").length>=$("#"+e+" .slide-page .row > .require-answer").length?$("#"+e+" .next").addClass("active"):$("#"+e+" .next").removeClass("active")}function t(e,r){$(".depends-"+e).addClass("hide"),$(".depends-"+e).removeClass("require-answer"),$(".depends-"+e).removeClass("answered"),1==$(".depends-option-"+r).hasClass("prompt")?$(".depends-option-"+r).removeClass("hide"):$(".depends-option-"+r).removeClass("hide").addClass("require-answer")}$(".close-report").click(function(){$(".close-popup-wrapper").fadeIn(300,function(){$(".close-popup-content").css({opacity:"1",top:0})})}),$(".close-popup-link").click(function(){$(".close-popup-wrapper").fadeOut(300,function(){$(".close-popup-content").css({opacity:"0",top:"20%"})})}),$(".require-field").bind("keyup change",function(){var t=$(this),n=t.parents(".slide-page-wrapper").attr("id"),i=t.parents(".question").attr("id");""!==t.val()?t.hasClass("url-field")?e(t,i,s(t.val())):t.hasClass("email-field")?e(t,i,r(t.val())):$("#"+i).addClass("answered"):$("#"+i).removeClass("answered"),a(n)}),$(".select-input.radio-select").click(function(){var e=$(this),r=e.attr("id"),s=e.parents(".slide-page-wrapper").attr("id"),n=e.parents(".question").attr("id");$("#"+n+" .selected").removeClass("selected"),e.addClass("selected"),$("#"+n).addClass("answered"),t(n,r),a(s)}),$(".select-input.multi-select label").click(function(){var e=$(this),r=e.parent(),s=e.parents(".slide-page-wrapper").attr("id"),n=e.attr("for"),i=e.parents(".question").attr("id");r.hasClass("selected")?(r.removeClass("selected"),e.hasClass("other-option")&&r.find(".other-option-input").hide()):(r.addClass("selected"),$("#"+i).addClass("answered"),t(i,n),a(s),e.hasClass("other-option")&&r.find(".other-option-input").show().focus())}),$(".next").click(function(){var e=$(this),r=e.parents(".slide-page-wrapper").attr("id"),s=e.parents(".slide-page-wrapper").next().attr("id"),a=e.parents(".slide-page-wrapper").data("id"),t=$("#"+r+" .slide-page .row > .require-answer").length,n=$("#"+r+" .slide-page .row > .answered").length,i=$("#"+s+" .slide-page .row > .not-require").length,d=$("#"+s+" .slide-page .row > .notification-text").length,p=$("#"+s+" .slide-page .row > .require-answer").length;if(1>p&&$("#"+s+" .next").addClass("active"),1>p&&1>d&&1>i)var s=e.parents(".slide-page-wrapper").next().next().attr("id");if((n>=t||1>t)&&($("#"+r).removeClass("current").addClass("hidden"),$("#"+s).removeClass("hidden").addClass("current"),!e.hasClass("done"))){var o=$(".process .container").width(),l=$(".slider-pages").data("pagescount"),c=o/l,u=100/l*a;$(".process-bar").css({width:"+="+c}),$(".process h1 span").html(u>100?"100":Math.ceil(u)),$(this).addClass("done")}}),$(".previous").click(function(){var e=$(this),r=e.parents(".slide-page-wrapper").attr("id"),s=e.parents(".slide-page-wrapper").prev().attr("id");if($("#"+s+" .slide-page .row > .require-answer").length<1&&$("#"+s+" .slide-page .row > .notification-text").length<1&&$("#"+s+" .slide-page .row > .not-require").length<1)var s=e.parents(".slide-page-wrapper").prev().prev().attr("id");$("#"+r).removeClass("current").addClass("hidden"),$("#"+s).addClass("current").removeClass("hidden")}),$(".require-user-data").click(function(){$("#page-submit-report input , #page-submit-report select").prop("required",!0)}),$(".disable-required").click(function(){$("#page-submit-report input , #page-submit-report select").prop("required",!1)}),$("#report").submit(function(){return""==$(".require-field").not(".user-data").val()?!1:void 0}),$(".submit-report").click(function(){$("#report").submit()}),$(".fa-arrow-down").click(function(){$(".current .next").click()}),$(".fa-arrow-up").click(function(){$(".current .previous").click()})});