;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
;(package-initialize)

(setq use-spacemacs nil)   ; or nil

(when use-spacemacs
  (setq user-emacs-directory
        (if (eq system-type 'windows-nt)      ; Windows
            (cond ((file-exists-p "C:/Dropbox/.spacemacs.d")
                   "C:/Dropbox/.spacemacs.d/")
                  ((file-exists-p "D:/Dropbox/.spacemacs.d")
                   "D:/Dropbox/.spacemacs.d/")
                  (t
                   (expand-file-name "~/.spacemacs.d")))
          (cond ((file-exists-p  "~/Dropbox/.spacemacs.d")
                 "~/Dropbox/.spacemacs.d/")
                (t
                 (expand-file-name "~/.spacemacs.d/")))))
  (setq spacemacs-start-directory user-emacs-directory
        marcel-lisp-dir user-emacs-directory)
  (if (file-exists-p (expand-file-name "init.el" user-emacs-directory))
      (load (expand-file-name "init.el" user-emacs-directory))))


;;; Add the code below to your ~/.emacs.d/init.el to load the shared version of the
;;; init file.
;;;
(unless use-spacemacs
(defvar marcel-lisp-dir
  (if (eq system-type 'windows-nt)      ; Windows
    (cond ((file-exists-p "C:/Dropbox/.emacs.d")
          "C:/Dropbox/.emacs.d/")
          ((file-exists-p "D:/Dropbox/.emacs.d")
           "D:/Dropbox/.emacs.d/")
          (t
           (expand-file-name "~/.emacs.d")))
  (cond ((file-exists-p  "~/Dropbox/.emacs.d")
         "~/Dropbox/.emacs.d/")
        (t
         (expand-file-name "~/.emacs.d/"))))
"Address of Marcel's lisp libraries.")

(setq user-init-file (expand-file-name "init.el" marcel-lisp-dir))
(if (not (eq user-init-file (expand-file-name "~/.emacs.d")))
    (load-file user-init-file)))
