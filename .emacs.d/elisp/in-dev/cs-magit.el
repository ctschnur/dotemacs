;;; cs-magit.el --- magit configuration              -*- lexical-binding: t; -*-

;; Copyright (C) 2020

;; Author:  <nanospin@MAIP-FRANCK>
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


;; from https://gist.github.com/ieure/883725
(eval-after-load "magit"
  '(progn
     (defun magit-browse-github (commit)
       "Open a browser pointing to the tracked branch on GitHub.
        With prefix argument, go to the commit HEAD is at."
       (interactive "p")
       (let* ((branch (magit-get-current-branch))
              (remote (and branch (magit-get "branch" branch "remote")))
              (remote-branch (or (and branch (magit-remote-branch-for branch))
                                 branch))
              (remote-url (magit-get "remote" remote "url"))
              (head (magit-git-string "log" "--max-count=1"
                                      "--pretty=format:%h"))
              (remote-tree (if (> commit 1) head remote-branch)))

         (browse-url
          (cond ((string-match "git@github\\.com" remote-url)
                 (replace-regexp-in-string
                  "^git@github.com:\\(.*?\\)\\(\\.git\\)?$"
                  (format "https://github.com/\\1/tree/%s" remote-tree)
                  remote-url))
                ((string-match "https?://github\\.com" remote-url)
                 (replace-regexp-in-string
                  "^\\(https?://github\\.com/.*?\\)\\(\\.git\\)?$"
                  (format "\\1/tree/%s" remote-tree) remote-url))
                (t (error "Tracked branch is not on GitHub."))))))

     (define-key magit-mode-map "\C-ch" 'magit-browse-github)))



(provide 'cs-magit)
;;; cs-magit.el ends here
