




<!DOCTYPE html>
<html>
  <head prefix="og: http://ogp.me/ns# fb: http://ogp.me/ns/fb# object: http://ogp.me/ns/object# article: http://ogp.me/ns/article# profile: http://ogp.me/ns/profile#">
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>emacs-gradle-mode/gradle-mode.el at master · jacobono/emacs-gradle-mode · GitHub</title>
    <link rel="search" type="application/opensearchdescription+xml" href="/opensearch.xml" title="GitHub" />
    <link rel="fluid-icon" href="https://github.com/fluidicon.png" title="GitHub" />
    <link rel="apple-touch-icon" sizes="57x57" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="114x114" href="/apple-touch-icon-114.png" />
    <link rel="apple-touch-icon" sizes="72x72" href="/apple-touch-icon-144.png" />
    <link rel="apple-touch-icon" sizes="144x144" href="/apple-touch-icon-144.png" />
    <meta property="fb:app_id" content="1401488693436528"/>

      <meta content="@github" name="twitter:site" /><meta content="summary" name="twitter:card" /><meta content="jacobono/emacs-gradle-mode" name="twitter:title" /><meta content="emacs-gradle-mode - minor mode for emacs to run gradle from emacs and not have to go to a terminal" name="twitter:description" /><meta content="https://avatars.githubusercontent.com/u/1119640" name="twitter:image:src" />
<meta content="GitHub" property="og:site_name" /><meta content="object" property="og:type" /><meta content="https://avatars.githubusercontent.com/u/1119640" property="og:image" /><meta content="jacobono/emacs-gradle-mode" property="og:title" /><meta content="https://github.com/jacobono/emacs-gradle-mode" property="og:url" /><meta content="emacs-gradle-mode - minor mode for emacs to run gradle from emacs and not have to go to a terminal" property="og:description" />

    <meta name="hostname" content="github-fe118-cp1-prd.iad.github.net">
    <meta name="ruby" content="ruby 2.1.0p0-github-tcmalloc (87c9373a41) [x86_64-linux]">
    <link rel="assets" href="https://github.global.ssl.fastly.net/">
    <link rel="conduit-xhr" href="https://ghconduit.com:25035/">
    <link rel="xhr-socket" href="/_sockets" />


    <meta name="msapplication-TileImage" content="/windows-tile.png" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta name="selected-link" value="repo_source" data-pjax-transient />
    <meta content="collector.githubapp.com" name="octolytics-host" /><meta content="collector-cdn.github.com" name="octolytics-script-host" /><meta content="github" name="octolytics-app-id" /><meta content="7AD86F16:521F:8DBD7C:530DB50C" name="octolytics-dimension-request_id" />
    

    
    
    <link rel="icon" type="image/x-icon" href="/favicon.ico" />

    <meta content="authenticity_token" name="csrf-param" />
<meta content="gec5ZVpfGbAWdCO8OQJFblkEl5B1Zc4Bo1w5wTgSWKU=" name="csrf-token" />

    <link href="https://github.global.ssl.fastly.net/assets/github-99f0c420247f036251131234f2df1eaaf2ddb386.css" media="all" rel="stylesheet" type="text/css" />
    <link href="https://github.global.ssl.fastly.net/assets/github2-c1671115cdd7e4b44317ecd428238f073c37dbc0.css" media="all" rel="stylesheet" type="text/css" />
    
    


      <script crossorigin="anonymous" src="https://github.global.ssl.fastly.net/assets/frameworks-01ab94ef47d6293597922a1fab60e274e1d8f37e.js" type="text/javascript"></script>
      <script async="async" crossorigin="anonymous" src="https://github.global.ssl.fastly.net/assets/github-4080dfd1919155cf72a9b56c3bf746e67b898aa6.js" type="text/javascript"></script>
      
      <meta http-equiv="x-pjax-version" content="285f2c751e45e1751b37093c33d9affd">

        <link data-pjax-transient rel='permalink' href='/jacobono/emacs-gradle-mode/blob/e5cb7fb428d83637e2ddc471d30790d7e3c1f473/gradle-mode.el'>

  <meta name="description" content="emacs-gradle-mode - minor mode for emacs to run gradle from emacs and not have to go to a terminal" />

  <meta content="1119640" name="octolytics-dimension-user_id" /><meta content="jacobono" name="octolytics-dimension-user_login" /><meta content="7677282" name="octolytics-dimension-repository_id" /><meta content="jacobono/emacs-gradle-mode" name="octolytics-dimension-repository_nwo" /><meta content="true" name="octolytics-dimension-repository_public" /><meta content="false" name="octolytics-dimension-repository_is_fork" /><meta content="7677282" name="octolytics-dimension-repository_network_root_id" /><meta content="jacobono/emacs-gradle-mode" name="octolytics-dimension-repository_network_root_nwo" />
  <link href="https://github.com/jacobono/emacs-gradle-mode/commits/master.atom" rel="alternate" title="Recent Commits to emacs-gradle-mode:master" type="application/atom+xml" />

  </head>


  <body class="logged_out  env-production  vis-public page-blob tipsy-tooltips">
    <div class="wrapper">
      
      
      
      


      
      <div class="header header-logged-out">
  <div class="container clearfix">

    <a class="header-logo-wordmark" href="https://github.com/">
      <span class="mega-octicon octicon-logo-github"></span>
    </a>

    <div class="header-actions">
        <a class="button primary" href="/join">Sign up</a>
      <a class="button signin" href="/login?return_to=%2Fjacobono%2Femacs-gradle-mode%2Fblob%2Fmaster%2Fgradle-mode.el">Sign in</a>
    </div>

    <div class="command-bar js-command-bar  in-repository">

      <ul class="top-nav">
          <li class="explore"><a href="/explore">Explore</a></li>
        <li class="features"><a href="/features">Features</a></li>
          <li class="enterprise"><a href="https://enterprise.github.com/">Enterprise</a></li>
          <li class="blog"><a href="/blog">Blog</a></li>
      </ul>
        <form accept-charset="UTF-8" action="/search" class="command-bar-form" id="top_search_form" method="get">

