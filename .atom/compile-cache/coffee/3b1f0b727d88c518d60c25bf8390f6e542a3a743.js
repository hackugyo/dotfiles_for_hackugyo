(function() {
  var JapaneseWrapManager;

  JapaneseWrapManager = require('./japanese-wrap-manager');

  module.exports = {
    japaneseWrapManager: null,
    activate: function(state) {
      var japaneseWrapManager;
      this.japaneseWrapManager = new JapaneseWrapManager;
      japaneseWrapManager = this.japaneseWrapManager;
      return atom.workspaceView.eachEditorView(function(editorView) {
        var editor;
        editor = editorView.getEditor();
        return japaneseWrapManager.overwriteFindWrapColumn(editor.displayBuffer);
      });
    },
    deactivate: function() {
      var japaneseWrapManager;
      japaneseWrapManager = this.japaneseWrapManager;
      return atom.workspaceView.eachEditorView(function(editorView) {
        var editor;
        editor = editorView.getEditor();
        return japaneseWrapManager.restoreFindWrapColumn(editor.displayBuffer);
      });
    }
  };

}).call(this);

//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAiZmlsZSI6ICIiLAogICJzb3VyY2VSb290IjogIiIsCiAgInNvdXJjZXMiOiBbCiAgICAiIgogIF0sCiAgIm5hbWVzIjogW10sCiAgIm1hcHBpbmdzIjogIkFBQUE7QUFBQSxNQUFBLG1CQUFBOztBQUFBLEVBQUEsbUJBQUEsR0FBc0IsT0FBQSxDQUFRLHlCQUFSLENBQXRCLENBQUE7O0FBQUEsRUFFQSxNQUFNLENBQUMsT0FBUCxHQUNFO0FBQUEsSUFBQSxtQkFBQSxFQUFxQixJQUFyQjtBQUFBLElBRUEsUUFBQSxFQUFVLFNBQUMsS0FBRCxHQUFBO0FBQ1IsVUFBQSxtQkFBQTtBQUFBLE1BQUEsSUFBQyxDQUFBLG1CQUFELEdBQXVCLEdBQUEsQ0FBQSxtQkFBdkIsQ0FBQTtBQUFBLE1BQ0EsbUJBQUEsR0FBc0IsSUFBQyxDQUFBLG1CQUR2QixDQUFBO2FBRUEsSUFBSSxDQUFDLGFBQWEsQ0FBQyxjQUFuQixDQUFrQyxTQUFDLFVBQUQsR0FBQTtBQUNoQyxZQUFBLE1BQUE7QUFBQSxRQUFBLE1BQUEsR0FBUyxVQUFVLENBQUMsU0FBWCxDQUFBLENBQVQsQ0FBQTtlQUNBLG1CQUFtQixDQUFDLHVCQUFwQixDQUE0QyxNQUFNLENBQUMsYUFBbkQsRUFGZ0M7TUFBQSxDQUFsQyxFQUhRO0lBQUEsQ0FGVjtBQUFBLElBU0EsVUFBQSxFQUFZLFNBQUEsR0FBQTtBQUNWLFVBQUEsbUJBQUE7QUFBQSxNQUFBLG1CQUFBLEdBQXNCLElBQUMsQ0FBQSxtQkFBdkIsQ0FBQTthQUNBLElBQUksQ0FBQyxhQUFhLENBQUMsY0FBbkIsQ0FBa0MsU0FBQyxVQUFELEdBQUE7QUFDaEMsWUFBQSxNQUFBO0FBQUEsUUFBQSxNQUFBLEdBQVMsVUFBVSxDQUFDLFNBQVgsQ0FBQSxDQUFULENBQUE7ZUFDQSxtQkFBbUIsQ0FBQyxxQkFBcEIsQ0FBMEMsTUFBTSxDQUFDLGFBQWpELEVBRmdDO01BQUEsQ0FBbEMsRUFGVTtJQUFBLENBVFo7R0FIRixDQUFBO0FBQUEiCn0=
//# sourceURL=/Users/kwatanabe/.atom/packages/japanese-wrap/lib/japanese-wrap.coffee