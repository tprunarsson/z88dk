
; size_t w_array_append(w_array_t *a, void *item)

XDEF w_array_append

w_array_append:

   pop af
   pop hl
   pop bc
   
   push bc
   push hl
   push af
   
   INCLUDE "../../z80/asm_w_array_append.asm"
