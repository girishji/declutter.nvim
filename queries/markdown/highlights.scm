;; extends
(fenced_code_block
  (info_string) @deemphasize)

(fenced_code_block_delimiter) @deemphasize

[
  (atx_h1_marker)
  (atx_h2_marker)
  (atx_h3_marker)
  (atx_h4_marker)
  (atx_h5_marker)
  (atx_h6_marker)
  (block_quote_marker)
] @deemphasize

; Task items:
;  ✔ task1
;  ☐ task2
;  ☐ task2.1
;  ✔ task2.2
;
; Create tasks as list:
; - [ ] foo
; - [x] bar
(list
  (list_item
    (list_marker_minus) @conceal (#set! conceal "")
    (task_list_marker_checked)
)) 
(list
  (list_item
    (list_marker_minus) @conceal (#set! conceal "")
    (task_list_marker_unchecked)
)) 
([
   (task_list_marker_checked)
] @conceal (#set! conceal "✔"))
([
   (task_list_marker_unchecked)
] @conceal (#set! conceal "☐"))

; FIXME: Do not conceal list item markers (-, +, *). Some bug causes coceal to
; eat up the space after marker.
; Also, see https://github.com/nvim-treesitter/nvim-treesitter/pull/2662
; ([
;    (list_marker_minus)
;    (list_marker_plus)
;    (list_marker_star)] @conceal (#set! conceal "•"))

; -- level 1 bullet
; (list
;   (list_item
;     [(list_marker_dot)
;      (list_marker_minus)
;      (list_marker_plus)
;      (list_marker_star)] @conceal (#set! conceal "◉")))
;
; -- level 2 bullet
; (document
;   (list
;     (list_item
;       (list
;         (list_item
;           [(list_marker_dot)
;            (list_marker_minus)
;            (list_marker_plus)
;            (list_marker_star)] @conceal (#set! conceal "•"))))))
