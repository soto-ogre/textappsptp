$(function(){
  var nowurl = window.location.pathname;
  var nowlink = 'a[href="'+nowurl+'"]'
  $('.post__title '+nowlink+'').parent().addClass('selected').removeClass('notselected')
  $('.post__title '+nowlink+'').not(''+nowlink+'').parent().removeClass('selected');
  $('.post__title '+nowlink+'').parents('.content').prev().addClass('active')
  $('.post__title '+nowlink+'').parents('.content').addClass('active')


})