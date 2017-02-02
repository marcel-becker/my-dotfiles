;;; Add the code below to your ~/.emacs.d/init.el to load 
;;; the shared version of the init file.
;;;
(defvar marcel-lisp-dir
(if (eq system-type 'windows-nt)      ; Windows
    (cond ((file-exists-p "C:/Dropbox/.emacs.d")
          "C:/Dropbox/.emacs.d")
          ((file-exists-p "D:/Dropbox/.emacs.d")
           "D:/Dropbox/.emacs.d")
          (t
           (expand-file-name "~/.emacs.d")))
  (cond ((file-exists-p  "~/Dropbox/.emacs.d")
         "~/Dropbox/.emacs.d")
        (t
         (expand-file-name "~/.emacs.d"))))
"Address of Marcel's lisp libraries.")

(setq user-init-file (expand-file-name "init.el" marcel-lisp-dir))
(if (not (eq user-init-file (expand-file-name "~/.emacs.d")))
    (load-file user-init-file))
