//= require jquery
//= require jquery_ujs
//= require nprogress
//= require ckeditor-jquery
//= require backend
//= require sorttable
//= require bootstrap-colorpicker
//= require docs

// loader settings
NProgress.configure({
  showSpinner: false,
  ease: 'ease',
  speed: 500
});

$( document ).ready(function() {


  // Creating Web Pages
  // $('form').on('click', '.remove_fields', function(event){
  //   $(this).prev('input[type=hidden]').val('1');
  //   $(this).closest('fieldset').hide();
  //   event.preventDefault();
  // });
  $('form').on('click', '.add_fields', function(event){
    time = new Date().getTime();
    regexp = new RegExp($(this).data('id'), 'g');
    $(this).before($(this).data('fields').replace(regexp, time));
    event.preventDefault();
  });
  ////


  // Ajax loading
  $(".load").click(function() {
    NProgress.start();
  });

  // show backend images
  $(".show-image").mouseover(function() {
    $(this).find(".main-image").show();
  });

  $(".show-image").mouseout(function() {
    $(this).find(".main-image").hide();
  });

  // show the questions options
	$('#question_question_type').on('change', function() {
	  if($(this).val()=="multi_select" || $(this).val()=="platform_select"){
      $('.other-option').removeClass("hide");
      $('.questions-options-fields').removeClass("hide");
      $(".placeholder-field").addClass("hide");
      $('.placeholder-field').removeClass("show");
      $(".prompt-field").addClass("hide");
    }else if ($(this).val()=="select"){
      $('.other-option').addClass("hide");
	  	$('.questions-options-fields').removeClass("hide");
      $(".placeholder-field").addClass("hide");
      $('.placeholder-field').removeClass("show");
      $(".prompt-field").addClass("hide");
    }else if ($(this).val()=="prompt"){
      $('.prompt-field').removeClass("hide");
      $(".placeholder-field").addClass("hide");
      $('.placeholder-field').removeClass("show");
      $('.other-option').addClass("hide");
      $('.questions-options-fields').addClass("hide");
    }else if($(this).val()=="text" || $(this).val()=="email" || $(this).val()=="url" || $(this).val()=="long_text"){
      $('.placeholder-field').removeClass("hide");
      $(".prompt-field").addClass("hide");
      $('.other-option').addClass("hide");
      $('.questions-options-fields').addClass("hide");
	  }else{
      $(".special-fields").addClass("hide");
      $('.placeholder-field').removeClass("show");
      $(".placeholder-field").addClass("hide");
	  }

	});

  // to add new option to the question form
  var template =
      '<div class="field fieldset clearfix">'+
        '<i class="fa fa-question-circle"></i>'+
        '<label for="question_question_options_attributes_INDEX_option_title">Question Option </label>'+
        '<input class="form-control option-field" id="question_question_options_attributes_INDEX_option_title" name="question[question_options_attributes][INDEX][option_title]" type="text" />'+
        '<div class="option-controlle">'+
          '<input name="question[question_options_attributes][INDEX][_destroy]" type="hidden" value="0" />'+
          '<input id="question_question_options_attributes_INDEX__destroy" name="question[question_options_attributes][INDEX][_destroy]" type="checkbox" value="1" />'+
          '<label for="question_question_options_attributes_INDEX__destroy">Remove</label>'+
        '</div>',
      index = $('.append-frame i').length,
      compiled_template;

  $('#add-option').click(function() {
    // get the social media id
    var social_media_platform_id = $('#add-option').attr('data-child');
    compiled_textarea = $(template.replace(/INDEX/g, index));
    $(".append-frame").append(compiled_textarea);
    index = index + 1;
    // End loading
    NProgress.done();
  });

  // Hide the deleted page fieldset
  $(".delete-page").click(function() {
    $(this).parents(".fieldset").fadeOut(500);
    NProgress.done();
  });

  // Hide the deleted page question
  $(".delete-question").click(function() {
    $(this).parents("li").fadeOut(500);
    NProgress.done();
  });

  // Save the page order number
  $(".page-order").change(function() {
    var el_id=$(this).parents(".fieldset").attr("id");
    $.ajax({
      method: "POST",
      url: "/admin/update_page",
      data: { id: el_id, theorder: $(this).val()}
    })
    .done(function(html) {
      // show saving notification
      $("#save_"+el_id).removeClass('hide').delay(2000).queue(function(){
        $(this).addClass('hide');
      });
    });
  });

  $(document).on("click", '.save-page', function() {
    var el_id = $(this).parents(".fieldset").attr("id");
    var el_lang = $(this).data("lang");
    $.ajax({
      method: "POST",
      url: "/"+el_lang+"/admin/update_message",
      data: { id: el_id, message: $(this).prev().val()}
    })
    .done(function(html) {
      // show saving notification
      $("#save_"+el_id).removeClass('hide').delay(2000).queue(function(){
        $(this).addClass('hide');
      });
    });
  });

  // Show/hide post links
  $("#post_category_id").change(function() {
    var category_title=$("#post_category_id option:selected").text();
    if(category_title=="News"){
      $(".post-field").addClass('hide');
      $(".post-link").removeClass("hide");
    }else{
      $(".post-field").removeClass('hide');
      $(".post-link").addClass("hide");
    }
  });

  // show the selected platform
  $(".platform_dropdown li a").click(function(){
    $(".platform_dropdown-title .btn:first-child").text($(this).text());
    $(".platform_dropdown-title .btn:first-child").val($(this).text());
    $(".platform_dropdown-title").removeClass("open");
  });

  // dashboard side menu
  $(".submenu > a").click(function(e) {
    e.preventDefault();
    var $li = $(this).parent("li");
    var $ul = $(this).next("ul");

    if($li.hasClass("open")) {
      $ul.slideUp(350);
      $li.removeClass("open");
    } else {
      $ul.slideDown(350);
      $li.addClass("open");
    }
  });

  // to close preview post panel
  $(document).on("click", '.close-post-preview', function(event) {
    $(".post-preview").fadeOut();
    $("body").css("overflow","auto");
  });

  // upload file preview
  $(".image-uploader").change(function(){
    readURL(this,$(this).next(".preview-image"));
  });


  // checked icon hover
  $(".check").hover(function(e) {
    $(this).removeClass("fa-check");
    $(this).addClass("fa-times");
  });
  $(".check").mouseout(function(e) {
    $(this).removeClass("fa-times");
    $(this).addClass("fa-check");
  });

  // uncheck icon hover
  $(".uncheck").hover(function(e) {
    $(this).removeClass("fa-times");
    $(this).addClass("fa-check");
  });
  $(".uncheck").mouseout(function(e) {
    $(this).removeClass("fa-check");
    $(this).addClass("fa-times");
  });

});

function readURL(input, preview) {
  if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
      preview.attr('src', e.target.result);
    }

    reader.readAsDataURL(input.files[0]);
  }
}

// check the uploaded files size
function fileUploader(max_size,element){
  var file_size=element.files[0].size;
	var max_size_kb=max_size * 1024 * 1024; // convert the file size to KB

	if (file_size > max_size_kb){
    var error_message ="The file size bigger than " +max_size+ "MB"
    $(element).next('.error_message').html(error_message);
	}else{
		$(element).next('.error_message').html("");
	}
}
