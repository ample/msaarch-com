//= require ./farbtastic

$(document).ready(function(){
	$('img.asset_thumb').die();
	$('img.asset_thumb').live('click',function(){
		var id = $(this).attr('id').split('_')[1]; 
		$.colorbox({width:"50%",height:"75%",href:AA.mount_at+'assets/'+id, iframe:true}); 
		return false;
	});	
}); 


$(function() {
	var market_id = $('form.edit_market').attr('id').split('_')[2];
	$('#projectships input[type=checkbox]').change(function() {
		var id = $(this).attr('id').split('_')[1];
		var status = $(this).attr('checked') ? '1' : '0';
		$.post('/admin/markets/' + market_id + '/update_featured', $('#projectships input[type=checkbox]').serialize());
	});
})