// Generated by CoffeeScript 1.6.3
var _ref,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Dashing.Photos = (function(_super) {
  __extends(Photos, _super);

  function Photos() {
    this.nextPhoto = __bind(this.nextPhoto, this);
    _ref = Photos.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Photos.accessor('photo', function() {
    var _ref1;
    return "background-image: url(" + ((_ref1 = this.get('current_photo')) != null ? _ref1.photo : void 0) + ");";
  });

  Photos.prototype.ready = function() {
    this.currentIndex = 0;
    this.photoElem = $(this.node).find('.photo-container');
    this.nextPhoto();
    return this.startCarousel();
  };

  Photos.prototype.onData = function(data) {
    return this.currentIndex = 0;
  };

  Photos.prototype.startCarousel = function() {
    return setInterval(this.nextPhoto, 15000);
  };

  Photos.prototype.nextPhoto = function() {
    var photos,
      _this = this;
    photos = this.get('photos');
    if (photos) {
      return this.photoElem.fadeOut(function() {
        _this.currentIndex = (_this.currentIndex + 1) % photos.length;
        _this.set('current_photo', photos[_this.currentIndex]);
        return _this.photoElem.fadeIn();
      });
    }
  };

  return Photos;

})(Dashing.Widget);
