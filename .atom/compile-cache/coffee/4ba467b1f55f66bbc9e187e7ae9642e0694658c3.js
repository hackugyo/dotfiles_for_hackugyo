(function() {
  var CSSbeautify, HTMLbeautify, JSbeautify, Subscriber, convert, convertCSS, convertHTML, convertJs, plugin, _;

  JSbeautify = require("js-beautify").js_beautify;

  HTMLbeautify = require("js-beautify").html;

  CSSbeautify = require("js-beautify").css;

  Subscriber = require('emissary').Subscriber;

  _ = require('lodash');

  plugin = module.exports;

  Subscriber.extend(plugin);

  convertJs = function() {
    var editor, _ref;
    console.log("Converting Js..");
    editor = atom.workspace.activePaneItem;
    if (((_ref = editor.getGrammar()) != null ? _ref.scopeName : void 0) !== 'source.js') {
      return;
    }
    return editor.setText(JSbeautify(editor.getText(), {
      indent_size: atom.config.get('atom-beautifier.JsIndentSize'),
      indent_char: atom.config.get('atom-beautifier.JsIndentChar'),
      indent_level: atom.config.get('atom-beautifier.JsIndentLevel'),
      indent_with_tabs: atom.config.get('atom-beautifier.JsIndentWithTabs'),
      preserve_newlines: atom.config.get('atom-beautifier.JsPreserveNewlines'),
      max_preserve_newlines: atom.config.get('atom-beautifier.JsMaxPreserveNewlines'),
      jslint_happy: atom.config.get('atom-beautifier.JsJslintHappy'),
      brace_style: atom.config.get('atom-beautifier.JsBraceStyle'),
      keep_array_indentation: atom.config.get('atom-beautifier.JsKeepArrayIndentation'),
      keep_function_indentation: atom.config.get('atom-beautifier.JsKeepFunctionIndentation'),
      space_before_conditional: atom.config.get('atom-beautifier.JsSpaceBeforeConditional'),
      break_chained_methods: atom.config.get('atom-beautifier.JsBreakChainedMethods'),
      eval_code: atom.config.get('atom-beautifier.JsEvalCode'),
      unescape_strings: atom.config.get('atom-beautifier.JsUnescapeStrings'),
      wrap_line_length: atom.config.get('atom-beautifier.JsWrapLineLength')
    }));
  };

  convertCSS = function() {
    var editor, _ref;
    console.log("Converting CSS..");
    editor = atom.workspace.activePaneItem;
    if (((_ref = editor.getGrammar()) != null ? _ref.scopeName : void 0) !== 'source.css') {
      return;
    }
    return editor.setText(CSSbeautify(editor.getText(), {
      indent_size: atom.config.get('atom-beautifier.CssIndentSize'),
      indent_char: atom.config.get('atom-beautifier.CssIndentChar')
    }));
  };

  convertHTML = function() {
    var editor, _ref;
    console.log("Converting Html..");
    editor = atom.workspace.activePaneItem;
    if (((_ref = editor.getGrammar()) != null ? _ref.scopeName : void 0) !== 'text.html.basic') {
      return;
    }
    return editor.setText(HTMLbeautify(editor.getText(), {
      indent_size: atom.config.get('atom-beautifier.HtmlIndentSize'),
      indent_char: atom.config.get('atom-beautifier.HtmlIndentChar'),
      indent_inner_html: atom.config.get('atom-beautifier.HtmlIndentInnerHtml'),
      brace_style: atom.config.get('atom-beautifier.HtmlBraceStyle'),
      indent_scripts: atom.config.get('atom-beautifier.HtmlIndentScripts'),
      wrap_line_length: atom.config.get('atom-beautifier.HtmlWrapLineLength')
    }));
  };

  convert = function() {
    var editor, _ref, _ref1, _ref2, _ref3;
    editor = atom.workspace.activePaneItem;
    console.log((_ref = editor.getGrammar()) != null ? _ref.scopeName : void 0);
    if (((_ref1 = editor.getGrammar()) != null ? _ref1.scopeName : void 0) === 'source.js') {
      return convertJs();
    } else if (((_ref2 = editor.getGrammar()) != null ? _ref2.scopeName : void 0) === 'source.css') {
      return convertCSS();
    } else if (((_ref3 = editor.getGrammar()) != null ? _ref3.scopeName : void 0) === 'text.html.basic') {
      return convertHTML();
    }
  };

  plugin.configDefaults = {
    autoSave: false,
    JsIndentSize: 2,
    JsIndentChar: " ",
    JsIndentLevel: 0,
    JsIndentWithTabs: false,
    JsPreserveNewlines: true,
    JsMaxPreserveNewlines: 10,
    JsJslintHappy: false,
    JsBraceStyle: "collapse",
    JsKeepArrayIndentation: false,
    JsKeepFunctionIndentation: false,
    JsSpaceBeforeConditional: true,
    JsBreakChainedMethods: false,
    JsEvalCode: false,
    JsUnescapeStrings: false,
    JsWrapLineLength: 0,
    CssIndentSize: 2,
    CssIndentChar: " ",
    HtmlIndentInnerHtml: false,
    HtmlIndentSize: 2,
    HtmlIndentChar: " ",
    HtmlBraceStyle: "collapse",
    HtmlIndentScripts: "normal",
    HtmlWrapLineLength: 250
  };

  plugin.activate = function() {
    atom.workspaceView.command("beautifier", function() {
      return convert();
    });
    atom.workspaceView.command("beautifier:js", function() {
      return convertJs();
    });
    atom.workspaceView.command("beautifier:html", function() {
      return convertHTML();
    });
    atom.workspaceView.command("beautifier:css", function() {
      return convertCSS();
    });
    if (atom.config.get('atom-beautifier.autoSave')) {
      return atom.workspace.eachEditor(function(editor) {
        var buffer;
        buffer = editor.getBuffer();
        plugin.unsubscribe(buffer);
        return plugin.subscribe(buffer, 'saved', _.debounce(convert, 50));
      });
    }
  };

}).call(this);

