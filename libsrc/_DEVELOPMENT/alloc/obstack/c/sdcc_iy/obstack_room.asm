
; size_t obstack_room(struct obstack *ob)

XDEF obstack_room

obstack_room:

   pop af
   pop hl
   
   push hl
   push af

   INCLUDE "alloc/obstack/z80/asm_obstack_room.asm"
