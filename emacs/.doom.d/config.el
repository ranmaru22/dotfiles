;;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;;; User config
(setq user-full-name "Alex Sun"
      user-mail-address "alexsun82@icloud.com")

;;; Default window sizing
(setq initial-frame-alist '((top . 10) (left . 10) (width . 148) (height . 46)))

;;; Fonts
(setq doom-font                (font-spec :family "Sarasa Term J" :size 14)
      doom-big-font            (font-spec :family "Sarasa Term J" :size 24)
      doom-variable-pitch-font (font-spec :family "Sarasa UI J" :size 14))

;;; Theme & visuals a
(setq doom-theme 'doom-one)

(custom-set-faces!
  '(font-lock-keyword-face :weight bold)
  '(font-lock-comment-face :slant italic)
  ;; Language specific
  `(js2-jsdoc-tag :foreground ,(doom-color 'blue) :slant italic)
  '(css-selector  :weight bold))

(setq +doom-dashboard-banner-dir  "~/.doom.d/splash"
      +doom-dashboard-banner-file "doom.png")

(setq doom-themes-treemacs-enable-variable-pitch nil
      display-line-numbers-type 'relative)

;;; Directories
(setq org-directory                  "~/Documents/org/"
      org-roam-directory             "~/Documents/org/roam"
      projectile-project-search-path '("~/Code/")
      racer-rust-src-path            "~/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/library")

;;; Useful functions
(defun my/insert-date ()
  "Inserts the current date and time."
  (interactive "*")
  (insert (format-time-string "%a %d %b %H:%M:%S %Y")))

(defun my/insert-github-dotfiles-repo ()
  "Inserts a link to my dotfiles repo."
  (interactive "*")
  (insert "https://github.com/ranmaru22/dotfiles"))

;;; Small tweaks
;; org-mode tweaks
(setq org-hide-emphasis-markers t)

;; Make buffer names unique
(setq uniquify-buffer-name-style 'forward)

;; Custom filetype associations
(add-to-list 'auto-mode-alist '("\\.mdx\\'" . markdown-mode))

;;; Keybindings
(map! "C-x w" #'ace-window)

(map! :leader
      :desc "Clear search" "s c" #'evil-ex-nohighlight)

(map! :leader
      :desc "Current date and time" "i d" #'my/insert-date
      :desc "Link to dotfiles repo" "i g" #'my/insert-github-dotfiles-repo)

(map! :leader
      :desc "HyperSpec lookup"  "h h" #'sly-hyperspec-lookup
      :desc "describe−function" "h f" #'helpful-function)

;; One-key window switching
(map! "s-n" #'evil-window-next
      "s-p" #'evil-window-prev
      "s-J" #'evil-window-down
      "s-K" #'evil-window-up
      "s-H" #'evil-window-left
      "s-L" #'evil-window-right)

;; Easy Lisp s-expression navigation
(map! :map smartparens-mode-map
      ;; Navigating
      :nvie "C-M-f" #'sp-forward-sexp
      :nvie "C-M-b" #'sp-backward-sexp
      :nvie "C-M-u" #'sp-backward-up-sexp
      :nvie "C-M-d" #'sp-down-sexp
      ;; Modifying
      :nie  "M-s"   #'sp-split-sexp
      :nie  "M-j"   #'sp-join-sexp
      :nie  "M-c"   #'sp-convolute-sexp
      :nvie "C->"   #'sp-forward-slurp-sexp
      :nvie "C-<"   #'sp-forward-barf-sexp
      :nvie "C-}"   #'sp-backward-slurp-sexp
      :nvie "C-{"   #'sp-backward-barf-sexp)

;;; Package config
(use-package! doom-modeline
  :ghook ('after-init-hook 'doom-modeline-init)
  :init
  (setq doom-modeline-major-mode-icon nil
        doom-modeline-persp-name t
        doom-modeline-persp-icon nil
        doom-modeline-buffer-file-name-style 'relative-to-project))

(use-package! evil
  :custom
  evil-disable-insert-state-bindings t)

(use-package! tree-sitter
  :config
  (require 'tree-sitter-langs)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

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

;;; IRC Settings
(use-package! erc
  :custom
  (erc-nick '("Ranmaru" "Rankun" "Ran_kun"))
  (erc-prompt-for-password nil)
  (erc-prompt-for-nickserv-password nil)
  (erc-rename-buffers t)
  (erc-input-line-position -1)
  (erc-fill-column 70)
  (erc-autojoin-timing 'ident)
  (erc-lurker-hide-list '("JOIN" "PART" "QUIT"))
  (erc-track-exclude-types '("JOIN" "PART" "NICK" "MODE" "QUIT"))
  :config
  (erc-scrolltobottom-enable)
  (add-to-list 'erc-modules 'spelling)
  (erc-services-mode 1)
  (erc-update-modules))

(defun my/erc-late-identify ()
  "Identifies to an IRC server, pulling auth details from authinfo or netrc.
   Useful if the default auth behaviour is too fast and the server's NickServ
   doesn't pick it up."
  (interactive)
  (let* ((server-name (buffer-name))
         (secret (plist-get (car (auth-source-search :max 1
                                                     :host erc-server
                                                     :user (erc-current-nick)
                                                     :port server-name))
                            :secret))
         (password (if (functionp secret)
                       (funcall secret)
                     secret)))
    (erc-message "PRIVMSG" (concat "NickServ identify" " " password) nil)))
