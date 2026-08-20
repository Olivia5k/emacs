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

(require 'catppuccin-modus-definitions)

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
  (append
   catppuccin-definitions-mocha
  '(
     ;; Basic values (only bg-main/fg-main bg-dim/fg-dim/fg-alt, which
     ;; feed shadow, metadata, etc.)

     (bg-main base)
     (fg-main text)

     ;; Catppuccin-Mocha named colors

     (bg-deep    "#080c16")
     (teal-soft  "#8ecede")
     (teal-dark  "#2a4a5a")
     (neon-cyan  "#00e5ff")
     (cyan-soft  "#00c5dd")
     (cyan-deep  "#00b8cc")
     (neon-green "#00cc77")
     (hot-pink   "#ff0044")
     (pink-soft  "#ff4466")
     (amber      "#ffaa00")
     (orange     "#ff8800")
     (purple     "#cc55ff")
     (teal-faint "#1a3a50")
     (teal-dim   "#2d5a70")
     (teal-mid   "#4a7a8a")

     ;; Special purpose

     (bg-completion      "#0a1a2a")
     (bg-hl-line         "#0d1e2e")
     (bg-region          "#0d2840")
     (fg-region          teal-soft)
     (bg-hover-secondary "#0d2030")

     ;; Mode-line

     (bg-mode-line-active       mantle)
     (fg-mode-line-active       text)
     (border-mode-line-active   unspecified)
     (bg-mode-line-inactive     crust)
     (fg-mode-line-inactive     overlay0)
     (border-mode-line-inactive unspecified)

     ;; Tab bar

     (bg-tab-bar     bg-main)
     ;; TODO(olivia): Make darker
     (bg-tab-current bg-main)
     (bg-tab-other   bg-main)

     ;; Diffs

     (bg-added          "#0a2018")
     (bg-added-refine   "#143a22")
     (bg-changed        "#0a1e38")
     (bg-changed-refine "#142840")
     (bg-removed        "#2a0a14")
     (bg-removed-refine "#3a1020")

     ;; General mappings

     (cursor rosewater)
     (name mauve)
     (identifier purple)
     (fringe bg-main)

     (err red)
     (warning yellow)
     (info green)

     (bg-active bg-main)
     (bg-prominent-err bg-removed)
     (fg-prominent-err hot-pink)

     ;; Code mappings

     (builtin neon-cyan)
     (comment overlay0)
     (constant pink-soft)
     (docstring teal-mid)
     (fnname cyan-soft)
     (keyword purple)
     (number amber)
     (property cyan-deep)
     (string neon-green)
     (type amber)
     (variable orange)

     ;; Accent mappings

     (accent-0 neon-cyan)
     (accent-1 hot-pink)

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

     (date-weekday neon-cyan)
     (date-weekend amber)

     ;; Line number mappings

     ;; TODO(olivia): Toggleable option
     (bg-line-number-active mantle)
     (bg-line-number-inactive mantle)
     (fg-line-number-active lavender)
     (fg-line-number-inactive surface1)

     ;; Link mappings

     (fg-link neon-cyan)

     ;; Mark mappings

     (bg-mark-delete bg-removed)
     (fg-mark-delete hot-pink)
     (bg-mark-select bg-changed)
     (fg-mark-select neon-cyan)

     ;; Prompt mappings

     (bg-prompt unspecified)
     (fg-prompt purple)

     ;; Prose mappings

     (bg-prose-block-contents "#0d1628")
     (bg-prose-block-delimiter bg-prose-block-contents)
     (fg-prose-block-delimiter teal-faint)
     (fg-prose-verbatim neon-green)

     ;; Search mappings

     (bg-search-current hot-pink)
     (fg-search-current bg-main)
     (bg-search-lazy bg-region)
     (fg-search-lazy teal-soft)
     (bg-search-static bg-region)
     (fg-search-static teal-soft)

     ;; Heading mappings

     (fg-heading-0 hot-pink)
     (fg-heading-1 pink-soft)
     (fg-heading-2 amber)
     (fg-heading-3 neon-green)
     (fg-heading-4 neon-cyan))
   modus-themes-vivendi-palette)
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
    `(modus-themes-bold ((,c :inherit bold)))
    `(modus-themes-slant ((,c :inherit italic)))
    `(modus-themes-prompt ((,c :inherit bold :background ,bg-prompt :foreground ,fg-prompt)))
;;;;; change-log and log-view (also vc-print-log)
    `(change-log-acknowledgment ((,c :foreground ,neon-cyan)))
    `(change-log-date ((,c :foreground ,neon-green)))
    `(change-log-name ((,c :foreground ,amber)))
    `(log-view-message ((,c :foreground ,neon-cyan)))
;;;;; completion
    `(modus-themes-completion-selected ((,c :background ,bg-completion :foreground ,teal-soft)))
;;;;; diff-mode
    `(diff-context ((,c :foreground ,teal-faint)))
    `(diff-file-header ((,c :foreground ,pink-soft)))
    `(diff-header ((,c :foreground ,neon-cyan)))
    `(diff-hunk-header ((,c :foreground ,amber)))
;;;;; gnus
    `(gnus-button ((,c :foreground ,neon-cyan)))
    `(gnus-group-mail-3 ((,c :foreground ,neon-cyan)))
    `(gnus-group-mail-3-empty ((,c :foreground ,neon-cyan)))
    `(gnus-header-content ((,c :foreground ,fg-main)))
    `(gnus-header-from ((,c :foreground ,purple)))
    `(gnus-header-name ((,c :foreground ,neon-green)))
    `(gnus-header-subject ((,c :foreground ,neon-cyan)))
;;;;; newsticker
    `(newsticker-extra-face ((,c :foreground ,teal-faint :height 0.8 :slant italic)))
    `(newsticker-feed-face ((,c :foreground ,hot-pink :height 1.2 :weight bold)))
    `(newsticker-treeview-face ((,c :foreground ,fg-main)))
    `(newsticker-treeview-selection-face ((,c :background ,bg-region :foreground ,teal-soft)))
;;;;; tab-bar
    ;; :box nil is load-bearing: the built-in `tab-bar-tab' defface sets a
    ;; `released-button' box on dark displays, and `tab-bar-tab-inactive'
    ;; inherits it.  Unlike the hacked-modus variant (which had modus-vivendi
    ;; enabled to supply a flat same-color box), this standalone theme drops
    ;; modus's own tab specs, so without :box nil the defface box leaks through
    ;; and every tab renders highlighted.
    `(tab-bar ((,c :background ,bg-main :foreground ,subtext0 :box nil)))
    `(tab-bar-tab ((,c :background ,base :foreground ,text :underline nil :box nil)))
    `(tab-bar-tab-inactive ((,c :background ,bg-main :foreground ,subtext0 :box nil)))
    `(tab-bar-tab-group-current ((,c :background ,bg-main :foreground ,teal-soft :box nil)))
    `(tab-bar-tab-group-inactive ((,c :background ,bg-main :foreground ,teal-dark :box nil)))
;;;;; vc-dir
    ;; vc-dir-file already follows the `name' mapping (neon cyan)
    `(vc-dir-header-value ((,c :foreground ,fg-main))))
  "Custom face overrides for the `catppuccin-mocha' theme.")

(defconst catppuccin-mocha-theme-custom-variables nil
  "Custom variable overrides for the `catppuccin-mocha' theme.")

;;;; Instantiate the theme

(modus-themes-theme
 'catppuccin-mocha
 'catppuccin-mocha
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
