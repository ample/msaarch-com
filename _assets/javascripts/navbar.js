$(document).ready(function(){
  var navbar = document.getElementById('navbar-container');
	$('#nav-icon').click(function(){
    $(this).toggleClass('open');
    $(navbar).toggleClass('navbar-open');
	});
});