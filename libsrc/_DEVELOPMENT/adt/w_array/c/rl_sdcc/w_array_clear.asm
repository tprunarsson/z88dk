
; void w_array_clear(w_array_t *a)

XDEF w_array_clear

LIB b_array_clear

defc w_array_clear = b_array_clear

INCLUDE "../../z80/asm_w_array_clear.asm"
