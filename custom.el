;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ledger-reports
   (quote
    (("balance" "D:\\Tools\\ledger_3.1.1_win_64_bin\\ledger -f account.ledger bal not Equity")
     ("reg" "D:\\Tools\\ledger_3.1.1_win_64_bin\\ledger -f account.ledger reg")
     ("payee" "D:\\Tools\\ledger_3.1.1_win_64_bin\\ledger -f account.ledger reg @%(payee)")
     ("account" "D:\\Tools\\ledger_3.1.1_win_64_bin\\ledger -f account.ledger reg %(account)")
     ("monthy balance" "D:\\Tools\\ledger_3.1.1_win_64_bin\\ledger -f account.ledger balance --period %(month) ^Income ^Expenses"))))
 '(package-selected-packages
   (quote
    (org-ref pdf-tools key-chord helm-bibtex biblio parsebib biblio-core tablist flycheck-ledger evil-ledger ledger-mode youdao-dictionary yasnippet-snippets yapfify yaml-mode xterm-color xref-js2 ws-butler winum which-key wgrep web-mode web-beautify vue-mode volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org tagedit symon string-inflection spaceline-all-the-icons solarized-theme smex smeargle slim-mode shell-pop scss-mode sass-mode restart-emacs request rainbow-delimiters pyvenv pytest pyenv-mode py-isort pug-mode prettier-js popwin pippel pipenv pip-requirements persp-mode pcre2el password-generator paradox overseer orgit org-present org-pomodoro org-mime org-download org-brain open-junk-file neotree nameless mwim multi-term move-text markdown-toc magit-svn magit-gitflow macrostep lorem-ipsum livid-mode live-py-mode lispy linum-relative link-hint less-css-mode json-navigator json-mode js2-refactor js-doc ivy-yasnippet ivy-xref ivy-purpose ivy-hydra indent-guide importmagic impatient-mode hungry-delete highlight-parentheses highlight-numbers highlight-indentation helm-org-rifle helm-make graphviz-dot-mode google-translate golden-ratio gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy font-lock+ flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-tutor evil-surround evil-org evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-cleverparens evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav editorconfig dumb-jump dotenv-mode diminish deft define-word cython-mode counsel-projectile counsel-css company-web company-tern company-statistics company-anaconda column-enforce-mode color-theme-sanityinc-solarized clean-aindent-mode centered-cursor-mode auto-yasnippet auto-highlight-symbol auto-compile aggressive-indent ace-link ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
