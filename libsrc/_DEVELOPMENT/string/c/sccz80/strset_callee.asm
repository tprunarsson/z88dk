
; char* strset(char *s, int c)

SECTION code_clib
SECTION code_string

PUBLIC strset_callee

EXTERN asm_strset

strset_callee:

   pop hl
   pop de
   ex (sp),hl
   
   jp asm_strset

; SDCC bridge for Classic
IF __CLASSIC
PUBLIC _strset_callee
defc _strset_callee = strset_callee
ENDIF

