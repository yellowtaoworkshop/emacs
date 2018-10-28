;;  __        __             __   ___
;; |__)  /\  /  ` |__/  /\  / _` |__
;; |    /~~\ \__, |  \ /~~\ \__> |___
;;                      __   ___        ___      ___
;; |\/|  /\  |\ |  /\  / _` |__   |\/| |__  |\ |  |
;; |  | /~~\ | \| /~~\ \__> |___  |  | |___ | \|  |


(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(
			     ("melpa-stable" . "http://mirrors.163.com/elpa/melpa-stable/")
			     ("melpa" . "http://mirrors.163.com/elpa/melpa/")
			     ("gnu" . "http://mirrors.163.com/elpa/gnu/"))))

;; cl - Common Lisp Extension
(require 'cl)


;; ...
(defvar gavin/packages '(
			company
			hungry-delete
			undo-tree
			smooth-scrolling
			popup
			org-beautify-theme
			org
			goto-chg
			evil-surround
			evil-numbers
			evil-matchit
			evil
			async
			helm
			helm-core
			smartparens
			popwin
			) "default package")

(setq package-selected-packages gavin/packages)

(defun gavin/package-installed-p ()
  (loop for pkg in gavin/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (gavin/package-installed-p)
  (message "Refreshing package database..")
  (package-refresh-contents)
  (dolist (pkg gavin/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;;Evil mode
(require 'evil)
(evil-mode 0)
;; load evil plugin
(require 'evil-numbers)
(require 'evil-surround)
(global-evil-surround-mode 1)
(require 'evil-matchit)
(global-evil-matchit-mode 1)


;;
(require 'smooth-scrolling)
(smooth-scrolling-mode 1)
(setq smooth-scroll-margin 3)


;;
(require 'helm-config)
(helm-mode 1)


;; make syntax hilight in org file 
(require 'org)
(setq org-src-fontify-natively t)

(require 'hungry-delete)
(global-hungry-delete-mode 1)

;;turn on auto complete 
(global-company-mode 1)


;; smartparens enable
(smartparens-global-strict-mode t)

;; popwin enable
(require 'popwin)
(popwin-mode 1)


;; the end of file
(provide 'init-packages)
