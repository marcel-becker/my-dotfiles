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
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     auto-completion
     better-defaults
     colors
     dash
     docker
     emacs-lisp
     git
     github
     ibuffer
     imenu-list
     markdown
     org
     pdf-tools
     java
     latex
     python
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-term-shell "/usr/local/bin/bash")
     spell-checking
     syntax-checking
     themes-megapack
     version-control
     spacemacs
     spacemacs-base
     spacemacs-completion
     spacemacs-editing
     spacemacs-editing-visual
     spacemacs-evil
     spacemacs-language
     spacemacs-layouts
     spacemacs-misc
     spacemacs-org
     spacemacs-ui
     spacemacs-ui-visual
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
     doremi
     doremi-frm
     doremi-cmd
     hlinum
     menu-bar+
     switch-window
     window-number
     window-numbering
     winum
     )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
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
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
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
   dotspacemacs-editing-style 'emacs
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
   dotspacemacs-startup-lists '((recents . 10)
                                (projects . 10))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
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
   dotspacemacs-enable-paste-transient-state nil
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
   dotspacemacs-line-numbers t
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
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
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup "trailing"
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
  (global-hl-line-mode 1) ; Disable current line highlight
  (global-linum-mode 1)
  (hlinum-activate)
 ;; (window-number-mode)
 ;; (window-numbering-mode )
  ;;(window-number-meta-mode)
  ;; Use the clipboard, pretty please, so that copy/paste "works"
  (setq x-select-enable-clipboard t)
  ;; Navigate windows with M-<arrows>

  ;;(setq windmove-wrap-around t)

  ;; winner-mode provides C-<left> to get back to previous window layout
  ;;(winner-mode 1)


  (setq linum-format " %d ")

  ;; key bindings
  (when (eq system-type 'darwin) ;; mac specific settings
    (setq mac-option-modifier 'alt)
    (setq mac-right-option-modifier 'super)
    (setq mac-command-modifier 'meta)
    (setq mac-allow-anti-aliasing t)
    (global-set-key [kp-delete] 'delete-char)) ;; sets fn-delete to be right-delete
  ) ; Show line numbers by default


;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-output-view-style
   (quote
    (("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "dvips %d -o && start \"\" %f")
     ("^dvi$"
      ("^a5\\(?:comb\\|paper\\)$" "^landscape$")
      "windvi %d %dS -qpaper a5r -s 0")
     ("^dvi$" "^a5\\(?:comb\\|paper\\)$" "windvi %d %dS -qpaper a5")
     ("^dvi$" "^b5paper$" "windvi %d %dS -qpaper b5")
     ("^dvi$"
      ("^landscape$" "^pstricks$\\|^psfrag$")
      "dvips -t landscape %d -o && start \"\" %f")
     ("^dvi$" "^letterpaper$" "windvi %d %dS -qpaper us")
     ("^dvi$" "^legalpaper$" "windvi %d %dS -qpaper legal")
     ("^dvi$" "^executivepaper$" "windvi %d %dS -qpaper 7.25x10.5in")
     ("^dvi$" "^landscape$" "windvi %d %dS -qpaper a4r")
     ("^dvi$" "." "windvi %d %dS")
     ("^pdf$" "." "C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe %o")
     ("^html?$" "." "start \"\" %o"))))
 '(TeX-view-program-selection
   (quote
    (((output-dvi style-pstricks)
      "dvips and start")
     (output-dvi "Yap")
     (output-pdf "SumatraPDF")
     (output-html "start"))))
 '(anzu-deactivate-region t)
 '(anzu-mode-lighter "")
 '(anzu-replace-threshold 50)
 '(anzu-replace-to-string-separator " => ")
 '(anzu-search-threshold 1000)
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 307 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(blink-cursor-mode nil)
 '(c-default-style
   (quote
    ((java-mode . "eclipse")
     (awk-mode . "awk")
     (other . "gnu"))))
 '(cursor-type (quote box))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" "7e3316825e6cdf7829743c88e66f85743f9665ec7cbb76846e7f00b938fef481" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" default)))
 '(default-frame-alist
    (quote
     ((background-color . "#09223F")
      (height . 50)
      (cursor-color . "white")
      (mouse-color . "white")
      (foreground-color . "white")
      (cursor-type . box)
      (width . 130))))
 '(dialog-frame-plist (quote (width 90 height 20 top 20)))
 '(display-time-mode t)
 '(ecb-options-version "2.40")
 '(echo-keystrokes 0.01)
 '(fill-column 120)
 '(frame-title-format (quote ("%f - " user-real-login-name "@" system-name)) t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(ido-auto-merge-work-directories-length nil)
 '(ido-create-new-buffer (quote always))
 '(ido-enable-flex-matching t)
 '(ido-enable-prefix nil)
 '(ido-ignore-extensions t)
 '(ido-max-prospects 8)
 '(ido-use-filename-at-point (quote guess))
 '(indent-tabs-mode nil)
 '(indicate-empty-lines t)
 '(inhibit-startup-screen t)
 '(linum-format "  %d  ")
 '(minimap-dedicated-window nil)
 '(minimap-hide-fringes t)
 '(minimap-recreate-window nil)
 '(minimap-update-delay 0)
 '(minimap-window-location (quote right))
 '(ns-alternate-modifier (quote alt))
 '(ns-right-alternate-modifier (quote super))
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(one-key-special-keybindings
   (quote
    ((dir-documentation documentation "Show one-key-dir documentation"
                        (lambda nil
                          (finder-commentary
                           (locate-library "one-key-dir"))
                          (setq one-key-menu-window-configuration nil)
                          nil))
     (quit-close "q" "Quit and close menu window"
                 (lambda nil
                   (setq one-key-buffer-temp-action
                         (quote close))))
     (quit-open "C-q" "Quit, but keep menu window open"
                (lambda nil
                  (setq one-key-buffer-temp-action
                        (quote deselect))))
     (toggle-persistence "<C-menu>" "Toggle menu persistence"
                         (lambda nil
                           (if one-key-buffer-match-action
                               (setq one-key-buffer-match-action nil one-key-buffer-miss-match-action nil)
                             (setq one-key-buffer-match-action
                                   (quote close)
                                   one-key-buffer-miss-match-action
                                   (quote close)))))
     (toggle-display "<menu>" "Toggle menu display" one-key-menu-window-toggle)
     (next-menu "<left>" "Change to left menu"
                (lambda nil
                  (setq one-key-buffer-menu-number
                        (mod
                         (1- one-key-buffer-menu-number)
                         (length one-key-buffer-menu-alists))
                        one-key-default-menu-number one-key-buffer-menu-number)
                  (one-key-update-buffer-contents)
                  (one-key-set-window-state
                   (nth one-key-window-toggle-pos one-key-window-toggle-sequence))))
     (prev-menu "<right>" "Change to right menu"
                (lambda nil
                  (setq one-key-buffer-menu-number
                        (mod
                         (1+ one-key-buffer-menu-number)
                         (length one-key-buffer-menu-alists))
                        one-key-default-menu-number one-key-buffer-menu-number)
                  (one-key-update-buffer-contents)
                  (one-key-set-window-state
                   (nth one-key-window-toggle-pos one-key-window-toggle-sequence))))
     (skip-menus-left "<C-left>" "Skip menus to left"
                      (lambda nil
                        (let*
                            ((nummenus
                              (length one-key-buffer-menu-alists))
                             (skipnum
                              (max
                               (round
                                (* nummenus 0.333))
                               2)))
                          (setq one-key-buffer-menu-number
                                (mod
                                 (- one-key-buffer-menu-number skipnum)
                                 nummenus)
                                one-key-default-menu-number one-key-buffer-menu-number)
                          (one-key-update-buffer-contents)
                          (one-key-set-window-state
                           (nth one-key-window-toggle-pos one-key-window-toggle-sequence)))))
     (skip-menus-right "<C-right>" "Skip menus to right"
                       (lambda nil
                         (let*
                             ((nummenus
                               (length one-key-buffer-menu-alists))
                              (skipnum
                               (max
                                (round
                                 (* nummenus 0.333))
                                2)))
                           (setq one-key-buffer-menu-number
                                 (mod
                                  (+ one-key-buffer-menu-number skipnum)
                                  nummenus)
                                 one-key-default-menu-number one-key-buffer-menu-number)
                           (one-key-update-buffer-contents)
                           (one-key-set-window-state
                            (nth one-key-window-toggle-pos one-key-window-toggle-sequence)))))
     (up "<up>" "Scroll/move up one line" one-key-menu-window-scroll-up-line)
     (down "<down>" "Scroll/move down one line"
           #[128 "\302\300\303\301\"\"\207"
                 [one-key-menu-window-scroll-up-line
                  (t)
                  apply append]
                 6 "

(fn &rest ARGS2)"])
     (scroll-down "<prior>" "Scroll menu down one page"
                  #[128 "\302\300\303\301\"\"\207"
                        [one-key-menu-window-scroll-up
                         (t)
                         apply append]
                        6 "

(fn &rest ARGS2)"])
     (scroll-up "<next>" "Scroll menu up one page" one-key-menu-window-scroll-up)
     (documentation "<S-f1>" "Show one-key documentation"
                    (lambda nil
                      (finder-commentary
                       (locate-library "one-key"))))
     (save-menu "C-s" "Save state of current menu"
                (lambda nil
                  (one-key-save-menu one-key-buffer-this-name one-key-buffer-full-list)))
     (toggle-help "<f1>" "Toggle this help buffer"
                  (lambda nil
                    (if
                        (get-buffer-window one-key-help-buffer-name)
                        (one-key-set-window-state
                         (quote hidehelp))
                      (one-key-set-window-state
                       (quote showhelp))
                      (one-key-show-help one-key-buffer-special-keybindings))))
     (toggle-row/column-order "<f2>" "Toggle column/row ordering of items"
                              (lambda nil
                                (setq one-key-column-major-order
                                      (not one-key-column-major-order))
                                (one-key-update-buffer-contents)))
     (sort-next "<f3>" "Sort items by next method"
                #[128 "\302\300\303\301\"\"\207"
                      [one-key-sort-items-by-next-method
                       (t)
                       apply append]
                      6 "

(fn &rest ARGS2)"])
     (sort-prev "<C-f3>" "Sort items by previous method"
                #[128 "\302\300\303\301\"\"\207"
                      [one-key-sort-items-by-next-method
                       (t t)
                       apply append]
                      6 "

(fn &rest ARGS2)"])
     (reverse-order "<f4>" "Reverse order of items" one-key-reverse-item-order)
     (limit-items "/" "Limit items to those matching regexp"
                  (lambda nil
                    (setq one-key-buffer-filter-regex
                          (read-regexp "Regular expression matching items to be filtered"))
                    (one-key-update-buffer-contents)))
     (highlight-items "C-/" "Highlight items matching regexp"
                      (lambda nil
                        (let
                            ((regex
                              (read-regexp "Regular expression matching items to be coloured"))
                             (bgcolour
                              (read-color "Colour: ")))
                          (one-key-highlight-matching-items bgcolour
                                                            (lambda
                                                              (item)
                                                              (string-match regex
                                                                            (cdar item)))))))
     (edit-item "<f5>" "Edit a menu item" one-key-edit-menu-item)
     (delete-item "<f6>" "Delete a menu item" one-key-delete-menu-item)
     (kill-items "<f7>" "Copy/kill coloured items" one-key-copy/kill-items)
     (yank-items "<C-f7>" "Yank copied items" one-key-yank-items)
     (swap-keys "<f8>" "Swap menu item keys" one-key-swap-menu-items)
     (add-item "<f9>" "Add a menu item" one-key-prompt-to-add-menu-item)
     (add-menu "<C-f9>" "Add a menu" one-key-add-menus)
     (remove-menu "<C-S-f9>" "Remove this menu" one-key-delete-menus)
     (move-item "<f10>" "Reposition item (with arrow keys)"
                (lambda nil
                  (let
                      ((key
                        (one-key-key-description
                         (read-event "Enter key of item to be moved"))))
                    (setq one-key-current-item-being-moved key))))
     (donate "<f11>" "Donate to support further development"
             (lambda nil
               (browse-url "http://onekeydonate.dynalias.net")))
     (report-bug "<C-f11>" "Report a bug" one-key-submit-bug-report)
     (show-menusets "C-h" "Show menus in menu set"
                    (lambda nil
                      (let*
                          ((key
                            (read-event "Enter the key for the menu set"))
                           (item
                            (one-key-get-menu-item key one-key-buffer-full-list))
                           (menuset
                            (assoc
                             (cdar item)
                             one-key-sets-of-menus-alist))
                           (desc
                            (car menuset))
                           (names
                            (cdr menuset)))
                        (message "%S" names))))
     (customize-menusets "C-c" "Customize menu sets"
                         (lambda nil
                           (one-key-set-window-state
                            (quote close))
                           (with-selected-window
                               (previous-window)
                             (customize-group
                              (quote one-key-menu-sets)))))
     (change-default-menuset "<f5>" "Change default menu set"
                             (lambda nil
                               (let*
                                   ((key
                                     (read-event "Press the key of item to set as default"))
                                    (item
                                     (one-key-get-menu-item key one-key-buffer-full-list))
                                    (name
                                     (cdar item))
                                    (pos
                                     (position "menu-sets" one-key-buffer-menu-names :test
                                               (quote equal))))
                                 (if name
                                     (eval
                                      (\`
                                       (customize-save-variable
                                        (quote one-key-default-menu-set)
                                        (\,
                                         (substring-no-properties name))))))
                                 (if pos
                                     (setf
                                      (nth pos one-key-buffer-menu-alists)
                                      (one-key-build-menu-sets-menu-alist))))
                               (one-key-update-buffer-contents)))
     (save-menuset save-menu "Save current menu set"
                   (lambda nil
                     (let*
                         ((names
                           (mapcar
                            (quote car)
                            one-key-sets-of-menus-alist))
                          (newname
                           (read-string "Name for menu set: "))
                          (validnames
                           (remq nil
                                 (mapcar
                                  (lambda
                                    (name)
                                    (if
                                        (one-key-get-menu-type name)
                                        name))
                                  one-key-buffer-menu-names)))
                          newset oldsets)
                       (unless
                           (and
                            (member newname names)
                            (not
                             (y-or-n-p "A menu set with that name already exists, overwrite it?")))
                         (setq newset
                               (if
                                   (y-or-n-p "Include \"menu-sets\" menu?")
                                   (append
                                    (list newname)
                                    validnames)
                                 (remove "menu-sets"
                                         (append
                                          (list newname)
                                          validnames))))
                         (setq oldsets
                               (remove-if
                                (lambda
                                  (item)
                                  (string=
                                   (car item)
                                   newname))
                                one-key-sets-of-menus-alist))
                         (if
                             (y-or-n-p "Associate menu set with major-mode?")
                             (let
                                 ((mode
                                   (with-selected-window
                                       (or one-key-buffer-associated-window
                                           (selected-window))
                                     major-mode)))
                               (eval
                                (\`
                                 (customize-save-variable
                                  (quote one-key-associations-for-menu-sets)
                                  (quote
                                   (\,
                                    (one-key-add-to-alist
                                     (quote one-key-associations-for-menu-sets)
                                     (cons mode newname))))))))
                           (if
                               (y-or-n-p "Associate menu set with current buffer?")
                               (let
                                   ((regex
                                     (with-selected-window
                                         (or one-key-buffer-associated-window
                                             (selected-window))
                                       (concat "^"
                                               (regexp-quote
                                                (buffer-name))
                                               "$"))))
                                 (eval
                                  (\`
                                   (customize-save-variable
                                    (quote one-key-associations-for-menu-sets)
                                    (quote
                                     (\,
                                      (one-key-add-to-alist
                                       (quote one-key-associations-for-menu-sets)
                                       (cons regex newname))))))))))
                         (eval
                          (\`
                           (customize-save-variable
                            (quote one-key-sets-of-menus-alist)
                            (quote
                             (\,
                              (append oldsets
                                      (list newset)))))))))
                     (one-key-update-buffer-contents)))
     (rebuild-menu "<M-f11>" "Rebuild the menu" one-key-rebuild-menu)
     (read-tree-up "RET" "Complete current list"
                   (lambda nil
                     (setq selected-item
                           (quote goup))))
     (read-tree-up2 ")" "Complete current list"
                    (lambda nil
                      (setq selected-item
                            (quote goup))))
     (read-tree-down "SPC" "Start new list recursively"
                     (lambda nil
                       (setq selected-item
                             (quote godown))))
     (read-tree-down2 "(" "Start new list recursively"
                      (lambda nil
                        (setq selected-item
                              (quote godown))))
     (read-tree-delete "<backspace>" "Remove last item from list"
                       (lambda nil
                         (setq selected-item
                               (quote del))))
     (read-logical-negate "!" "Negate next item"
                          (lambda nil
                            (setq selected-item
                                  (quote not)))))))
 '(package-selected-packages
(quote
 (yapfify xterm-color shell-pop rainbow-identifiers py-isort multi-term magit-gh-pulls github-clone github-browse-file eshell-z dash-at-point company-emacs-eclim company-auctex ht pdf-tools org-category-capture live-py-mode imenu-list ibuffer-projectile helm-dash github-search gist eshell-prompt-extras esh-help docker color-identifiers-mode eclim marshal auctex-latexmk hlinum doremi-frm faces+ doremi-cmd doremi ac-helm ac-ispell ac-python ace-flyspell ace-jump-helm-line ace-link ace-window adaptive-wrap afternoon-theme aggressive-indent alect-themes alert ample-regexps ample-theme ample-zen-theme anaconda-mode anti-zenburn-theme anything anzu apropospriate-theme async auctex auto-compile auto-complete auto-dictionary auto-highlight-symbol auto-yasnippet autopair autothemer avy badwolf-theme bind-key bind-map birds-of-paradise-plus-theme browse-kill-ring+ bubbleberry-theme buffer-move busybee-theme cherry-blossom-theme cl-lib clean-aindent-mode clues-theme coffee-mode color-theme color-theme-sanityinc-solarized color-theme-sanityinc-tomorrow color-theme-tango column-enforce-mode company company-anaconda company-jedi company-quickhelp company-statistics company-tern csv-mode ctable cyberpunk-theme cython-mode dakrone-theme darkburn-theme darkmine-theme darkokai-theme darktooth-theme dash dash-functional deferred define-word diff-hl diminish dired+ dired-atool dired-avfs dired-details dired-details+ dired-dups dired-efap dired-explorer dired-fdclone dired-filetype-face dired-filter dired-hacks-utils dired-imenu dired-launch dired-narrow dired-nav-enhance dired-open dired-quick-sort dired-rainbow dired-ranger dired-single dired-sort dired-sort-menu dired-sort-menu+ dired-subtree dired-toggle dired-toggle-sudo diredful direx direx-grep django-theme dockerfile-mode dracula-theme dumb-jump el-get elisp-slime-nav elpy emacs-eclim epc epl escreen espresso-theme eval-sexp-fu evil evil-anzu evil-args evil-ediff evil-escape evil-exchange evil-iedit-state evil-indent-plus evil-indent-textobject evil-leader evil-lisp-state evil-magit evil-matchit evil-mc evil-nerd-commenter evil-numbers evil-search-highlight-persist evil-surround evil-tutor evil-unimpaired evil-visual-mark-mode evil-visualstar exec-path-from-shell expand-region eyebrowse f fancy-battery farmhouse-theme fill-column-indicator find-file-in-project firebelly-theme flatland-theme flatui-theme flx flx-ido flycheck flycheck-pos-tip flymake flyspell-correct flyspell-correct-helm frame-cmds frame-fns fringe-helper fuzzy gandalf-theme gh-md git-commit git-gutter git-gutter+ git-gutter-fringe git-gutter-fringe+ git-link git-messenger git-timemachine gitattributes-mode gitconfig-mode gitignore-mode gntp gnuplot golden-ratio google-translate gotham-theme goto-chg goto-last-change grandshell-theme gruber-darker-theme gruvbox-theme hc-zenburn-theme header2 helm helm-ag helm-anything helm-c-yasnippet helm-company helm-core helm-descbinds helm-flx helm-git helm-git-files helm-gitignore helm-helm-commands helm-ls-git helm-make helm-mode-manager helm-package helm-projectile helm-pydoc helm-spotify helm-swoop helm-themes help-fns+ hemisu-theme heroku-theme hexrgb hide-comnt highlight highlight-indentation highlight-numbers highlight-parentheses hl-todo htmlize hungry-delete hy-mode hydra icicles ido-vertical-mode idomenu iedit indent-guide info+ inkpot-theme ir-black-theme jazz-theme jbeans-theme jedi jedi-core js-doc js2-mode js2-refactor json json-mode json-reformat json-rpc json-snatcher let-alist leuven-theme light-soap-theme link-hint linum-relative livid-mode log4e lorem-ipsum lua-mode lush-theme mac-key-mode macrostep madhat2r-theme magit magit-gitflow magit-popup majapahit-theme markdown-mode markdown-toc material-theme menu-bar+ minimal-theme mmm-mode moe-theme molokai-theme monochrome-theme monokai-theme move-text multiple-cursors mustang-theme mwim naquadah-theme neotree nginx-mode niflheim-theme noctilux-theme nose nxml-mode obsidian-theme occidental-theme oldlace-theme omtose-phellack-theme open-junk-file org org-bullets org-download org-plus-contrib org-pomodoro org-present org-projectile organic-green-theme orgit package package-build packed page-break-lines paradox parent-mode pastels-on-dark-theme pcache pcre2el persp-mode phoenix-dark-mono-theme phoenix-dark-pink-theme pip-requirements pkg-info planet-theme popup popup-kill-ring popwin pos-tip powerline professional-theme projectile purple-haze-theme py-autopep8 pycomplete pydoc pydoc-info pyenv-mode pytest python-environment python-mode python-pep8 pythonic pyvenv quelpa railscasts-theme rainbow-delimiters rainbow-mode recentf-ext redo+ request restart-emacs reverse-theme s seq seti-theme shell-command simple-httpd skewer-mode smartparens smartrep smeargle smooth-scroll smooth-scrolling smyx-theme soft-charcoal-theme soft-morning-theme soft-stone-theme solarized-theme soothe-theme spacegray-theme spaceline spacemacs-theme spinner spotify spray sr-speedbar subatomic-theme subatomic256-theme sublime-themes sunny-day-theme swiper switch-window tabbar tango-2-theme tango-plus-theme tangotango-theme tao-theme tern toc-org toxi-theme tronesque-theme twilight-anti-bright-theme twilight-bright-theme twilight-theme ujelly-theme unbound underwater-theme undo-tree unfill use-package uuidgen vi-tilde-fringe virtualenvwrapper vline volatile-highlights web-beautify websocket which-key window-number window-numbering winum with-editor ws-butler yaml-mode yasnippet zen-and-art-theme zenburn-theme zencoding-mode zonokai-theme)))
 '(paradox-github-token t)
 '(puppet-indent-level tab-width)
 '(ruby-indent-level tab-width)
 '(show-paren-delay 0)
 '(slime-repl-enable-presentations t)
'(speedbar-frame-parameters
(quote
 ((minibuffer)
  (width . 40)
  (border-width . 0)
  (menu-bar-lines . 0)
  (tool-bar-lines . 0)
  (unsplittable . t)
  (left-fringe . 0))))
 '(speedbar-show-unknown-files t)
 '(tab-width 4)
 '(visual-line-mode nil t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-scrollbar-bg ((t (:background "green"))))
 '(company-scrollbar-fg ((t (:background "green"))))
 '(company-tooltip ((t (:inherit default :background "skyblue"))))
 '(company-tooltip-common ((t (:inherit font-lock-constant-face :background "black"))))
 '(company-tooltip-selection ((t (:inherit font-lock-function-name-face :background "black" :foreground "yellow"))))
 '(font-lock-comment-face ((t (:foreground "tan"))))
 '(header-line ((t (:inherit mode-line :background "blue3" :foreground "#eab700" :box (:line-width 4 :color "orange") :weight extra-bold :height 130 :width normal))))
 '(hl-line ((t (:background "dark blue"))))
 '(icicle-complete-input ((t (:foreground "#B19E6A64B19E" :weight bold))))
 '(ido-subdir ((t (:foreground "light green"))))
 '(one-key-keystroke ((t (:foreground "light green"))))
 '(region ((t (:background "sky blue"))))
 '(slime-repl-inputed-output-face ((t (:foreground "CadetBlue1")))))
