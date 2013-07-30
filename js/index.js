(function() {
  (function($) {
    return $.fn.fitText = function(kompressor, options) {
      var compressor, settings;
      compressor = kompressor || 1;
      settings = $.extend({
        minFontSize: Number.NEGATIVE_INFINITY,
        maxFontSize: Number.POSITIVE_INFINITY
      }, options);
      return this.each(function() {
        var $this, resizer;
        $this = $(this);
        resizer = function() {
          return $this.css("font-size", Math.max(Math.min($this.width() / (compressor * 10), parseFloat(settings.maxFontSize)), parseFloat(settings.minFontSize)));
        };
        resizer();
        return $(window).on("resize.fittext orientationchange.fittext", resizer);
      });
    };
  })(jQuery);

  $(function() {
    $("header h1").fitText();
    return $("article.venue h1").fitText(0.85);
  });

}).call(this);
