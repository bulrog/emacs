
;; Missing function in git emacs
(defun plist-to-alist (p)
  (if (empty? p)
    p
    (let (( c (cons (car p) (cadr p))))
      (cons c (plist-to-alist (cddr p)))
      )))

(require 'package)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/") t)
(package-initialize)

(defun extend-exec-path (s)
  (setenv "PATH" (concat (getenv "PATH") (concat ":" s)))
  (setq exec-path (append exec-path (list s))))

(extend-exec-path "/usr/local/bin")

(add-to-list 'load-path "~/.emacs.d/vendor")

(when (file-exists-p ".passwords") (load ".passwords"))

(load "snamellit/lisp")
(load "snamellit/global")
(load "snamellit/defuns")
(load "snamellit/bindings")
(load "snamellit/modes")
(load "snamellit/theme")
(load "snamellit/temp_files")
(load "snamellit/coffee")
(load "snamellit/yasnippet-bundle")
(load "snamellit/groovy")
(load "snamellit/gnus")
(load "snamellit/rcirc")
(load "snamellit/org-mode")

(print "Loading settings done.")

(when (file-exists-p "snamellit/private")
  (load "snamellit/private"))


(print "Loading vendor extensions")

;;(vendor 'ack)
(vendor 'cheat)
;; (vendor 'magit)
(vendor 'growl)
;; (vendor 'twittering-mode)
(vendor 'textile-mode)
;; (vendor 'yaml-mode)
(vendor 'tpl-mode)
(vendor 'open-file-in-github)
;;(vendor 'js2-mode)
;;(vendor 'coffee-mode)
;;(vendor 'clojure-mode)
;;(vendor 'xml-rpc)
;;(vendor 'org2blog)
(vendor 'org-jira)
;;(vendor 'feature-mode)

; github support is more modular these days
;;(vendor 'logito)
;;(vendor 'pcache)
;;(vendor 'gh)
;;(vendor 'gist)

(print "Loading vendor extensions done")

(print "Loading snippets")

(setq yas/root-directory "~/.emacs.d/snamellit/snippets")
(yas/load-directory yas/root-directory)
(print "Snippets done")

; custom place to save customizations
(setq custom-file "~/.emacs.d/snamellit/custom.el")
(when (file-exists-p custom-file) (load custom-file))
(print "Customization done")
