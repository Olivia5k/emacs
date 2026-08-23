;;; catppuccin-lib.el - -*- lexical-binding: t; -*-

;; Color operations
(defun catppuccin--hex-to-rgb (color)
  "Convert a hex COLOR string like \"#rrggbb\" to a list of three integers."
  (mapcar (lambda (i) (string-to-number (substring color i (+ i 2)) 16))
          '(1 3 5)))

(defun catppuccin--rgb-to-hex (r g b)
  "Convert R, G, B integers to a hex color string."
  (format "#%02x%02x%02x" r g b))

(defun catppuccin--rnd (n)
  "Round N to the nearest integer."
  (round (+ 0.5 n)))

(defun catppuccin-lighten (color value)
  "Lighten COLOR by VALUE% (0–100)."
  (let* ((factor (/ value 100.0)))
    (apply #'catppuccin--rgb-to-hex
      (mapcar (lambda (v)
                (catppuccin--rnd
                  (min 255 (+ (* (- 255 v) factor) v))))
        (catppuccin--hex-to-rgb color)))))

(defun catppuccin-darken (color value)
  "Darken COLOR by VALUE% (0–100)."
  (let* ((factor (/ value 100.0)))
    (apply #'catppuccin--rgb-to-hex
      (mapcar (lambda (v)
                (floor (* (- 1 factor) v)))
        (catppuccin--hex-to-rgb color)))))

;; (defun catppuccin-recolor (color value)
;;   "Darken or lightens COLOR based on the current flavour."
;;   (if (eq catppuccin-flavor 'latte)
;;     (catppuccin-lighten color value)
;;     (catppuccin-darken color value)))

(provide 'catppuccin-lib)
;;; catppuccin-lib.el ends here
