;;; prelude-ui.el --- Emacs Prelude: UI optimizations and tweaks.
;;
;; Copyright © 2011-2025 Bozhidar Batsov
;;
;; Author: Bozhidar Batsov <bozhidar@batsov.com>
;; URL: https://github.com/bbatsov/prelude

;; This file is not part of GNU Emacs.

;;; Commentary:

;; We dispense with most of the point and click UI, reduce the startup noise,
;; configure smooth scolling and a nice theme that's easy on the eyes (zenburn).

;;; License:

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 3
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Code:

;; the toolbar is just a waste of valuable screen estate
;; in a tty tool-bar-mode does not properly auto-load, and is
;; already disabled anyway
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))

(when prelude-minimalistic-ui
  (menu-bar-mode -1))

;; the blinking cursor is nothing, but an annoyance
(blink-cursor-mode -1)

;; disable the annoying bell ring
(setq ring-bell-function 'ignore)

;; disable startup screen
(setq inhibit-startup-screen t)

;; nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; mode line settings
(line-number-mode t)
(column-number-mode t)
(size-indication-mode t)

;; show line numbers at the beginning of each line
(unless prelude-minimalistic-ui
  ;; there's a built-in linum-mode, but we're using
  ;; display-line-numbers-mode or nlinum-mode,
  ;; as it's supposedly faster
  (if (fboundp 'global-display-line-numbers-mode)
      (global-display-line-numbers-mode)
    (global-nlinum-mode t)))

;; enable y/n answers
(fset 'yes-or-no-p 'y-or-n-p)

;; more useful frame title, that show either a file or a
;; buffer name (if the buffer isn't visiting a file)
(setq frame-title-format
      '("" invocation-name " Prelude - " (:eval (if (buffer-file-name)
                                            (abbreviate-file-name (buffer-file-name))
                                          "%b"))))

;; use zenburn as the default theme
(when prelude-theme
  (load-theme prelude-theme t))


;; NOTE(@lerax): dom 01 jun 2025 12:42:24
;; helm-descbinds became incompatible with which-key-mode ins 202402XX version
;; Using prelude, calling which-key-mode as hook in
;; server-after-make-frame-hook crash terminal daemoned session
;; this function prevents to this happen
(defun prelude-safe-which-key-mode ()
  (condition-case err
      (which-key-mode +1)
    (error
     (let ((error-message (cadr err)))
       (with-temp-message "" ;; don't print to minibuffer
         (message "[Prelude] bypass error: %s" error-message))))))

;; show available keybindings after you start typing
;; add to hook when running as a daemon as a workaround for a
;; which-key bug
;; https://github.com/justbur/emacs-which-key/issues/306
(if (daemonp)
    (add-hook 'server-after-make-frame-hook #'prelude-safe-which-key-mode)
  (prelude-safe-which-key-mode))

(provide 'prelude-ui)
;;; prelude-ui.el ends here
