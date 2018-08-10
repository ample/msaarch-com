$(document).ready(function(){
  var navbar = document.getElementById('navbar-container');
  $('[data-role="navbar-toggle"]').click(function(){
    $(navbar).toggleClass('navbar-open').promise().done(function(){
      $(this).find('#nav-icon').toggleClass('open');
      $('#navbarNav').toggleClass('collapse');
    });
  });
});