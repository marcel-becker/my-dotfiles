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
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     common-lisp
     emacs-lisp
     python
     git
     markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '()
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
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
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("DejaVu Sans Mono"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to miminimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
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
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
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
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put any
user code."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
 This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
)

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
    ("60f04e478dedc16397353fb9f33f0d895ea3dab4f581307fbf0aa2f07e658a40" "7e3316825e6cdf7829743c88e66f85743f9665ec7cbb76846e7f00b938fef481" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" "d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" default)))
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
 (holy-mode slime mmm-mode helm-flyspell flycheck-pos-tip diff-hl ranger nil zencoding-mode window-numbering window-number windata which-key websocket volatile-highlights vline virtualenvwrapper vi-tilde-fringe use-package unbound tabbar switch-window swiper sr-speedbar spray spotify spacemacs-theme smooth-scrolling smooth-scroll smeargle smartrep shell-command redo+ recentf-ext rainbow-mode rainbow-delimiters quelpa python-pep8 python-mode pytest pyenv-mode pydoc-info pydoc pycomplete py-autopep8 powerline popwin popup-kill-ring pip-requirements pcre2el paradox page-break-lines open-junk-file nxml-mode nose nginx-mode neotree move-text menu-bar+ markdown-toc magit-gitflow macrostep mac-key-mode lua-mode linum-relative leuven-theme json-rpc json-mode jedi info+ indent-guide idomenu ido-vertical-mode icicles hy-mode hungry-delete highlight-parentheses highlight-numbers hexrgb helm-themes helm-swoop helm-spotify helm-pydoc helm-projectile helm-package helm-mode-manager helm-make helm-ls-git helm-helm-commands helm-gitignore helm-git-files helm-git helm-descbinds helm-c-yasnippet helm-anything helm-ag header2 goto-last-change google-translate golden-ratio gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md fuzzy frame-cmds flycheck flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-leader evil-indent-textobject evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu escreen emacs-eclim elpy elisp-slime-nav dockerfile-mode define-word cython-mode csv-mode company-statistics company-quickhelp company-jedi company-anaconda color-theme-tango clean-aindent-mode buffer-move browse-kill-ring+ autopair auto-yasnippet auto-highlight-symbol auto-dictionary auctex ample-regexps aggressive-indent adaptive-wrap ace-window ace-link ace-flyspell ac-python ac-ispell ac-helm)))
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
