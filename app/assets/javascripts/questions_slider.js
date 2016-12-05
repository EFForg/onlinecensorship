$( document ).ready(function() {

  // enable the questionnaire
  $("#over-13-18 ,#over-19-25 ,#over-26-35 ,#over-36-45 ,#over-45").click(function(){
    // hide the question
    $("#page-0").hide();
    // show the questionnaire
    $("#page-1").fadeIn(300).removeClass("hidden").css("display","table");
  });

  //disable the questionnaire for kids
  $("#under-13").click(function(){
    // hide the question and the form
    $("#page-0").hide();
    $("#report").hide();
    // create cookie
    document.cookie="user_still_kid=still under 13 years";
    // show the notification message
    $(".kids").fadeIn(300).removeClass("hidden").css("display","table");;
  });

  // close report
  $(".close-report").click(function(){
    $(".close-popup-wrapper").fadeIn(300, function(){
      $(".close-popup-content").css({"opacity":"1", "top": 0});
    });
  });
  $(".close-popup-link").click(function(){
    $(".close-popup-wrapper").fadeOut(300, function(){
      $(".close-popup-content").css({"opacity":"0", "top": "20%"});
    });
  });

  // Show the notification message
  function showNotification(element,question_id,condition){
    if(condition==false){
      element.next(".error-wrapper").find("span").fadeIn();
      // remove the answer class
      $("#"+question_id).removeClass("answered");
    }else{
      element.next(".error-wrapper").find("span").fadeOut();
      // add the answer class
      $("#"+question_id).addClass("answered");
    }
  }

  // Validate email value
  function validateEmail(email) {
    var emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
    return emailReg.test(email);
  }

  // Validate url value
  function validateURL(textval) {
    // var urlregex = new RegExp("^(http:\/\/www.|https:\/\/www.|ftp:\/\/[www.|www.]){1}([0-9A-Za-z]+\.)");
    var urlregex = new RegExp(/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/);
    return urlregex.test(textval);
  }

  // show next button
  function showNextButton(slide_page_id){
    // check if the user fill all the required fields in the slider page
    if($("#"+slide_page_id+" .slide-page .row > .answered").length >= $("#"+slide_page_id+" .slide-page .row > .require-answer").length){
      $("#"+slide_page_id+" .next").addClass("active");
    }else{
      $("#"+slide_page_id+" .next").removeClass("active");
    }//if
  }

  // show next button
  function showDependsQuestions(question_id,option_id){
    // hide all the questions related with the same question options
    $(".depends-"+question_id).addClass("hide");
    $(".depends-"+question_id).removeClass("require-answer");
    $(".depends-"+question_id).removeClass("answered");
    // show the related question with the same option
    // first we check if it prompt question or not
    if ($(".depends-option-"+option_id).hasClass("prompt")==true){
      $(".depends-option-"+option_id).removeClass("hide");
    }else{
      // add require-answer
      $(".depends-option-"+option_id).removeClass("hide").addClass("require-answer");
    }
  }

  // check the questions
  $(".require-field").bind("keyup change", (function() {
      var el=$(this);
      var parent_page_id=el.parents(".slide-page-wrapper").attr("id");
      var question_id=el.parents(".question").attr("id");
      if(el.val()!==""){
        // check the url validation
        if (el.hasClass("url-field")){
          // show /hide the error notification
          showNotification(el,question_id,validateURL(el.val()));
        // check the email validation
        }else if(el.hasClass("email-field")){
          // show /hide the error notification
          showNotification(el,question_id,validateEmail(el.val()));
        }else{
          $("#"+question_id).addClass("answered");
        }
      }else{
        $("#"+question_id).removeClass("answered");
      }

      // show next button
      showNextButton(parent_page_id);
    })
  );

  // radio select
  $(".select-input.radio-select, .platform_select .other-option-input, .multi_select.multi-select-false .select-input").click(function(){
    // $(".platform_select input[type=checkbox]:checked").removeAttr('checked');
    // $(this).find("input[type=checkbox]").prop('checked', true);
    var el=$(this);
    var option_id=el.attr("id");
    var parent_page_id=el.parents(".slide-page-wrapper").attr("id");
    var question_id=el.parents(".question").attr("id");
    // for styling the selected
    $("#" + question_id + " .selected").removeClass("selected");
    el.addClass("selected");
    // answered
    $("#"+question_id).addClass("answered");
    // show related questions
    showDependsQuestions(question_id,option_id);
    // show next button
    showNextButton(parent_page_id);
  });

  // radio / multi with other
  $(".multi_select.multi-select-false .select-input, .platform_select .select-input").click(function(){
    $(this).parent().find("input[type=checkbox]").prop('checked', false);
    $(this).find("input[type=checkbox]").prop('checked', true);
  });

  // platform select
  $(".platform_select .platform-select").click(function(){
    var selectedPlatform = $('.platform_select .selected label').text().trim().toLowerCase();

    $(".support-link").addClass("hide");
    
    if(selectedPlatform == "other") {
      selectedPlatform = "'Platform'";
      $(".prompt").addClass("hide");
      $(".prompt h2").css("color","#152f4e");
    } else {
      $("."+selectedPlatform+"-support-link").removeClass("hide");
      $(".prompt h2").css("color","#41DCF5");
    }

    $(".question h2").each(function(index) {
      $(this).find("b.platform").html( selectedPlatform );
    });
  });

  $(".platform_select .other-option-input").bind("keyup", (function() {
      selectedPlatform = $(this).val();
      $(".question h2").each(function(index) {
        $(this).find("b.platform").html( selectedPlatform );
      });
    })
  );

  // multi select
  $(".select-input.multi-select label").click(function(){
    var el=$(this);
    var el_parent = el.parent();
    var parent_page_id=el.parents(".slide-page-wrapper").attr("id");
    var option_id=el.attr("for");
    var question_id=el.parents(".question").attr("id");
    if( el_parent.hasClass("selected")){
      // remove the style
      el_parent.removeClass("selected");

      if(el.hasClass("other-option")) {
        el_parent.find(".other-option-input").hide();
      }
    } else {
      // for styling the selected
      el_parent.addClass("selected");
      // answered
      $("#"+question_id).addClass("answered");
      // show related questions
      showDependsQuestions(question_id,option_id)
      // show next button
      showNextButton(parent_page_id);

      // show other
      if(el.hasClass("other-option")) {
        el_parent.find(".other-option-input").show().focus();
      }
    }

  });

  // move to next page
  $(".next").click(function(){
    var el=$(this);
    var parent_page_id=el.parents(".slide-page-wrapper").attr("id");
    var next_page_id=el.parents(".slide-page-wrapper").next().attr("id");
    var page_no = el.parents(".slide-page-wrapper").data("id");
    var current_slide_require_answer_fields = $("#"+parent_page_id+" .slide-page .row > .require-answer").length
    var current_slide_answered_fields = $("#"+parent_page_id+" .slide-page .row > .answered").length
    var not_require_fields = $("#"+next_page_id+" .slide-page .row > .not-require").length
    var notification_page = $("#"+next_page_id+" .slide-page .row > .notification-text").length
    var next_slide_require_answer_fields = $("#"+next_page_id+" .slide-page .row > .require-answer").length

    // add next button class
    if(next_slide_require_answer_fields < 1){
      $("#"+next_page_id+" .next").addClass("active");
    }

    // check if the next page contains questions
    if (next_slide_require_answer_fields < 1 && notification_page < 1 && not_require_fields < 1){
      var next_page_id=el.parents(".slide-page-wrapper").next().next().attr("id");
    }

    // check if fill the required fields or not has any required fields
    if(current_slide_answered_fields >= current_slide_require_answer_fields || current_slide_require_answer_fields < 1 ){
      // hide current page
      $("#"+parent_page_id).removeClass("current").addClass("hidden");
      // show next page
      $("#"+next_page_id).removeClass("hidden").addClass("current");
      // update progress bar
      if(!el.hasClass("done")) {
        var pagesCount = $(".slider-pages").data("pagescount");
        var percentage = (100 / pagesCount) * page_no;
        if(percentage > 100) {
          $(".process h1 span").html("100");
          $(".process-bar").css({"width": "100%"});
        } else {
          $(".process h1 span").html(Math.ceil(percentage));
          $(".process-bar").css({"width": Math.ceil(percentage) + "%"});
        }
        $(this).addClass("done");
      }
    }
  });

  // move to previous page
  $(".previous").click(function(){
    var el=$(this);
    var parent_page_id=el.parents(".slide-page-wrapper").attr("id");
    var previous_page_id=el.parents(".slide-page-wrapper").prev().attr("id");

    // check if the next page contains questions
    if ($("#"+previous_page_id+" .slide-page .row > .require-answer").length < 1 && $("#"+previous_page_id+" .slide-page .row > .notification-text").length < 1 && $("#"+previous_page_id+" .slide-page .row > .not-require").length < 1){
      var previous_page_id=el.parents(".slide-page-wrapper").prev().prev().attr("id");
    }
    // hide current page
    $("#"+parent_page_id).removeClass("current").addClass("hidden");
    // show previous page
    $("#"+previous_page_id).addClass("current").removeClass("hidden");
  });

  // user data validation
  $(".require-user-data").click(function(){
    $("#page-submit-report .user-data , #page-submit-report select").prop('required',true);
  });

  // disable user data validation
  $(".disable-required").click(function(){
    $("#page-submit-report .user-data , #page-submit-report select").prop('required',false);
  });

  // submit report
  $(".submit-report").click(function(){
    $("#report").submit();
  });

  // side nav (arrows)
  $(".fa-arrow-down").click(function(){
    $(".current .next").click();
  });
  $(".fa-arrow-up").click(function(){
    $(".current .previous").click();
  });

  // increase the progress bar sliders number
  $(".increase-count").click(function(){
    if (!$(".slider-pages").hasClass('increased')){
      var slider_pages=parseInt($(".slider-pages").attr("data-pagescount"));
      $(".slider-pages").attr("data-pagescount", slider_pages+1);
      $(".slider-pages").addClass("increased");
    }
  });
  $(".un-increase-count").click(function(){
    if ($(".slider-pages").hasClass("increased")){
      var slider_pages=parseInt($(".slider-pages").attr("data-pagescount"));
      $(".slider-pages").attr("data-pagescount", slider_pages-1);
      $(".slider-pages").removeClass("increased");
    }
  });

});
