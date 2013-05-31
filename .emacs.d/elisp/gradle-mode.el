  


<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# githubog: http://ogp.me/ns/fb/githubog#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>emacs-gradle-mode/gradle-mode.el at master · djmijares/emacs-gradle-mode · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <link rel="logo" type="image/svg" href="http://github-media-downloads.s3.amazonaws.com/github-logo.svg" />
    <link rel="xhr-socket" href="/_sockets" />


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="github" name="octolytics-app-id" />

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="G38nylUu6NGW2dWZ+9MAXCU2FVoieytGXt1EIdYSr9s=" name="csrf-token" />

    <link href="https://a248.e.akamai.net/assets.github.com/assets/github-aacfd01406222a8e32af6bf66a2eed1a08267178.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://a248.e.akamai.net/assets.github.com/assets/github2-30896c5685c3dd8da766a4fd3065a563107c9370.css" media="all" rel="stylesheet" type="text/css" />
    


      <script src="https://a248.e.akamai.net/assets.github.com/assets/frameworks-ec9348b8374c693b0749d0b95b215fe3f5414fd0.js" type="text/javascript"></script>
      <script src="https://a248.e.akamai.net/assets.github.com/assets/github-3a11f3836624f198d32737512fe1c445445987b3.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="bdd56032babb410898471b4229dd697b">

        <link data-pjax-transient rel='permalink' href='/djmijares/emacs-gradle-mode/blob/aaad1e5c65fd99948f95e984e66e162c9b1f8450/gradle-mode.el'>
    <meta property="og:title" content="emacs-gradle-mode"/>
    <meta property="og:type" content="githubog:gitrepository"/>
    <meta property="og:url" content="https://github.com/djmijares/emacs-gradle-mode"/>
    <meta property="og:image" content="https://secure.gravatar.com/avatar/5a29afa8a365fd6333b01b5f8aa80f4a?s=420&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png"/>
    <meta property="og:site_name" content="GitHub"/>
    <meta property="og:description" content="emacs-gradle-mode - minor mode for emacs to run gradle from emacs and not have to go to a terminal"/>
    <meta property="twitter:card" content="summary"/>
    <meta property="twitter:site" content="@GitHub">
    <meta property="twitter:title" content="djmijares/emacs-gradle-mode"/>

    <meta name="description" content="emacs-gradle-mode - minor mode for emacs to run gradle from emacs and not have to go to a terminal" />


    <meta content="1119640" name="octolytics-dimension-user_id" /><meta content="7677282" name="octolytics-dimension-repository_id" />
  <link href="https://github.com/djmijares/emacs-gradle-mode/commits/master.atom" rel="alternate" title="Recent Commits to emacs-gradle-mode:master" type="application/atom+xml" />

  </head>


  <body class="logged_out page-blob  vis-public env-production  ">
    <div id="wrapper">

      
      
      

      
      <div class="header header-logged-out">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/">Github</a>

    <div class="header-actions">
      <a class="button primary" href="/signup">Sign up</a>
      <a class="button" href="/login?return_to=%2Fdjmijares%2Femacs-gradle-mode%2Fblob%2Fmaster%2Fgradle-mode.el">Sign in</a>
    </div>

    <div class="command-bar js-command-bar  in-repository">


      <ul class="top-nav">
          <li class="explore"><a href="/explore">Explore</a></li>
        <li class="features"><a href="/features">Features</a></li>
          <li class="enterprise"><a href="http://enterprise.github.com/">Enterprise</a></li>
          <li class="blog"><a href="/blog">Blog</a></li>
      </ul>
        <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">
  <a href="/search/advanced" class="advanced-search-icon tooltipped downwards command-bar-search" id="advanced_search" title="Advanced search"><span class="octicon octicon-gear "></span></a>

  <input type="text" data-hotkey="/ s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
      data-repo="djmijares/emacs-gradle-mode"
      data-branch="master"
      data-sha="b725537bbe3c2f55a9fdd727f084abb164464f3a"
  >

    <input type="hidden" name="nwo" value="djmijares/emacs-gradle-mode" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="octicon help tooltipped downwards" title="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

  <div class="divider-vertical"></div>

</form>
    </div>

  </div>
</div>


      


            <div class="site hfeed" itemscope itemtype="http://schema.org/WebPage">
      <div class="hentry">
        
        <div class="pagehead repohead instapaper_ignore readability-menu ">
          <div class="container">
            <div class="title-actions-bar">
              

