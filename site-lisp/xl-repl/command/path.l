;;; -*- mode:lisp; package:repl.command.std -*-

(eval-when (:compile-toplevel :load-toplevel :execute)
  (require "xl-repl/repl-mode"))

(in-package :repl)

(defun repl.command::dir (&optional wildcard)
  "default-directory�̃t�@�C�����"
  (let* ((dir (default-directory))
	 (files (directory dir :wild (if wildcard (string wildcard) "*"))))
    (format t "[~A]~%~{~A~%~}" dir files)
    files))

(defun repl.command::cd (&optional dir)
  "default-directory��dir�ֈړ� (dir�ȗ�����default-directory��\��)"
  (if dir
      (let ((path (merge-pathnames dir (default-directory))))
	(when (set-default-directory path)
	  (princ path)))
    (princ (default-directory))))


(provide "xl-repl/command/path")