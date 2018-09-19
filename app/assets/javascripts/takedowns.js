$(document).ready(function() {
  var remove = $('<a></a>').addClass('remove-link hidden').text('(Remove)');
  $('div.takedown_images_file').append(remove);
  $('div.takedown_images_file').addClass('hidden');
  $('div.takedown_images_file').first().removeClass('hidden');
  $('div.takedown_images_file').change(function (){
    if (! ($(this).val() === null)) {
      $(this).children('a.remove-link').removeClass('hidden');
      $(this).next('div.hidden').removeClass('hidden');
    }
  });
  $('div.takedown_images_file').on('click', 'a.remove-link', function (){
    $(this).siblings('input').val(null);
    $(this).addClass('hidden');
  });
});
