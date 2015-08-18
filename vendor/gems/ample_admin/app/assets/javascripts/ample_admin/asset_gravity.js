$(document).ready(function() {
	$('#asset-detail .cj img').load(function() {
		
		var gravities = {
      nw: [0,0],
      n:  [1,0],
      ne: [2,0],
      w:  [0,1],
      c:  [1,1],
      e:  [2,1],
      sw: [0,2],
      s:  [1,2],
      se: [2,2]
    }
		var current_gravity = $('#asset_attachment_gravity').val() || 'c';
		console.log(current_gravity);
		var gravity_image = $('#asset-detail .cj img');
		var gravity_focus = $('#focus');
		var gravity_image_pos = gravity_image.position();
		var gravity_image_center = {top: (gravity_image_pos.top + (gravity_image.height()/2) - (gravity_focus.height()/2)), left: (gravity_image_pos.left + (gravity_image.width()/2) - (gravity_focus.width()/2))};
		var gravity_grid = [];
		gravity_grid[0] = gravity_image.width() / 3;
		gravity_grid[1] = gravity_image.height() / 3;
		console.log(gravity_grid);
		console.log(gravity_image_center);
		gravity_focus.css({
			position: 'absolute',
			left: (gravity_image_center.left - gravity_grid[0]) + (gravity_grid[0] * gravities[current_gravity][0]),
			top: (gravity_image_center.top - gravity_grid[1]) + (gravity_grid[1] * gravities[current_gravity][1])	
		});
		
		gravity_focus.draggable({
			containment: gravity_image,
			grid: gravity_grid,
			scroll: false,
			stop: function(event, ui) {
				var gravity_pos = [Math.floor(ui.position.left / gravity_grid[0]), Math.floor(ui.position.top / gravity_grid[1])];
				console.log(gravity_pos);
				for (var i in gravities) {
					if (gravities[i][0] == gravity_pos[0] && gravities[i][1] == gravity_pos[1]) {
						var gravity = i;
						break;
					}
				}
				$('#asset_attachment_gravity').val(gravity);
				$('#edit_gravity').submit();
			}
		});
		
	});
});