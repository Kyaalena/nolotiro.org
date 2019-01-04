//= require jquery
//= require rails-ujs
//= require jquery.cookiebar
//= require bootstrap-sprockets

$(document).ready(function(){

  // alert cookies (bottom)
  // http://www.primebox.co.uk/projects/jquery-cookiebar/
  $.cookieBar({
    message: $('.js-cookie-message').html(),
    acceptText: 'OK',
    fixed: true,
    bottom: true
  });
});