<input type="text" data-hotkey="/ s" name="q" id="js-command-bar-field" placeholder="Search or type a command" tabindex="1" autocapitalize="off"
    
    
      data-repo="jacobono/emacs-gradle-mode"
      data-branch="master"
      data-sha="789a36ffe107f419385fb4651d1ffa65b468f01b"
  >

    <input type="hidden" name="nwo" value="jacobono/emacs-gradle-mode" />

    <div class="select-menu js-menu-container js-select-menu search-context-select-menu">
      <span class="minibutton select-menu-button js-menu-target" role="button" aria-haspopup="true">
        <span class="js-select-button">This repository</span>
      </span>

      <div class="select-menu-modal-holder js-menu-content js-navigation-container" aria-hidden="true">
        <div class="select-menu-modal">

          <div class="select-menu-item js-navigation-item js-this-repository-navigation-item selected">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" class="js-search-this-repository" name="search_target" value="repository" checked="checked" />
            <div class="select-menu-item-text js-select-button-text">This repository</div>
          </div> <!-- /.select-menu-item -->

          <div class="select-menu-item js-navigation-item js-all-repositories-navigation-item">
            <span class="select-menu-item-icon octicon octicon-check"></span>
            <input type="radio" name="search_target" value="global" />
            <div class="select-menu-item-text js-select-button-text">All repositories</div>
          </div> <!-- /.select-menu-item -->

        </div>
      </div>
    </div>

  <span class="help tooltipped tooltipped-s" aria-label="Show command bar help">
    <span class="octicon octicon-question"></span>
  </span>


  <input type="hidden" name="ref" value="cmdform">

</form>
    </div>

  </div>
</div>




          <div class="site" itemscope itemtype="http://schema.org/WebPage">
    
    <div class="pagehead repohead instapaper_ignore readability-menu">
      <div class="container">
        

<ul class="pagehead-actions">


  <li>
    <a href="/login?return_to=%2Fjacobono%2Femacs-gradle-mode"
    class="minibutton with-count js-toggler-target star-button tooltipped tooltipped-n"
    aria-label="You must be signed in to use this feature" rel="nofollow">
    <span class="octicon octicon-star"></span>Star
  </a>

    <a class="social-count js-social-count" href="/jacobono/emacs-gradle-mode/stargazers">
      3
    </a>

  </li>

    <li>
      <a href="/login?return_to=%2Fjacobono%2Femacs-gradle-mode"
        class="minibutton with-count js-toggler-target fork-button tooltipped tooltipped-n"
        aria-label="You must be signed in to fork a repository" rel="nofollow">
        <span class="octicon octicon-git-branch"></span>Fork
      </a>
      <a href="/jacobono/emacs-gradle-mode/network" class="social-count">
        7
      </a>
    </li>
</ul>

        <h1 itemscope itemtype="http://data-vocabulary.org/Breadcrumb" class="entry-title public">
          <span class="repo-label"><span>public</span></span>
          <span class="mega-octicon octicon-repo"></span>
          <span class="author">
            <a href="/jacobono" class="url fn" itemprop="url" rel="author"><span itemprop="title">jacobono</span></a>
          </span>
          <span class="repohead-name-divider">/</span>
          <strong><a href="/jacobono/emacs-gradle-mode" class="js-current-repository js-repo-home-link">emacs-gradle-mode</a></strong>

          <span class="page-context-loader">
            <img alt="Octocat-spinner-32" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
          </span>

        </h1>
      </div><!-- /.container -->
    </div><!-- /.repohead -->

    <div class="container">
      <div class="repository-with-sidebar repo-container new-discussion-timeline js-new-discussion-timeline  ">
        <div class="repository-sidebar clearfix">
            

