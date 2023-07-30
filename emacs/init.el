;; You will most likely need to adjust this font size for your system!
(defvar runemacs/default-font-size 180)

(setq inhibit-startup-message t)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(tooltip-mode -1)           ; Disable tooltips
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

;; Set up the visible bell
(setq visible-bell t)

;; set transparency
(set-frame-parameter (selected-frame) 'alpha '(85 85))
(add-to-list 'default-frame-alist '(alpha 85 85))

(set-face-attribute 'default nil :font "JetBrainsMono Nerd Font" :height runemacs/default-font-size)

;;No Backup
(setq make-backup-files nil)

;; Make ESC quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

;; Initialize package sources
(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Initialize use-package on non-Linux platforms
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;;set UTF-8 encoding
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(use-package command-log-mode)

(use-package ivy
  :diminish
  :bind (("C-s" . swiper)
         :map ivy-minibuffer-map
         ("TAB" . ivy-alt-done)
         ("C-l" . ivy-alt-done)
         ("C-j" . ivy-next-line)
         ("C-k" . ivy-previous-line)
         :map ivy-switch-buffer-map
         ("C-k" . ivy-previous-line)
         ("C-l" . ivy-done)
         ("C-d" . ivy-switch-buffer-kill)
         :map ivy-reverse-i-search-map
         ("C-k" . ivy-previous-line)
         ("C-d" . ivy-reverse-i-search-kill))
  :config
  (ivy-mode 1))

;; NOTE: The first time you load your configuration on a new machine, you'll
;; need to run the following command interactively so that mode line icons
;; display correctly:
;;
;; M-x all-the-icons-install-fonts

(use-package all-the-icons)

(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :custom ((doom-modeline-height 15)))

(use-package doom-themes
  :init (load-theme 'doom-ir-black t))

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package which-key
  :init (which-key-mode)
  :diminish which-key-mode
  :config
  (setq which-key-idle-delay 1))

(use-package ivy-rich
  :init
  (ivy-rich-mode 1))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
         ("C-x b" . counsel-ibuffer)
         ("C-x C-f" . counsel-find-file)
         :map minibuffer-local-map
         ("C-r" . 'counsel-minibuffer-history)))

(use-package helpful
  :custom
  (counsel-describe-function-function #'helpful-callable)
  (counsel-describe-variable-function #'helpful-variable)
  :bind
  ([remap describe-function] . counsel-describe-function)
  ([remap describe-command] . helpful-command)
  ([remap describe-variable] . counsel-describe-variable)
  ([remap describe-key] . helpful-key))

(use-package general
  :config
  (general-create-definer rune/leader-keys
    :keymaps '(normal insert visual emacs)
    :prefix "SPC"
    :global-prefix "C-SPC")

  (rune/leader-keys
    "t"  '(:ignore t :which-key "toggles")
    "tt" '(counsel-load-theme :which-key "choose theme")))

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  :config
  (evil-mode 1)
  (define-key evil-insert-state-map (kbd "C-g") 'evil-normal-state)
  (define-key evil-insert-state-map (kbd "C-h") 'evil-delete-backward-char-and-join)

  ;; Use visual line motions even outside of visual-line-mode buffers
  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (evil-set-initial-state 'messages-buffer-mode 'normal)
  (evil-set-initial-state 'dashboard-mode 'normal))

(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))

(use-package hydra)

(defhydra hydra-text-scale (:timeout 4)
  "scale text"
  ("j" text-scale-increase "in")
  ("k" text-scale-decrease "out")
  ("f" nil "finished" :exit t))

(rune/leader-keys
  "ts" '(hydra-text-scale/body :which-key "scale text"))

;;LSP mode
(use-package lsp-mode
  :hook (((rust-mode
           c-mode
           c++-mode
           elixir-mode
           clojure-mode
           clojurec-mode
           clojurescript-mode)
          . lsp)
         (lsp-mode . yas-minor-mode))
  :custom-face
  (lsp-modeline-code-actions-face ((t (:inherit mode-line))))
  :custom
  ;; general settings
  (lsp-keymap-prefix "C-c l")
  (lsp-completion-provider :capf)
  (lsp-diagnostics-provider :flycheck)
  (lsp-session-file (expand-file-name ".lsp-session" user-emacs-directory))
  (lsp-log-io nil)
  (lsp-keep-workspace-alive nil)
  ;; DAP
  (lsp-enable-dap-auto-configure nil)
  ;; UI
  (lsp-enable-links nil)
  (lsp-headerline-breadcrumb-enable nil)
  ;; semantic code features
  (lsp-enable-folding nil)
  (lsp-enable-indentation nil)
  (lsp-enable-semantic-highlighting nil)
  (lsp-enable-symbol-highlighting t)
  ;; completion
  (lsp-completion-show-kind nil)
  ;; lens
  (lsp-lens-enable t)
  (lsp-lens-place-position 'end-of-line)
  ;; rust
  (lsp-rust-clippy-preference "on")
  (lsp-rust-server 'rust-analyzer))

;;Company-mode
(use-package company
  :bind (:map company-mode-map
              ([remap completion-at-point] . company-complete)
              ;; ([remap indent-for-tab-command] . company-indent-or-complete-common)
              ("M-/" . company-complete)
              :map company-active-map
              ("TAB" . company-complete-common-or-cycle)
              ("<tab>" . company-complete-common-or-cycle)
              ("<S-Tab>" . company-select-previous)
              ("<backtab>" . company-select-previous)
              ("C-n" . company-select-next)
              ("C-p" . company-select-previous)
              ("C-d" . company-show-doc-buffer)
              ("M-." . company-show-location))
  :hook (after-init . global-company-mode)
  :custom
  ;; (tab-always-indent 'complete)
  ;; (tab-first-completion 'word-or-paren-or-punct)
  (company-idle-delay 0)
  (company-require-match 'never)
  (company-minimum-prefix-length 2)
  (company-tooltip-align-annotations t)
  (company-frontends '(company-pseudo-tooltip-unless-just-one-frontend
                       company-preview-frontend
                       company-echo-metadata-frontend))
  (company-backends '(company-capf company-files company-dabbrev-code))
  (company-tooltip-minimum-width 30)
  (company-tooltip-maximum-width 120)
  ;; (company-format-margin-function nil)
  )

(use-package company-box
  :hook (company-mode . company-box-mode))

;;LSP Ui
(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :bind (:map lsp-ui-mode-map
              ("M-." . lsp-ui-peek-find-definitions)
              ("M-S-." . lsp-ui-peek-find-references))
  :custom
  (lsp-ui-doc-border (face-attribute 'window-divider :foreground))
  (lsp-ui-sideline-enable 2)
  (lsp-ui-doc-enable nil)
  (lsp-ui-imenu-enable t)
  (lsp-ui-doc-delay 2 "higher than eldoc delay")
  (lsp-ui-doc-max-width 1000)
  (lsp-ui-doc-show-with-cursor nil)
  (lsp-ui-doc-show-with-mouse t)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-enhanced-markdown nil)
  :custom-face
  (lsp-ui-peek-highlight ((t (:foreground unspecified
					  :background unspecified
					  :box unspecified
					  :inherit lsp-face-highlight-textual))))
  :config
  (when (fboundp #'aorst/escape)
    (define-advice lsp-ui-doc--make-request (:around (foo) aorst:hide-lsp-ui-doc)
      (unless (eq this-command 'aorst/escape)
        (funcall foo))))
  (lsp-ui-mode))

(use-package lsp-ivy)

;;Flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(defvar-local aorst--mode-line-lsp "")

(defun aorst/mode-line-update-lsp (&rest _)
  (setq aorst--mode-line-lsp
        (concat "  "
                (if-let ((workspaces (lsp-workspaces)))
                    (propertize "LSP" 'help-echo "LSP Connected")
                  (propertize "LSP" 'help-echo "LSP Disconnected")))))

(add-hook 'lsp-before-initialize-hook #'aorst/mode-line-update-lsp)
(add-hook 'lsp-after-initialize-hook #'aorst/mode-line-update-lsp)
(add-hook 'lsp-after-uninitialized-functions #'aorst/mode-line-update-lsp)
(add-hook 'lsp-before-open-hook #'aorst/mode-line-update-lsp)
(add-hook 'lsp-after-open-hook #'aorst/mode-line-update-lsp)

;;Treesitter
(use-package tree-sitter
  :config
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))
(use-package tree-sitter-langs
  :ensure t)

;;Commenting Line
(use-package evil-nerd-commenter
  :bind ("M-/" . evilnc-comment-or-uncomment-lines))

;;Rust Mode
(use-package rust-mode
  :hook (rust-mode . lsp-deferred))
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(setq rust-format-on-save t)
(add-hook 'rust-mode-hook
          (lambda () (prettify-symbols-mode)))

;;C/C++
(add-hook 'c-mode 'lsp)
(add-hook 'c++-mode 'lsp)
