;                   *************************************** Title block ***********************************************
;		Customer:		Mottramlabs
;		Product:		Hello World
;		Last update:        16th May 2020
;		Author:		David Mottram
;		Device:		PIC12F683
;		Clock:		16MHz Crystal
;		---------------------------------------------------------------------------------------------------
; Revision notes:

                    #define		F_CPU               8000000            ;Xtal frequency

		;Device Selection
		include		PIC12F675_Config_Bits.asm               ;Configuration Bits
		include		PIC12F675_Registers.asm		;Regsiters and bits

                    ;************************************* General purpose registers 20h - 7Fh ************************
                    CBLOCK		020h                                    ;Start of Variable space address
                    Time_1                                                      ;Used by timers
                    Time_2						;Used by timers
                    Time_3						;Used by timers
                    Temp_1						;Temp Reg.
                    Temp_2						;Temp Reg.
                    Temp_3						;Temp Reg.
                    Temp_4						;Temp Reg.
                    Temp_5						;Temp Reg.
                    Temp_6						;Temp Reg.
                    Temp_7						;Temp Reg.													;Temp Reg.
                    ENDC														;End if C Block

                    #define             LED                 5                   ;LED connection
                    
		org		00h                                     ;Reset vector

;                    bsf		Status,RP0			;Reg bank select
;		;Set internal osc to 8MHz                                   
;                    movlw		b'01110011'                             ;Load w
;		movwf		OSCCON				;Load reg
;		movlw		b'00000000'			;Load w
;		movwf		ANSEL				;Select all I/O as digital
;                    bcf                 TRISG0				;I/O
;                    bcf                 TRISG1				;I/O
;                    bcf                 TRISG2				;I/O
;                    bcf                 TRISG3				;I/O
;                    bcf                 TRISG4				;I/O
;                    bcf                 TRISG5				;I/O
;                    bcf		Status,RP0			;Reg bank select

                    
                    
                    
                    ; setup a few things including turning off comparators and interupts	
bsf		Register_Bank_0					; reg bank select
movlw		b'00001111'					; watchdog control, timer0 to Watchdog and slowest setting
movwf		OPTION_REG					; load option reg
bcf		IOC3						; interrupt-on-change GPIO Control bits
bcf		IOC2						; interrupt-on-change GPIO Control bits
bcf		IOC1						; interrupt-on-change GPIO Control bits
bcf		IOC0						; interrupt-on-change GPIO Control bits
bcf		Register_Bank_0					; reg bank select
bcf		GBIE						; RB Port Change Interrupt Enable bit
bsf		CM0						; comparator off
bsf		CM1						; comparator off
bsf		CM2										;Comparator off
                    
bsf     		Register_Bank_0					; select Register Bank 1
bcf		TRISG5						; port direction
bcf		TRISG4						; port direction
bcf		TRISG2						; port direction				
bsf		TRISG1						; port direction
clrf		ANSEL						; turn off A/D, 12F675 only
	
;bcf TRISG1			
bcf     		Register_Bank_0					; select Register Bank 1

movlw		0x07
movwf		CMCON0
   
                    
                    ;Define and enable I/O
                    #Define		PCB_LED             Port_G,LED          ;LED
                    bcf		PCB_LED                                 ;LED Control

                    goto                Start				;Jump
                    
                    ;--------------------------------------------------------------------------------------------------------------
                    ;*********************************  Start of Sub routines *****************************************************
                    ;--------------------------------------------------------------------------------------------------------------

		include		Timer_SUBS.asm			;Timer sub routines

		;-------------------------------------------------------------------------------------------------
		;********************************* End of Sub routines *******************************************
		;-------------------------------------------------------------------------------------------------

Start		;Program start
                    
                    movlw               .004                                    ;Load w, number of flash loops
                    movwf               Temp_1                                  ;Load reg
Loop                ;Flash loop
            	bsf		PCB_LED                                 ;LED Control
		call                Del_10mS                                ;Delay
		bcf		PCB_LED                                 ;LED Control
                    
                    call                Del_100mS                               ;Delay
                    call                Del_100mS                               ;Delay
                    decfsz              Temp_1,1                                ;Dec counter and skip next if zero
                    goto                Loop                                    ;Next flash
                    
                    call                Del_1S                                  ;Delay

                    goto                Start                                   ;Loop
		    
end
	    