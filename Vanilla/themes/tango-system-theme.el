;;; tango-system-theme.el --- Tango-based custom theme for faces

;; Copyright (C) 2010-2018 Free Software Foundation, Inc.

;; Authors: Chong Yidong <cyd@stupidchicken>
;;          Jan Moringen <jan.moringen@uni-bielefeld.de>

;; This file is part of GNU Emacs.

;; GNU Emacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; GNU Emacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary

;; The colors in this theme come from the Tango palette, which is in
;; the public domain: http://tango.freedesktop.org/

;;; Code:

(deftheme tango-system
  "Face colors using the Tango palette (dark background).
Basic, Font Lock, Isearch, Gnus, Message, Ediff, Flyspell,
Semantic, and Ansi-Color faces are included.")

(let ((class '((class color) (min-colors 89)))
      ;; Tango palette colors.
      (white "#e2e2e7") (black "#111115") (blue "#0042DD")
      (white-1 "#c2c2c7") (blue-1 "#007AFF") (orange-3 "#ce5c00")
      (choc-1 "#e9b96e") (choc-2 "#c17d11") (choc-3 "#8f5902")
      (cham-1 "#8ae234") (cham-2 "#55aa55") (cham-3 "#4e9a06")
      (blue-1 "#729fcf") (blue-2 "#3465a4") (blue-3 "#204a87")
      (plum-1 "#e090d7") (plum-2 "#75507b") (plum-3 "#5c3566")
      (red-1 "#ef2929")  (red-2 "#cc0000")  (red-3 "#a40000")
      (alum-1 "#eeeeec") (alum-2 "#d3d7cf") (alum-3 "#babdb6")
      (alum-4 "#888a85") (alum-5 "#555753") (alum-6 "#2e3436")
      ;; Not in Tango palette; used for better contrast.
      (cham-0 "#b4fa70") (blue-0 "#8cc4ff") (plum-0 "#e9b2e3")
      (red-0 "#ff4b4b")  (alum-5.5 "#41423f") (alum-7 "#212526"))

  (custom-theme-set-faces
   'tango-system
   `(default ((((class color) (min-colors 4096))
	       (:foreground ,black :background ,white))
	      (((class color) (min-colors 256)))))
   `(cursor ((,class (:background ,blue))))
   `(fringe ((,class (:background ,white-1))))
   `(line-number ((t (:foreground ,black :background ,white-1))))
   `(line-number-current-line ((t (:inherit line-number :foreground ,blue))))
   `(highlight ((,class (:background ,blue))))
   `(evil-ex-lazy-highlight ((,class (:background ,blue))))
   `(lazy-highlight ((,class (:background ,blue))))
   `(region ((,class (:background ,blue-1))))
   `(mode-line ((,class
		 (:box nil
		       :background ,black :foreground ,white))))
   ;; Org 
   `(org-agenda-date ((,class (:foreground ,blue :height 1.3))))
   `(org-super-agenda-header ((,class (:height 1.2))))
   ;; Helm
   `(helm-selection ((, class (:background ,blue :foreground ,white))))
   `(helm-visible-mark ((, class (:background ,blue-1 :foreground ,black))))

   `(ledger-font-posting-amount-face ((, class (:foreground ,black))))
   `(ledger-font-posting-date-face ((, class (:foreground ,black))))
   ))

(provide-theme 'tango-system)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; tango-dark-theme.el ends here