<ul class="pagehead-actions">



    <li>
      <a href="/login?return_to=%2Fdjmijares%2Femacs-gradle-mode"
        class="minibutton js-toggler-target star-button entice tooltipped upwards"
        title="You must be signed in to use this feature" rel="nofollow">
        <span class="octicon octicon-star"></span>Star
      </a>
      <a class="social-count js-social-count" href="/djmijares/emacs-gradle-mode/stargazers">
        0
      </a>
    </li>
    <li>
      <a href="/login?return_to=%2Fdjmijares%2Femacs-gradle-mode"
        class="minibutton js-toggler-target fork-button entice tooltipped upwards"
        title="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-git-branch"></span>Fork
      </a>
      <a href="/djmijares/emacs-gradle-mode/network" class="social-count">
        0
      </a>
    </li>
</ul>

              <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
                <span class="repo-label"><span>public</span></span>
                <span class="mega-octicon octicon-repo"></span>
                <span class="author vcard">
                  <a href="/djmijares" class="url fn" itemprop="url" rel="author">
                  <span itemprop="title">djmijares</span>
                  </a></span> /
                <strong><a href="/djmijares/emacs-gradle-mode" class="js-current-repository">emacs-gradle-mode</a></strong>
              </h1>
            </div>

            
  <ul class="tabs">
    <li class="pulse-nav"><a href="/djmijares/emacs-gradle-mode/pulse" class="js-selected-navigation-item " data-selected-links="pulse /djmijares/emacs-gradle-mode/pulse" rel="nofollow"><span class="octicon octicon-pulse"></span></a></li>
    <li><a href="/djmijares/emacs-gradle-mode" class="js-selected-navigation-item selected" data-selected-links="repo_source repo_downloads repo_commits repo_tags repo_branches /djmijares/emacs-gradle-mode">Code</a></li>
    <li><a href="/djmijares/emacs-gradle-mode/network" class="js-selected-navigation-item " data-selected-links="repo_network /djmijares/emacs-gradle-mode/network">Network</a></li>
    <li><a href="/djmijares/emacs-gradle-mode/pulls" class="js-selected-navigation-item " data-selected-links="repo_pulls /djmijares/emacs-gradle-mode/pulls">Pull Requests <span class='counter'>0</span></a></li>

      <li><a href="/djmijares/emacs-gradle-mode/issues" class="js-selected-navigation-item " data-selected-links="repo_issues /djmijares/emacs-gradle-mode/issues">Issues <span class='counter'>0</span></a></li>



    <li><a href="/djmijares/emacs-gradle-mode/graphs" class="js-selected-navigation-item " data-selected-links="repo_graphs repo_contributors /djmijares/emacs-gradle-mode/graphs">Graphs</a></li>


  </ul>
  
<div class="tabnav">

  <span class="tabnav-right">
    <ul class="tabnav-tabs">
          <li><a href="/djmijares/emacs-gradle-mode/tags" class="js-selected-navigation-item tabnav-tab" data-selected-links="repo_tags /djmijares/emacs-gradle-mode/tags">Tags <span class="counter blank">0</span></a></li>
    </ul>
  </span>

  <div class="tabnav-widget scope">


    <div class="select-menu js-menu-container js-select-menu js-branch-menu">
      <a class="minibutton select-menu-button js-menu-target" data-hotkey="w" data-ref="master">
        <span class="octicon octicon-branch"></span>
        <i>branch:</i>
        <span class="js-select-button">master</span>
      </a>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container">

        <div class="select-menu-modal">
          <div class="select-menu-header">
            <span class="select-menu-title">Switch branches/tags</span>
            <span class="octicon octicon-remove-close js-menu-close"></span>
          </div> <!-- /.select-menu-header -->

          <div class="select-menu-filters">
            <div class="select-menu-text-filter">
              <input type="text" id="commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
            </div>
            <div class="select-menu-tabs">
              <ul>
                <li class="select-menu-tab">
                  <a href="#" data-tab-filter="branches" class="js-select-menu-tab">Branches</a>
                </li>
                <li class="select-menu-tab">
                  <a href="#" data-tab-filter="tags" class="js-select-menu-tab">Tags</a>
                </li>
              </ul>
            </div><!-- /.select-menu-tabs -->
          </div><!-- /.select-menu-filters -->

          <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket css-truncate" data-tab-filter="branches">

            <div data-filterable-for="commitish-filter-field" data-filterable-type="substring">

                <div class="select-menu-item js-navigation-item selected">
                  <span class="select-menu-item-icon octicon octicon-check"></span>
                  <a href="/djmijares/emacs-gradle-mode/blob/master/gradle-mode.el" class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target" data-name="master" rel="nofollow" title="master">master</a>
                </div> <!-- /.select-menu-item -->
            </div>

              <div class="select-menu-no-results">Nothing to show</div>
          </div> <!-- /.select-menu-list -->


          <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket css-truncate" data-tab-filter="tags">
            <div data-filterable-for="commitish-filter-field" data-filterable-type="substring">

            </div>

            <div class="select-menu-no-results">Nothing to show</div>

          </div> <!-- /.select-menu-list -->

        </div> <!-- /.select-menu-modal -->
      </div> <!-- /.select-menu-modal-holder -->
    </div> <!-- /.select-menu -->

  </div> <!-- /.scope -->

  <ul class="tabnav-tabs">
    <li><a href="/djmijares/emacs-gradle-mode" class="selected js-selected-navigation-item tabnav-tab" data-selected-links="repo_source /djmijares/emacs-gradle-mode">Files</a></li>
    <li><a href="/djmijares/emacs-gradle-mode/commits/master" class="js-selected-navigation-item tabnav-tab" data-selected-links="repo_commits /djmijares/emacs-gradle-mode/commits/master">Commits</a></li>
    <li><a href="/djmijares/emacs-gradle-mode/branches" class="js-selected-navigation-item tabnav-tab" data-selected-links="repo_branches /djmijares/emacs-gradle-mode/branches" rel="nofollow">Branches <span class="counter ">1</span></a></li>
  </ul>

