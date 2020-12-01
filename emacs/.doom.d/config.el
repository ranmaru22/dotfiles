;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Alex Sun"
      user-mail-address "alexsun82@icloud.com")

;; Default window sizing
(setq initial-frame-alist '((top . 1) (left . 1) (width . 164) (height . 46)))

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "IBM Plex Mono" :size 14)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 14))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

(setq +doom-dashboard-banner-dir "~/.doom.d/splash"
      +doom-dashboard-banner-file "doom.png")

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Documents/org/")

;; Other config
(setq projectile-project-search-path '("~/Code/"))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Face adjustments
(custom-set-faces!
  '(font-lock-keyword-face       :weight bold)
  '(font-lock-function-name-face :weight bold)
  '(font-lock-comment-face       :slant italic)
  ;; Language specific
  `(js2-jsdoc-tag                :foreground ,(doom-color 'blue) :slant italic)
  '(css-selector                 :weight bold))

;; Custom package config
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

(global-git-gutter-mode t)

(global-prettify-symbols-mode t)

(setq doom-themes-treemacs-enable-variable-pitch nil)

;; Unbdind the unholy fuckery that is using SPC as a leader key and put
;; the functionality into a sane place where it belongs: behind C-c. :X
;; (setq doom-leader-key "<f13>"
;;       doom-localleader-key "<f14>")
;; (map! :map general-override-mode-map
;;       :nvm "C-c" #'doom/leader)

(setq racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/library")

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
