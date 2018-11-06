(setq package-archives
    '(("melpa" . "http://melpa.org/packages/")
      ("gnu" . "http://elpa.gnu.org/packages/")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-version "2e")
 '(Linum-format "%7i ")
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(beacon-color "#cc6666")
 '(compilation-message-face 'default)
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("f66ffeadda7b52d40c8d698967ae9e9836f54324445af95610d257fa5e3e1e21" "b9e9ba5aeedcc5ba8be99f1cc9301f6679912910ff92fdf7980929c2fc83ab4d" "84d2f9eeb3f82d619ca4bfffe5f157282f4779732f48a5ac1484d94d5ff5b279" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "5bccf8917c4508bfb6f73e4d23d610a6f106547bc020109d978bc68f00e8f30d" "cd125c0cb337e0dc4aff253ed97284da8e94b69fa5032174f4bb9728cd913566" "53054cfc717f84ed1ec24df2d2afc3b9f50ad6bbeb308d78eb3778516d33a2e1" "ede95e02b47ec0e0b1d3011dbcf1390755cf20bf7bd4df01f5158447f70ad276" "02529fb38e63a3a6a95c2244c1ea1c86a69339433df20f0ec34445fd78a7b1fd" "0a5bf3b78de61affa7d53fce482b158348e6b1f86e5e73ba1b400f41a0cd20bf" "68001bc35ff40d747ab8ad076e4f5990a27c4521a06b5e40910145d704885320" "1784927ceae5f347b4f9fe0ed69cc52d10f63fa14d27436dc959e7877162c87a" "308c88c84758f042fae387150f8727898ae35c9de759c6e54a5ddc3321641c33" "b06024a357b66fbbd73070c4f636dac552c0d2441e04d0abd335a320d43809ee" "f77d5cab0a9aed47f05fdf746d590b6a5d1329af2f8ad5458b360e570c9c84f0" "9b6530653460ac479b7f89501c70be77fe2ded81f38257a73b06e251f219bfb7" "2508cb47ef6daeefb67c00390716c419ca11b89673d3c6aa488797beff4375ff" "7e1f081ea8da0a3f37582b3821ba7ab6371e7d3587b40deedb9230c6c41c312b" "46881dbae3eb18c9262ffec6789d4a9bdb130e6ef2c8d81122156b2c6c057a16" "bc40f613df8e0d8f31c5eb3380b61f587e1b5bc439212e03d4ea44b26b4f408a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" default))
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#3C3D37")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(fringe-mode 4 nil (fringe))
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100)))
 '(magit-diff-use-overlays nil)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style 'chamfer)
 '(org-agenda-files '("~/Dropbox/Journal/agenda.org"))
 '(package-selected-packages
   '(smart-mode-line smart-mode-line-atom-one-dark-theme smart-mode-line-powerline-theme god-mode org-edit-latex auto-package-update use-package julia-mode julia-shell org-ac wolfram exec-path-from-shell org-bullets rainbow-mode helm-spotify helm-spotify-plus julia-repl auctex))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(sml/mode-width (if (eq (powerline-current-separator) 'arrow) 'right 'full))
 '(sml/pos-id-separator
   '(""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " " 'display
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (car powerline-default-separator-dir)))
                   'powerline-active1 'powerline-active2)))
     (:propertize " " face powerline-active2)))
 '(sml/pos-minor-modes-separator
   '(""
     (:propertize " " face powerline-active1)
     (:eval
      (propertize " " 'display
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (cdr powerline-default-separator-dir)))
                   'powerline-active1 'sml/global)))
     (:propertize " " face sml/global)))
 '(sml/pre-id-separator
   '(""
     (:propertize " " face sml/global)
     (:eval
      (propertize " " 'display
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (car powerline-default-separator-dir)))
                   'sml/global 'powerline-active1)))
     (:propertize " " face powerline-active1)))
 '(sml/pre-minor-modes-separator
   '(""
     (:propertize " " face powerline-active2)
     (:eval
      (propertize " " 'display
                  (funcall
                   (intern
                    (format "powerline-%s-%s"
                            (powerline-current-separator)
                            (cdr powerline-default-separator-dir)))
                   'powerline-active2 'powerline-active1)))
     (:propertize " " face powerline-active1)))
 '(sml/pre-modes-separator (propertize " " 'face 'sml/modes))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   '((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-constant-face ((t (:foreground "firebrick2")))))

