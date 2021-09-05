;;;  -*- lexical-binding: t -*-

(defun bar (x)
  (let ((i 0))
    (while (< i x)
      (message "i is: %d" i)
      (setq i (1+ i)))))



