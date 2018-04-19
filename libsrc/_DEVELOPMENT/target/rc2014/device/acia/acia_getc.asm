
    SECTION code_driver
    SECTION code_driver_character_input

    PUBLIC _acia_getc

    EXTERN __IO_ACIA_CONTROL_REGISTER
    EXTERN __IO_ACIA_CR_TEI_MASK, __IO_ACIA_CR_TDI_RTS0
    EXTERN __IO_ACIA_RX_EMPTYISH

    EXTERN aciaRxCount, aciaRxOut, aciaRxBuffer, aciaControl
    EXTERN asm_z80_push_di, asm_z80_pop_ei

    _acia_getc:

        ; exit     : l = char received
        ;            carry reset if Rx buffer is empty
        ;
        ; modifies : af, hl

        ld a, (aciaRxCount)         ; get the number of bytes in the Rx buffer
        ld l, a                     ; and put it in hl
        or a                        ; see if there are zero bytes available
        ret Z                       ; if the count is zero, then return

        cp __IO_ACIA_RX_EMPTYISH    ; compare the count with the preferred empty size
        jr NC, get_clean_up_rx      ; if the buffer not emptyish, don't change the RTS

        di        
        ld a, (aciaControl)         ; get the ACIA control echo byte
        and ~__IO_ACIA_CR_TEI_MASK  ; mask out the Tx interrupt bits
        or __IO_ACIA_CR_TDI_RTS0    ; set RTS low.
        ld (aciaControl), a	        ; write the ACIA control echo byte back
        ei
        out (__IO_ACIA_CONTROL_REGISTER), a    ; set the ACIA CTRL register

    get_clean_up_rx:
        ld hl,aciaRxCount
        di      
        dec (hl)                    ; atomically decrement Rx count
        ld hl, (aciaRxOut)          ; get the pointer to place where we pop the Rx byte
        ei
        ld a, (hl)                  ; get the Rx byte

        inc l                       ; move the Rx pointer low byte along
        ld (aciaRxOut), hl          ; write where the next byte should be popped

        ld l, a                     ; and put it in hl
        scf                         ; indicate char received
        ret

    EXTERN _acia_need
    defc NEED = _acia_need

