// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require nprogress
//= require owl.carousel.min
//= require questions_slider
//= require headline
//= require select2

NProgress.configure({
  showSpinner: false,
  ease: 'ease',
  speed: 500
});

$(document).ready(function(){

  // tab links
  // specific url for each tab
  if( $(".web-page .nav-pills").length > 0 ) {
    // Javascript to enable link to tab
    var url = document.location.toString();
    if (url.match('#')) {
      $('.nav-pills a[href="#' + url.split('#')[1] + '"]').tab('show');
    } 

    // Change hash for page-reload
    $('.nav-pills a').on('shown.bs.tab', function (e) {
      window.location.hash = e.target.hash;
      var offsetTop = $(".nav-pills").offset().top - 15;
      window.scrollTo(0, offsetTop);
    });

    $('.nav-pills a').click(function(e){
      e.preventDefault();
      if(!$(this).parent().hasClass('main')) {
        $(this).parent().parent().prev().find('a').click();
      }

      // smooth scrolling
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
        var target = $(this.hash);
        target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
        var scrollTo = target.offset().top - 100;
        if (target.length) {
          $('html,body').animate({
            scrollTop: scrollTo
          }, 800);
          // window.history.pushState({}, "BDS" , $(this).attr("href"));
          // return false;
        }
      }

    });
  }
  //

  //Smooth Scrolling
  $(function() {
    $('.scroll-link').click(function(e) {
      // e.preventDefault();
      
    });
  }); 

  // select2
  $(".select2").select2(); 

  // page scroll, header to minimize on scrolling
  if( $(window).width() > 991 && $(".main-header").length > 0 ) {
    $(window).scroll(function(){
      offset = $(window).scrollTop();

      if(offset > 30) {
        $(".main-header").addClass("minimized");
      } else {
        $(".main-header").removeClass("minimized");
      }
    });
  }

  // Home owl slider
  if($(".owl-carousel").length > 0) {

    $(".owl-carousel").owlCarousel({
      responsive: {
      0 : {
      items: 1
      },
      992: {
      items: 2
      }
      },
      center: true,
      loop: true,
      autoplay: true,
      autoplaySpeed: 1000,
      autoplayTimeout: 7000,
      autoplayHoverPause: true,
      dots: true
    });

  }

  // Accordion
  // $("#accordion .panel").click(function(event){
  //   if( $(this).find(".collapsing").length > 0)
  //     return false;
  //   // slide down
  //   if($(this).find(".collapse.in").length == 0) {
  //     $(".dark-blue-bg .fa-minus").removeClass("fa-minus").addClass("fa-plus");
  //     $(this).find(".fa").first().removeClass("fa-plus").addClass("fa-minus");
  //   }
  //   else {// slide up
  //     $(".fa-minus").removeClass("fa-minus").addClass("fa-plus");
  //   }
  // });

  // submit message
  $("#new_contact, #new_subscribe").submit(function(e){
    NProgress.start();
    if($(this).hasClass("new_contact")) {
      $(".contact-page .form-wrapper").hide();
      $(".contact-page .form-confirmation").fadeIn(500);
    } else {
      $(".subscribe-form .form-wrapper").hide();
      $(".subscribe-form .form-confirmation").fadeIn(500);
    }
    NProgress.done();
  });

  // upload file
  $(".upload-file input").change(function(){
    var filename = $(".upload-file input").val().replace(/C:\\fakepath\\/i, '');
    $(".uploaded-filename").html( filename );
  });

  // main nav hover
  if( $(window).width() > 767 ) {
    $("#navbar .dropdown").hover(
      function() {
        $("#navbar .dropdown-menu").hide();
        $(this).find(".dropdown-menu").show();
      }, function() {
        $(this).find(".dropdown-menu").hide();
      }
    );
  }

  // dropdown
  $(".dropdown-menu li").click(function(){
    $el = $(this)
    $selected = $el.find("a").html();
    $el_wrapper = $el.closest(".select-wrapper");
    $btn = $el_wrapper.find("button");

    $filter_wrapper = $el_wrapper.closest(".posts-filter-wrapper");

    // hide placeholder of this button, and show the value
    $btn.find(".btn-placeholder").hide();
    $btn.find(".btn-value").html($selected).fadeIn();

    $el_wrapper.removeClass("open");
  });

  // search posts
  $(".search-field, .search-icon").click(function(){
    $(".search-field").css({"padding-right": "50px", "width": "100%"}).focus();
    $(".search-icon").hide();
    $(".search-submit").show();
  });

  // hide more btn
  $(".hide-more-btn").click(function() {
    $(".more-btn").fadeOut();
  });

  // Ajax loading
  $(".load").click(function() {
    NProgress.start();
  });

  // for home headline
  // making words the same length, to move smothly with each others
  if($(".cd-words-wrapper").length > 0) {
    $(".cd-words-wrapper i:contains('/')").css({"display":"inline-block","width":0, "opacity": 0});
  }

  // get the filtering params
  $.urlParam = function(name){
    var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
    if(results)
    return results[1]
    else
    return false;
  }

  // change posts category filter params
  $("#post-type").click(function(){
    var $links = $(".category-dropdown a");
    $links.each(function( index ) {
      if($.urlParam) {
        var params = $(this).attr("href").split('&')[0];
        var href = params + "&platform_id=" + $.urlParam('platform_id') + "&theme_id=" + $.urlParam('theme_id');
        $(this).attr("href", href);
      }
    });
  });

  // change posts platform filter params
  $("#post-platform").click(function(){
    var $links = $(".platform-dropdown a");
    $links.each(function( index ) {
      if($.urlParam) {
        var params = $(this).attr("href").split('&')[0];
        var href = params + "&category_id=" + $.urlParam('category_id') + "&theme_id=" + $.urlParam('theme_id');
        $(this).attr("href", href);
      }
    });
  });

  // change posts theme filter params
  $("#post-theme").click(function(){
    var $links = $(".theme-dropdown a");
    $links.each(function( index ) {
      if($.urlParam) {
        var params = $(this).attr("href").split('&')[0];
        var href = params + "&platform_id=" + $.urlParam('platform_id') + "&category_id=" + $.urlParam('category_id');
        $(this).attr("href", href);
      }
    });
  });

});

// PushLink
function PushLink(Url){
  window.history.pushState("Online Censorship","Online Censorship",Url);
}
