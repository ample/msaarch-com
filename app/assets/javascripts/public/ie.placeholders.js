$(document).ready(function(){

	// IE < 9
	if(parseInt($.browser.version, 10)<9) {

		$.each($("#new_search input[placeholder]"), function(i,el) {
				if($(el).val()=='') {
					$(el).val($(el).attr('placeholder')); 
				}
				$(el).focus(function() {
					if(this.value==$(this).attr('placeholder'))this.value='';
				}).bind('blur',function(){ 
					if(this.value=='')this.value=$(this).attr('placeholder');
				});
		}); 
		
	} else {
		
		var dataPlaceholders = document.querySelectorAll("#new_search input[placeholder]"),
			l = dataPlaceholders.length,

			// Set caret at the beginning of the input
			setCaret = function (evt) {
					if (this.value === this.getAttribute("data-placeholder")) {
							this.setSelectionRange(0, 0);
							evt.preventDefault();
							evt.stopPropagation();
							return false;
					}
			},

			// Clear placeholder value at user input
			clearPlaceholder = function (evt) {
					if (!(evt.shiftKey && evt.keyCode === 16) && evt.keyCode !== 9) {
							if (this.value === this.getAttribute("data-placeholder")) {
									this.value = "";
									$(this).addClass('active');
									if (this.getAttribute("data-type") === "password") {
											this.type = "password";
									}
							}
					} 
			},

			restorePlaceHolder = function () {
					if (this.value.length === 0) {
							this.value = this.getAttribute("data-placeholder");
							setCaret.apply(this, arguments);
							$(this).removeClass('active'); 
							if (this.type === "password") {
									this.type = "text";
							}
					}
			},

			clearPlaceholderAtSubmit = function (evt) {
					for (var i=0, placeholder; i<l; i++) {
							placeholder = dataPlaceholders[i];
							if (placeholder.value === placeholder.getAttribute("data-placeholder")) {
									placeholder.value = "";
							}
					}
			};

			for (var i=0, placeholder, placeholderVal; i<l; i++) {
					placeholder = dataPlaceholders[i];
					if (placeholder.value.length === 0) {
						placeholderVal = placeholder.getAttribute("placeholder");
						placeholder.setAttribute("data-placeholder", placeholderVal);
						placeholder.value = placeholderVal;
						placeholder.removeAttribute("placeholder");
						if (placeholder.type === "password") {
								placeholder.type = "text";
						} 
					} else {
							$(placeholder).addClass('active');
					}


					if (!placeholder.addEventListener) {
						// Apply events for placeholder handling
						placeholder.attachEvent("focus", setCaret);
						placeholder.attachEvent("drop", setCaret);
						placeholder.attachEvent("click", setCaret);
						placeholder.attachEvent("keydown", clearPlaceholder);
						placeholder.attachEvent("keyup", restorePlaceHolder);
						placeholder.attachEvent("blur", restorePlaceHolder);

						// Clear all default placeholder values from the form at submit
						placeholder.form.attachEvent("submit", clearPlaceholderAtSubmit);
					
					} else {
						// Apply events for placeholder handling
						placeholder.addEventListener("focus", setCaret, false);
						placeholder.addEventListener("drop", setCaret, false);
						placeholder.addEventListener("click", setCaret, false);
						placeholder.addEventListener("keydown", clearPlaceholder, false);
						placeholder.addEventListener("keyup", restorePlaceHolder, false);
						placeholder.addEventListener("blur", restorePlaceHolder, false);

						// Clear all default placeholder values from the form at submit
						placeholder.form.addEventListener("submit", clearPlaceholderAtSubmit, false);
					}
			}
		}
});