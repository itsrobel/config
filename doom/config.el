;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-
(setq shell-file-name (executable-find "bash"))

(setq-default vterm-shell (executable-find "fish"))
(setq-default explicit-shell-file-name (executable-find "fish"))
;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
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
(setq doom-theme 'doom-dracula)
(setq doom-font (font-spec :family "Noto Sans Mono" :size 12 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 13))



;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

(global-auto-revert-mode t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")
(setq-default tab-width 4)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
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
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; global activation of the unicode symbol completion
(add-to-list 'company-backends 'company-math-symbols-unicode)
(add-to-list 'company-backends 'company-math-symbols-latex)
(add-to-list 'company-backends 'company-latex-commands)



;; accept completion from copilot and fallback to company

(use-package! copilot
  :hook (prog-mode . copilot-mode)
  :bind (:map copilot-completion-map
              ;; ("C-<tab>" . 'copilot-accept-completion)
              ;; ("C-TAB" . 'copilot-accept-completion)))
              ("C-TAB" . 'copilot-accept-completion-by-word)
              ("C-<tab>" . 'copilot-accept-completion-by-word)))

(add-to-list 'warning-suppress-types '(copilot copilot-no-mode-indent))


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

