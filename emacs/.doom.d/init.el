;;; init.el -*- lexical-binding: t; -*-

;; Packages
(doom! :input
       ;;chinese
       ;;japanese
       ;;layout            ; auie,ctsrnm is the superior home row

       :completion
       company           ; the ultimate code completion backend
       ivy               ; a search engine for love and life

       :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       ;;fill-column       ; a `fill-column' indicator
       hl-todo           ; highlight TODO/FIXME/NOTE/DEPRECATED/HACK/REVIEW
       ligatures         ; ligatures and symbols to make your code pretty again
       ;;minimap           ; show a map of the code on the side
       modeline          ; snazzy, Atom-inspired modeline, plus API
       ophints           ; highlight the region an operation acts on
       (popup +defaults) ; tame sudden yet inevitable temporary windows
       treemacs          ; a project drawer, like neotree but cooler
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       workspaces        ; tab emulation, persistence & separate workspaces
       ;;zen               ; distraction-free coding or writing

       :editor
       (evil +everywhere); come to the dark side, we have cookies
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       ;;(format +onsave)  ; automated prettiness
       multiple-cursors  ; editing in many places at once
       snippets          ; my elves. They type so I don't have to
       ;;word-wrap         ; soft wrapping with language-aware indent

       :emacs
       (dired +icons)    ; making dired pretty [functional]
       electric          ; smarter, keyword-based electric-indent
       undo              ; persistent, smarter undo for your inevitable mistakes
       vc                ; version-control and Emacs, sitting in a tree

       :term
       eshell            ; the elisp shell that works everywhere
       vterm             ; the best terminal emulation in Emacs

       :checkers
       syntax              ; tasing you for every semicolon you forget
       ;;spell             ; tasing you for misspelling mispelling
       ;;grammar           ; tasing grammar mistake every you make

       :tools
       ;;debugger          ; FIXME stepping through code, to help you add bugs
       ;;direnv
       (eval +overlay)     ; run code, run (also, repls)
       ;;gist              ; interacting with github gists
       lookup              ; navigate your code and its documentation
       (lsp)
       magit             ; a git porcelain for Emacs
       ;;make              ; run make tasks from Emacs
       pdf               ; pdf enhancements
       ;;upload            ; map local to remote projects via ssh/ftp

       :os
       (:if IS-MAC macos)  ; improve compatibility with macOS
       ;;tty               ; improve the terminal Emacs experience

       :lang
       common-lisp       ; if you've seen one lisp, you've seen them all
       (csharp +lsp)     ; unity, .NET, and mono shenanigans
       emacs-lisp        ; drown in parentheses
       json              ; At least it ain't XML
       (javascript +lsp) ; all(hope(abandon(ye(who(enter(here))))))
       ;;latex             ; writing papers in Emacs has never been so fun
       markdown          ; writing docs for people to ignore
       org               ; organize your plain life in plain text
       (python +lsp)     ; beautiful is better than ugly
       (rust +lsp)       ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       (sh +lsp)         ; she sells {ba,z,fi}sh shells on the C xor
       web               ; the tubes
       yaml              ; JSON, but readable

       :email
       ;;(mu4e +gmail)
       ;;notmuch
       ;;(wanderlust +gmail)

       :app
       ;;calendar
       irc               ; how neckbeards socialize
       ;;(rss +org)        ; emacs as an RSS reader

       :config
       ;;literate
       (default +bindings +smartparens))

;; Custom hooks
(use-package-hook! evil
  :pre-init
  (setq evil-respect-visual-line-mode t)
  t)
