;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'catppuccin)
;; default catppuccin theme is mocha
;; (setq catppuccin-flavor 'mocha) ;; or 'latte, 'macchiato, or 'mocha
;; (catppuccin-reload)
;; (setq doom-font 'MesloLGSNerdFontMono)
(setq doom-font (font-spec :family "MesloLGS Nerd Font Mono" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "MesloLGS Nerd Font Mono") ; inherits `doom-font''s :size
      doom-unicode-font (font-spec :family "MesloLGS Nerd Font Mono" :size 12)
      doom-big-font (font-spec :family "MesloLGS Nerd Font Mono" :size 19))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq-default tab-width 4)


(global-auto-revert-mode t)

(setq shell-file-name (executable-find "zsh"))

(setq-default vterm-shell (executable-find "zsh"))
(setq-default explicit-shell-file-name (executable-find "zsh"))
(setq display-line-numbers-type t)


(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; global activation of the unicode symbol completion
;; (add-to-list 'company-backends 'company-math-symbols-unicode)
(add-to-list 'company-backends 'company-math-symbols-latex)
(add-to-list 'company-backends 'company-latex-commands)



;; accept completion from copilot and fallback to company

;; (use-package! copilot
;;   :hook (prog-mode . copilot-mode)
;;   :bind (:map copilot-completion-map
;;               ;; ("C-<tab>" . 'copilot-accept-completion)
;;               ;; ("C-TAB" . 'copilot-accept-completion)))
;;               ("C-TAB" . 'copilot-accept-completion-by-word)
;;               ("C-<tab>" . 'copilot-accept-completion-by-word)))

;; (add-to-list 'warning-suppress-types '(copilot copilot-no-mode-indent))


(define-key global-map (kbd "C-g") (make-sparse-keymap))
(use-package! magit
  :bind (
         ("C-g s" . 'magit-stage-modified)
         ("C-g c" . 'magit-commit)
         ("C-g p" . 'magit-push)
         ))


;;
(use-package! org-bullets-mode
  :hook (org-mode . org-bullets-mode))

(use-package! centered-window
  :bind ("M-o" . 'centered-window-mode))


(use-package! evil
  :bind ("C->" . 'evil-window-increase-width))

(use-package! evil
  :bind ("C-<" . 'evil-window-decrease-width))

(use-package! org-roam
  ;; :ensure t
  ;; :init
  ;; (setq org-roam-v2-ack t)
  ;; (after-init . 'org-roam-mode)
  :custom
  (org-roam-directory "~/Documents/roam")
  (org-roam-completion-everywhere t)
  :bind (("C-c n l" . 'org-roam-buffer-toggle)
         ("C-c n f" . 'org-roam-node-find)
         ("C-c n g" . 'org-roam-graph)
         ("C-c n i" . 'org-roam-node-insert)
         :map org-mode-map
         ("C-M-i" . 'completion-at-point))

  ;; :bind (:map org-roam-mode-map
  ;;             (("C-c n l" . org-roam)
  ;;              ("C-c n f" . org-roam-find-file)
  ;;              ("C-c n g" . org-roam-graph))
  ;;             :map org-mode-map
  ;;             (("C-c n i" . org-roam-insert))
  ;;             (("C-c n I" . org-roam-insert-immediate)))
  :config
  (org-roam-setup))