<div class="sunken-menu vertical-right repo-nav js-repo-nav js-repository-container-pjax js-octicon-loaders">
  <div class="sunken-menu-contents">
    <ul class="sunken-menu-group">
      <li class="tooltipped tooltipped-w" aria-label="Code">
        <a href="/jacobono/emacs-gradle-mode" aria-label="Code" class="selected js-selected-navigation-item sunken-menu-item" data-gotokey="c" data-pjax="true" data-selected-links="repo_source repo_downloads repo_commits repo_tags repo_branches /jacobono/emacs-gradle-mode">
          <span class="octicon octicon-code"></span> <span class="full-word">Code</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

        <li class="tooltipped tooltipped-w" aria-label="Issues">
          <a href="/jacobono/emacs-gradle-mode/issues" aria-label="Issues" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-gotokey="i" data-selected-links="repo_issues /jacobono/emacs-gradle-mode/issues">
            <span class="octicon octicon-issue-opened"></span> <span class="full-word">Issues</span>
            <span class='counter'>0</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>        </li>

      <li class="tooltipped tooltipped-w" aria-label="Pull Requests">
        <a href="/jacobono/emacs-gradle-mode/pulls" aria-label="Pull Requests" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-gotokey="p" data-selected-links="repo_pulls /jacobono/emacs-gradle-mode/pulls">
            <span class="octicon octicon-git-pull-request"></span> <span class="full-word">Pull Requests</span>
            <span class='counter'>0</span>
            <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>


    </ul>
    <div class="sunken-menu-separator"></div>
    <ul class="sunken-menu-group">

      <li class="tooltipped tooltipped-w" aria-label="Pulse">
        <a href="/jacobono/emacs-gradle-mode/pulse" aria-label="Pulse" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="pulse /jacobono/emacs-gradle-mode/pulse">
          <span class="octicon octicon-pulse"></span> <span class="full-word">Pulse</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped tooltipped-w" aria-label="Graphs">
        <a href="/jacobono/emacs-gradle-mode/graphs" aria-label="Graphs" class="js-selected-navigation-item sunken-menu-item" data-pjax="true" data-selected-links="repo_graphs repo_contributors /jacobono/emacs-gradle-mode/graphs">
          <span class="octicon octicon-graph"></span> <span class="full-word">Graphs</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>

      <li class="tooltipped tooltipped-w" aria-label="Network">
        <a href="/jacobono/emacs-gradle-mode/network" aria-label="Network" class="js-selected-navigation-item sunken-menu-item js-disable-pjax" data-selected-links="repo_network /jacobono/emacs-gradle-mode/network">
          <span class="octicon octicon-git-branch"></span> <span class="full-word">Network</span>
          <img alt="Octocat-spinner-32" class="mini-loader" height="16" src="https://github.global.ssl.fastly.net/images/spinners/octocat-spinner-32.gif" width="16" />
</a>      </li>
    </ul>


  </div>
</div>

              <div class="only-with-full-nav">
                

  

<div class="clone-url open"
  data-protocol-type="http"
  data-url="/users/set_protocol?protocol_selector=http&amp;protocol_type=clone">
  <h3><strong>HTTPS</strong> clone URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/jacobono/emacs-gradle-mode.git" readonly="readonly">

    <span aria-label="copy to clipboard" class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/jacobono/emacs-gradle-mode.git" data-copied-hint="copied!"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>

  

<div class="clone-url "
  data-protocol-type="subversion"
  data-url="/users/set_protocol?protocol_selector=subversion&amp;protocol_type=clone">
  <h3><strong>Subversion</strong> checkout URL</h3>
  <div class="clone-url-box">
    <input type="text" class="clone js-url-field"
           value="https://github.com/jacobono/emacs-gradle-mode" readonly="readonly">

    <span aria-label="copy to clipboard" class="js-zeroclipboard url-box-clippy minibutton zeroclipboard-button" data-clipboard-text="https://github.com/jacobono/emacs-gradle-mode" data-copied-hint="copied!"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


<p class="clone-options">You can clone with
      <a href="#" class="js-clone-selector" data-protocol="http">HTTPS</a>
      or <a href="#" class="js-clone-selector" data-protocol="subversion">Subversion</a>.
  <span class="help tooltipped tooltipped-n" aria-label="Get help on which URL is right for you.">
    <a href="https://help.github.com/articles/which-remote-url-should-i-use">
    <span class="octicon octicon-question"></span>
    </a>
  </span>
</p>



                <a href="/jacobono/emacs-gradle-mode/archive/master.zip"
                   class="minibutton sidebar-button"
                   title="Download this repository as a zip file"
                   rel="nofollow">
                  <span class="octicon octicon-cloud-download"></span>
                  Download ZIP
                </a>
              </div>
        </div><!-- /.repository-sidebar -->

        <div id="js-repo-pjax-container" class="repository-content context-loader-container" data-pjax-container>
          


<!-- blob contrib key: blob_contributors:v21:e7935b7e50446872a389adb2ad374ac3 -->