</div>

  
  
  


            
          </div>
        </div><!-- /.repohead -->

        <div id="js-repo-pjax-container" class="container context-loader-container" data-pjax-container>
          


<!-- blob contrib key: blob_contributors:v21:9ed2e48d599f70bd60202c59517d6542 -->
<!-- blob contrib frag key: views10/v8/blob_contributors:v21:9ed2e48d599f70bd60202c59517d6542 -->


<div id="slider">
    <div class="frame-meta">

      <p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

        <div class="breadcrumb">
          <span class='bold'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/djmijares/emacs-gradle-mode" class="js-slide-to" data-branch="master" data-direction="back" itemscope="url"><span itemprop="title">emacs-gradle-mode</span></a></span></span><span class="separator"> / </span><strong class="final-path">gradle-mode.el</strong> <span class="js-zeroclipboard zeroclipboard-button" data-clipboard-text="gradle-mode.el" data-copied-hint="copied!" title="copy to clipboard"><span class="octicon octicon-clippy"></span></span>
        </div>

      <a href="/djmijares/emacs-gradle-mode/find/master" class="js-slide-to" data-hotkey="t" style="display:none">Show File Finder</a>


        
  <div class="commit file-history-tease">
    <img class="main-avatar" height="24" src="https://secure.gravatar.com/avatar/5a29afa8a365fd6333b01b5f8aa80f4a?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
    <span class="author"><a href="/djmijares" rel="author">djmijares</a></span>
    <time class="js-relative-date" datetime="2013-01-17T20:42:57-08:00" title="2013-01-17 20:42:57">January 17, 2013</time>
    <div class="commit-title">
        <a href="/djmijares/emacs-gradle-mode/commit/aaad1e5c65fd99948f95e984e66e162c9b1f8450" class="message">adding the base skeleton to gradle minor mode</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>1</strong> contributor</a></p>
      
    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2>Users on GitHub who have contributed to this file</h2>
      <ul class="facebox-user-list">
        <li>
          <img height="24" src="https://secure.gravatar.com/avatar/5a29afa8a365fd6333b01b5f8aa80f4a?s=140&amp;d=https://a248.e.akamai.net/assets.github.com%2Fimages%2Fgravatars%2Fgravatar-user-420.png" width="24" />
          <a href="/djmijares">djmijares</a>
        </li>
      </ul>
    </div>
  </div>


    </div><!-- ./.frame-meta -->

    <div class="frames">
      <div class="frame" data-permalink-url="/djmijares/emacs-gradle-mode/blob/aaad1e5c65fd99948f95e984e66e162c9b1f8450/gradle-mode.el" data-title="emacs-gradle-mode/gradle-mode.el at master · djmijares/emacs-gradle-mode · GitHub" data-type="blob">

        <div id="files" class="bubble">
          <div class="file">
            <div class="meta">
              <div class="info">
                <span class="icon"><b class="octicon octicon-file-text"></b></span>
                <span class="mode" title="File Mode">file</span>
                  <span>30 lines (19 sloc)</span>
                <span>0.715 kb</span>
              </div>
              <div class="actions">
                <div class="button-group">
                      <a class="minibutton js-entice" href=""
                         data-entice="You must be signed in and on a branch to make or propose changes">Edit</a>
                  <a href="/djmijares/emacs-gradle-mode/raw/master/gradle-mode.el" class="button minibutton " id="raw-url">Raw</a>
                    <a href="/djmijares/emacs-gradle-mode/blame/master/gradle-mode.el" class="button minibutton ">Blame</a>
                  <a href="/djmijares/emacs-gradle-mode/commits/master/gradle-mode.el" class="button minibutton " rel="nofollow">History</a>
                </div><!-- /.button-group -->
              </div><!-- /.actions -->

            </div>
                <div class="blob-wrapper data type-emacs-lisp js-blob-data">
      <table class="file-code file-diff">
        <tr class="file-code-line">
          <td class="blob-line-nums">
            <span id="L1" rel="#L1">1</span>
