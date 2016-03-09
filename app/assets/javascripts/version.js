$(document).ready(function(){


$(document).on("click",".nav-tabs li",function(e){
  e.preventDefault();
  $("#versions").show();
  $('.nav-tabs li').removeClass('active');
  $(this).addClass('active');
  $('.tab-content').hide();
  var show = $(this).find("a").attr("href");
  $(show).show();

});

});
