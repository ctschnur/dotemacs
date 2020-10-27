;;; cs-helm-ag.el --- modifications on cs-helm-projectile  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  chris

;; Author: chris <chris@chris-lenovo>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

(require 'helm-ag)

(defun cs-helm-ag (&optional arg)
  "Searches for occurrences of a string in the project"
  (interactive "P")
  (let* (word-at-point)
    (if (equal arg '(4))
        (if (thing-at-point 'word)
            (progn
              (setq word-at-point (substring-no-properties (thing-at-point 'word)))
              (helm-do-ag default-directory nil word-at-point))
          (user-error "No word at point"))
      (let* ()
        (helm-do-ag default-directory nil nil)))))

(provide 'cs-helm-ag)
;;; cs-helm-ag.el ends here
