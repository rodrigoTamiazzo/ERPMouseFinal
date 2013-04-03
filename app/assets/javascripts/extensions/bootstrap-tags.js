/*
 Copyright (c) 2012 Max Lahey

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
*/

(function() {

  jQuery(function() {
    $.tags = function(element, options) {
      var tagData,
        _this = this;
      this.suggestions = (options.suggestions != null ? options.suggestions : []);
      this.restrictTo = (options.restrictTo != null ? options.restrictTo.concat(this.suggestions) : false);
      this.exclude = (options.excludeList != null ? options.excludeList : false);
      this.displayPopovers = (options.popovers != null ? true : options.popoverData != null);
      this.tagClass = (options.tagClass != null ? options.tagClass : 'btn-info');
      this.promptText = (options.promptText != null ? options.promptText : 'Enter tags...');
      this.whenAddingTag = (options.whenAddingTag != null ? options.whenAddingTag : function(tag) {});
      this.definePopover = (options.definePopover ? options.definePopover : function(tag) {
        return "associated content for \"" + tag + "\"";
      });
      this.excludes = (options.excludes ? options.excludes : function() {
        return false;
      });
      this.pressedReturn = (options.pressedReturn != null ? options.pressedReturn : function(e) {});
      this.pressedDelete = (options.pressedDelete != null ? options.pressedDelete : function(e) {});
      this.pressedDown = (options.pressedDown != null ? options.pressedDown : function(e) {});
      this.pressedUp = (options.pressedUp != null ? options.pressedUp : function(e) {});
      this.$element = $(element);
      if (options.tagData != null) {
        this.tagsArray = options.tagData;
      } else {
        tagData = $('.tag-data', this.$element).html();
        this.tagsArray = (tagData != null ? tagData.split(',') : []);
      }
      if (this.displayPopovers) {
        this.popoverArray = options.popoverData;
      }
      this.removeTagClicked = function(e) {
        if (e.currentTarget.tagName === "A") {
          _this.removeTag(e.currentTarget.previousSibling.textContent);
          return $(e.currentTarget.parentNode).remove();
        }
      };
      this.removeLastTag = function() {
        var el;
        el = $('.tag', _this.$element).last();
        el.remove();
        return _this.removeTag(_this.tagsArray[_this.tagsArray.length - 1]);
      };
      this.removeTag = function(tag) {
        if (_this.tagsArray.indexOf(tag) > -1) {
          if (_this.displayPopovers) {
            _this.popoverArray.splice(_this.tagsArray.indexOf(tag), 1);
          }
          _this.tagsArray.splice(_this.tagsArray.indexOf(tag), 1);
          return _this.renderTags();
        }
      };
      this.addTag = function(tag) {
        var associatedContent;
        if ((_this.restrictTo === false || _this.restrictTo.indexOf(tag) !== -1) && _this.tagsArray.indexOf(tag) < 0 && tag.length > 0 && (_this.exclude === false || _this.exclude.indexOf(tag) === -1) && !_this.excludes(tag)) {
          _this.whenAddingTag(tag);
          if (_this.displayPopovers) {
            associatedContent = _this.definePopover(tag);
            _this.popoverArray.push(associatedContent);
          }
          _this.tagsArray.push(tag);
          return _this.renderTags();
        }
      };
      this.addTagWithContent = function(tag, content) {
        if ((_this.restrictTo === false || _this.restrictTo.indexOf(tag) !== -1) && _this.tagsArray.indexOf(tag) < 0 && tag.length > 0) {
          _this.whenAddingTag(tag);
          _this.tagsArray.push(tag);
          _this.popoverArray.push(content);
          return _this.renderTags();
        }
      };
      this.renameTag = function(name, newName) {
        _this.tagsArray[_this.tagsArray.indexOf(name)] = newName;
        return _this.renderTags();
      };
      this.setPopover = function(tag, popoverContent) {
        _this.popoverArray[_this.tagsArray.indexOf(tag)] = popoverContent;
        return _this.renderTags();
      };
      this.toggleCloseColor = function(e) {
        var opacity, tagAnchor;
        tagAnchor = $(e.currentTarget);
        opacity = tagAnchor.css('opacity');
        opacity = (opacity < 0.8 ? 1.0 : 0.6);
        return tagAnchor.css({
          opacity: opacity
        });
      };
      this.keyDownHandler = function(e) {
        var k, numSuggestions, tag;
        k = (e.keyCode != null ? e.keyCode : e.which);
        switch (k) {
          case 13:
            _this.pressedReturn(e);
            tag = e.target.value;
            if (_this.suggestedIndex !== -1) {
              tag = _this.suggestionList[_this.suggestedIndex];
            }
            _this.addTag(tag);
            e.target.value = '';
            _this.renderTags();
            return _this.hideSuggestions();
          case 46:
          case 8:
            _this.pressedDelete(e);
            if (e.target.value === '') {
              _this.removeLastTag();
            }
            if (e.target.value.length === 1) {
              return _this.hideSuggestions();
            }
            break;
          case 40:
            _this.pressedDown(e);
            if (_this.input.val() === '' && (_this.suggestedIndex === -1 || !(_this.suggestedIndex != null))) {
              _this.makeSuggestions(e, true);
            }
            numSuggestions = _this.suggestionList.length;
            _this.suggestedIndex = (_this.suggestedIndex < numSuggestions - 1 ? _this.suggestedIndex + 1 : numSuggestions - 1);
            _this.selectSuggested(_this.suggestedIndex);
            if (_this.suggestedIndex >= 0) {
              return _this.scrollSuggested(_this.suggestedIndex);
            }
            break;
          case 38:
            _this.pressedUp(e);
            _this.suggestedIndex = (_this.suggestedIndex > 0 ? _this.suggestedIndex - 1 : 0);
            _this.selectSuggested(_this.suggestedIndex);
            if (_this.suggestedIndex >= 0) {
              return _this.scrollSuggested(_this.suggestedIndex);
            }
            break;
          case 9:
          case 27:
            _this.hideSuggestions();
            return _this.suggestedIndex = -1;
        }
      };
      this.makeSuggestions = function(e, overrideLengthCheck) {
        var val;
        val = (e.target.value != null ? e.target.value : e.target.textContent);
        _this.suggestedIndex = -1;
        _this.$suggestionList.html('');
        _this.suggestionList = [];
        $.each(_this.suggestions, function(i, suggestion) {
          if (_this.tagsArray.indexOf(suggestion) < 0 && suggestion.substring(0, val.length) === val && (val.length > 0 || overrideLengthCheck)) {
            _this.$suggestionList.append('<li class="tags-suggestion">' + suggestion + '</li>');
            return _this.suggestionList.push(suggestion);
          }
        });
        $('.tags-suggestion', _this.$element).mouseover(_this.selectSuggestedMouseOver);
        $('.tags-suggestion', _this.$element).click(_this.suggestedClicked);
        if (_this.suggestionList.length > 0) {
          return _this.showSuggestions();
        } else {
          return _this.hideSuggestions();
        }
      };
      this.suggestedClicked = function(e) {
        var tag;
        tag = e.target.textContent;
        if (_this.suggestedIndex !== -1) {
          tag = _this.suggestionList[_this.suggestedIndex];
        }
        _this.addTag(tag);
        _this.input.val('');
        _this.makeSuggestions(e, false);
        _this.input.focus();
        return _this.hideSuggestions();
      };
      this.keyUpHandler = function(e) {
        var k;
        k = (e.keyCode != null ? e.keyCode : e.which);
        if (k !== 40 && k !== 38 && k !== 27) {
          return _this.makeSuggestions(e, false);
        }
      };
      this.hideSuggestions = function() {
        return $('.tags-suggestion-list', _this.$element).css({
          display: "none"
        });
      };
      this.showSuggestions = function() {
        return $('.tags-suggestion-list', _this.$element).css({
          display: "block"
        });
      };
      this.selectSuggestedMouseOver = function(e) {
        $('.tags-suggestion').removeClass('tags-suggestion-highlighted');
        $(e.target).addClass('tags-suggestion-highlighted');
        $(e.target).mouseout(_this.selectSuggestedMousedOut);
        return _this.suggestedIndex = $('.tags-suggestion', _this.$element).index($(e.target));
      };
      this.selectSuggestedMousedOut = function(e) {
        return $(e.target).removeClass('tags-suggestion-highlighted');
      };
      this.selectSuggested = function(i) {
        var tagElement;
        $('.tags-suggestion').removeClass('tags-suggestion-highlighted');
        tagElement = $('.tags-suggestion', _this.$element).eq(i);
        return tagElement.addClass('tags-suggestion-highlighted');
      };
      this.scrollSuggested = function(i) {
        var pos, tagElement, topElement, topPos;
        tagElement = $('.tags-suggestion', _this.$element).eq(i);
        topElement = $('.tags-suggestion', _this.$element).eq(0);
        pos = tagElement.position();
        topPos = topElement.position();
        return $('.tags-suggestion-list', _this.$element).scrollTop(pos.top - topPos.top);
      };
      this.adjustInputPosition = function() {
        var pBottom, pLeft, pTop, tagElement, tagPosition;
        tagElement = $('.tag', _this.$element).last();
        tagPosition = tagElement.position();
        pLeft = tagPosition != null ? tagPosition.left + tagElement.outerWidth(true) : 0;
        pTop = tagPosition != null ? tagPosition.top : 0;
        $('.tags-input', _this.$element).css({
          paddingLeft: pLeft,
          paddingTop: pTop
        });
        pBottom = tagPosition != null ? tagPosition.top + tagElement.outerHeight(true) : 22;
        return _this.$element.css({
          height: pBottom
        });
      };
      this.renderTags = function() {
        var tagList;
        tagList = $('.tags', _this.$element);
        tagList.html('');
        _this.input.attr('placeholder', (_this.tagsArray.length === 0 ? _this.promptText : ''));
        $.each(_this.tagsArray, function(i, tag) {
          tag = $(_this.formatTag(i, tag));
          $('a', tag).click(_this.removeTagClicked);
          $('a', tag).mouseover(_this.toggleCloseColor);
          $('a', tag).mouseout(_this.toggleCloseColor);
          if (_this.displayPopovers) {
            $('span', tag).mouseover(function() {
              return tag.popover('show');
            });
            $('span', tag).mouseout(function() {
              return tag.popover('hide');
            });
          }
          return tagList.append(tag);
        });
        return _this.adjustInputPosition();
      };
      this.formatTag = function(i, tag) {
        var popoverContent;
        if (_this.displayPopovers === true) {
          popoverContent = _this.popoverArray[_this.tagsArray.indexOf(tag)];
          return "<div class='tag label " + _this.tagClass + "' rel='popover' data-placement='bottom' data-content='" + popoverContent + "' data-original-title='" + tag + "'><span>" + tag + "</span><a> <i class='icon-remove-sign icon-white'></i></a></div>";
        } else {
          return "<div class='tag label " + _this.tagClass + "'><span>" + tag + "</span><a> <i class='icon-remove-sign icon-white'></i></a></div>";
        }
      };
      this.addDocumentListeners = function() {
        return $(document).mouseup(function(e) {
          var container;
          container = $('.tags-suggestion-list', _this.$element);
          if (container.has(e.target).length === 0) {
            return _this.hideSuggestions();
          }
        });
      };
      this.init = function() {
        this.input = $("<input type='text' class='tags-input'>");
        this.input.keydown(this.keyDownHandler);
        this.input.keyup(this.keyUpHandler);
        this.$element.append(this.input);
        this.$suggestionList = $('<ul class="tags-suggestion-list dropdown-menu"></ul>');
        this.$element.append(this.$suggestionList);
        this.renderTags();
        return this.addDocumentListeners();
      };
      this.init();
      return this;
    };
    return $.fn.tags = function(options) {
      return this.each(function() {
        var tags;
        return tags = new $.tags(this, options);
      });
    };
  });

}).call(this);
