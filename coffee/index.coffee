#global jQuery 

#!
#* FitText.js 1.1
#*
#* Copyright 2011, Dave Rupert http://daverupert.com
#* Released under the WTFPL license
#* http://sam.zoy.org/wtfpl/
#*
#* Date: Thu May 05 14:23:00 2011 -0600
#
(($) ->
  $.fn.fitText = (kompressor, options) ->
    
    # Setup options
    compressor = kompressor or 1
    settings = $.extend(
      minFontSize: Number.NEGATIVE_INFINITY
      maxFontSize: Number.POSITIVE_INFINITY
    , options)
    @each ->
      
      # Store the object
      $this = $(this)
      
      # Resizer() resizes items based on the object width divided by the compressor * 10
      resizer = ->
        $this.css "font-size", Math.max(Math.min($this.width() / (compressor * 10), parseFloat(settings.maxFontSize)), parseFloat(settings.minFontSize))

      
      # Call once to set.
      resizer()
      
      # Call on resize. Opera debounces their resize by default.
      $(window).on "resize.fittext orientationchange.fittext", resizer

) jQuery

$ -> 
  $("header h1").fitText()
  $("article.venue h1").fitText()