<p title="This is a placeholder element" class="js-history-link-replace hidden"></p>

<a href="/jacobono/emacs-gradle-mode/find/master" data-pjax data-hotkey="t" class="js-show-file-finder" style="display:none">Show File Finder</a>

<div class="file-navigation">
  

<div class="select-menu js-menu-container js-select-menu" >
  <span class="minibutton select-menu-button js-menu-target" data-hotkey="w"
    data-master-branch="master"
    data-ref="master"
    role="button" aria-label="Switch branches or tags" tabindex="0" aria-haspopup="true">
    <span class="octicon octicon-git-branch"></span>
    <i>branch:</i>
    <span class="js-select-button">master</span>
  </span>

  <div class="select-menu-modal-holder js-menu-content js-navigation-container" data-pjax aria-hidden="true">

    <div class="select-menu-modal">
      <div class="select-menu-header">
        <span class="select-menu-title">Switch branches/tags</span>
        <span class="octicon octicon-remove-close js-menu-close"></span>
      </div> <!-- /.select-menu-header -->

      <div class="select-menu-filters">
        <div class="select-menu-text-filter">
          <input type="text" aria-label="Filter branches/tags" id="context-commitish-filter-field" class="js-filterable-field js-navigation-enable" placeholder="Filter branches/tags">
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

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="branches">

        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


            <div class="select-menu-item js-navigation-item selected">
              <span class="select-menu-item-icon octicon octicon-check"></span>
              <a href="/jacobono/emacs-gradle-mode/blob/master/gradle-mode.el"
                 data-name="master"
                 data-skip-pjax="true"
                 rel="nofollow"
                 class="js-navigation-open select-menu-item-text js-select-button-text css-truncate-target"
                 title="master">master</a>
            </div> <!-- /.select-menu-item -->
        </div>

          <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

      <div class="select-menu-list select-menu-tab-bucket js-select-menu-tab-bucket" data-tab-filter="tags">
        <div data-filterable-for="context-commitish-filter-field" data-filterable-type="substring">


        </div>

        <div class="select-menu-no-results">Nothing to show</div>
      </div> <!-- /.select-menu-list -->

    </div> <!-- /.select-menu-modal -->
  </div> <!-- /.select-menu-modal-holder -->
</div> <!-- /.select-menu -->

  <div class="breadcrumb">
    <span class='repo-root js-repo-root'><span itemscope="" itemtype="http://data-vocabulary.org/Breadcrumb"><a href="/jacobono/emacs-gradle-mode" data-branch="master" data-direction="back" data-pjax="true" itemscope="url"><span itemprop="title">emacs-gradle-mode</span></a></span></span><span class="separator"> / </span><strong class="final-path">gradle-mode.el</strong> <span aria-label="copy to clipboard" class="js-zeroclipboard minibutton zeroclipboard-button" data-clipboard-text="gradle-mode.el" data-copied-hint="copied!"><span class="octicon octicon-clippy"></span></span>
  </div>
</div>


  <div class="commit file-history-tease">
    <img alt="Flávio Alves granato" class="main-avatar js-avatar" data-user="328252" height="24" src="https://avatars.githubusercontent.com/u/328252" width="24" />
    <span class="author"><a href="/flaviogranato" rel="author">flaviogranato</a></span>
    <time class="js-relative-date" data-title-format="YYYY-MM-DD HH:mm:ss" datetime="2013-09-03T19:04:36-07:00" title="2013-09-03 19:04:36">September 03, 2013</time>
    <div class="commit-title">
        <a href="/jacobono/emacs-gradle-mode/commit/7460c95a61564aa1528f026bf85dedb0967a282b" class="message" data-pjax="true" title="Kill compilation windows on recompile project">Kill compilation windows on recompile project</a>
    </div>

    <div class="participation">
      <p class="quickstat"><a href="#blob_contributors_box" rel="facebox"><strong>2</strong> contributors</a></p>
          <a class="avatar tooltipped tooltipped-s" aria-label="jacobono" href="/jacobono/emacs-gradle-mode/commits/master/gradle-mode.el?author=jacobono"><img alt="jacobono" class=" js-avatar" data-user="1119640" height="20" src="https://avatars.githubusercontent.com/u/1119640" width="20" /></a>
    <a class="avatar tooltipped tooltipped-s" aria-label="flaviogranato" href="/jacobono/emacs-gradle-mode/commits/master/gradle-mode.el?author=flaviogranato"><img alt="Flávio Alves granato" class=" js-avatar" data-user="328252" height="20" src="https://avatars.githubusercontent.com/u/328252" width="20" /></a>


    </div>
    <div id="blob_contributors_box" style="display:none">
      <h2 class="facebox-header">Users who have contributed to this file</h2>
      <ul class="facebox-user-list">
          <li class="facebox-user-list-item">
            <img alt="jacobono" class=" js-avatar" data-user="1119640" height="24" src="https://avatars.githubusercontent.com/u/1119640" width="24" />
            <a href="/jacobono">jacobono</a>
          </li>
          <li class="facebox-user-list-item">
            <img alt="Flávio Alves granato" class=" js-avatar" data-user="328252" height="24" src="https://avatars.githubusercontent.com/u/328252" width="24" />
            <a href="/flaviogranato">flaviogranato</a>
          </li>
      </ul>
    </div>
  </div>

