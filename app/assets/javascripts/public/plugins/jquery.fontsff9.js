(function( $ ){

  var methods = {
    init : function( options ) { 
      if(!methods.ff9()) return;
      return this.each(function(){
        methods.clean(this)
      });
    },
    clean : function(el) {
      var arr = new Array();
      arr = $(el).children();
      arr.push(el);
      $(arr).each(function(i,el){
        $(el).css({'font-weight':'normal'});
      });
    },
    ff9 : function() {
      var ua = $.browser;
      return ua.mozilla && parseInt(ua.version, 10) > 8;
    }
  };

  $.fn.fontsff9 = function( method ) {
    
    if ( methods[method] ) {
      return methods[ method ].apply( this, Array.prototype.slice.call( arguments, 1 ));
    } else if ( typeof method === 'object' || ! method ) {
      return methods.init.apply( this, arguments );
    } else {
      $.error( 'Method ' +  method + ' does not exist on jQuery.fontsff9' );
    }    
  
  };

})( jQuery );