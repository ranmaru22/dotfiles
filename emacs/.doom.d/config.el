;;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; User config
(setq user-full-name "Alex Sun"
      user-mail-address "alexsun82@icloud.com")

;;; Default window sizing
(setq initial-frame-alist '((top . 10) (left . 10) (width . 148) (height . 46)))

;;; Fonts
(setq doom-font                (font-spec :family "JetBrains Mono" :size 14)
      doom-big-font            (font-spec :family "JetBrains Mono" :size 24)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans"  :size 14))

;;; Theme & visuals a
(setq doom-theme 'doom-one)

(custom-set-faces!
  '(font-lock-keyword-face :weight bold)
  '(font-lock-comment-face :slant italic)
  ;; Language specific
  `(js2-jsdoc-tag :foreground ,(doom-color 'blue) :slant italic)
  '(css-selector  :weight bold))

(setq +doom-dashboard-banner-dir "~/.doom.d/splash"
      +doom-dashboard-banner-file "doom.png")

(setq doom-themes-treemacs-enable-variable-pitch nil
      display-line-numbers-type 'relative)

;;; Directories
(setq org-directory "~/Documents/org/"
      org-roam-directory "~/Documents/org/roam"
      projectile-project-search-path '("~/Code/")
      racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/library")

;;; Keybindings
(map! "C-x w" #'ace-window)

(map! :leader
      :desc "Clear search" "s c" #'evil-ex-nohighlight)

(map! :leader
      :desc "HyperSpec lookup"  "h h" #'sly-hyperspec-lookup
      :desc "describe−function" "h f" #'helpful-function)

(map! "s-n" #'(lambda () (interactive) (other-window 1))
      "s-p" #'(lambda () (interactive) (other-window -1)))

(map! :map (lisp-mode-map emacs-lisp-mode-map)
      :g "C-c C-l"   #'sp-forward-slurp-sexp
      :g "C-c C-h"   #'sp-backward-slurp-sexp
      :g "C-c C-S-l" #'sp-forward-barf-sexp
      :g "C-c C-S-h" #'sp-backward-barf-sexp)

(map! :leader
      (:prefix-map ("e" . "edwina")
       :desc "Next window"                "n"   #'edwina-select-next-window
       :desc "Prev window"                "p"   #'edwina-select-previous-window
       :desc "Swap next window"           "N"   #'edwina-swap-next-window
       :desc "Swap prev window"           "P"   #'edwina-swap-previous-window
       :desc "Zoom window"                "RET" #'edwina-zoom
       :desc "Arrange windows"            "r"   #'edwina-arrange
       :desc "Increase Master size"       "]"   #'edwina-inc-mfact
       :desc "Decrease Master size"       "["   #'edwina-dec-mfact
       :desc "Increase Master win number" "i"   #'edwina-inc-nmaster
       :desc "Decrease Master win number" "d"   #'edwina-dec-nmaster
       :desc "Clone window"               "c"   #'edwina-clone-window
       :desc "Delete window"              "k"   #'edwina-delete-window))

;;; Small tweaks
;; crg-mode tweaks
(setq org-hide-emphasis-markers t)

;; Make buffer names unique
(setq uniquify-buffer-name-style 'forward)

;; Custom filetype associations
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))

;; Don't use vi mode in terms
(evil-set-initial-state 'vterm-mode 'emacs)
(evil-set-initial-state 'erc-mode 'emacs)

;;; Package config
(use-package! evil
  :custom
  evil-disable-insert-state-bindings t)

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package! edwina
  :config
  (setq display-buffer-base-action '(display-buffer-below-selected))
  (edwina-mode 1))

(use-package! ivy
  :bind (("C-s" . swiper)))

(use-package! company
  :hook (company-mode . company-box-mode)
  :bind
  (:map company-active-map
   ("<tab>" . company-complete-selection))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0)
  (company-quickhelp))

(use-package! doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))

(use-package! web-mode
  :config
  ;; Disable symbols list in favour of ligatures.
  (setq web-mode-prettify-symbols-alist '()))

(after! git-gutter-fringe
  (fringe-mode '8))
