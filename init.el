;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     yaml
     markdown
     (javascript
      :variables
      ;; javascript-disable-tern-port-files true ;; enable tern
      ;; In windows for locating and launch tern server.
      ;; tern-command '("node" "C:\\Users\\duo\\AppData\\Roaming\\npm\\node_modules\\tern\\bin\\tern")
      )
     html
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; helm
     ivy
     (auto-completion :variables
                      auto-completion-complete-with-key-sequence "kj"
                      auto-completion-enable-sort-by-usage t
                      auto-completion-enable-help-tooltip nil
                      auto-completion-enable-snippets-in-popup t
                      auto-completion-private-snippets-directory "~/.spacemacs.d/snippets")
     better-defaults
     emacs-lisp
     (chinese
      :packages youdao-dictionary
      :variables chinese-enable-youdao-dict t
      )
     ;;(themes-megapack)
     graphviz
     git
     markdown
     org
     deft
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(vue-mode
                                      lispy
                                      xref-js2)
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(chinese-pyim
                                    chinese-wbim
                                    cute-jumper/fcitx.el
                                    coldnew/pangu-spacing
                                    org-bullets
                                    evil-unimpaired ;; melpa connect timeout
                                    tern
                                    hl-todo
                                    org-projectile ;; Disable org-projectile package for some unfix bugs
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https nil
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(sanityinc-solarized-dark
                         spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font (if (eq system-type 'windows-nt)
                                 '("Inziu Iosevka SC"
                                   :size 13
                                   :weight normal
                                   :width normal
                                   :powerline-scale 1)
                               '("Source Code Pro"
                                 :size 13
                                 :weight normal
                                 :width normal
                                 :powerline-scale 1))
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("pt" "ag" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; debug when error occur
  ;; (setq debug-on-error t)

  ;; encode
  (if (eq system-type 'windows-nt)
      (progn
        ;; encode settings
        (setq coding-system-for-write 'utf-8)
        (set-keyboard-coding-system 'utf-8)
        ;; (set-clipboard-coding-system 'utf-8)
        (set-terminal-coding-system 'utf-8)
        ;; (set-buffer-file-coding-system 'utf-8)
        (set-default-coding-systems 'utf-8)
        ;; (unless (eq system-type 'windows-nt) (set-selection-coding-system 'utf-8))
        ;;(set-selection-coding-system 'utf-8)
        (modify-coding-system-alist 'process "*" 'utf-8)
        (setq default-process-coding-system '(utf-8 . utf-8))
        (setq default-buffer-file-coding-system 'utf-8)
        (setq-default pathname-coding-system 'utf-8)
        (set-file-name-coding-system 'utf-8)
        ;; (prefer-coding-system 'utf-8-dos)
        (prefer-coding-system 'utf-8-unix)

        ;; Chinese mono font
        ;; (spacemacs//set-monospaced-font "Consolas" "Yahei Mono" 14 14)
        ;; Use 1:2 strict fonts like:
        ;; 1. Ubuntu Mono (https://design.ubuntu.com/font/)
        ;; 2. M+ 1m (https://mplus-fonts.osdn.jp/)
        ;; 3. 文泉驿
        ;; (spacemacs//set-monospaced-font "Ubuntu Mono" "WenQuanYi Micro Hei Mono" 14 14)
        ;; (spacemacs//set-monospaced-font "Ubuntu Mono" "Noto Sans Mono CJK SC Regular" 14 14)
        ;; (spacemacs//set-monospaced-font "Ubuntu Mono" "Inziu Iosevka TC" 14 14)
        (spacemacs//set-monospaced-font "Inziu Iosevka SC" "Inziu Iosevka SC" 13 13)
        (setq tramp-ssh-controlmaster-options
              "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no"))
    (progn
      ;; encode settings
      (set-keyboard-coding-system 'utf-8)
      (set-clipboard-coding-system 'utf-8)
      (set-terminal-coding-system 'utf-8)
      (set-buffer-file-coding-system 'utf-8)
      (set-default-coding-systems 'utf-8)
      (set-selection-coding-system 'utf-8)
      (modify-coding-system-alist 'process "*" 'utf-8)
      (setq default-process-coding-system '(utf-8 . utf-8))
      (setq default-buffer-file-coding-system 'utf-8)
      (setq-default pathname-coding-system 'utf-8)
      (set-file-name-coding-system 'utf-8)
      (prefer-coding-system 'utf-8)
      ;; Chinese mono font (Just in Emacs with Graphic)
      (if (display-graphic-p)
          (spacemacs//set-monospaced-font "Source Code Pro" "Yahei Mono" 13 13))))

  ;; Smooth Scrolling
  (setq scroll-margin 5
        scroll-conservatively 9999
        scroll-step 1)

  ;; Never "Keep current list of tags tables also"
  (setq tags-add-tables nil)

  ;;解决org表格里面中英文对齐的问题
  ;; (when (configuration-layer/layer-usedp 'chinese)
  ;;   (when (and (spacemacs/system-is-mac) window-system)
  ;;     (spacemacs//set-monospaced-font "Source Code Pro" "Hiragino Sans GB" 14 16)))

  (set-default 'truncate-lines t)

  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")

  (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

  ;; indent to 2 spaces
  (setq-default js2-basic-offset 2) ;; js indent
  (setq-default js-indent-level 2)  ;; json indent
  (setq css-indent-offset 2)        ;; css-mode

  ;; (define-key js2-mode-map (kbd "M-.") nil)
  ;; (add-hook 'js2-mode-hook (lambda ()
  ;; (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

  (defun my-web-mode-hook ()
    "Hooks for web-mode."
    ;; web-mode indent
    (setq web-mode-markup-indent-offset 2)
    (setq web-mode-css-indent-offset 2)
    (setq web-mode-code-indent-offset 2)
    (setq web-mode-attr-indent-offset 2)
    (setq web-mode-style-padding 0)
    (setq web-mode-script-padding 0)
    (setq web-mode-block-padding 0)
    (setq web-mode-enable-current-element-highlight t)
    (setq web-mode-enable-current-column-highlight t)
    (setq web-mode-enable-css-colorization t)

    ;; web-mode auto-complete
    (setq web-mode-ac-sources-alist
          '(("css" . (ac-source-css-property))
            ("html" . (ac-source-words-in-buffer ac-source-abbrev)))))
  (add-hook 'web-mode-hook 'my-web-mode-hook)

  (add-to-list 'auto-mode-alist '("/.*\\.vue\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("/.*\\.styl\\'" . css-mode))

  (defun my-js2-mode-hook ()
    "Hooks for js2-mode."
    (setq js2-mode-show-parse-errors nil)
    (setq js2-mode-show-strict-warnings nil)
    (setq js2-strict-missing-semi-warning nil)
    (setq js2-missing-semi-one-line-override t)
    (setq js2-strict-inconsistent-return-warning nil)
    (setq js2-strict-cond-assign-warning nil)
    (setq js2-strict-var-redeclaration-warning nil)
    (setq js2-strict-var-hides-function-arg-warning nil)
    (setq js-switch-indent-offset 2))

  (add-hook 'js2-mode-hook 'my-js2-mode-hook)

  ;; emmet-mode
  (add-hook 'emmet-mode-hook (lambda () (setq emmet-indentation 2)))

  (defun my-org-mode-hook ()
   "Hooks for org-mode."
   (define-key org-mode-map [M-return] 'org-meta-return))
  (add-hook 'org-mode-hook 'my-org-mode-hook)
  ;; (define-key org-mode-map [M-return] 'org-meta-return)


  ;; Make org-mode friendly for Chinese chars.
  (setq org-emphasis-regexp-components
        '(
          "- “：，。、  \t('\"{"        ;pre
          "- ”：，。、 \t.,:!?;'\")}\\" ;post
          " \t\r\n,\"'"                 ;border *forbidden*
          "."                           ;body-regexp
          1                             ; newline
          ))

  ;; Register
  (global-set-key (kbd "<f2> m") 'point-to-register)
  (global-set-key (kbd "<f2> j") 'jump-to-register)

  ;; org startup indented on org file by default
  (setq org-startup-indented t)
  ;; hide log & clock info as default
  (setq org-log-into-drawer t)
  ;; allows changing todo states with S-left and S-right skipping all of the normal processing when entering or leaving a todo state. This cycles through the todo states but skips setting timestamps and entering notes which is very convenient when all you want to do is fix up the status of an entry.
  (setq org-treat-S-cursor-todo-selection-as-state-change nil)

  ;; Hiding markup elements in org-mode
  ;; (setq org-hide-emphasis-markers nil)
  ;; (setq org-emphasis-alist
  ;;       (cons '("=" '(:foreground "gray"))
  ;;             (delete* "=" org-emphasis-alist :key 'car :test 'equal)))

  ;; org-mode keybindings
  (global-set-key (kbd "C-c l") 'org-store-link)
  (global-set-key (kbd "C-c a") 'org-agenda)
  (global-set-key (kbd "<f12>") 'org-agenda)
  (global-set-key (kbd "C-c c") 'org-capture)
  (global-set-key (kbd "C-c b") 'org-iswitchb)

  (global-set-key (kbd "C-c L") 'org-insert-link-global)
  (global-set-key (kbd "C-c O") 'org-open-at-point-global)

  ;; Goto currently clockly items
  (global-set-key (kbd "<f11>") 'org-clock-goto)

  ;; (setq org-tag-alist '((:startgrouptag)
  ;;                       (:grouptags)
  ;;                       ("@home" . ?h)
  ;;                       ("@work" . ?w)
  ;;                       (:endgrouptag)
  ;;                       (:startgrouptag)
  ;;                       ("@home" . ?h)
  ;;                       (:grouptags)
  ;;                       ("Reading")
  ;;                       (:endgrouptag)
  ;;                       (:startgrouptag)
  ;;                       ("@work" . ?w)
  ;;                       (:grouptags)
  ;;                       ("SysVideo")
  ;;                       ("SysVideoAdmin")
  ;;                       (:endgrouptag)
  ;;                       ))
  (setq org-tag-alist '((:startgroup . nil)
                        ("@office" . ?w)
                        ("@home" . ?h)
                        (:endgroup . nil)

                        ("Video" . nil)
                        ("VideoAdmin" . nil)
                        ("Developer" . nil)
                        ("DeveloperAdmin" . nil)
                        ("WebSite" . nil)
                        ("WorkOrder" . nil)
                        ("Analysis" . nil)

                        ("Git" . nil)

                        (:startgroup . nil)
                        ("NodeJS" . nil)
                        (:grouptags)
                        ("Webpack")
                        ("Express")
                        (:endgroup . nil)

                        (:startgroup . nil)
                        ("Javascript" . nil)
                        (:grouptags)
                        ("ES5")
                        ("ES6")
                        (:endgroup . nil)

                        (:startgroup . nil)
                        ("CSS" . nil)
                        (:grouptags)
                        ("CSS3")
                        (:endgroup . nil)

                        (:startgroup . nil)
                        ("HTML" . nil)
                        (:grouptags)
                        ("HTML5")
                        (:endgroup . nil)

                        ("WebApp")

                        (:startgroup . nil)
                        ("Emacs" . nil)
                        (:grouptags)
                        ("Spacemacs")
                        ("Lisp")
                        (:endgroup . nil)

                        ))

  ;; Todo keywords
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELED(c@/!)" "PHONE(p)" "MEETING(m)" "FIXED(f)"))))

  ;; Todo keywords colors
  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "#dc322f" :weight bold)
                ("NEXT" :foreground "#d33682" :weight bold)
                ("DONE" :foreground "#859900" :weight bold)
                ("WAITING" :foreground "#cb4b16" :weight bold)
                ("HOLD" :foreground "#b58900" :weight bold)
                ("CANCELED" :foreground "#859900" :weight bold)
                ("MEETING" :foreground "#859900" :weight bold)
                ("PHONE" :foreground "#859900" :weight bold))))

  ;; Todo keywords trigger
  ;; Moving a task to `CANCELED' adds a `CANCELED' tag
  ;; Moving a task to `WAITING' adds a `WAITING' tag
  ;; Moving a task to `HOLD' adds `WAITING' and `HOLD' tags
  ;; Moving a task to a done state removes `WAITING' and HOLD' tags
  ;; Moving a task to `TODO' removes `WAITING', `CANCELED', and `HOLD' tags
  ;; Moving a task to `NEXT' removes `WAITING', `CANCELED', and `HOLD' tags
  ;; Moving a task to `DONE' removes `WAITING', `CANCELED', and `HOLD' tags
  (setq org-todo-state-tags-triggers
        (quote (("CANCELED" ("CANCELED" . t))
                ("WAITING" ("WAITING" . t))
                ("HOLD" ("WAITING") ("HOLD" . t))
                (done ("WAITING") ("HOLD"))
                ("TODO" ("WAITING") ("CANCELED") ("HOLD"))
                ("NEXT" ("WAITING") ("CANCELED") ("HOLD"))
                ("DONE" ("WAITING") ("CANCELED") ("HOLD")))))

  (defun org-summary-todo (n-done n-not-done)
    "Switch entry to DONE when all subentries are done, to TODO otherwise. Parent entry must be added a [%] or [/] tag to enable statistics."
    (let (org-log-done org-log-states)  ; turn off logging
      (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

  (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

  ;; org-capture settings
  (setq org-directory "~/org")
  (setq org-default-notes-file "~/org/inbox.org")

  ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
  ;; the %i would copy the selected text into the template
  (setq org-capture-templates
        '(("t" "Task" entry (file+headline "~/org/inbox.org" "Tasks")
           "* TODO %?\n%U\n" :clock-in t :clock-resume t :empty-lines 1)
          ("n" "Note" entry (file+headline "~/org/inbox.org" "Notes")
           "* %? \n%U\n" :clock-in t :clock-resume t :empty-lines 1)
          ("s" "Code Snippet" entry (file+headline "~/org/inbox.org" "Notes")
           "* %?\t%^g\n#+BEGIN_SRC %^{language}\n\n#+END_SRC" :empty-lines 1)
          ("l" "links" entry (file+headline "~/org/inbox.org" "Notes")
           "* TODO [#C] %?\n  %i\n %a \n %U\n"
           :empty-lines 1)
          ("j" "Journal" entry (file+datetree "~/org/journal.org")
           "* %?\n%U\n\n" :clock-in t :clock-resume t :empty-lines 1)
          ("o" "Oneway Task" entry (file+headline "~/org/oneway/oneway.org" "Tasks")
           "* TODO %?\n%U\n" :clock-in t :clock-resume t :empty-lines 1)
          ("m" "Meeting" entry (file+datetree "~/org/journal.org")
           "* MEETING with %? :MEETING:\n%U\n" :clock-in t :clock-resume t :empty-lines 1)
          ("p" "Phone call" entry (file+datetree "~/org/journal.org")
           "* PHONE %? :PHONE:\n%U\n" :clock-in t :clock-resume t :empty-lines 1)
          ("h" "Habit" entry (file+datetree "~/org/inbox.org" "Habits")
           "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")))

  ;; hide weeky
  ;; (setq org-time-stamp-custom-formats '("<%Y-%m-%d>" . "<%Y-%m-%d %H:%M>"))

  ;; org-agenda-files
  (setq org-agenda-files '("~/org/" "~/org/oneway/"))


  ;; ====== Custom Agenda Views ======

  ;; Do not dim blocked tasks
  (setq org-agenda-dim-blocked-tasks nil)

  ;; Compact the block agenda view
  (setq org-agenda-compact-blocks t)

  ;; custom agemda views
  (setq org-agenda-custom-commands
        (quote ((" " "Agenda"
                 ((agenda "" nil)
                  (tags "INBOX"
                        ((org-agenda-overriding-header "Tasks to Refile")
                         (org-tags-match-list-sublevels nil))))
                 nil))))

  ;; ====== Time Clocking ======
  (global-set-key (kbd "<f9> I") 'duo/punch-in)
  (global-set-key (kbd "<f9> O") 'duo/punch-out)
  (global-set-key (kbd "<f9> SPC") 'duo/clock-in-last-task)
  ;; Separate drawers for clocking and logs
  (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
  ;; Save clock data and notes in the LOGBOOK drawer
  (setq org-clock-into-drawer t)
  ;; Removes clocked tasks with 0:00 duration
  (setq org-clock-out-remove-zero-time-clocks t)
  ;; Clock out when moving task to a done state
  (setq org-clock-out-when-done t)
  ;; Save the running clock and all clock history when exiting Emacs, load it on startup.
  (setq org-clock-persist t)
  ;; Resume clocking task when emacs is restarted
  (org-clock-persistence-insinuate)
  ;; Do not prompt to resume an active clock
  (setq org-clock-persist-query-resume nil)
  ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
  (setq org-clock-history-length 23)
  ;; Resume clocking task on clock-in if the clock is open
  (setq org-clock-in-resume t)
  ;; Enable auto clock resolution for finding open clocks
  (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
  ;; Include current clocking task in clock reports
  (setq org-clock-report-include-clocking-task t)
  ;; Change tasks to NEXT when clocking in
  (setq org-clock-in-switch-to-state 'duo/clock-in-to-next)

  (setq duo/keep-clock-running nil)

  (defun duo/clock-in-to-next (kw)
    "Switch a task from TODO to NEXT when clocking in.
Skips capture tasks, projects, and subprojects.
Switch projects and subprojects from NEXT back to TODO"
    (when (not (and (boundp 'org-capture-mode) org-capture-mode))
      (cond
       ((and (member (org-get-todo-state) (list "TODO"))
             (duo/is-task-p))
        "NEXT")
       ((and (member (org-get-todo-state) (list "NEXT"))
             (duo/is-project-p))
        "TODO"))))

  (defun duo/is-project-p ()
    "Any task with a todo keyword subtask"
    (save-restriction
      (widen)
      (let ((has-subtask)
            (subtree-end (save-excursion (org-end-of-subtree t)))
            (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
        (save-excursion
          (forward-line 1)
          (while (and (not has-subtask)
                      (< (point) subtree-end)
                      (re-search-forward "^\*+ " subtree-end t))
            (when (member (org-get-todo-state) org-todo-keywords-1)
              (setq has-subtask t))))
        (and is-a-task has-subtask))))

  (defun duo/is-project-subtree-p ()
    "Any task with a todo keyword that is in a project subtree.
Callers of this function already widen the buffer view."
    (let ((task (save-excursion (org-back-to-heading 'invisible-ok)
                                (point))))
      (save-excursion
        (duo/find-project-task)
        (if (equal (point) task)
            nil
          t))))

  (defun duo/is-task-p ()
    "Any task with a todo keyword and no subtask"
    (save-restriction
      (widen)
      (let ((has-subtask)
            (subtree-end (save-excursion (org-end-of-subtree t)))
            (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
        (save-excursion
          (forward-line 1)
          (while (and (not has-subtask)
                      (< (point) subtree-end)
                      (re-search-forward "^\*+ " subtree-end t))
            (when (member (org-get-todo-state) org-todo-keywords-1)
              (setq has-subtask t))))
        (and is-a-task (not has-subtask)))))

  (defun duo/is-subproject-p ()
    "Any task which is a subtask of another project"
    (let ((is-subproject)
          (is-a-task (member (nth 2 (org-heading-components)) org-todo-keywords-1)))
      (save-excursion
        (while (and (not is-subproject) (org-up-heading-safe))
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq is-subproject t))))
      (and is-a-task is-subproject)))

  (defun duo/find-project-task ()
    "Move point to the parent (project) task if any"
    (save-restriction
      (widen)
      (let ((parent-task (save-excursion (org-back-to-heading 'invisible-ok) (point))))
        (while (org-up-heading-safe)
          (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
            (setq parent-task (point))))
        (goto-char parent-task)
        parent-task)))

  (defun duo/punch-in (arg)
    "Start continuous clocking and set the default task to the
selected task.  If no task is selected set the Organization task
as the default task."
    (interactive "p")
    (setq duo/keep-clock-running t)
    (if (equal major-mode 'org-agenda-mode)
        ;;
        ;; We're in the agenda
        ;;
        (let* ((marker (org-get-at-bol 'org-hd-marker))
               (tags (org-with-point-at marker (org-get-tags-at))))
          (if (and (eq arg 4) tags)
              (org-agenda-clock-in '(16))
            (duo/clock-in-organization-task-as-default)))
      ;;
      ;; We are not in the agenda
      ;;
      (save-restriction
        (widen)
                                        ; Find the tags on the current task
        (if (and (equal major-mode 'org-mode) (not (org-before-first-heading-p)) (eq arg 4))
            (org-clock-in '(16))
          (duo/clock-in-organization-task-as-default)))))

  (defun duo/punch-out ()
    (interactive)
    (setq duo/keep-clock-running nil)
    (when (org-clock-is-active)
      (org-clock-out))
    (org-agenda-remove-restriction-lock))

  (defvar duo/organization-task-id "eb155a82-92b2-4f25-a3c6-0304591af2f9")

  (defun duo/clock-in-organization-task-as-default ()
    (interactive)
    (org-with-point-at (org-id-find duo/organization-task-id 'marker)
      (org-clock-in '(16))))

  (defun duo/clock-in-default-task ()
    (save-excursion
      (org-with-point-at org-clock-default-task
        (org-clock-in))))

  (defun duo/clock-in-parent-task ()
    "Move point to the parent (project) task if any and clock in"
    (let ((parent-task))
      (save-excursion
        (save-restriction
          (widen)
          (while (and (not parent-task) (org-up-heading-safe))
            (when (member (nth 2 (org-heading-components)) org-todo-keywords-1)
              (setq parent-task (point))))
          (if parent-task
              (org-with-point-at parent-task
                (org-clock-in))
            (when duo/keep-clock-running
              (duo/clock-in-default-task)))))))

  (defun duo/clock-out-maybe ()
    (when (and duo/keep-clock-running
               (not org-clock-clocking-in)
               (marker-buffer org-clock-default-task)
               (not org-clock-resolving-clocks-due-to-idleness))
      (duo/clock-in-parent-task)))

  (add-hook 'org-clock-out-hook 'duo/clock-out-maybe 'append)

  (defun duo/clock-in-last-task (arg)
    "Clock in the interrupted task if there is one
Skip the default task and get the next one.
A prefix arg forces clock in of the default task."
    (interactive "p")
    (let ((clock-in-to-task
           (cond
            ((eq arg 4) org-clock-default-task)
            ((and (org-clock-is-active)
                  (equal org-clock-default-task (cadr org-clock-history)))
             (caddr org-clock-history))
            ((org-clock-is-active) (cadr org-clock-history))
            ((equal org-clock-default-task (car org-clock-history)) (cadr org-clock-history))
            (t (car org-clock-history)))))
      (widen)
      (org-with-point-at clock-in-to-task
        (org-clock-in nil))))

  ;; ====== Time Report =======
  ;; Agenda clock report parameters
  (setq org-agenda-clockreport-parameter-plist
        (quote (:link t :maxlevel 5 :fileskip0 t :compact t :narrow 80)))

  ;; ====== Task Estimate ======
  ;; task estimate with column view
                                        ; Set default column view headings: Task Effort Clock_Summary
  (setq org-columns-default-format "%80ITEM(Task) %10Effort(Effort){:} %10CLOCKSUM")
                                        ; global Effort estimate values
                                        ; global STYLE property values for completion
  (setq org-global-properties (quote (("Effort_ALL" . "0:15 0:30 0:45 1:00 2:00 3:00 4:00 5:00 6:00 0:00")
                                      ("STYLE_ALL" . "habit"))))
  ;; Agenda log mode items to display (closed and state changes by default)
  (setq org-agenda-log-mode-items (quote (closed state)))


  ;; ====== Exporting =======

  ;; auto section number to 4 on org export
  (setq-default org-export-with-section-numbers 6)
  (setq org-export-headline-levels 6)
  (setq org-export-with-toc nil)

  ;; Targets include this file and any file contributing to the agenda - up to 2 levels deep
  (setq org-refile-targets (quote ((nil :maxlevel . 2)
                                   (org-agenda-files :maxlevel . 2))))

  ;; Use full outline paths for refile targets - we file directly with IDO
  (setq org-refile-use-outline-path 'file)

  ;; Targets complete directly with IDO
  (setq org-outline-path-complete-in-steps nil)

  ;; Allow refile to create parent tasks with confirmation
  (setq org-refile-allow-creating-parent-nodes (quote confirm))

  ;; Use IDO for both buffer and file completion and ido-everywhere to t
  (setq org-completion-use-ido t)
  (setq ido-everywhere t)
  (setq ido-max-directory-size 100000)
  ;;(ido-mode (quote both))
  ;; Use the current window when visiting files and buffers with ido
  (setq ido-default-file-method 'selected-window)
  (setq ido-default-buffer-method 'selected-window)
  ;; Use the current window for indirect buffer display
  (setq org-indirect-buffer-display 'current-window)

  ;; Refile settings
                                        ; Exclude DONE state tasks from refile targets
  (defun duo/verify-refile-target ()
    "Exclude todo keywords with a done state from refile targets"
    (not (member (nth 2 (org-heading-components)) org-done-keywords)))

  (setq org-refile-target-verify-function 'duo/verify-refile-target)

  ;; deft
  (setq deft-extensions '("org"))
  (setq deft-directory "~/org")
  (setq deft-recursive t)
  (setq deft-use-filename-as-title t)

  ;; org-export
  (setq org-export-backends '(ascii html md))

  ;; auto delete trailing whitespace
  (add-hook 'local-write-file-hooks
            (lambda ()
              (delete-trailing-whitespace)
              nil))

;;; add-node-modules-path.el --- Add node_modules to your exec-path

  ;; Copyright (C) 2016 Neri Marschik
  ;; This package uses the MIT License.
  ;; See the LICENSE file.

  ;; Author: Neri Marschik <marschik_neri@cyberagent.co.jp>
  ;; Version: 1.0
  ;; Package-Requires: ()
  ;; Keywords: javascript, node, node_modules, eslint
  ;; URL: https://github.com/codesuki/add-node-modules-path

;;; Commentary:
  ;;
  ;; This file provides `add-node-modules-path', which searches
  ;; the current files parent directories for the `node_modules/.bin/' directory
  ;; and adds it to the buffer local `exec-path'.
  ;; This allows Emacs to find project based installs of e.g. eslint.
  ;;
  ;; Usage:
  ;;     M-x add-node-modules-path
  ;;
  ;;     To automatically run it when opening a new buffer:
  ;;     (Choose depending on your favorite mode.)
  ;;
  ;;     (eval-after-load 'js-mode
  ;;       '(add-hook 'js-mode-hook #'add-node-modules-path))
  ;;
  ;;     (eval-after-load 'js2-mode
  ;;       '(add-hook 'js2-mode-hook #'add-node-modules-path))

;;; Code:

;;;###autoload
  (defun add-node-modules-path ()
    (interactive)
    (let* ((root (locate-dominating-file
                  (or (buffer-file-name) default-directory)
                  "node_modules"))
           (path (and root
                      (expand-file-name "node_modules/.bin/" root))))
      (if root
          (progn
            (make-local-variable 'exec-path)
            (add-to-list 'exec-path path)
            (message "added node_modules to exec-path"))
        (message "node_modules not found"))))

  (provide 'add-node-modules-path)

  (eval-after-load 'js2-mode
    '(add-hook 'js2-mode-hook #'add-node-modules-path))

  (eval-after-load 'web-mode
    '(add-hook 'web-mode-hook #'add-node-modules-path))

;;; add-node-modules-path.el ends here

  ;; turn on flycheck globally
  (global-flycheck-mode)

  ;; disable jshint since we prefer eslint checking
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers '(javascript-jshint)))

  ;; add flycheck with eslint on web-mode
  (flycheck-add-mode 'javascript-eslint 'web-mode)

  ;; eslint config file
  ;;(setq-default flycheck-eslint-rules-directories '("~/.eslintrc"))
  (setq-default flycheck-checker-error-threshold 1000)
  ;; only check on saving
  (setq flycheck-check-syntax-automatically '(mode-enabled save))

  ;; disable js2-mode semicolon check
  (setq js2-strict-missing-semi-warning nil)

  (defun remove-dos-eol ()
    "Do not show ^M in files containing mixed UNIX and DOS line endings."
    (interactive)
    (setq buffer-display-table (make-display-table))
    (aset buffer-display-table ?\^M []))

  ;; global company mode
  (global-company-mode t)
  ;; disable auto company popup
  (setq company-idle-delay nil)
  (global-set-key (kbd "C-'") 'company-complete-common)

  (define-key evil-normal-state-map (kbd "u") 'undo-tree-undo)
  ;; Youdao Dictionary
  (spacemacs/set-leader-keys "oy" 'youdao-dictionary-search-at-point-tooltip)

  ;; use projectile native ignore index
  (setq projectile-indexing-method 'native)

  (setq powerline-default-separator nil)

  ;; evil-escape key delay
  (setq-default evil-escape-delay 0.3)

  ;; yasnippet settings
  (setq yas-snippet-dirs '("~/.spacemacs.d/snippets"))

  ;; org-html styles
  (setq org-html-preamble nil)
  (setq org-html-postamble nil)
  (setq org-html-head-include-default-style nil)
  (setq org-html-head "
   <style type=\"text/css\">
html {
  padding: 0;
}

body {
  font-family: \"Droid Serif\", \"Lucida Grande\", \"Lucida Sans Unicode\", \"DejaVu Sans\", Verdana, sans-serif;
  font-size: 11pt;
  line-height: 1.3;
  margin: 40pt;
  padding: 0;
}
ul, ol {
  padding-left: 1em;
}
h1,h2,h3,h4,h5,h6,.h1,.h2,.h3,.h4,.h5,.h6 {
  font-family: \"Helvetica Neue\", Helvetica, Arial, sans-serif;
  font-weight: bold;
  line-height: 1.1;
  color: inherit
}

h1,h2,h3,h4,h5,h6 {
  margin-bottom: 9px
}

p {
  margin: 0 0 10px
}

.outline-2 h1 {
  margin-top: 45px;
  font-size: 2.5em;
}

.outline-2 h2 {
  margin-top: 40px;
  font-size: 2em;
}

.outline-2 h3 {
  margin-top: 35px;
  font-size: 1.5em;
}

.outline-2 h4 {
  margin-top: 30px;
  font-size: 1.2em
}

.outline-2 h5 {
  margin-top: 30px;
  font-size: 1.1em
}

.outline-2 h6 {
  margin-top: 30px;
  font-size: 1.1em
}

.outline-2 code {
  padding: 2px 4px;
  font-size: 90%;
  color: #c7254e;
  background-color: #f9f2f4;
  white-space: nowrap;
  border-radius: 4px;
}

.outline-2 table{
  width: 100%;
}

table tbody tr:nth-child(odd){
  background-color: #efefef;
}

.title {
  position: fixed;
  display: inline;
  left: 0px;
  top: 0px;
  height: 54px;
  width: 100%;
  margin-top: 0px;
  background-color: #eee;
  padding: 0;
  z-index: 99;
}

#orgquote {
  position: fixed;
  display: block;
  top: 77px;
  padding: 5pt;
  text-align: center;
  background-color: black;
  width: 100%;
  color: #ccc;
  box-shadow: 0px 15px 10px #fff;
  font-size: 90%;
  font-family: Courier new;
  z-index: 98;
}

h1.title {
  text-shadow: 2px 2px 4px #999;
  padding-top: 23px;
  padding-left: 70pt;
  font-size: 23pt;
}

.timestamp {
  font-family: Courier New;
  color: #888888;
}

pre {
  background-color: #eee;
  box-shadow: 5px 5px 5px #888;
  border: none;
  padding: 5pt;
  margin-bottom: 14pt;
  color: black;
  padding: 12pt;
  font-family: Courier New;
  font-size: 95%;
  overflow: auto;
}

#outline-container-1 {
  padding-top: 3pt;
}

p {
  margin-top: 0;
  text-align: justify;
}

a:link {
  font-weight: normal;
  text-decoration: none;
}

a:visited {
  font-weight: normal;
  text-decoration: none;
}

a:hover, a:active {
  text-decoration: underline;
}

dd {
  text-align: justify;
  margin-bottom: 14pt;
}

dt {
  font-size: 110%;
  font-family: Courier New;
  color: #1c3030;
  padding: 3px;
  margin-bottom: 3px;
}

li {
  margin: 10px;
  text-align: justify;
}

#table-of-contents {
  font-size: 9pt;
  position: fixed;
  right: 0em;
  top: 0em;
  background: white;
  -webkit-box-shadow: 0 0 1em #777777;
  -moz-box-shadow: 0 0 1em #777777;
  -webkit-border-bottom-left-radius: 5px;
  -moz-border-radius-bottomleft: 5px;
  text-align: right;
  max-height: 80%;
  overflow: auto;
  z-index: 200;
}

#table-of-contents h2 {
  font-size: 9pt;
  max-width: 8em;
  font-weight: normal;
  padding-left: 0.5em;
  padding-top: 0.05em;
  padding-bottom: 0.05em;
}

#table-of-contents ul {
  margin-left: 14pt;
  margin-bottom: 10pt;
  padding: 0
}

#table-of-contents li {
  padding: 0;
  margin: 1px;
  list-style: none;
}

#table-of-contents ul>:first-child {
  color: blue;
}

#table-of-contents #text-table-of-contents {
  display: none;
  text-align: left;
}

#table-of-contents:hover #text-table-of-contents {
  display: block;
  padding: 0.5em;
  margin-top: -1.5em;
}

img {
  border: 1px solid black;
}
img.random {
  max-width: 750px;
  max-height: 380px;
  margin-bottom: 10pt;
}
.underline{
  text-decoration: underline;
}
del{
  text-decoration: line-through;
}
i{
  font-style: italic;
}
@media screen
{
  #table-of-contents {
    float: right;
    border: 1px solid #CCC;
    max-width: 50%;
    overflow: auto;
  }
} /* END OF @media screen */
   </style>")

  ;; Graph library path
  (setq org-plantuml-jar-path
        (expand-file-name "~/.spacemacs.d/plantuml.jar"))
  (setq org-ditaa-jar-path "~/.spacemacs.d/ditaa.jar")

  ;; Make markdown exportable
  (eval-after-load "org"
    '(require 'ox-md nil t))

  ;; Activate Org-babel languages
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((sh . t)
     (dot . t)
     (js . t)
     (latex .t)
     (python . t)
     (emacs-lisp . t)
     (plantuml . t)
     (C . t)
     (ditaa . t)))

                                        ; Do not prompt to confirm evaluation
                                        ; This may be dangerous - make sure you understand the consequences
                                        ; of setting this -- see the docstring for details
  ;; (setq org-confirm-babel-evaluate nil)
  ;; user-config end
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
 (custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