<span id="L2" rel="#L2">2</span>
<span id="L3" rel="#L3">3</span>
<span id="L4" rel="#L4">4</span>
<span id="L5" rel="#L5">5</span>
<span id="L6" rel="#L6">6</span>
<span id="L7" rel="#L7">7</span>
<span id="L8" rel="#L8">8</span>
<span id="L9" rel="#L9">9</span>
<span id="L10" rel="#L10">10</span>
<span id="L11" rel="#L11">11</span>
<span id="L12" rel="#L12">12</span>
<span id="L13" rel="#L13">13</span>
<span id="L14" rel="#L14">14</span>
<span id="L15" rel="#L15">15</span>
<span id="L16" rel="#L16">16</span>
<span id="L17" rel="#L17">17</span>
<span id="L18" rel="#L18">18</span>
<span id="L19" rel="#L19">19</span>
<span id="L20" rel="#L20">20</span>
<span id="L21" rel="#L21">21</span>
<span id="L22" rel="#L22">22</span>
<span id="L23" rel="#L23">23</span>
<span id="L24" rel="#L24">24</span>
<span id="L25" rel="#L25">25</span>
<span id="L26" rel="#L26">26</span>
<span id="L27" rel="#L27">27</span>
<span id="L28" rel="#L28">28</span>
<span id="L29" rel="#L29">29</span>

          </td>
          <td class="blob-line-code">
                  <div class="highlight"><pre><div class='line' id='LC1'><span class="c1">;;; gradle-mode.el --- Groovy and gradle-mode Emacs features</span></div><div class='line' id='LC2'><br/></div><div class='line' id='LC3'><span class="c1">;; This is free and unencumbered software released into the public domain.</span></div><div class='line' id='LC4'><br/></div><div class='line' id='LC5'><span class="c1">;;; Install:</span></div><div class='line' id='LC6'><br/></div><div class='line' id='LC7'><span class="c1">;; Put this file somewhere on your load path (like in .emacs.d), and</span></div><div class='line' id='LC8'><span class="c1">;; require it. That&#39;s it!</span></div><div class='line' id='LC9'><br/></div><div class='line' id='LC10'><span class="c1">;;    (require &#39;gradle-mode)</span></div><div class='line' id='LC11'><br/></div><div class='line' id='LC12'><span class="c1">;;; Code:</span></div><div class='line' id='LC13'><br/></div><div class='line' id='LC14'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">gradle-mode-map</span> <span class="p">(</span><span class="nf">make-sparse-keymap</span><span class="p">)</span></div><div class='line' id='LC15'>&nbsp;&nbsp;<span class="s">&quot;Keymap for the gradle minor mode.&quot;</span><span class="p">)</span></div><div class='line' id='LC16'><br/></div><div class='line' id='LC17'><span class="c1">;;;###autoload</span></div><div class='line' id='LC18'><span class="p">(</span><span class="nf">define-minor-mode</span> <span class="nv">gradle-mode</span></div><div class='line' id='LC19'>&nbsp;&nbsp;<span class="s">&quot;Extensions to groovy-mode for further support with standard Groovy tools.&quot;</span></div><div class='line' id='LC20'>&nbsp;&nbsp;<span class="nv">:lighter</span> <span class="s">&quot; gra&quot;</span></div><div class='line' id='LC21'>&nbsp;&nbsp;<span class="nv">:keymap</span> <span class="ss">&#39;gradle-mode-map</span><span class="p">)</span></div><div class='line' id='LC22'><br/></div><div class='line' id='LC23'><span class="c1">;; Enable the minor mode wherever groovy-mode is used.</span></div><div class='line' id='LC24'><span class="c1">;;;###autoload</span></div><div class='line' id='LC25'><span class="p">(</span><span class="nf">add-hook</span> <span class="ss">&#39;groovy-mode-hook</span> <span class="ss">&#39;gradle-mode</span><span class="p">)</span></div><div class='line' id='LC26'><br/></div><div class='line' id='LC27'><span class="p">(</span><span class="nf">provide</span> <span class="ss">&#39;gradle-mode</span><span class="p">)</span></div><div class='line' id='LC28'><br/></div><div class='line' id='LC29'><span class="c1">;; groovy-mode-plus.el ends here</span></div></pre></div>
          </td>
        </tr>
      </table>
  </div>

          </div>
        </div>

        <a href="#jump-to-line" rel="facebox" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
        <div id="jump-to-line" style="display:none">
          <h2>Jump to Line</h2>
          <form accept-charset="UTF-8" class="js-jump-to-line-form">
            <input class="textfield js-jump-to-line-field" type="text">
            <div class="full-button">
              <button type="submit" class="button">Go</button>
            </div>
          </form>
        </div>

      </div>
    </div>
