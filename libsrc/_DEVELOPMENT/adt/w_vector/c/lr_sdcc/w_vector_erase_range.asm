
; size_t w_vector_erase_range(w_vector_t *v, size_t idx_first, size_t idx_last)

XDEF w_vector_erase_range

LIB w_array_erase_range

defc w_vector_erase_range = w_array_erase_range

INCLUDE "../../z80/asm_w_vector_erase_range.asm"
