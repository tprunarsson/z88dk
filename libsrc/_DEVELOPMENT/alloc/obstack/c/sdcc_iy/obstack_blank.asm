
; void *obstack_blank(struct obstack *ob, int size)

XDEF obstack_blank

obstack_blank:

   pop af
   pop hl
   pop bc
   
   push bc
   push hl
   push af
   
   INCLUDE "alloc/obstack/z80/asm_obstack_blank.asm"
