(defun my/decimal-to-hex ()
  (interactive)
  (let ((user-input (read-string "Enter a decimal number (base 10): ")))
    (message "Decimal to Hex: %s => %x" user-input (string-to-number user-input 10))))

(defun my/hex-to-decimal ()
  (interactive)
  (let ((user-input (read-string "Enter a hex number (base 16): ")))
    (message "Hex to Decimal: %s => %d" user-input (string-to-number user-input 16))))
