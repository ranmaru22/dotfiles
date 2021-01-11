;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; User config
(setq user-full-name "Alex Sun"
      user-mail-address "alexsun82@icloud.com")

;; Default window sizing
(setq initial-frame-alist '((top . 10) (left . 10) (width . 148) (height . 42)))

;; Fonts
(setq doom-font                (font-spec :family "LigaLex Mono" :size 14)
      doom-big-font            (font-spec :family "LigaLex Mono" :size 24)
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
      display-line-numbers-type 'relative)

;; Directories
(setq org-directory "~/Documents/org/"
      projectile-project-search-path '("~/Code/")
      racer-rust-src-path "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/library")

;; Keybindings
(map! :leader
      :desc "Clear search" "s c" #'evil-ex-nohighlight)

(map! :leader
      :desc "HyperSpec lookup" "h h" #'hyperspec-lookup)

(map! :leader
      (:prefix-map ("e" . "edwina")
       :desc "Next window" "n" #'edwina-select-next-window
       :desc "Prev window" "p" #'edwina-select-previous-window
       :desc "Swap next window" "N" #'edwina-swap-next-window
       :desc "Swap prev window" "P" #'edwina-swap-previous-window
       :desc "Zoom window" "RET" #'edwina-zoom
       :desc "Arrange windows" "r" #'edwina-arrange
       :desc "Increase Master size" "]" #'edwina-inc-mfact
       :desc "Decrease Master size" "[" #'edwina-dec-mfact
       :desc "Increase Master win number" "i" #'edwina-inc-nmaster
       :desc "Decrease Master win number" "d" #'edwina-dec-nmaster
       :desc "Clone window" "c" #'edwina-clone-window
       :desc "Delete window" "k" #'edwina-delete-window))

;; Org-mode tweaks
(setq org-hide-emphasis-markers t)

;; Make buffer names unique
(setq uniquify-buffer-name-style 'forward)

;; Custom filetype associations
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))

;; Don't use vi mode in terms
(evil-set-initial-state 'vterm-mode 'emacs)

;; Package config
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

(after! git-gutter-fringe
  (fringe-mode '8))
