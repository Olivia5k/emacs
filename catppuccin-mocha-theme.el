;;; catppuccin-theme-mocha.el --- Catppuccin Mocha for Emacs - 🍄 Soothing pastel theme for Emacs -*- lexical-binding: t; -*-

;; Copyright 2022-present Catppuccin, All rights reserved
;;
;; Permission is hereby granted, free of charge, to any person obtaining
;; a copy of this software and associated documentation files (the
;; "Software"), to deal in the Software without restriction, including
;; without limitation the rights to use, copy, modify, merge, publish,
;; distribute, sublicense, and/or sell copies of the Software, and to
;; permit persons to whom the Software is furnished to do so, subject to
;; the following conditions:
;;
;; The above copyright notice and this permission notice shall be included
;; in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
;; IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
;; CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
;; TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
;; SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

;; Maintainer: Jeremy Baxter <jeremy@baxters.nz>
;; Author: nyxkrage
;; Original-Author: film42
;; Version: 1.0.0
;; Package-Requires: ((emacs "27.1"))
;; URL: https://github.com/catppuccin/emacs

;;; Commentary:

;; 🍄 Soothing pastel theme for Emacs
;;
;; catppuccin-theme-mocha.el provides the theme `catppuccin-mocha', a port of the
;; Catppuccin colors to Emacs.  To select a palette and enable the theme,
;; evaluate:
;;
;;     (load-theme 'catppuccin-mocha t)
;;
;; For more information visit <https://catppuccin.com>.

;;; Code:

(eval-and-compile
  (unless (require 'modus-themes nil :noerror)
    ;; Fall back to the copy bundled with Emacs (etc/themes is not in
    ;; `load-path', so a plain `require' cannot find it).
    (require-theme 'modus-themes)))

(require 'cl-lib)
(require 'catppuccin-modus-definitions)
(require 'catppuccin-lib)

;;;; User customization options

(defgroup catppuccin-mocha-theme ()
  "Soothing pastel theme, mocha variant.
Built on the Modus themes infrastructure."
  :group 'modus-themes
  :link '(url-link :tag "GitHub" "https://github.com/LionyxML/catppuccin-mocha-theme")
  :prefix "catppuccin-mocha-"
  :tag "Catppuccin-Mocha")

(defcustom catppuccin-mocha-theme-palette-user nil
  "Like `catppuccin-mocha-theme-palette' for user-defined entries.
This is meant to extend the palette with custom named colors and/or
semantic palette mappings.  Those may then be used in combination with
palette overrides (also see `modus-themes-common-palette-overrides' and
`catppuccin-mocha-theme-palette-overrides')."
  :group 'catppuccin-mocha-theme
  :type '(repeat (list symbol (choice symbol string)))
  :link '(info-link "(modus-themes) Option to extend the palette for use with overrides"))

(defcustom catppuccin-mocha-theme-palette-overrides nil
  "Overrides for `catppuccin-mocha-theme-palette'.
Mirror the elements of the aforementioned palette, overriding
their value.

For overrides that are shared across all of the Modus themes,
refer to `modus-themes-common-palette-overrides'.

Theme-specific overrides take precedence over shared overrides."
  :group 'catppuccin-mocha-theme
  :type '(repeat (list symbol (choice symbol string)))
  :link '(info-link "(modus-themes) Palette overrides"))

;;;; Palette
;;
;; Entries here take precedence over `modus-themes-vivendi-palette',
;; which provides every named color and semantic mapping not listed.

(defconst catppuccin-mocha-theme-palette
  (cl-flet* ((color (name) (car (alist-get name catppuccin-definitions-mocha)))
             (darken (name &optional value) (catppuccin-darken (color name) (or value 10)))
             (lighten (name &optional value) (catppuccin-lighten (color name) (or value 10))))
    (append
     catppuccin-definitions-mocha
     `(
       (fg-alt subtext0)
       (fg-dim overlay0)
       
       ;; Special purpose

       (bg-completion       ,(darken 'base))
       (bg-hl-line          ,(darken 'base))
       (bg-region           ,(lighten 'base 17))
       (bg-popup            mantle)
       (bg-hover            bg-cyan-intense)
       (bg-hover-secondary  bg-yellow-subtle)

       ;; Mode-line

       (bg-mode-line-active mantle)
       (fg-mode-line-active text)
       (border-mode-line-active unspecified)
       (bg-mode-line-inactive crust)
       (fg-mode-line-inactive overlay0)
       (border-mode-line-inactive unspecified)

       (modeline-err     red)
       (modeline-warning yellow)
       (modeline-info    sapphire)

       ;; Tab bar

       (bg-tab-bar base)
       (bg-tab-current mantle)
       (bg-tab-other bg-main)

       ;; Diffs

       (bg-added          ,(darken 'green 60))
       (bg-added-refine   ,(darken 'green 40))
       (bg-changed        ,(darken 'blue 60))
       (bg-changed-refine ,(darken 'blue 40))
       (bg-removed        ,(darken 'red 60))
       (bg-removed-refine ,(darken 'red 40))

       (fg-added green)
       (fg-changed yellow)
       (fg-removed red)

       ;; Paren match
       (bg-paren-match        bg-main)
       (fg-paren-match        rosewater)
       (bg-paren-expression   bg-yellow-nuanced)

       ;; General mappings

       (cursor rosewater)
       (name mauve)
       (identifier mauve)
       (fringe bg-main)

       (err red)
       (warning yellow)
       (info green)

       (bg-active bg-main)
       (bg-prominent-err bg-removed)
       (fg-prominent-err peach)

       ;; Code mappings

       (builtin red)
       (comment overlay0)
       (constant peach)
       (docstring overlay1)
       (fnname blue)
       (keyword mauve)
       (number peach)
       (property blue)
       (string green)
       (type yellow)
       (variable text)
       (parenthesis shadow)
       (shadow comment)

       ;; Accent mappings

       (accent-0 blue)
       (accent-1 pink)
       (accent-2 sky)
       (accent-3 red)

       ;; Completion mappings

       (bg-completion-match-0 surface0)
       (bg-completion-match-1 surface0)
       (bg-completion-match-2 surface0)
       (bg-completion-match-3 surface0)
       (fg-completion-match-0 sky)
       (fg-completion-match-1 pink)
       (fg-completion-match-2 green)
       (fg-completion-match-3 peach)

       ;; Date mappings

       ;; (date-weekday sky)
       ;; (date-weekend peach)

       ;; Line number mappings

       ;; TODO(olivia): Toggleable option
       (bg-line-number-active mantle)
       (bg-line-number-inactive mantle)
       (fg-line-number-active lavender)
       (fg-line-number-inactive surface1)

       ;; Link mappings

       (fg-link lavender)

       ;; Mark mappings

       (bg-mark-delete bg-removed)
       (fg-mark-delete red)
       (bg-mark-select bg-changed)
       (fg-mark-select sky)

       ;; Prompt mappings

       (bg-prompt unspecified)
       (fg-prompt subtext0)

       ;; Prose mappings

       (bg-prose-block-contents mantle)
       (bg-prose-block-delimiter bg-prose-block-contents)
       (fg-prose-block-delimiter surface0)
       (fg-prose-verbatim green)

       ;; Search mappings

       (bg-search-current red)
       (fg-search-current bg-main)
       (bg-search-lazy bg-region)
       (fg-search-lazy sapphire)
       (bg-search-static bg-region)
       (fg-search-static teal)

       ;; Heading mappings

       (fg-heading-0 red)
       (fg-heading-1 peach)
       (fg-heading-2 yellow)
       (fg-heading-3 green)
       (fg-heading-4 sapphire))

     ;; Generate a palette using the catppuccin colors. This takes care to generate all of the
     ;; variations of the colors that the modus themes are powered by.
     ;; TODO(olivia): Make the mapping user configurable, e.g. choosing between lavender and mauve
     ;; for the magenta base.
     (modus-themes-generate-palette
      `((bg-main ,(color 'base))
        (fg-main ,(color 'text))
        (magenta ,(color 'mauve))
        (red     ,(color 'red))
        (yellow  ,(color 'yellow))
        (green   ,(color 'green))
        (cyan    ,(color 'sky))
        (blue    ,(color 'blue)))
      'cool)))
  "The entire palette of the `catppuccin-mocha' theme.

This palette is based on `modus-themes-vivendi-palette' with the
Catppuccin-Mocha colors taking precedence (palette lookup returns the first
match).

Named colors have the form (COLOR-NAME HEX-VALUE) with the former
as a symbol and the latter as a string.

Semantic color mappings have the form (MAPPING-NAME COLOR-NAME)
with both as symbols.  The latter is a named color that already
exists in the palette and is associated with a HEX-VALUE.")

;;;; Custom face overrides
;;
;; Faces whose styling cannot be expressed through palette mappings
;; alone (sizes, slants, or faces the Modus themes do not map).

(defconst catppuccin-mocha-theme-faces
  '(
;;;;; modus option equivalents
    ;; Bake in what the modus user options would produce, so the theme
    ;; is self-contained and does not depend on the caller setting
    ;; `modus-themes-italic-constructs', `modus-themes-bold-constructs',
    ;; or `modus-themes-prompts' (those are shared across all modus
    ;; themes, so setting them here as variables would leak).
    ;; `(modus-themes-bold ((,c :inherit bold)))
    ;; `(modus-themes-slant ((,c :inherit italic)))
    ;; `(modus-themes-prompt ((,c :inherit bold :background ,bg-prompt :foreground ,fg-prompt)))
;;;;; change-log and log-view (also vc-print-log)
    ;; `(change-log-acknowledgment ((,c :foreground ,sapphire)))
    ;; `(change-log-date ((,c :foreground ,green)))
    ;; `(change-log-name ((,c :foreground ,peach)))
    ;; `(log-view-message ((,c :foreground ,sapphire)))
;;;;; completion
    `(modus-themes-completion-selected ((,c :background ,bg-completion :foreground ,sky)))
;;;;; diff-mode
    ;; `(diff-context ((,c :foreground ,surface0)))
    ;; `(diff-file-header ((,c :foreground ,pink)))
    ;; `(diff-header ((,c :foreground ,sapphire)))
    ;; `(diff-hunk-header ((,c :foreground ,peach)))
;;;;; gnus
    ;; `(gnus-button ((,c :foreground ,sapphire)))
    ;; `(gnus-group-mail-3 ((,c :foreground ,sapphire)))
    ;; `(gnus-group-mail-3-empty ((,c :foreground ,sapphire)))
    ;; `(gnus-header-content ((,c :foreground ,fg-main)))
    ;; `(gnus-header-from ((,c :foreground ,mauve)))
    ;; `(gnus-header-name ((,c :foreground ,green)))
    ;; `(gnus-header-subject ((,c :foreground ,sapphire)))
;;;;; newsticker
    ;; `(newsticker-extra-face ((,c :foreground ,surface0 :height 0.8 :slant italic)))
    ;; `(newsticker-feed-face ((,c :foreground ,red :height 1.2 :weight bold)))
    ;; `(newsticker-treeview-face ((,c :foreground ,fg-main)))
    ;; `(newsticker-treeview-selection-face ((,c :background ,bg-region :foreground ,sky)))
;;;;; tab-bar
    ;; :box nil is load-bearing: the built-in `tab-bar-tab' defface sets a
    ;; `released-button' box on dark displays, and `tab-bar-tab-inactive'
    ;; inherits it.  Unlike the hacked-modus variant (which had modus-vivendi
    ;; enabled to supply a flat same-color box), this standalone theme drops
    ;; modus's own tab specs, so without :box nil the defface box leaks through
    ;; and every tab renders highlighted.
    `(tab-bar ((,c :background ,bg-main :foreground ,subtext0 :box nil)))
    `(tab-bar-tab ((,c :background ,crust :foreground ,lavender :underline nil :box nil)))
    `(tab-bar-tab-inactive ((,c :background ,bg-main :foreground ,subtext0 :box nil)))
    `(tab-bar-tab-group-current ((,c :background ,crust :foreground ,sky :box nil)))
    `(tab-bar-tab-group-inactive ((,c :background ,bg-main :foreground ,surface0 :box nil)))

    ;; magit
    `(magit-branch-local ((,c :foreground ,teal)))
    `(magit-branch-remote ((,c :foreground ,green)))
    `(magit-tag ((,c :foreground ,peach)))
    `(magit-section-heading ((,c :foreground ,blue :weight bold)))
    `(magit-section-highlight ((,c :background ,surface0 :extend t)))
    `(magit-diff-context-highlight ((,c :background ,surface0 :foreground ,text :extend t)))
    `(magit-diff-revision-summary ((,c :foreground ,blue :weight bold)))
    `(magit-diff-revision-summary-highlight ((,c :foreground ,blue :weight bold)))
    `(magit-diff-added ((,c :foreground ,green :extend t)))
    `(magit-diff-added-highlight ((,c :background ,surface1 :foreground ,green :extend t)))
    `(magit-diff-removed ((,c :foreground ,red :extend t)))
    `(magit-diff-removed-highlight ((,c :background ,surface1 :foreground ,red :extend t)))
    `(magit-diff-file-heading ((,c :foreground ,text)))
    `(magit-diff-file-heading-highlight ((,c :inherit magit-section-highlight)))
    `(magit-diffstat-added ((,c :foreground ,green)))
    `(magit-diffstat-removed ((,c :foreground ,red)))
    `(magit-hash ((,c :foreground ,subtext0)))
    `(magit-diff-hunk-heading ((,c :inherit diff-hunk-header)))
    `(magit-diff-hunk-heading-highlight ((,c :inherit diff-hunk-header :weight bold)))
    `(magit-log-author ((,c :foreground ,subtext0)))
    `(magit-process-ng ((,c :foreground ,peach :weight bold)))
    `(magit-process-ok ((,c :foreground ,green :weight bold)))


;;;;; vc-dir
    ;; vc-dir-file already follows the `name' mapping (neon cyan)
    ;; `(vc-dir-header-value ((,c :foreground ,fg-main)))
    )
  "Custom face overrides for the `catppuccin-mocha' theme.")

(defconst catppuccin-mocha-theme-custom-variables nil
  "Custom variable overrides for the `catppuccin-mocha' theme.")

;;;; Instantiate the theme

(modus-themes-theme
 'catppuccin-mocha
 'catppuccin
 ""
 'dark
 'catppuccin-mocha-theme-palette
 'catppuccin-mocha-theme-palette-user
 'catppuccin-mocha-theme-palette-overrides
 'catppuccin-mocha-theme-faces
 'catppuccin-mocha-theme-custom-variables)

(provide-theme 'catppuccin-mocha)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide 'catppuccin-mocha-theme)
;;; catppuccin-mocha-theme.el ends here
