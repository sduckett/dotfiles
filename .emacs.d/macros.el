(defun save-macro (name)
    "save a macro. Take a name as argument
     and save the last defined macro under
     this name at the end of your .emacs"
     (interactive "SName of the macro :")             ; ask for the name of the macro
     (kmacro-name-last-macro name)                    ; use this name for the macro
     (find-file "~/.emacs.d/macros.el")               ; open ~/.emacs or other user init file
     (goto-char (point-max))                          ; go to the end of the .emacs
     (newline)                                        ; insert a newline
     (insert-kbd-macro name)                          ; copy the macro
     (newline)                                        ; insert a newline
     (switch-to-buffer nil))                          ; return to the initial buffer

(fset 'complex-ids
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217747 94 79 124 13 19 124 88 90 13 2 2 67108896 19 45 2 134217847 19 124 19 19 13 25 1 14] 0 "%d")) arg)))

