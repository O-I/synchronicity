class Dashing.Photos extends Dashing.Widget

  @accessor 'photo', ->
    "background-image: url(#{@get('current_photo')?.photo});"

  ready: ->
    @currentIndex = 0
    @photoElem = $(@node).find('.photo-container')
    @nextPhoto()
    @startCarousel()

  onData: (data) ->
    @currentIndex = 0

  startCarousel: ->
    setInterval(@nextPhoto, 15000)

  nextPhoto: =>
    photos = @get('photos')
    if photos
      @photoElem.fadeOut =>
        @currentIndex = (@currentIndex + 1) % photos.length
        @set 'current_photo', photos[@currentIndex]
        @photoElem.fadeIn()