;;------------------------------------------------------------------------------
;;
;;          K E Y B I N D I N G S    A N D    M O U S E    C O N F I G
;;                      F O R    D O T    E M A C S
;;
;;------------------------------------------------------------------------------
;;
;; When using a window manager that doesn't do iconification (XMonad,
;; etc..) C-z will put the window into a locked-state, and you'll have
;; to resize it in order to gain interactivity.
;;
(global-set-key (kbd "C-z") nil)
;;
;; Tip 1 - Swap Caps Lock & Control (or better yet, lose the caps lock!)
;;
;; This item is the #1 reason for buying a "Happy Hacker" keyboard
;; or using a Sun keyboard....a PROPER layout.  The problem, though, is the cost
;; involved....a HHKBD costs $60-70 for the USB only model, and $120+ for the
;; PS/2, ADB, Sun-5 (swappable) model.  It does rock, though!
;;
;; The relevent xmodmap(1) entry for .Xmodmap :
;;  !
;;  ! Swap Caps_Lock and Control_L
;;  !
;;  remove Lock = Caps_Lock
;;  remove Control = Control_L
;;  keysym Control_L = Control_L
;;  keysym Caps_Lock = Control_L
;;  add Lock = Caps_Lock
;;  add Control = Control_L
;;------------------------------------------------------------------------------
;; Tip 2 - Invoke M-x without the Alt-key
;; (because apparently Alt is a "cross-platform nightmare of mappings..."
;;  or at least was at some point....)
;;
(global-set-key "\C-x\C-m" 'execute-extended-command)
(global-set-key "\C-c\C-m" 'execute-extended-command)
;;
;;------------------------------------------------------------------------------
;; Keybindings for Org-mode
;;------------------------------------------------------------------------------
(global-set-key (kbd "C-c r") 'remember)   ;; 1) Quickly add an entry in todo list
(global-set-key (kbd "C-c a") 'org-agenda) ;; 2) Pull-up the daily / weekly agends
;;
;;------------------------------------------------------------------------------
;; Tip 3 - Prefer backward-kill-word over Backspace
;;
(global-set-key "\C-w"     'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-c\C-k" 'kill-region)
;;
;; Mousewheel needs to work also.
;;
(defun sd-mousewheel-scroll-up (event)
  "Scroll window under mouse up by five lines."
  (interactive "e")
  (let ((current-window (selected-window)))
    (unwind-protect
        (progn
          (select-window (posn-window (event-start event)))
          (scroll-up 5))
      (select-window current-window))))

(defun sd-mousewheel-scroll-down (event)
  "Scroll window under mouse down by five lines."
  (interactive "e")
  (let ((current-window (selected-window)))
    (unwind-protect
        (progn
          (select-window (posn-window (event-start event)))
          (scroll-down 5))
      (select-window current-window))))

(global-set-key (kbd "<mouse-5>") 'sd-mousewheel-scroll-up)
(global-set-key (kbd "<mouse-4>") 'sd-mousewheel-scroll-down)
;;
;;------------------------------------------------------------------------------
;; Keyboard Macro tricks, from the emacswiki
;;------------------------------------------------------------------------------
;;
(defun toggle-kbd-macro-recording-on ()
  "One-key keyboard macros: turn recording on."
  (interactive)
  (define-key
    global-map
    (events-to-keys (this-command-keys) t)
    'toggle-kbd-macro-recording-off)
  (start-kbd-macro nil))

(defun toggle-kbd-macro-recording-off ()
  "One-key keyboard macros: turn recording off."
  (interactive)
  (define-key
    global-map
    (events-to-keys (this-command-keys) t)
    'toggle-kbd-macro-recording-on)
  (end-kbd-macro))
;;
;;
(global-set-key '[(f1)]          'call-last-kbd-macro)
(global-set-key '[(shift f1)]    'toggle-kbd-macro-recording-on)
(global-set-key "\C-xg" 'goto-line)
(global-set-key [f3] 'start-kbd-macro)
(global-set-key [f4] 'end-kbd-macro)
(global-set-key [f5] 'call-last-kbd-macro)
