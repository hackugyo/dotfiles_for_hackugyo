(function() {
  var StatsTracker;

  module.exports = StatsTracker = (function() {
    StatsTracker.prototype.startDate = new Date;

    StatsTracker.prototype.hours = 6;

    StatsTracker.prototype.eventLog = {};

    function StatsTracker() {
      var date, future;
      date = new Date(this.startDate);
      future = new Date(date.getTime() + (36e5 * this.hours));
      this.eventLog[this.time(date)] = 0;
      while (date < future) {
        this.eventLog[this.time(date)] = 0;
      }
      atom.workspaceView.on('keydown', (function(_this) {
        return function() {
          return _this.track();
        };
      })(this));
      atom.workspaceView.on('mouseup', (function(_this) {
        return function() {
          return _this.track();
        };
      })(this));
    }

    StatsTracker.prototype.clear = function() {
      return this.eventLog = {};
    };

    StatsTracker.prototype.track = function() {
      var date, times, _base;
      date = new Date;
      times = this.time(date);
      if ((_base = this.eventLog)[times] == null) {
        _base[times] = 0;
      }
      this.eventLog[times] += 1;
      if (this.eventLog.length > (this.hours * 60)) {
        return this.eventLog.shift();
      }
    };

    StatsTracker.prototype.time = function(date) {
      var hour, minute;
      date.setTime(date.getTime() + 6e4);
      hour = date.getHours();
      minute = date.getMinutes();
      return "" + hour + ":" + minute;
    };

    return StatsTracker;

  })();

}).call(this);

//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAiZmlsZSI6ICIiLAogICJzb3VyY2VSb290IjogIiIsCiAgInNvdXJjZXMiOiBbCiAgICAiIgogIF0sCiAgIm5hbWVzIjogW10sCiAgIm1hcHBpbmdzIjogIkFBQUE7QUFBQSxNQUFBLFlBQUE7O0FBQUEsRUFBQSxNQUFNLENBQUMsT0FBUCxHQUNNO0FBQ0osMkJBQUEsU0FBQSxHQUFXLEdBQUEsQ0FBQSxJQUFYLENBQUE7O0FBQUEsMkJBQ0EsS0FBQSxHQUFPLENBRFAsQ0FBQTs7QUFBQSwyQkFFQSxRQUFBLEdBQVUsRUFGVixDQUFBOztBQUlhLElBQUEsc0JBQUEsR0FBQTtBQUNYLFVBQUEsWUFBQTtBQUFBLE1BQUEsSUFBQSxHQUFXLElBQUEsSUFBQSxDQUFLLElBQUMsQ0FBQSxTQUFOLENBQVgsQ0FBQTtBQUFBLE1BQ0EsTUFBQSxHQUFhLElBQUEsSUFBQSxDQUFLLElBQUksQ0FBQyxPQUFMLENBQUEsQ0FBQSxHQUFpQixDQUFDLElBQUEsR0FBTyxJQUFDLENBQUEsS0FBVCxDQUF0QixDQURiLENBQUE7QUFBQSxNQUVBLElBQUMsQ0FBQSxRQUFTLENBQUEsSUFBQyxDQUFBLElBQUQsQ0FBTSxJQUFOLENBQUEsQ0FBVixHQUF5QixDQUZ6QixDQUFBO0FBSUEsYUFBTSxJQUFBLEdBQU8sTUFBYixHQUFBO0FBQ0UsUUFBQSxJQUFDLENBQUEsUUFBUyxDQUFBLElBQUMsQ0FBQSxJQUFELENBQU0sSUFBTixDQUFBLENBQVYsR0FBeUIsQ0FBekIsQ0FERjtNQUFBLENBSkE7QUFBQSxNQU9BLElBQUksQ0FBQyxhQUFhLENBQUMsRUFBbkIsQ0FBc0IsU0FBdEIsRUFBaUMsQ0FBQSxTQUFBLEtBQUEsR0FBQTtlQUFBLFNBQUEsR0FBQTtpQkFBRyxLQUFDLENBQUEsS0FBRCxDQUFBLEVBQUg7UUFBQSxFQUFBO01BQUEsQ0FBQSxDQUFBLENBQUEsSUFBQSxDQUFqQyxDQVBBLENBQUE7QUFBQSxNQVFBLElBQUksQ0FBQyxhQUFhLENBQUMsRUFBbkIsQ0FBc0IsU0FBdEIsRUFBaUMsQ0FBQSxTQUFBLEtBQUEsR0FBQTtlQUFBLFNBQUEsR0FBQTtpQkFBRyxLQUFDLENBQUEsS0FBRCxDQUFBLEVBQUg7UUFBQSxFQUFBO01BQUEsQ0FBQSxDQUFBLENBQUEsSUFBQSxDQUFqQyxDQVJBLENBRFc7SUFBQSxDQUpiOztBQUFBLDJCQWVBLEtBQUEsR0FBTyxTQUFBLEdBQUE7YUFDTCxJQUFDLENBQUEsUUFBRCxHQUFZLEdBRFA7SUFBQSxDQWZQLENBQUE7O0FBQUEsMkJBa0JBLEtBQUEsR0FBTyxTQUFBLEdBQUE7QUFDTCxVQUFBLGtCQUFBO0FBQUEsTUFBQSxJQUFBLEdBQU8sR0FBQSxDQUFBLElBQVAsQ0FBQTtBQUFBLE1BQ0EsS0FBQSxHQUFRLElBQUMsQ0FBQSxJQUFELENBQU0sSUFBTixDQURSLENBQUE7O2FBRVUsQ0FBQSxLQUFBLElBQVU7T0FGcEI7QUFBQSxNQUdBLElBQUMsQ0FBQSxRQUFTLENBQUEsS0FBQSxDQUFWLElBQW9CLENBSHBCLENBQUE7QUFJQSxNQUFBLElBQXFCLElBQUMsQ0FBQSxRQUFRLENBQUMsTUFBVixHQUFtQixDQUFDLElBQUMsQ0FBQSxLQUFELEdBQVMsRUFBVixDQUF4QztlQUFBLElBQUMsQ0FBQSxRQUFRLENBQUMsS0FBVixDQUFBLEVBQUE7T0FMSztJQUFBLENBbEJQLENBQUE7O0FBQUEsMkJBeUJBLElBQUEsR0FBTSxTQUFDLElBQUQsR0FBQTtBQUNKLFVBQUEsWUFBQTtBQUFBLE1BQUEsSUFBSSxDQUFDLE9BQUwsQ0FBYSxJQUFJLENBQUMsT0FBTCxDQUFBLENBQUEsR0FBaUIsR0FBOUIsQ0FBQSxDQUFBO0FBQUEsTUFDQSxJQUFBLEdBQU8sSUFBSSxDQUFDLFFBQUwsQ0FBQSxDQURQLENBQUE7QUFBQSxNQUVBLE1BQUEsR0FBUyxJQUFJLENBQUMsVUFBTCxDQUFBLENBRlQsQ0FBQTthQUdBLEVBQUEsR0FBRSxJQUFGLEdBQVEsR0FBUixHQUFVLE9BSk47SUFBQSxDQXpCTixDQUFBOzt3QkFBQTs7TUFGRixDQUFBO0FBQUEiCn0=
//# sourceURL=/Users/kwatanabe/.atom/packages/editor-stats/lib/stats-tracker.coffee