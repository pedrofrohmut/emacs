(require 'autothemer)
(require 'highlight-numbers)

(autothemer-deftheme diboa
 "A dark theme that is quiet and calm"

 ((((class color) (min-colors #xFFFFFF))) ;; Only supports GUI for now
  ;; Define color palette
  (diboa-bg              "#1a1b26")
  (diboa-lighter-bg      "#3a3b46")
  (diboa-fg              "#cecece")
  (diboa-yellow          "#e5c463")
  (diboa-red             "#f85e84")
  (diboa-bright-red      "#ff0000")
  (diboa-darker-gray     "#181818")
  (diboa-dark-gray       "#242424")
  (diboa-medium-gray     "#666666")
  (diboa-lighter-gray    "#fefefe")
  (diboa-gray-blue       "#557799")
  (diboa-lighter-blue    "#aaccee")
  (diboa-light-blue      "#4178b5")
  (diboa-light-green     "#99ce99")
  (diboa-light-green2    "#43a047")
  (diboa-light-purple    "#ce9fce")
  )

 ;; Customize faces
 ((default (:foreground diboa-fg :background diboa-bg))

  (fringe (:background diboa-bg))

  (font-lock-variable-name-face (:foreground diboa-fg))
  (font-lock-type-face          (:foreground diboa-fg))

  (cursor  (:foreground diboa-darker-gray :background diboa-yellow))

  ;; keywords
  (font-lock-builtin-face       (:foreground diboa-lighter-blue))
  (font-lock-keyword-face       (:foreground diboa-lighter-blue))
  (font-lock-function-name-face (:foreground diboa-lighter-blue))

  ;; Comments
  (font-lock-comment-face    (:foreground diboa-gray-blue))
  (font-lock-doc-face        (:foreground diboa-gray-blue))
  (font-lock-doc-markup-face (:foreground diboa-gray-blue))

  ;; strings
  (font-lock-string-face    (:foreground diboa-light-green))

  ;; numbers and values
  (font-lock-constant-face  (:foreground diboa-fg))
  (highlight-numbers-number (:foreground diboa-fg))

  (font-lock-constant-face  (:foreground diboa-yellow))
  (highlight-numbers-number (:foreground diboa-yellow))

  ;; Line number
  (line-number              (:background diboa-bg :foreground diboa-medium-gray))
  (line-number-current-line (:background diboa-bg :foreground diboa-yellow))

  ;; Selection
  (region         (:background diboa-light-blue   :foreground diboa-lighter-gray))
  (isearch        (:background diboa-light-green2 :foreground diboa-lighter-gray))
  (lazy-highlight (:background diboa-light-green2 :foreground diboa-lighter-gray))
  (match          (:background diboa-light-green2 :foreground diboa-lighter-gray))

  ;; Mode line
  (mode-line-active   (:background diboa-lighter-bg :foreground diboa-fg))
  (mode-line-inactive (:background diboa-bg         :foreground diboa-medium-gray))

  ;; Prompt
  (minibuffer-prompt (:foreground diboa-lighter-blue))
  )
 )

(provide-theme 'diboa)