</div>

<div id="js-frame-loading-template" class="frame frame-loading large-loading-area" style="display:none;">
  <img class="js-frame-loading-spinner" src="https://a248.e.akamai.net/assets.github.com/images/spinners/octocat-spinner-128.gif?1347543528" height="64" width="64">
</div>


        </div>
      </div>
      <div class="modal-backdrop"></div>
    </div>

      <div id="footer-push"></div><!-- hack for sticky footer -->
    </div><!-- end of wrapper - hack for sticky footer -->

      <!-- footer -->
      <div id="footer">
  <div class="container clearfix">

      <dl class="footer_nav">
        <dt>GitHub</dt>
        <dd><a href="/about">About us</a></dd>
        <dd><a href="/blog">Blog</a></dd>
        <dd><a href="/contact">Contact &amp; support</a></dd>
        <dd><a href="http://enterprise.github.com/">GitHub Enterprise</a></dd>
        <dd><a href="http://status.github.com/">Site status</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Applications</dt>
        <dd><a href="http://mac.github.com/">GitHub for Mac</a></dd>
        <dd><a href="http://windows.github.com/">GitHub for Windows</a></dd>
        <dd><a href="http://eclipse.github.com/">GitHub for Eclipse</a></dd>
        <dd><a href="http://mobile.github.com/">GitHub mobile apps</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Services</dt>
        <dd><a href="http://get.gaug.es/">Gauges: Web analytics</a></dd>
        <dd><a href="http://speakerdeck.com">Speaker Deck: Presentations</a></dd>
        <dd><a href="https://gist.github.com">Gist: Code snippets</a></dd>
        <dd><a href="http://jobs.github.com/">Job board</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>Documentation</dt>
        <dd><a href="http://help.github.com/">GitHub Help</a></dd>
        <dd><a href="http://developer.github.com/">Developer API</a></dd>
        <dd><a href="http://github.github.com/github-flavored-markdown/">GitHub Flavored Markdown</a></dd>
        <dd><a href="http://pages.github.com/">GitHub Pages</a></dd>
      </dl>

      <dl class="footer_nav">
        <dt>More</dt>
        <dd><a href="http://training.github.com/">Training</a></dd>
        <dd><a href="/edu">Students &amp; teachers</a></dd>
        <dd><a href="http://shop.github.com">The Shop</a></dd>
        <dd><a href="/plans">Plans &amp; pricing</a></dd>
        <dd><a href="http://octodex.github.com/">The Octodex</a></dd>
      </dl>

      <hr class="footer-divider">


    <p class="right">&copy; 2013 <span title="0.03744s from fe1.rs.github.com">GitHub</span>, Inc. All rights reserved.</p>
    <a class="left" href="/">
      <span class="mega-octicon octicon-mark-github"></span>
    </a>
    <ul id="legal">
        <li><a href="/site/terms">Terms of Service</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
    </ul>

  </div><!-- /.container -->

</div><!-- /.#footer -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
          <div class="suggester-container">
              <div class="suggester fullscreen-suggester js-navigation-container" id="fullscreen_suggester"
                 data-url="/djmijares/emacs-gradle-mode/suggestions/commit">
              </div>
          </div>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped leftwards" title="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped leftwards"
      title="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      Something went wrong with that request. Please try again.
      <a href="#" class="octicon octicon-remove-close ajax-error-dismiss"></a>
    </div>

    
    <span id='server_response_time' data-time='0.03785' data-host='fe1'></span>
    
  </body>
</html>

