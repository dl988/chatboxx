angular.module('bxFisheye', [])

.directive 'bxfisheye', ($document) ->
  (scope, element, attr) ->
    scale = attr.bxfisheyescale || 0.8
    radius = attr.bxfisheyeradius || 70

    scale = parseFloat scale
    radius = parseInt radius

    startWidth = element.width()
    startHeight = element.height()

    maxWidth = startWidth + (startWidth * scale)
    maxHeight = startHeight + (startHeight * scale)

    $document.on 'mousemove', (e) ->
      centerX = element.offset().left + (element.width() / 2)
      centerY = element.offset().top + (element.height() / 2)

      x = Math.abs e.pageX - centerX
      y = Math.abs e.pageY - centerY
      r = Math.sqrt((x * x) + (y * y))

      if r < radius
        percent = 1 - (r / radius)
        w = startWidth + ((maxWidth - startWidth) * percent)
        h = startHeight + ((maxHeight - startHeight) * percent)

        element.css
          width: w + 'px'
          height: h + 'px'
      else
        if element.width() != startWidth || element.height() != startHeight
          element.css
            width: startWidth + 'px'
            height: startHeight + 'px'