<div class="file-box">
  <div class="file">
    <div class="meta clearfix">
      <div class="info file-name">
        <span class="icon"><b class="octicon octicon-file-text"></b></span>
        <span class="mode" title="File Mode">file</span>
        <span class="meta-divider"></span>
          <span>79 lines (61 sloc)</span>
          <span class="meta-divider"></span>
        <span>2.848 kb</span>
      </div>
      <div class="actions">
        <div class="button-group">
              <a class="minibutton disabled tooltipped tooltipped-w" href="#"
                 aria-label="You must be signed in to make or propose changes">Edit</a>
          <a href="/jacobono/emacs-gradle-mode/raw/master/gradle-mode.el" class="button minibutton " id="raw-url">Raw</a>
            <a href="/jacobono/emacs-gradle-mode/blame/master/gradle-mode.el" class="button minibutton js-update-url-with-hash">Blame</a>
          <a href="/jacobono/emacs-gradle-mode/commits/master/gradle-mode.el" class="button minibutton " rel="nofollow">History</a>
        </div><!-- /.button-group -->
          <a class="minibutton danger disabled empty-icon tooltipped tooltipped-w" href="#"
             aria-label="You must be signed in to make or propose changes">
          Delete
        </a>
      </div><!-- /.actions -->
    </div>
        <div class="blob-wrapper data type-emacs-lisp js-blob-data">
        <table class="file-code file-diff tab-size-8">
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
<span id="L30" rel="#L30">30</span>
<span id="L31" rel="#L31">31</span>
<span id="L32" rel="#L32">32</span>
<span id="L33" rel="#L33">33</span>
<span id="L34" rel="#L34">34</span>
<span id="L35" rel="#L35">35</span>
<span id="L36" rel="#L36">36</span>
<span id="L37" rel="#L37">37</span>
<span id="L38" rel="#L38">38</span>
<span id="L39" rel="#L39">39</span>
<span id="L40" rel="#L40">40</span>
<span id="L41" rel="#L41">41</span>
<span id="L42" rel="#L42">42</span>
<span id="L43" rel="#L43">43</span>
<span id="L44" rel="#L44">44</span>
<span id="L45" rel="#L45">45</span>
<span id="L46" rel="#L46">46</span>
<span id="L47" rel="#L47">47</span>
<span id="L48" rel="#L48">48</span>
<span id="L49" rel="#L49">49</span>
<span id="L50" rel="#L50">50</span>
<span id="L51" rel="#L51">51</span>
<span id="L52" rel="#L52">52</span>
<span id="L53" rel="#L53">53</span>
<span id="L54" rel="#L54">54</span>
<span id="L55" rel="#L55">55</span>
<span id="L56" rel="#L56">56</span>
<span id="L57" rel="#L57">57</span>
<span id="L58" rel="#L58">58</span>
<span id="L59" rel="#L59">59</span>
<span id="L60" rel="#L60">60</span>
<span id="L61" rel="#L61">61</span>
<span id="L62" rel="#L62">62</span>
<span id="L63" rel="#L63">63</span>
<span id="L64" rel="#L64">64</span>
<span id="L65" rel="#L65">65</span>
<span id="L66" rel="#L66">66</span>
<span id="L67" rel="#L67">67</span>
<span id="L68" rel="#L68">68</span>
<span id="L69" rel="#L69">69</span>
<span id="L70" rel="#L70">70</span>
<span id="L71" rel="#L71">71</span>
<span id="L72" rel="#L72">72</span>
<span id="L73" rel="#L73">73</span>
<span id="L74" rel="#L74">74</span>
<span id="L75" rel="#L75">75</span>
<span id="L76" rel="#L76">76</span>
<span id="L77" rel="#L77">77</span>
<span id="L78" rel="#L78">78</span>

            </td>
            <td class="blob-line-code"><div class="code-body highlight"><pre><div class='line' id='LC1'><span class="c1">;;; gradle-mode.el --- gradle integration with Emacs</span></div><div class='line' id='LC2'><br/></div><div class='line' id='LC3'><span class="c1">;; This is free and unencumbered software released into the public domain.</span></div><div class='line' id='LC4'><br/></div><div class='line' id='LC5'><span class="c1">;;; Install:</span></div><div class='line' id='LC6'><br/></div><div class='line' id='LC7'><span class="c1">;; Put this file somewhere on your load path (like in .emacs.d), and</span></div><div class='line' id='LC8'><span class="c1">;; require it. That&#39;s it!</span></div><div class='line' id='LC9'><br/></div><div class='line' id='LC10'><span class="c1">;;    (require &#39;gradle-mode)</span></div><div class='line' id='LC11'><br/></div><div class='line' id='LC12'><span class="c1">;;; Code:</span></div><div class='line' id='LC13'><span class="p">(</span><span class="nf">require</span> <span class="ss">&#39;compile</span><span class="p">)</span></div><div class='line' id='LC14'><br/></div><div class='line' id='LC15'><span class="p">(</span><span class="nf">defun</span> <span class="nv">gradle-executable-path</span> <span class="p">()</span></div><div class='line' id='LC16'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">executable-find</span> <span class="s">&quot;gradle&quot;</span><span class="p">))</span></div><div class='line' id='LC17'><br/></div><div class='line' id='LC18'><span class="p">(</span><span class="nf">defun</span> <span class="nv">gradle-input-tasks</span> <span class="p">()</span></div><div class='line' id='LC19'>&nbsp;&nbsp;<span class="p">(</span><span class="nb">list </span><span class="p">(</span><span class="nf">read-string</span> <span class="s">&quot;Enter your gradle tasks to execute (and/or) options: &quot;</span><span class="p">)))</span></div><div class='line' id='LC20'><br/></div><div class='line' id='LC21'><span class="c1">;; Get&#39;s the *potential* gradle file to run off **IF** there is the naming convention in a multi project build</span></div><div class='line' id='LC22'><span class="c1">;; of the folder/dirname -- ${foldername}.gradle -- so you don&#39;t have</span></div><div class='line' id='LC23'><span class="c1">;; as many &quot;build.gradle&quot; in a multi project build</span></div><div class='line' id='LC24'><span class="p">(</span><span class="nf">defun</span> <span class="nv">gradle-get-directory-gradle-file</span> <span class="p">()</span></div><div class='line' id='LC25'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">setq</span> <span class="nv">dirname</span> <span class="p">(</span><span class="nf">file-name-nondirectory</span> <span class="p">(</span><span class="nf">directory-file-name</span> <span class="nv">default-directory</span><span class="p">)))</span></div><div class='line' id='LC26'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">concat</span> <span class="nv">dirname</span> <span class="s">&quot;.gradle&quot;</span><span class="p">))</span></div><div class='line' id='LC27'><br/></div><div class='line' id='LC28'><span class="c1">;; looks for the directory with either a build.gradle or a {foldername}.gradle and uses that directory to run the gradle executable under</span></div><div class='line' id='LC29'><span class="p">(</span><span class="nf">defun</span> <span class="nv">gradle-find-project-dir</span> <span class="p">()</span></div><div class='line' id='LC30'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">with-temp-buffer</span></div><div class='line' id='LC31'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">while</span> <span class="p">(</span><span class="k">and </span><span class="p">(</span><span class="nf">not</span></div><div class='line' id='LC32'>		 <span class="p">(</span><span class="k">or </span><span class="p">(</span><span class="nf">file-exists-p</span> <span class="s">&quot;build.gradle&quot;</span><span class="p">)</span> <span class="p">(</span><span class="nf">file-exists-p</span> <span class="p">(</span><span class="nf">gradle-get-directory-gradle-file</span><span class="p">))))</span></div><div class='line' id='LC33'>		<span class="p">(</span><span class="nb">not </span><span class="p">(</span><span class="nf">equal</span> <span class="s">&quot;/&quot;</span> <span class="nv">default-directory</span><span class="p">)))</span></div><div class='line' id='LC34'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">cd</span> <span class="s">&quot;..&quot;</span><span class="p">))</span></div><div class='line' id='LC35'>&nbsp;&nbsp;<span class="nv">default-directory</span><span class="p">))</span></div><div class='line' id='LC36'><br/></div><div class='line' id='LC37'><span class="p">(</span><span class="nf">defun</span> <span class="nv">gradle-execute-interactive</span> <span class="p">(</span><span class="nf">tasks</span><span class="p">)</span></div><div class='line' id='LC38'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span> <span class="p">(</span><span class="nb">list </span><span class="p">(</span><span class="nf">gradle-input-tasks</span><span class="p">)))</span></div><div class='line' id='LC39'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">gradle-execute</span> <span class="nv">tasks</span><span class="p">))</span></div><div class='line' id='LC40'><br/></div><div class='line' id='LC41'><span class="p">(</span><span class="nf">defun</span> <span class="nv">gradle-execute-daemon-interactive</span> <span class="p">(</span><span class="nf">tasks</span><span class="p">)</span></div><div class='line' id='LC42'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">interactive</span> <span class="p">(</span><span class="nb">list </span><span class="p">(</span><span class="nf">gradle-input-tasks</span><span class="p">)))</span></div><div class='line' id='LC43'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">gradle-execute</span> <span class="p">(</span><span class="nb">append </span><span class="nv">tasks</span> <span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;--daemon&quot;</span><span class="p">))))</span></div><div class='line' id='LC44'><br/></div><div class='line' id='LC45'><span class="p">(</span><span class="nf">defun</span> <span class="nv">gradle-execute</span> <span class="p">(</span><span class="nf">tasks</span><span class="p">)</span></div><div class='line' id='LC46'>&nbsp;&nbsp;<span class="p">(</span><span class="k">let </span><span class="p">((</span><span class="nf">default-directory</span> <span class="p">(</span><span class="nf">gradle-find-project-dir</span><span class="p">)))</span></div><div class='line' id='LC47'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">progn</span></div><div class='line' id='LC48'>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="k">if </span><span class="p">(</span><span class="nf">get-buffer</span> <span class="s">&quot;*compilation*&quot;</span><span class="p">)</span></div><div class='line' id='LC49'>	  <span class="p">(</span><span class="nf">progn</span></div><div class='line' id='LC50'>	    <span class="p">(</span><span class="nf">delete-windows-on</span> <span class="p">(</span><span class="nf">get-buffer</span> <span class="s">&quot;*compilation*&quot;</span><span class="p">))</span></div><div class='line' id='LC51'>	    <span class="p">(</span><span class="nf">kill-buffer</span> <span class="s">&quot;*compilation*&quot;</span><span class="p">))))</span></div><div class='line' id='LC52'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">compile</span> <span class="p">(</span><span class="nf">gradle-make-command</span> <span class="nv">tasks</span><span class="p">))))</span></div><div class='line' id='LC53'><br/></div><div class='line' id='LC54'><span class="p">(</span><span class="nf">defun</span> <span class="nv">gradle-make-command</span> <span class="p">(</span><span class="nf">tasks</span><span class="p">)</span></div><div class='line' id='LC55'>&nbsp;&nbsp;<span class="p">(</span><span class="nf">concat</span> <span class="p">(</span><span class="nf">gradle-executable-path</span><span class="p">)</span></div><div class='line' id='LC56'>	  <span class="p">(</span><span class="nf">when</span> <span class="nv">tasks</span> <span class="p">(</span><span class="nf">mapconcat</span> <span class="ss">&#39;identity</span> <span class="p">(</span><span class="nb">cons </span><span class="s">&quot;&quot;</span> <span class="nv">tasks</span><span class="p">)</span> <span class="s">&quot; &quot;</span><span class="p">))))</span></div><div class='line' id='LC57'><br/></div><div class='line' id='LC58'><span class="p">(</span><span class="nf">defvar</span> <span class="nv">gradle-mode-map</span></div><div class='line' id='LC59'>&nbsp;&nbsp;<span class="p">(</span><span class="k">let </span><span class="p">((</span><span class="nb">map </span><span class="p">(</span><span class="nf">make-sparse-keymap</span><span class="p">)))</span></div><div class='line' id='LC60'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">define-key</span> <span class="nv">map</span> <span class="p">(</span><span class="nf">kbd</span> <span class="s">&quot;C-c C-g b&quot;</span><span class="p">)</span> <span class="p">(</span><span class="k">lambda </span><span class="p">()</span> <span class="p">(</span><span class="nf">interactive</span><span class="p">)</span> <span class="p">(</span><span class="nf">gradle-execute</span> <span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;build&quot;</span><span class="p">))))</span></div><div class='line' id='LC61'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">define-key</span> <span class="nv">map</span> <span class="p">(</span><span class="nf">kbd</span> <span class="s">&quot;C-c C-g t&quot;</span><span class="p">)</span> <span class="p">(</span><span class="k">lambda </span><span class="p">()</span> <span class="p">(</span><span class="nf">interactive</span><span class="p">)</span> <span class="p">(</span><span class="nf">gradle-execute</span> <span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;test&quot;</span><span class="p">))))</span></div><div class='line' id='LC62'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">define-key</span> <span class="nv">map</span> <span class="p">(</span><span class="nf">kbd</span> <span class="s">&quot;C-c C-g C-d b&quot;</span><span class="p">)</span> <span class="p">(</span><span class="k">lambda </span><span class="p">()</span> <span class="p">(</span><span class="nf">interactive</span><span class="p">)</span> <span class="p">(</span><span class="nf">gradle-execute</span> <span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;build&quot;</span> <span class="s">&quot;--daemon&quot;</span><span class="p">))))</span></div><div class='line' id='LC63'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">define-key</span> <span class="nv">map</span> <span class="p">(</span><span class="nf">kbd</span> <span class="s">&quot;C-c C-g C-d t&quot;</span><span class="p">)</span> <span class="p">(</span><span class="k">lambda </span><span class="p">()</span> <span class="p">(</span><span class="nf">interactive</span><span class="p">)</span> <span class="p">(</span><span class="nf">gradle-execute</span> <span class="o">&#39;</span><span class="p">(</span><span class="s">&quot;test&quot;</span>  <span class="s">&quot;--daemon&quot;</span><span class="p">))))</span></div><div class='line' id='LC64'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">define-key</span> <span class="nv">map</span> <span class="p">(</span><span class="nf">kbd</span> <span class="s">&quot;C-c C-g d&quot;</span><span class="p">)</span> <span class="ss">&#39;gradle-execute-daemon-interactive</span><span class="p">)</span></div><div class='line' id='LC65'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="p">(</span><span class="nf">define-key</span> <span class="nv">map</span> <span class="p">(</span><span class="nf">kbd</span> <span class="s">&quot;C-c C-g r&quot;</span><span class="p">)</span> <span class="ss">&#39;gradle-execute-interactive</span><span class="p">)</span></div><div class='line' id='LC66'>&nbsp;&nbsp;&nbsp;&nbsp;<span class="nv">map</span><span class="p">)</span></div><div class='line' id='LC67'>&nbsp;&nbsp;<span class="s">&quot;Keymap for the gradle minor mode.&quot;</span><span class="p">)</span></div><div class='line' id='LC68'><br/></div><div class='line' id='LC69'><span class="c1">;;;###autoload</span></div><div class='line' id='LC70'><span class="p">(</span><span class="nf">define-minor-mode</span> <span class="nv">gradle-mode</span></div><div class='line' id='LC71'>&nbsp;&nbsp;<span class="s">&quot;Gradle Mode -- run gradle from any buffer, will scan up for nearest gradle build file in a directory and run the command.&quot;</span></div><div class='line' id='LC72'>&nbsp;&nbsp;<span class="nv">:lighter</span> <span class="s">&quot; gra&quot;</span></div><div class='line' id='LC73'>&nbsp;&nbsp;<span class="nv">:keymap</span> <span class="ss">&#39;gradle-mode-map</span></div><div class='line' id='LC74'>&nbsp;&nbsp;<span class="nv">:global</span> <span class="nv">t</span><span class="p">)</span></div><div class='line' id='LC75'><br/></div><div class='line' id='LC76'><span class="p">(</span><span class="nf">provide</span> <span class="ss">&#39;gradle-mode</span><span class="p">)</span></div><div class='line' id='LC77'><br/></div><div class='line' id='LC78'><span class="c1">;; gradle-mode.el ends here</span></div></pre></div></td>
          </tr>
        </table>
  </div>

  </div>
