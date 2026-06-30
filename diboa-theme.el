(require 'autothemer)
(require 'highlight-numbers)

(autothemer-deftheme
 diboa
 "A theme that is quiet and calm"

 ((((class color) (min-colors #xFFFFFF))) ;; Only supports GUI for now
  ;; Define color palette
  (diboa-bg              "#1a1b26")
  (diboa-fg              "#cecece")
  (diboa-yellow          "#e5c463")
  (diboa-red             "#f85e84")
  (diboa-bright-red      "#ff0000")
  (diboa-dark-gray       "#181818")
  (diboa-medium-gray     "#666666")
  (diboa-lighter-gray    "#fefefe")
  (diboa-gray-blue       "#557799")
  (diboa-lighter-blue    "#aaccee")
  (diboa-light-blue      "#4178b5")
  (diboa-light-green     "#99ce99")
  (diboa-light-green2    "#43a047")
  )

 ;; Customize faces
 ((default (:foreground diboa-fg :background diboa-bg))

  (fringe (:background diboa-bg))

  (font-lock-variable-name-face (:foreground diboa-fg))

  (cursor  (:foreground diboa-dark-gray :background diboa-yellow))

  (font-lock-builtin-face (:foreground diboa-lighter-blue))
  (font-lock-keyword-face (:foreground diboa-lighter-blue))

  (font-lock-comment-face    (:foreground diboa-gray-blue))
  (font-lock-doc-facel       (:foreground diboa-gray-blue))
  (font-lock-doc-markup-face (:foreground diboa-gray-blue))

  (font-lock-string-face    (:foreground diboa-light-green))
  (font-lock-constant-face  (:foreground diboa-light-green))
  (highlight-numbers-number (:foreground diboa-light-green))
  ;; (set-face-foreground 'highlight-numbers-number clr-light-purple)
  ;; (set-face-foreground 'highlight-numbers-number "#ce99ce")

  (line-number              (:background diboa-bg :foreground diboa-medium-gray))
  (line-number-current-line (:background diboa-bg :foreground diboa-yellow))

  (region         (:background diboa-light-blue   :foreground diboa-lighter-gray))
  (isearch        (:background diboa-light-green2 :foreground diboa-lighter-gray))
  (lazy-highlight (:background diboa-light-green2 :foreground diboa-lighter-gray))
  (match          (:background diboa-light-green2 :foreground diboa-lighter-gray))
  )
 )

(provide-theme 'diboa)
