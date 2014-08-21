(function() {
  var JapaneseWrapManager;

  module.exports = JapaneseWrapManager = (function() {
    function JapaneseWrapManager() {
      this.highSurrogateChar = /[\uD800-\uDBFF]/;
      this.highSurrogateHalfWidthChar = /[\uD800-\uD83F]/;
      this.highSurrogateFullWdithChar = /[\uD840-\uDBFF]/;
      this.lowSurrogateChar = /[\uDC00-\uDFFF]/;
      this.whitespaceChar = /[\t\n\v\f\r \u00a0\u2000-\u200b\u2028\u2029]/;
      this.unbreakbleChar = /[—…‥]/;
      this.europeanNumeralChar = /[\d.,]/;
      this.openingBracketChar = /[‘“（〔［｛〈《「『【｟〘〖«〝]/;
      this.closingBracketChar = /[’”）〕］｝〉》」』】｠〙〗»〟]/;
      this.hyphenChar = /[‐〜゠–]/;
      this.dividingPunctuationChar = /[！？‼⁇⁈⁉]/;
      this.middleDotChar = /[・：；]/;
      this.fullStopChar = /[。．]/;
      this.commaChar = /[、，]/;
      this.inseparableChar = /[—…‥〳〴〵]/;
      this.iterationMarkChar = /[ヽヾゝゞ々〻]/;
      this.prolongedSoundMarkChar = /ー/;
      this.smallKanaChar = /[ぁぃぅぇぉァィゥェォっゃゅょゎゕゖッャュョヮヵヶㇰㇱㇲㇳㇴㇵㇶㇷㇸㇹㇺㇻㇼㇽㇾㇿ]/;
      this.prefAbbrChar = /[¥$£#€№]/;
      this.postAbbrChar = /[°′″℃¢%‰㏋ℓ㌃㌍㌔㌘㌢㌣㌦㌧㌫㌶㌻㍉㍊㍍㍑㍗㎎㎏㎜㎝㎞㎡㏄]/;
      this.ideographicSpaceChar = /\u3000/;
      this.westernChar = /[\u0021-\u007E\u00A0-\u1FFF]/;
      this.notStartingChar = new RegExp(this.closingBracketChar.source + "|" + this.hyphenChar.source + "|" + this.dividingPunctuationChar.source + "|" + this.middleDotChar.source + "|" + this.fullStopChar.source + "|" + this.commaChar.source + "|" + this.iterationMarkChar.source + "|" + this.prolongedSoundMarkChar.source + "|" + this.smallKanaChar.source + "|" + this.lowSurrogateChar.source);
      this.notEndingChar = new RegExp(this.openingBracketChar.source + "|" + this.highSurrogateChar.source);
      this.zeroWidthChar = /[\u200B-\u200F\uDC00-\uDFFF\uFEFF]/;
      this.halfWidthChar = /[\u0000-\u036F\u2000-\u2000A\u2122\uD800-\uD83F\uFF61-\uFFDC]/;
    }

    JapaneseWrapManager.prototype.overwriteFindWrapColumn = function(displayBuffer) {
      if (displayBuffer.japaneseWrapManager == null) {
        displayBuffer.japaneseWrapManager = this;
      }
      if (displayBuffer.originalFindWrapColumn == null) {
        displayBuffer.originalFindWrapColumn = displayBuffer.findWrapColumn;
      }
      return displayBuffer.findWrapColumn = function(line, softWrapColumn) {
        if (softWrapColumn == null) {
          softWrapColumn = this.getSoftWrapColumn();
        }
        if (!this.softWrap) {
          return;
        }
        return this.japaneseWrapManager.findJapaneseWrapColumn(line, softWrapColumn);
      };
    };

    JapaneseWrapManager.prototype.restoreFindWrapColumn = function(displayBuffer) {
      if (displayBuffer.originalFindWrapColumn != null) {
        displayBuffer.findWrapColumn = displayBuffer.originalFindWrapColumn;
        displayBuffer.originalFindWrapColumn = void 0;
      }
      if (displayBuffer.japaneseWrapManager != null) {
        return displayBuffer.japaneseWrapManager = void 0;
      }
    };

    JapaneseWrapManager.prototype.findJapaneseWrapColumn = function(line, sotfWrapColumn) {
      var column, size, wrapColumn, _i, _j, _k, _l, _m, _ref, _ref1, _ref2;
      if (!((line.length * 2) > sotfWrapColumn)) {
        return;
      }
      size = 0;
      for (wrapColumn = _i = 0, _ref = line.length; 0 <= _ref ? _i < _ref : _i > _ref; wrapColumn = 0 <= _ref ? ++_i : --_i) {
        if (this.zeroWidthChar.test(line[wrapColumn])) {
          continue;
        } else if (this.halfWidthChar.test(line[wrapColumn])) {
          size = size + 1;
        } else {
          size = size + 2;
        }
        if (size > sotfWrapColumn) {
          if (this.notEndingChar.test(line[wrapColumn - 1])) {
            for (column = _j = _ref1 = wrapColumn - 1; _ref1 <= 0 ? _j < 0 : _j > 0; column = _ref1 <= 0 ? ++_j : --_j) {
              if (!this.notEndingChar.test(line[column - 1])) {
                return column;
              }
            }
            return wrapColumn;
          } else if (this.whitespaceChar.test(line[wrapColumn])) {
            for (column = _k = wrapColumn, _ref2 = line.length; wrapColumn <= _ref2 ? _k < _ref2 : _k > _ref2; column = wrapColumn <= _ref2 ? ++_k : --_k) {
              if (!this.whitespaceChar.test(line[column])) {
                return column;
              }
            }
            return line.length;
          } else if (this.westernChar.test(line[wrapColumn])) {
            for (column = _l = wrapColumn; wrapColumn <= 0 ? _l <= 0 : _l >= 0; column = wrapColumn <= 0 ? ++_l : --_l) {
              if (!this.westernChar.test(line[column])) {
                return column + 1;
              }
            }
            return wrapColumn;
          } else if (this.notStartingChar.test(line[wrapColumn])) {
            for (column = _m = wrapColumn; wrapColumn <= 0 ? _m < 0 : _m > 0; column = wrapColumn <= 0 ? ++_m : --_m) {
              if (!this.notStartingChar.test(line[column])) {
                return column;
              }
            }
            return wrapColumn;
          } else {
            return wrapColumn;
          }
        }
      }
    };

    return JapaneseWrapManager;

  })();

}).call(this);

//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAiZmlsZSI6ICIiLAogICJzb3VyY2VSb290IjogIiIsCiAgInNvdXJjZXMiOiBbCiAgICAiIgogIF0sCiAgIm5hbWVzIjogW10sCiAgIm1hcHBpbmdzIjogIkFBQ0E7QUFBQSxNQUFBLG1CQUFBOztBQUFBLEVBQUEsTUFBTSxDQUFDLE9BQVAsR0FDTTtBQUNTLElBQUEsNkJBQUEsR0FBQTtBQU1YLE1BQUEsSUFBQyxDQUFBLGlCQUFELEdBQXFCLGlCQUFyQixDQUFBO0FBQUEsTUFDQSxJQUFDLENBQUEsMEJBQUQsR0FBOEIsaUJBRDlCLENBQUE7QUFBQSxNQUVBLElBQUMsQ0FBQSwwQkFBRCxHQUE4QixpQkFGOUIsQ0FBQTtBQUFBLE1BR0EsSUFBQyxDQUFBLGdCQUFELEdBQW9CLGlCQUhwQixDQUFBO0FBQUEsTUFNQSxJQUFDLENBQUEsY0FBRCxHQUFrQiw4Q0FObEIsQ0FBQTtBQUFBLE1BUUEsSUFBQyxDQUFBLGNBQUQsR0FBa0IsT0FSbEIsQ0FBQTtBQUFBLE1BU0EsSUFBQyxDQUFBLG1CQUFELEdBQXVCLFFBVHZCLENBQUE7QUFBQSxNQWlCQSxJQUFDLENBQUEsa0JBQUQsR0FBc0Isb0JBakJ0QixDQUFBO0FBQUEsTUFvQkEsSUFBQyxDQUFBLGtCQUFELEdBQXNCLG9CQXBCdEIsQ0FBQTtBQUFBLE1BdUJBLElBQUMsQ0FBQSxVQUFELEdBQWMsUUF2QmQsQ0FBQTtBQUFBLE1BMEJBLElBQUMsQ0FBQSx1QkFBRCxHQUEyQixVQTFCM0IsQ0FBQTtBQUFBLE1BNkJBLElBQUMsQ0FBQSxhQUFELEdBQWlCLE9BN0JqQixDQUFBO0FBQUEsTUErQkEsSUFBQyxDQUFBLFlBQUQsR0FBZ0IsTUEvQmhCLENBQUE7QUFBQSxNQWlDQSxJQUFDLENBQUEsU0FBRCxHQUFhLE1BakNiLENBQUE7QUFBQSxNQW9DQSxJQUFDLENBQUEsZUFBRCxHQUFtQixVQXBDbkIsQ0FBQTtBQUFBLE1Bc0NBLElBQUMsQ0FBQSxpQkFBRCxHQUFxQixVQXRDckIsQ0FBQTtBQUFBLE1Bd0NBLElBQUMs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
//# sourceURL=/Users/kwatanabe/.atom/packages/japanese-wrap/lib/japanese-wrap-manager.coffee