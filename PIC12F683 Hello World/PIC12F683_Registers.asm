                    ;PIC12F675_Registers.asm
                    ;Date 3rd June 2020

                    ; function Registers
                    INDF                equ                 00h                 ; indirect address

                    PC                  equ                 02h                 ; program counter
                    PCL                 equ                 02h                 ; program counter
                    
                    FSR                 equ                 04h                 ; file select register 

                    PCLATH              equ                 0Ah                 ; page select

                    OPTION_REG          equ                 81h                 ; option register
                        #Define         GPPU                OPTION_REG,7        ; GPIO Pull-up Enable bit
                        #Define         INTEDG              OPTION_REG,6        ; interrupt Edge Select bit
                        #Define         T0CS                OPTION_REG,5        ; clock Source Select bit
                        #Define         T0SE                OPTION_REG,4        ; source Edge Select bit
                        #Define         PSA                 OPTION_REG,3        ; prescaler Assignment bit
                        #Define         PS2                 OPTION_REG,2        ; prescaler Rate Select bit 2
                        #Define         PS1                 OPTION_REG,1        ; prescaler Rate Select bit 1
                        #Define         PS0                 OPTION_REG,0        ; prescaler Rate Select bit 0

                    Status              equ                 03h                 ; status Reg.
                        ;Below are for older programs, kept so as to support these older programs
                        Carry           equ                 00h                 ; carry bit
                        Zflag           equ                 02h                 ; zero bit of status
                        RP0             equ                 05h                 ; reg bank control
                        RP1             equ                 06h                 ; reg bank control
                        IRP             equ                 07h                 ; IRP bit
                        ;Below are the new prefered versions
                        #Define         Register_Bank_1     Status,6            ; register Bank Select bits (used for direct addressing)
                        #Define         Register_Bank_0     Status,5            ; register Bank Select bits (used for direct addressing)
                        #Define         Time_Out            Status,4            ; time-out bit
                        #Define         Power_Down          Status,3            ; power-down bit
                        #Define         Zero_Flag           Status,2            ; zero bit
                        #Define         Digit_Carry         Status,1            ; digit carry/borrow bit (ADDWF, ADDLW,SUBLW,SUBWF instructions)
                        #Define         Carry_Flag          Status,0            ; carry/borrow bit (ADDWF, ADDLW,SUBLW,SUBWF instructions)

                    ; I/O Port Registers
                    Port_G              equ                 05h                 ; port Register
                        #Define         GP0                 Port_G,0            ; I/O Pin
                        #Define         GP1                 Port_G,1            ; I/O Pin
                        #Define         GP2                 Port_G,2            ; I/O Pin
                        #Define         GP3                 Port_G,3            ; I/O Pin
                        #Define         GP4                 Port_G,4            ; I/O Pin
                        #Define         GP5                 Port_G,5            ; I/O Pin
                        #Define         GP6                 Port_G,6            ; I/O Pin
                        #Define         GP7                 Port_G,7            ; I/O Pin
                    TRISG               equ                 85h                 ; trisate port
                        #Define         TRISG0              TRISG,0             ; I/O Pin
                        #Define         TRISG1              TRISG,1             ; I/O Pin
                        #Define         TRISG2              TRISG,2             ; I/O Pin
                        #Define         TRISG3              TRISG,3             ; I/O Pin
                        #Define         TRISG4              TRISG,4             ; I/O Pin
                        #Define         TRISG5              TRISG,5             ; I/O Pin
                        #Define         TRISG6              TRISG,6             ; I/O Pin
                        #Define         TRISG7              TRISG,7             ; I/O Pin

                    ;********** Interrupt Control Registers ***********************************************************************************
                    INTCON              equ                 0Bh                 ; interupt control register
                        #Define         GIE                 INTCON,7            ; global Interrupt Enable bit
                        #Define         PEIE                INTCON,6            ; peripheral Interrupt Enable bit
                        #Define         T0IE                INTCON,5            ; TMR0 Overflow Interrupt Enable bit
                        #Define         INTE                INTCON,4            ; RB0/INT External Interrupt Enable bit
                        #Define         GBIE                INTCON,3            ; RB Port Change Interrupt Enable bit
                        #Define         T0IF                INTCON,2            ; TMR0 Overflow Interrupt Flag bit
                        #Define         INTF                INTCON,1            ; RB0/INT External Interrupt Flag bit
                        #Define         GBIF                INTCON,0            ; RB Port Change Interrupt Flag bit

                    PIE1                equ                 8Ch                 ; peripheral Interrupt Enable Register 1
                        #Define         EEIE                PIE1,7              ; EE Write Complete Interrupt Enable bit
                        #Define         ADIE                PIE1,6              ; A/D Converter Interrupt Enable bit (PIC12F675 only)
                        #Define         CMIE                PIE1,3              ; comparator Interrupt Enable bit
                        #Define         TMR1IE              PIE1,0              ; TMR1 Overflow Interrupt Enable bit

                    PIR1                equ                 0Ch                 ; peripheral Interrupt Register 1
                        #Define         EEIF                PIR1,7              ; EEPROM Write Operation Interrupt Flag bit
                        #Define         ADIF                PIR1,6              ; A/D Converter Interrupt Flag bit
                        #Define         CMIF                PIR1,3              ; comparator Interrupt Flag bit
                        #Define         TMR1IF              PIR1,0              ; TMR1 Overflow Interrupt Flag bit

                    IOC                 equ                 96h                 ; interrupt-on-change GPIO Control Register
                        #Define         IOC5                IOC,5               ; interrupt-on-change GPIO Control bits
                        #Define         IOC4                IOC,4               ; interrupt-on-change GPIO Control bits
                        #Define         IOC3                IOC,3               ; interrupt-on-change GPIO Control bits
                        #Define         IOC2                IOC,2               ; interrupt-on-change GPIO Control bits
                        #Define         IOC1                IOC,1               ; interrupt-on-change GPIO Control bits
                        #Define         IOC0                IOC,0               ; interrupt-on-change GPIO Control bits
                        
                    VRCON               equ                 99h                 ; voltage Reference Control Register
                        #Define         VREN                VRCON,7             ; CVREF Enable
                        #Define         VRR                 VRCON,5             ; CVREF Range Selection
                        #Define         VR3                 VRCON,3             ; CVREF Value Selection
                        #Define         VR2                 VRCON,2             ; CVREF Value Selection
                        #Define         VR1                 VRCON,1             ; CVREF Value Selection
                        #Define         VR0                 VRCON,0             ; CVREF Value Selection

                    ;********** Timer 0 control ***********************************************************************************************
                    TMR0                equ                 01h                 ; timer 0 Register Low

                    ;********** Timer 1 control ***********************************************************************************************
                    T1CON                equ                10h                 ; T1CON register
                        #Define          TMR1GE             T1CON,6             ; Timer1 Gate Enable bit
                        #Define          T1CKPS1            T1CON,5             ; prescaler selection bit 1
                        #Define          T1CKPS0            T1CON,4             ; prescaler selection bit 0
                        #Define          T1OSCEN            T1CON,3             ; LP Oscillator Enable Control bit
                        #Define          T1SYNC             T1CON,2             ; external clock input sync. 0=Synchronize 1=Do not syncronize
                        #Define          TMR1CS             T1CON,1             ; clock source select. 1=External 0=Internal
                        #Define          TMR1ON             T1CON,0             ; timer 1 on. 0=Stop 1=Start

                    TMR1L                equ                0Eh                 ; timer 1 Register Low
                    TMR1H                equ                0Fh                 ; timer 1 Register High

                    ;********** PCON - Power Control Register *********************************************************************************
                    PCON                equ                 8Eh                 ; PCON reg
                        #Define         Power_On_Reset      PCON,1              ; power-on Reset Status bit
                        #Define         Brown_Out           PCON,0              ; brown-out Reset Status bit

                    ;********** EEPROM Registers **********************************************************************************************
                    EEDATA              equ                 9Ah                 ; EEPROM Data Register, Low Byte

                    EEADR               equ                 9Bh                 ; EEPROM Address Register, Low Byte

                    EECON1              equ                 9Ch                 ; EEPROM Control Register 1
                        #Define         EEPROM_WRERR        EECON1,3            ; EEPROM Error Flag bit
                        #Define         EEPROM_WREN         EECON1,2            ; EEPROM Write Enable bit
                        #Define         EEPROM_WR           EECON1,1            ; write Control bit
                        #Define         EEPROM_RD           EECON1,0            ; read Control bit

                    EECON2              equ                 9Dh                 ; EEPROM Control Register2 (not a physical register)

                    ;********** Capture, Compare and PWM Module *******************************************************************************
                    CMCON0              equ                 19h                 ; comarator Configuration Register
                        #Define         COUT                CMCON0,6            ; comparator Output bit
                        #Define         CINV                CMCON0,4            ; comparator Output Inversion bit
                        #Define         CIS                 CMCON0,3            ; comparator Input Switch bit
                        #Define         CM2                 CMCON0,2            ; comparator Mode bits
                        #Define         CM1                 CMCON0,1            ; comparator Mode bits
                        #Define         CM0                 CMCON0,0            ; comparator Mode bits
                    
                    ;********** Internal Oscillator Control ***********************************************************************************
                    OSCCAL              equ                 90h                 ; oscillator Calibration Register
                        #Define         CAL5                OSCCAL,7            ; 6-bit Signed Oscillator Calibration bits
                        #Define         CAL4                OSCCAL,6            ; 6-bit Signed Oscillator Calibration bits
                        #Define         CAL3                OSCCAL,5            ; 6-bit Signed Oscillator Calibration bits
                        #Define         CAL2                OSCCAL,4            ; 6-bit Signed Oscillator Calibration bits
                        #Define         CAL1                OSCCAL,3            ; 6-bit Signed Oscillator Calibration bits
                        #Define         CAL0                OSCCAL,2            ; 6-bit Signed Oscillator Calibration bits

                    ;********** Weak Pull-up *************************************************************************************************
                    WPU                 equ                 95h                 ; weak Pull-up Register
                        #Define         WPU5                WPU,5               ; weak Pull-up Control bits    
                        #Define         WPU4                WPU,4               ; weak Pull-up Control bits    
                        #Define         WPU2                WPU,2               ; weak Pull-up Control bits    
                        #Define         WPU1                WPU,1               ; weak Pull-up Control bits    
                        #Define         WPU0                WPU,0               ; weak Pull-up Control bits    


                    ;********** End of File **************************************************************************************************
