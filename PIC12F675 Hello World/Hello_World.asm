;                   *************************************** Title block ***********************************************
;                   Customer:           Mottramlabs
;                   Product:            Hello World
;                   Last update:        16th May 2020
;                   Author:             David Mottram
;                   Device:             PIC12F675
;                   Clock:              Internal 8MHz
;                   ---------------------------------------------------------------------------------------------------

                    #define             F_CPU               8000000             ; Xtal frequency

                    ; device Selection
                    include             PIC12F675_Config_Bits.asm               ; configuration Bits
                    include             PIC12F675_Registers.asm                 ; regsiters and bits

                    ;************************************* General purpose registers 20h - 7Fh ************************
                    CBLOCK              020h                                    ; start of Variable space address
                    Time_1                                                      ; used by timers
                    Time_2                                                      ; used by timers
                    Time_3                                                      ; used by timers
                    Temp_1                                                      ; temp reg
                    Temp_2                                                      ; temp reg
                    Temp_3                                                      ; temp reg
                    ENDC                                                        ; end if C Block

                    #define             LED                 GP5                 ; LED
                    
                    org                 00h                                     ; reset vector

                    ; setup a few things including turning off comparators and interupts    
                    bsf                 Register_Bank_0                         ; reg bank select
                    movlw               b'00001111'                             ; watchdog control, timer0 to Watchdog and slowest setting
                    movwf               OPTION_REG                              ; load option reg
                    bcf                 IOC3                                    ; interrupt-on-change GPIO Control bits
                    bcf                 IOC2                                    ; interrupt-on-change GPIO Control bits
                    bcf                 IOC1                                    ; interrupt-on-change GPIO Control bits
                    bcf                 IOC0                                    ; interrupt-on-change GPIO Control bits
                    bcf                 Register_Bank_0                         ; reg bank select
                    bcf                 GBIE                                    ; RB Port Change Interrupt Enable bit
                    bsf                 CM0                                     ; comparator off
                    bsf                 CM1                                     ; comparator off
                    bsf                 CM2                                     ;Comparator off
                    
                    bsf                 Register_Bank_0                         ; select Register Bank 1
                    bcf                 TRISG5                                  ; port direction
                    bcf                 TRISG4                                  ; port direction
                    bcf                 TRISG2                                  ; port direction                
                    bsf                 TRISG1                                  ; port direction
                    clrf                ANSEL                                   ; turn off A/D, 12F675 only
                    bcf                 Register_Bank_0                         ; select Register Bank 1

                    movlw               0x07                                    ; load w
                    movwf               CMCON0                                  ; comarators off, digital I/O only

                    bcf                 LED                                     ; LED control
                    goto                Start                                   ; jump
                    
                    ;--------------------------------------------------------------------------------------------------------------
                    ;*********************************  Start of Sub routines *****************************************************
                    ;--------------------------------------------------------------------------------------------------------------

                    include             Timer_SUBS.asm                          ; timer sub routines

                    ;-------------------------------------------------------------------------------------------------
                    ;********************************* End of Sub routines *******************************************
                    ;-------------------------------------------------------------------------------------------------

Start               ; program start
                    
                    movlw               .004                                    ; load w, number of flash loops
                    movwf               Temp_1                                  ; load reg
Loop                ; flash loop
                    bsf                 LED                                     ; LED control
                    call                Del_10mS                                ; delay
                    bcf                 LED                                     ; LED control
                    
                    call                Del_100mS                               ; delay
                    call                Del_100mS                               ; delay

                    decfsz              Temp_1,1                                ; dec counter and skip next if zero
                    goto                Loop                                    ; next flash
                    
                    call                Del_1S                                  ; delay
                    goto                Start                                   ; loop
            
end
        