//# sourceMappingURL=data:application/json;base64,ewogICJ2ZXJzaW9uIjogMywKICAiZmlsZSI6ICIiLAogICJzb3VyY2VSb290IjogIiIsCiAgInNvdXJjZXMiOiBbCiAgICAiIgogIF0sCiAgIm5hbWVzIjogW10sCiAgIm1hcHBpbmdzIjogIkFBQUE7QUFBQSxNQUFBLHlHQUFBOztBQUFBLEVBQUEsVUFBQSxHQUFhLE9BQUEsQ0FBUSxhQUFSLENBQXNCLENBQUMsV0FBcEMsQ0FBQTs7QUFBQSxFQUNBLFlBQUEsR0FBZSxPQUFBLENBQVEsYUFBUixDQUFzQixDQUFDLElBRHRDLENBQUE7O0FBQUEsRUFFQSxXQUFBLEdBQWMsT0FBQSxDQUFRLGFBQVIsQ0FBc0IsQ0FBQyxHQUZyQyxDQUFBOztBQUFBLEVBR0EsVUFBQSxHQUFhLE9BQUEsQ0FBUSxVQUFSLENBQW1CLENBQUMsVUFIakMsQ0FBQTs7QUFBQSxFQUlBLENBQUEsR0FBSSxPQUFBLENBQVEsUUFBUixDQUpKLENBQUE7O0FBQUEsRUFNQSxNQUFBLEdBQVMsTUFBTSxDQUFDLE9BTmhCLENBQUE7O0FBQUEsRUFRQSxVQUFVLENBQUMsTUFBWCxDQUFrQixNQUFsQixDQVJBLENBQUE7O0FBQUEsRUFXQSxTQUFBLEdBQVksU0FBQSxHQUFBO0FBQ1YsUUFBQSxZQUFBO0FBQUEsSUFBQSxPQUFPLENBQUMsR0FBUixDQUFZLGlCQUFaLENBQUEsQ0FBQTtBQUFBLElBQ0EsTUFBQSxHQUFTLElBQUksQ0FBQyxTQUFTLENBQUMsY0FEeEIsQ0FBQTtBQUdBLElBQUEsZ0RBQWlDLENBQUUsbUJBQXJCLEtBQWtDLFdBQWhEO0FBQUEsWUFBQSxDQUFBO0tBSEE7V0FLQSxNQUFNLENBQUMsT0FBUCxDQUFlLFVBQUEsQ0FBVyxNQUFNLENBQUMsT0FBUCxDQUFBLENBQVgsRUFDYjtBQUFBLE1BQUEsV0FBQSxFQUFhLElBQUksQ0FBQyxNQUFNLENBQUMsR0FBWixDQUFnQiw4QkFBaEIsQ0FBYjtBQUFBLE1BQ0EsV0FBQSxFQUFhLElBQUksQ0FBQyxNQUFNLENBQUMsR0FBWixDQUFnQiw4QkFBaEIsQ0FEYjtBQUFBLE1B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
//# sourceURL=/Users/kwatanabe/.atom/packages/atom-beautifier/lib/beautifier.coffee