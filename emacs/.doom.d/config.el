;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; User config
(setq user-full-name "Alex Sun"
      user-mail-address "alexsun82@icloud.com")

;; Default window sizing
(setq initial-frame-alist '((top . 1) (left . 1) (width . 164) (height . 46)))

;; Fonts
(setq doom-font (font-spec :family "IBM Plex Mono" :size 14)
      doom-big-font (font-spec :family "IBM Plex Mono" :size 36)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 14))

;; Theme & visuals
(setq doom-theme 'doom-one)

(custom-set-faces!
  '(font-lock-keyword-face       :weight bold)
  '(font-lock-function-name-face :weight bold)
  '(font-lock-comment-face       :slant italic)
  ;; Language specific
  `(js2-jsdoc-tag                :foreground ,(doom-color 'blue) :slant italic)
  '(css-selector                 :weight bold))

(setq +doom-dashboard-banner-dir "~/.doom.d/splash"
      +doom-dashboard-banner-file "doom.png")

(setq doom-themes-treemacs-enable-variable-pitch nil
      vi-tilde-fringe-mode nil
      display-line-numbers-type 'relative)

(global-prettify-symbols-mode t)

;; Directories
(setq org-directory "~/Documents/org/"
      projectile-project-search-path '("~/Code/")
      racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/library")

;; Package config
(use-package! ivy
  :bind (("C-s" . swiper)))

(use-package! company
  :bind
  (:map company-active-map
   ("<tab>" . company-complete-selection))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0))

(use-package! doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic t))
