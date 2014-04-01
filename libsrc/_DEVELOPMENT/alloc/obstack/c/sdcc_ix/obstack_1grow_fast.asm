
; void *obstack_1grow_fast(struct obstack *ob, char c)

XDEF obstack_1grow_fast

obstack_1grow_fast:

   pop af
   pop hl
   pop de
   
   push de
   push hl
   push af
   
   ld a,e

   INCLUDE "alloc/obstack/z80/asm_obstack_1grow_fast.asm"
