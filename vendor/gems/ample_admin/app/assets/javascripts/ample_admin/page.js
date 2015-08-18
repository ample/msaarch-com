/** 
 * model agnostic template selector. 
 */
$(function() {
	// grab the page's url and make an array
	var path = window.location.pathname.split('/'); 
	// assume the last item in the array is the restful action
	var action = path.splice(-1); 
	// find the form with the action that matches the page's url
	var form = $('form.edit_page'); 
	// if we have a form and are creating a new record or editing an existing one... 
	if(form.length==1 && (action[0]=='edit' || action[0]=='new')) {
		// attach event handler to template select element
		$('select[data-role=change-template]').change(function() {
			$('input[data-role=template-filename]').val($(this).val());
			// tell rails we want to continue editing
			form.append('<input type="hidden" name="continue" id="continue" value="true" />');
			form.submit();
		});
	}
});


var current_model;
$(function() {
	
	// Tabs object for right column of model edit screens
	$('#tabs').tabs({});
	
	// Fade out flash messages after 5 seconds
	$('.flash').delay(5000).fadeOut();
	
	// Show new flash message when using AJAX
	$('#notifications').ajaxComplete(function(e, xhr, settings) {
		if(settings.url.indexOf('update')==-1) return; 
		
		$(this).append('<div class="flash success">Update successfully saved.</div>');
		$(this).children('div:last').delay(5000).fadeOut();
	});
	
	// Sortable object for the index view of various models
	$('.sortable').sortable({ 
		handle: '.handle',
		axis: 'y',
		update: function(event, ui) {
			var post_url = $(this).attr('rel') ? $(this).attr('rel') : window.location + '/update_sort_order';
			$.post(post_url, $(this).sortable('serialize', { key: 'sortable_list[]'}));
		}
	});
	// IE needs some direction
	$('ul.sortable').bind('mousedown', function(e) {
		e.stopPropagation();
	});

	// Fade out an object after it's been deleted
	$('.delete_object').live('ajax:success', function(evt, data, status, xhr) {
		$(this).parents('li').first().fadeOut();
	});
	
	// Delete selected assets
	$('.delete-selected').click(function(){
		var els = $('#asset-list input[type=checkbox]:checked'); 
		if(els.length == 0) {
			alert('Whoa there... You haven\'t selected any assets.'); 
		} else {
			var approval = confirm('Are you sure? This action cannot be undone.')
			if(approval) {
				var asset_ids = [];
				$.each(els,function(i,el){
					asset_ids.push($(el).val()); 
				})
				$.post($(this).attr('href'), {asset_ids: asset_ids}, function(){
					$.each(els,function(i,el){
						$(el).parent().hide('pulsate');
					});
					$('#asset-list input[type=checkbox]').removeAttr("checked")
				});
			}
		}
		return false;
	})
	
	// Deselect assets
	$('.clear-selected').click(function(){
	  $('#asset-list input[type=checkbox]').removeAttr("checked")
	  return false;
	});
	
	// Draggable & Droppable objects are for adding assets to various model records
	$('.asset_thumb').liveDraggable({
		appendTo: 'body',
		helper: 'clone'
	});
	$('.droppable').droppable({
		activeClass: 'notice',
		hoverClass: 'success',
		drop: function( event, ui ) {
			$(this).find('.placeholder').remove();
			$(this).html(ui.draggable.clone());
			// Add the dragged item's ID to the associated hidden field
			var asset_id = $(ui.draggable).attr('id').split('_')[1];
			var hidden_field = $('input.' + $(this).attr('rel'));
			hidden_field.val(asset_id);
		}
	});
	$('.deleteable').droppable({
		activeClass: 'notice',
		hoverClass: 'success',
		drop: function( event, ui ) {
			var answer = confirm("Are you sure?");
			if (answer) {
				var asset_id = $(ui.draggable).attr('id').split('_')[1];
				$(ui.draggable).hide('pulsate');
				$.post(AA.mount_at+'assets/'+asset_id, {'_method': 'delete'});
			}
		}
	});

	// Remove associated asset from drop-target
	$('.remove-asset').click(function(){
		var target = $(this).prev(); 
		var input = $(this).parent().find('input.' + $(this).attr('rel')); 
		if(input.length==1) { input.val(''); }
		target.find('img').remove(); 
		target.text('Drag Asset Here'); 
		$(this).hide(); 
		return false;
	}); 

	// AJAX Search
	$('#search_collection #q').change(function() {
		var search_url = $(this).attr('rel') ? $(this).attr('rel') : window.location + '/search';
		$.post(search_url, $(this).serialize(), function(data) {
			$('#search_collection_results').html(data);
		});
	});
	
	// Edit in place for permalink
	if ($('form').length > 0) {
		var pattern = /[^_]+((_[^_]+){1,})?(?=_\d{1,})/gi;
		var form_id = $('form').attr('id'); 
		current_model = form_id.substr(5).match(pattern); 

		$('#' + current_model + '_permalink').hide().before('<a href="#" id="permalink_editor">Click to Edit</a>');
		$('#permalink_editor').click(function(e) {
			var edit = confirm('Changing the permalink will break any existing links to this ' + current_model + '.');
			if(edit) {
				$(this).hide();
				$('#' + current_model + '_permalink').show();
			}
			e.preventDefault();
			e.stop();
			return false;
		});
	}

	// modal details for asset thumbs
	$('img.asset_thumb').live('click',function(){
		var id = $(this).attr('id').split('_')[1]; 
		$.colorbox({width:"50%",height:"65%",href:AA.mount_at+'assets/'+id}); 
		return false;
	}); 

	// textile editor
	$.each($('textarea.textile'),function(i,el){
		TextileEditor.initialize($(el).attr('id'));
	});
	
	// Tooltips for field-level help
	$('a[data-tip]').poshytip({
		className: 'tip-twitter',
		showTimeout: 1,
		alignTo: 'target',
		alignX: 'center',
		offsetY: 5,
		allowTipHover: false,
		content: function() {
			return $(this).attr('data-tip');
		}
	});

	// Maxlength Counter
	$('input[maxlength]').keyup(function(){ 
		var limit = $(this).attr('maxlength');
		if ($(this).val().length < limit) {
			$(this).next('.charsLeft').html(limit-$(this).val().length)
		} else {
			$(this).val($(this).val().substr(0,limit)) + $(this).next('.charsLeft').html('<span style="color:#ff0000;">0</span>');
		}
	});
	$('input[maxlength]').after('<span class="charsLeft"></span>').trigger('keyup');

});

(function($) {
	 jQuery.fn.liveDraggable = function (opts) {
			this.live("mouseover", function() {
				 if (!$(this).data("init")) {
						$(this).data("init", true).draggable(opts);
				 }
			});
	 };
})(jQuery);

jQuery.ajaxSetup({ 'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")} });