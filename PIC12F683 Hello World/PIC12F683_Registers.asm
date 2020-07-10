					;PIC12F683_Registers.asm
					;Date 11th March 2010

					;********** Function Registers ********************************************************************************************
					INDF				equ					00h					;Indirect address

					PC      			equ     			02h             	;Program counter
					PCL      			equ     			02h             	;Program counter
					
    				FSR					equ					04h					;File select register 

    				PCLATH				equ					0Ah					;Page select

					OPTION_REG			equ					81h					;Option register
						#Define			RBPU	    		OPTION_REG,7		;PORTB Pull-up Enable bit
						#Define			INTEDG      		OPTION_REG,6		;Interrupt Edge Select bit
						#Define			T0CS        		OPTION_REG,5		;Clock Source Select bit
						#Define			T0SE        		OPTION_REG,4		;Source Edge Select bit
						#Define			PSA         		OPTION_REG,3		;Prescaler Assignment bit
						#Define			PS2         		OPTION_REG,2		;Prescaler Rate Select bit 2
						#Define			PS1         		OPTION_REG,1		;Prescaler Rate Select bit 1
						#Define			PS0         		OPTION_REG,0		;Prescaler Rate Select bit 0

					Status  			equ     			03h             	;Status Reg.
						;Below are for older programs, kept so as to support these older programs
						Carry   		equ     			00h             	;Carry bit
						Zflag   		equ     			02h             	;Zero bit of status
						RP0				equ					05h					;Reg bank control
						RP1				equ					06h					;Reg bank control
						IRP				equ					07h					;IRP bit
						;Below are the new prefered versions
						#Define			Register_Bank_1 	Status,6			;Register Bank Select bits (used for direct addressing)
						#Define			Register_Bank_0 	Status,5			;Register Bank Select bits (used for direct addressing)
						#Define			Time_Out			Status,4			;Time-out bit
						#Define			Power_Down			Status,3			;Power-down bit
						#Define			Zero_flag 			Status,2			;Zero bit
						#Define			Digit_Carry			Status,1			;Digit carry/borrow bit (ADDWF, ADDLW,SUBLW,SUBWF instructions)
						#Define			Carry_Flag			Status,0			;Carry/borrow bit (ADDWF, ADDLW,SUBLW,SUBWF instructions)

					;********** I/O Port Registers ********************************************************************************************
					Port_G				equ					05h					;Port Register
						#Define			GP0					Port_G,0			;I/O Pin
						#Define			GP1					Port_G,1			;I/O Pin
						#Define			GP2					Port_G,2			;I/O Pin
						#Define			GP3					Port_G,3			;I/O Pin
						#Define			GP4					Port_G,4			;I/O Pin
						#Define			GP5					Port_G,5			;I/O Pin
						#Define			GP6					Port_G,6			;I/O Pin
						#Define			GP7					Port_G,7			;I/O Pin
					TRISG				equ					85h					;Trisate port
						#Define			TRISG0				TRISG,0				;I/O Pin
						#Define			TRISG1				TRISG,1				;I/O Pin
						#Define			TRISG2				TRISG,2				;I/O Pin
						#Define			TRISG3				TRISG,3				;I/O Pin
						#Define			TRISG4				TRISG,4				;I/O Pin
						#Define			TRISG5				TRISG,5				;I/O Pin
						#Define			TRISG6				TRISG,6				;I/O Pin
						#Define			TRISG7				TRISG,7				;I/O Pin

					;********** Interrupt Control Registers ***********************************************************************************
					INTCON				equ					0Bh					;Interupt control register
						#Define			GIE					INTCON,7			;Global Interrupt Enable bit
						#Define			PEIE				INTCON,6			;Peripheral Interrupt Enable bit
						#Define			T0IE				INTCON,5			;TMR0 Overflow Interrupt Enable bit
						#Define			INTE				INTCON,4			;RB0/INT External Interrupt Enable bit
						#Define			GBIE				INTCON,3			;RB Port Change Interrupt Enable bit
						#Define			T0IF				INTCON,2			;TMR0 Overflow Interrupt Flag bit
						#Define			INTF				INTCON,1			;RB0/INT External Interrupt Flag bit
						#Define			GBIF				INTCON,0			;RB Port Change Interrupt Flag bit

					PIE1				equ					8Ch					;Peripheral Interrupt Enable Register 1
						#Define			PSPIE   			PIE1,7				;Parallel Slave Port Read/Write Interrupt Enable
						#Define			ADIE     			PIE1,6				;A/D Converter Interrupt Enable bit
						#Define			RCIE     			PIE1,5				;USART Receive Interrupt Enable bit
						#Define			TXIE      			PIE1,4				;USART Transmit Interrupt Enable bit
						#Define			SSPIE      			PIE1,3				;Synchronous Serial Port Interrupt Enable bit
						#Define			CCP1IE      		PIE1,2				;CCP1 Interrupt Enable bit
						#Define			TMR2IE        		PIE1,1				;TMR2 to PR2 Match Interrupt Enable bit
						#Define			TMR1IE       		PIE1,0				;TMR1 Overflow Interrupt Enable bit

					PIR1				equ					0Ch					;Peripheral Interrupt Register 1
						#Define			PSPIF 				PIR1,7				;Parallel Slave Port Read/Write Interrupt Flag bit
						#Define			ADIF            	PIR1,6				;A/D Converter Interrupt Flag bit
						#Define			RCIF            	PIR1,5				;USART Receive Interrupt Flag bit
						#Define			TXIF            	PIR1,4				;USART Transmit Interrupt Flag bit
						#Define			SSPIF           	PIR1,3				;Synchronous Serial Port (SSP) Interrupt Flag
						#Define			CCP1IF          	PIR1,2				;CCP1 Interrupt Flag bit
						#Define			TMR2IF          	PIR1,1				;TMR2 to PR2 Match Interrupt Flag bit
						#Define			TMR1IF          	PIR1,0				;TMR1 Overflow Interrupt Flag bit

					IOC					equ					96h					;Interrupt-on-change GPIO Control Register
						#Define			IOC5				IOC,5				;Interrupt-on-change GPIO Control bits
						#Define			IOC4				IOC,4				;Interrupt-on-change GPIO Control bits
						#Define			IOC3				IOC,3				;Interrupt-on-change GPIO Control bits
						#Define			IOC2				IOC,2				;Interrupt-on-change GPIO Control bits
						#Define			IOC1				IOC,1				;Interrupt-on-change GPIO Control bits
						#Define			IOC0				IOC,0				;Interrupt-on-change GPIO Control bits
						
					;********** A/D Registers *************************************************************************************************
					ADRESH				equ					1Eh					;A/D register results
					ADRESL				equ					9Eh					;A/D register results

					ADCON0				equ					1Fh					;A/D control reg.
						#Define			ADON				ADCON0,0			;A/D on/off (1=on)
						#Define			GO_DONE				ADCON0,2			;Start A/D convertion, read 0 when finished
						#Define			CHS0				ADCON0,3			;Channel select, Bit 0
						#Define			CHS1				ADCON0,4			;Channel select, Bit 1
						#Define			VCFG				ADCON0,6			;Voltage Reference bit
						#Define			ADFM				ADCON0,7			;A/D Conversion Result Format Select bit 1 = Right justified 0 = Left justified

					ANSEL				equ					9Fh					;Analog select
						#Define			ADCS2				ANSEL,6				;A/D Conversion Clock Select bits
						#Define			ADCS1				ANSEL,5				;A/D Conversion Clock Select bits
						#Define			ADCS0				ANSEL,4				;A/D Conversion Clock Select bits
						#Define			ANS3				ANSEL,3				;Analog Select bits. Analog/Digital
						#Define			ANS2				ANSEL,2				;Analog Select bits. Analog/Digital
						#Define			ANS1				ANSEL,1				;Analog Select bits. Analog/Digital
						#Define			ANS0				ANSEL,0				;Analog Select bits. Analog/Digital

					VRCON				equ					99h					;Voltage Reference Control Register
						#Define			VREN				VRCON,7				;CVREF Enable
						#Define			VRR					VRCON,5				;CVREF Range Selection
						#Define			VR3					VRCON,3				;CVREF Value Selection
						#Define			VR2					VRCON,2				;CVREF Value Selection
						#Define			VR1					VRCON,1				;CVREF Value Selection
						#Define			VR0					VRCON,0				;CVREF Value Selection

					;********** Timer 0 control ***********************************************************************************************
					TMR0				equ					01h					;Timer 0 Register Low

					;********** Timer 1 control ***********************************************************************************************
					T1CON				equ					10h					;T1CON register
						#Define			T1DINV				T1CON,7				;Timer1 Gate Invert
						#Define			TMR1GE				T1CON,6				;Timer1 Gate Enable bit
						#Define			T1CKPS1				T1CON,5				;Prescaler selection bit 1
						#Define			T1CKPS0				T1CON,4				;Prescaler selection bit 0
						#Define			T1PSCEN				T1CON,3				;Oscillator enable 1=enable
						#Define			T1SYNC				T1CON,2				;External clock input sync. 0=Synchronize 1=Do not syncronize
						#Define			TMR1CS				T1CON,1				;Clock source select. 1=External 0=Internal
						#Define			TMR1ON				T1CON,0				;Timer 1 on. 0=Stop 1=Start

					TMR1L				equ					0Eh					;Timer 1 Register Low
					TMR1H				equ					0Fh					;Timer 1 Register High

					;********** Timer 2 control ***********************************************************************************************
					TMR2 				equ					11h					;Timer2 Moduleís Register

					T2CON				equ					12h					;T2CON register
						#Define			TOUTPS3 			T2CON,6				;TOUTPS3 Timer2 Output Postscale Select bits
						#Define			TOUTPS2 			T2CON,5				;TOUTPS2 Timer2 Output Postscale Select bits
						#Define			TOUTPS1 			T2CON,4				;TOUTPS1 Timer2 Output Postscale Select bits
						#Define			TOUTPS0 			T2CON,3				;TOUTPS0 Timer2 Output Postscale Select bits
						#Define			TMR2ON	 			T2CON,2				;TMR2ON: Timer2 On bit
						#Define			T2CKPS1 			T2CON,1				;T2CKPS1 Timer2 Clock Prescale Select bits
						#Define			T2CKPS0 			T2CON,0				;T2CKPS0 Timer2 Clock Prescale Select bits

					PR2 				equ					92h					;Timer2 Period Register

					;********** PCON - Power Control Register *********************************************************************************
					PCON				equ					8Eh					;PCON reg
						#Define			ULPWUE				PCON,5				;Ultra Low-Power Wake-Up Enable	
						#Define			SBOREN				PCON,4				;Software BOR Enable
						#Define			Power_On_Reset		PCON,1				;Power-on Reset Status bit
						#Define			Brown_Out			PCON,0				;Brown-out Reset Status bit

					;********** EEPROM Registers **********************************************************************************************
					EEDATA				equ					9Ah					;EEPROM Data Register, Low Byte

					EEADR				equ					9Bh 				;EEPROM Address Register, Low Byte

					EECON1				equ					9Ch					;EEPROM Control Register 1
						#Define			EEPROM_WRERR 		EECON1,3			;EEPROM Error Flag bit
						#Define			EEPROM_WREN  		EECON1,2			;EEPROM Write Enable bit
						#Define			EEPROM_WR    		EECON1,1			;Write Control bit
						#Define			EEPROM_RD    		EECON1,0			;Read Control bit

					EECON2				equ					9Dh					;EEPROM Control Register2 (not a physical register)

					;********** Capture, Compare and PWM Module *******************************************************************************
					CCPR1L 				equ					13h 				;Capture/Compare/PWM Register1 (LSB)
					CCPR1H				equ					14h  				;Capture/Compare/PWM Register1 (MSB)
					CCP1CON				equ					15h					;Capture/Compare/PWM control Register 1
						#Define			DC1B1				CCP1CON,5			;PWM Duty Cycle Least Significant bits
						#Define			DC1B0				CCP1CON,4			;PWM Duty Cycle Least Significant bits
						#Define			CCP1M3              CCP1CON,3   		;Mode Select bits
						#Define			CCP1M2              CCP1CON,2   		;Mode Select bits
						#Define			CCP1M1              CCP1CON,1   		;Mode Select bits
						#Define			CCP1M0              CCP1CON,0   		;Mode Select bits
		
					CMCON0				equ					19h					;Comarator Configuration Register
						#Define			COUT				CMCON0,6			;Comparator Output bit
						#Define			CINV				CMCON0,4			;Comparator Output Inversion bit
						#Define			CIS					CMCON0,3			;Comparator Input Switch bit
						#Define			CM2					CMCON0,2			;Comparator Mode bits
						#Define			CM1					CMCON0,1			;Comparator Mode bits
						#Define			CM0					CMCON0,0			;Comparator Mode bits
					
					CMCON1				equ					1Ah					;Comarator Configuration Register
						#Define			T1GSS				CMCON1,1			;Timer1 Gate Source Select
						#Define			CMSYNC				CMCON1,0			;Comparator Output Synchronization

					;********** Internal Oscillator Control ***********************************************************************************
					OSCCON				equ					8Fh					;Oscillator Control Register
						#Define			IRCF_2				OSCCOM,6			;Internal Oscillator Frequency Select bits 2
						#Define			IRCF_1				OSCCOM,5			;Internal Oscillator Frequency Select bits 1
						#Define			IRCF_0				OSCCOM,4			;Internal Oscillator Frequency Select bits 0
																				;111 = 8MHz
																				;110 = 4MHz (default)
																				;101 = 2MHz
																				;100 = 1MHz
																				;011 = 500kHz
																				;010 = 250kHz
																				;001 = 125kHz
																				;000 = 31kHz (LFINTOSC)
						#Define			OSTS				OSCCON,3			;Oscillator Start-up Time-out Status bit
						#Define			HTS					OSCCON,2			;HFINTOSC Status bit (High Frequency ñ 8MHz to 125kHz)
						#Define			LTS					OSCCON,1			;LFINTOSC Stable bit (Low Frequency ñ 31kHz)
						#Define			SCS					OSCCON,0			;System Clock Select bit

					OSCTUNE				equ					90h					;Oscillator Tuning Register

					;********** Watchdog Timer Control ****************************************************************************************
					WDTCON				equ					18h					;Watchdog Timer Control Register
						#Define			WDTPS3				WDTCON,4			;Watchdog Timer Period Select bits
						#Define			WDTPS2				WDTCON,3			;Watchdog Timer Period Select bits
						#Define			WDTPS1				WDTCON,2			;Watchdog Timer Period Select bits
						#Define			WDTPS0				WDTCON,1			;Watchdog Timer Period Select bits
						#Define			SWDTEN				WDTCON,0			;Software Enable or Disable the Watchdog Timer

					;********** Weak Pull-up *************************************************************************************************
					WPU					equ					95h					;Weak Pull-up Register
						#Define			WPU5				WPU,5				;Weak Pull-up Control bits	
						#Define			WPU4				WPU,4				;Weak Pull-up Control bits	
						#Define			WPU2				WPU,2				;Weak Pull-up Control bits	
						#Define			WPU1				WPU,1				;Weak Pull-up Control bits	
						#Define			WPU0				WPU,0				;Weak Pull-up Control bits	


					;********** End of File **************************************************************************************************
						