</div>

<a href="#jump-to-line" rel="facebox[.linejump]" data-hotkey="l" class="js-jump-to-line" style="display:none">Jump to Line</a>
<div id="jump-to-line" style="display:none">
  <form accept-charset="UTF-8" class="js-jump-to-line-form">
    <input class="linejump-input js-jump-to-line-field" type="text" placeholder="Jump to line&hellip;" autofocus>
    <button type="submit" class="button">Go</button>
  </form>
</div>

        </div>

      </div><!-- /.repo-container -->
      <div class="modal-backdrop"></div>
    </div><!-- /.container -->
  </div><!-- /.site -->


    </div><!-- /.wrapper -->

      <div class="container">
  <div class="site-footer">
    <ul class="site-footer-links right">
      <li><a href="https://status.github.com/">Status</a></li>
      <li><a href="http://developer.github.com">API</a></li>
      <li><a href="http://training.github.com">Training</a></li>
      <li><a href="http://shop.github.com">Shop</a></li>
      <li><a href="/blog">Blog</a></li>
      <li><a href="/about">About</a></li>

    </ul>

    <a href="/">
      <span class="mega-octicon octicon-mark-github" title="GitHub"></span>
    </a>

    <ul class="site-footer-links">
      <li>&copy; 2014 <span title="0.03949s from github-fe118-cp1-prd.iad.github.net">GitHub</span>, Inc.</li>
        <li><a href="/site/terms">Terms</a></li>
        <li><a href="/site/privacy">Privacy</a></li>
        <li><a href="/security">Security</a></li>
        <li><a href="/contact">Contact</a></li>
    </ul>
  </div><!-- /.site-footer -->
</div><!-- /.container -->


    <div class="fullscreen-overlay js-fullscreen-overlay" id="fullscreen_overlay">
  <div class="fullscreen-container js-fullscreen-container">
    <div class="textarea-wrap">
      <textarea name="fullscreen-contents" id="fullscreen-contents" class="js-fullscreen-contents" placeholder="" data-suggester="fullscreen_suggester"></textarea>
    </div>
  </div>
  <div class="fullscreen-sidebar">
    <a href="#" class="exit-fullscreen js-exit-fullscreen tooltipped tooltipped-w" aria-label="Exit Zen Mode">
      <span class="mega-octicon octicon-screen-normal"></span>
    </a>
    <a href="#" class="theme-switcher js-theme-switcher tooltipped tooltipped-w"
      aria-label="Switch themes">
      <span class="octicon octicon-color-mode"></span>
    </a>
  </div>
</div>



    <div id="ajax-error-message" class="flash flash-error">
      <span class="octicon octicon-alert"></span>
      <a href="#" class="octicon octicon-remove-close close js-ajax-error-dismiss"></a>
      Something went wrong with that request. Please try again.
    </div>

  </body>
</html>

