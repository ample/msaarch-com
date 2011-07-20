//= require ./farbtastic

$(document).ready(function(){
	$('img.asset_thumb').die();
	$('img.asset_thumb').live('click',function(){
		var id = $(this).attr('id').split('_')[1]; 
		$.colorbox({width:"50%",height:"65%",href:AA.mount_at+'assets/'+id, iframe:true}); 
		return false;
	});	
}); 