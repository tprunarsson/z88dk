
; ===============================================================
; Oct 2015
; ===============================================================
; 
; int in_test_key(void)
;
; Return true if a key is currently pressed.
;
; ===============================================================

SECTION code_input

PUBLIC asm_in_test_key

EXTERN asm_cpm_bdos

asm_in_test_key:

   ; exit : nz flag set if a key is pressed
   ;         z flag set if no key is pressed
   ;
   ; uses : potentially all (ix, iy saved for sdcc)
   
   ld c,0x0b                   ; get console status
   call asm_cpm_bdos
   
   or a
   ret
