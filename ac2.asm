; Perifericos de Entrada
PER_EN 					EQU 30H		;Endereço do PER_EN
ON_OFF  				EQU 1A0H    ;BOTAO ON/OFF
EntradaCodigoCartao		EQU 20H	;Endereço do periferico para submeter o código do Cartão PEPE

; Periferico de Saida
Display 	EQU 40H  ;Endereço onde começa o display
Display_end EQU 175  ;Endereço onde termina o display
CaracterVazio 	 		EQU 20 			;limpa o ecra

Numero_Cartoes              EQU 35H        ;numero de cartoes na memoria(CORRESPONDE A 5 )
EntradaColocardinheiroCartao		EQU 10H	      ;Endereço de numero_cartoes
UltimoEndrecoPEPE                   EQU 5100H ;ENDREÇO


TabelaCartoesInicio 	EQU	4000H
;código único de  5 caracteres  - 5 bytes (Ex: XXXXX)
; saldo disponivel				- 5 bytes (Ex: 1 5 , 0 0)


PasswordLugar			EQU 0980H
ApontadorCartaoaUtilizar 		EQU 3FE0H; aponta para o cartão pepe que está a ser utilizado
NULL 							EQU 0;
novoCodigoPepe          EQU 3FC0H; endereço de memoria do numero do pepe que foi gerado

;SP
StackPointer 	EQU 6000H ;Endereço onde começa a Stack Pointer

Place 0010H
String "5    "

Place 4000H
String "12345"
String "15,90"

Place 4010H
String "21214"
String "24,10"

Place 4020H
String "72984"
String "08,00"

Place 4030H
String "18352"
String "81,30"

Place 4040H
String "98765"
String "99,50"

Place 3FC0H
String "000"


Place 200H
MenuPrincipal:
	String "|--------------|"
	String "|MAQUINA VENDAS|"
	String "|-----METRO----|"
	String "|1-COMPRAR     |"
	String "|2-USAR CARTAO |"
	String "|3-STOCK       |"
	String "|4-Faz Cartao  |"
	
Place 280H
Menu_Estacoes:
	String "--Menu Inicial--"
	String "-Metro Estacoes-"
	String "----------------"
	String "1) Lisboa       "
	String "2) Porto        "
	String "7) Cancelar     "
	String "----------------"
	
Place 300H
Menu_Lisboa:
	String "----------------"
	String "--Lisboa 1/1----"
	String "0) Sair         "
	String "1) Almada   1,50"
	String "2) Parlamen 2,50"
	String "3) Pont25/4 3,50"
	String "7) Seguinte     "

Place 380H
Menu_Lisboa_2:
	String "----------------"
	String "--Lisboa 2/2----"
	String "0) Sair         "
	String "4) D.JoseI  4,50"
	String "5) M.Pombal 1,90"
	String "6) Alvalade 5,00"
	String "7) Anterior     "

Place 400H
Menu_Porto:
	String "----------------"
	String " Porto 1/2      "
	String "0) Sair         "
	String "1) Douro    3,50"
	String "2) Conegos  2,50"
	String "3) Dragao   1,50"
	String "7) Seguinte     "

Place 480H
Menu_Porto_2:
	String "----------------"
	String "-Porto 2/2  ----"
	String "0) Sair         "
	String "4) Varzim   4,50"
	String "5) Gaia     2,50"
	String "6) Barcelos 1,20"
	String "7) Anterior     "

Place 500H
Talao:
	String "----------------"
	String " PEPE GERADO:XXX"
	String "->              "
	String "-> Inserido 1,00"
	String "-> Troco    1,00"
	String "----------------"
	String "1) Continuar    "
	
Place 580H
TalaoInt:
	String "----------------"
	String "      Talao     "
	String "Inserido:   0,00"
	String "                "
	String "Preço:      X,XX"
	String "----------------"
	String "1)Inserir Moedas"
	
Place 600H
FormaPag:
	String "----Pagamento---"
	String "1)5,00          "
	String "2)2,00          "
	String "3)1,00          "
	String "4)0,50          "
	String "5)0,20          "
	String "6)0,10          "
	
Place 680H
StockIni:
	String "---- Stock -----"
	String "  Introduza a   "
	String "    Password    "
	String "                "
	String "     ----       "
	String "1) Continuar    "
	String "2) Voltar       "
	
Place 700H
Bilhtete1:
	String "--S.Bilhete1/3--"
	String "Almada      0000"
	String "Parla       0000"
	String "Ponte       0099"
	String "D.JoseI     0099"
	String "1) Seguinte     "
	String "2) Sair         "
	
Place 780H
Bilhtete2:
	String "--S.Bilhete2/3--"
	String "M.Pombal    0099"
	String "D.JoseI     0099"
	String "Alvalade    0099"
	String "Douro       0099"
	String "1) Seguinte     "
	String "2) Anterior     "
	
Place 800H
Bilhete3:
	String "--S.Bilhete3/3--"
	String "Conegos     0099"
	String "Dragao      0099"
	String "Varzim      0099"
	String "Gaia        0099"
	String "Barcelos    0099"
	String "2) Sair         "
	
Place 880H
Stock1:
	String "-- Stock 1/2 ---"
	String "5,00        0001"
	String "2,00        0099"
	String "1,00        0099"
	String "0,50        0099"
	String "1) Seguinte     "
	String "2) Anterior     "

Place 900H
Stock2:
	String "-- Stock 2/2 ---"
	String "0,20        0099"
	String "0,10        0099"
	String "                "
	String "                "
	String "1) Anterior     "
	String "2) Sair         "

Place 980H
Password:
	String "02024"
	
Place 0A00H
StockErr:
	String "---- Stock -----"
	String "     ERRO!!     "
	String " Password Errada"
	String "                "
	String "                "
	String "                "
	String "1) Continuar    "
	
Place 0A80H
StockErr1:
	String "----- ERRO -----"
	String "                "
	String "    Moedas      "
	String " Não tem Stock  "
	String "                "
	String "                "
	String "1) Continuar    "
Place 0B00H 
MenuCodigoPepe:
	String "Introduza n.Pepe"
	String "|    XXXXX     |"
	String "|--------------|"
	String "|1- Continuar  |"
	String "|5- Cancelar   |"
	String "|              |"
	String "|--------------|"
Place 0B80H 
MenuSaldoPepe:
	String "|---Saldo PEPE-|"
	String "|------00.00---|"
	String "|1- Comprar    |"
	String "|2- Recarregar |"
	String "|              |"
	String "|7- Sair       |"
	String "|--------------|"
Place 0C10H
Menu_Erro_Pepe:
	String "----- ERRO -----"
	String "                "
	String "      Cartao    "
	String "  Inexistente!  "
	String "                "
	String " 1) Continuar   "
	String "                "
Place 0D90H
InserirValor:
	String "----------------"
	String "---Recarregar---"
	String "Inserido:  00,00"
	String "                "
	String "----------------"
	String "1) Inserir      "
	String "2) Continuar    "	
Place 0D10H
TalaoPepe:
	String "----------------"
	String "      Talao     "
	String "Saldo Atual:    "
	String " 00,00          "
	String "Inserido:   0,00"
	String "----------------"
	String "1) Continuar    "

Place 0E10H
Cartao_feito2:
	String "Cartao feito    "
	String "                "
	String "      Cartao    "
	String "  Numero: XXXXX "
	String "                "
	String " 1) Continuar   "
	String " 2) Usar Cartao "

Place 0E90H
TalaoCartaoPepe:
	String "----------------"
	String "   PEPE: xxxxx  "
	String "->              "
	String "-> Saldo:   1,00"
	String "->Restante: 1,00"
	String "----------------"
	String "1) Continuar    "
Place 0F10H
TalaoRecarregamento:
	String "----------------"
	String "Cartao Carregado"
	String "                "
	String "Inserido:  00,00"
	String "Saldo:     00,00"
	String "----------------"
	String "1) Continuar    "

Place 0F90H
ErroSaldoInsuficiente:
	String "----- ERRO -----"
	String "                "
	String "      Saldo     "
	String "  Insuficiente  "
	String "                "
	String " 1) Cancelar    "
	String " 2) Recarregar  "


Place 0000H
Inicio:
	MOV R0, Principio
	JMP R0
	
Place 3000H
Principio:
	MOV SP, StackPointer				;Stack Pointer onde esta a pilha
	MOV R2, MenuPrincipal				;Carrega o endereço do menu principal
	CALL LimpaDisplay					;Limpa o Display de saida onde estara a nossa interface
	CALL LimpaPerifericos				;limpa os perifericos
	MOV R0,ON_OFF        				;move o endreço de ON_OFF para r0
	Liga:                    			; liga Maquina   
		MOVB R1,[R0]         			; passa o byte no endereço para R1 
		CMP R1,1						;Se for 1 liga
		JNE Liga
	ligado:                 		; mostra o menu inicial 
		MOV R2,MenuPrincipal 
		CALL MostrarDisplay
		CALL LimpaPerifericos		;limpa os perifericos
		MOV R9, ApontadorCartaoaUtilizar
		MOV R0, NULL
		MOV [R9], R0
	Le_PER_EN:
		MOV R0, PER_EN					;Le o endereço onde esta o PER_EN
		MOVB R1, [R0]					;Le o PER_EN da memoria
		CMP R1, 1						;Compara o PER_EN com o valor 1
		JEQ	MComparBilhet					;Opção Comaprar	
		CMP R1, 2						;Compara o PER_EN com o valor 2
		JEQ MCartao						;Opcão Usar Cartao
		CMP R1, 3						;Compara o PER_EN com o valor 3
		JEQ Stoc						;Opcão Stock
		CMP R1, 4
		JEQ FazCartao
	JMP Le_PER_EN					;Caso nao tenha sido introduzido nenhum valor de PER_EN valido, o mesmo fica num ciclo
	;----------------------------------------
MComparBilhet:
JMP MComparBilhete
Stoc:
JMP Stock

	FazCartao:
	   CALL cartao_operacao
		MOV R2, Cartao_feito2			;Carrega o endereço do menu de produtos
		CALL MostrarDisplay				;Mostra o menu de produtos
		CALL LimpaPerifericos			;Limpa os perifericos de entrada
		
		Faz_Cart:
			MOV R0, PER_EN					;Le o endereço de PER_EN
			MOVB R1, [R0]					;Le o PER_EN da memoria
			CMP R1, 1						;Compara o PER_EN com o valor 1
			JEQ	ligado 					;Opção Cartao para continuar
			CMP R1,2
		    JEQ MCartao
		JMP Faz_Cart	
		
    cartao_operacao:
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7
	PUSH R8
	PUSH R9
	MOV R4, 0010H
	MOVB R0, [R4]         ;numero de cartoes(35h)
	MOV R1, TabelaCartoesInicio    ;endreço onde estão os cartoes
	MOV R2, 0010H                  ;IR DE LINHA A LINHA CONSOANTE O NUMERO DE CARTOES PEPE
	MOV R5, R0                      ;Adiciona um ao numero_cartoes  
	ADD R5, 1H                     ;1 para percorrer os cartoes
	MOV R6, 30H  ;ZERO
	MOV R7, 5       ;NUMERO DE DIGITOS DO CODIGO PEPE
	ciclo_cartao_at:
	ADD R1, R2    ;Soma 1 linha a cada  cartao(0010H)
	ADD R6,1H
	CMP R6, R5    ;se o numero de cartoes for igual para
	JEQ fimmmmm
	JMP ciclo_cartao_at
	
	fimmmmm:
	MOV R9, 0E4AH ;ENDREÇO DO DISPLAY 
	SUB R1,R2  ; linha para inserir os cartoes
	MOVB [R4],R6            ;ATRIBUI AO ENDREÇO O NOVO REGISTOS DE CARTOES
	JMP ciclo_preencher_digitos_pepe
	ciclo_preencher_digitos_pepe: ;"digitos aleatorios"
	MOVB[R1], R5 ;endreço para a memoria
	MOVB[R9],R5  ;endreço display
	ADD R9,1 ;percorrer o display
	ADD R1, 1H ;percorrer a memoria
	ADD R5,1H ; conteudo para o display/memoria
	ADD R8,1 ;var controlo para depois parar 
	CMP R7,R8
	JEQ fim_oficial
	JMP ciclo_preencher_digitos_pepe
	;[R1] SERÁ O ENDREÇO QUE IRA SER GERADO UM NOVO CARTAO 
	fim_oficial:;depois é colocar o saldo a 00,00 na memoria
	MOV R9,30H
	MOVB[R1], R9
	ADD R1,1
	MOVB[R1], R9
	ADD R1,1
	MOV R9, 2CH ;virgula
	MOVB[R1], R9
	ADD R1,1
	MOV R9,30H
	MOVB[R1], R9
	ADD R1,1
	MOVB[R1], R9
	;meter agora no display
	MOV R9, UltimoEndrecoPEPE
	MOV R8, 0010H
	MOV R7, [R9]
	ADD R7,R8
	MOV [R9],R7
	POP R9
	POP R8
	POP R7
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2 
	POP R1
	POP R0	
	RET

	MCartao:
		MOV R2, MenuCodigoPepe			;Carrega o endereço do menu de produtos
		CALL MostrarDisplay				;Mostra o menu de produtos
		CALL LimpaPerifericos			;Limpa os perifericos de entrada
	Le_Cart:
	MOV R0, PER_EN					;Le o endereço de PER_EN
	MOVB R1, [R0]					;Le o PER_EN da memoria
	CMP R1, 1						;Compara o PER_EN com o valor 1
	JEQ	MPepeContinuar 					;Opção Cartao para continuar	
	CMP R1, 5						;Compara com o valor de saida 5
	JEQ ligado					;Caso seja igual volta para o inicio
	JMP Le_Cart						;Caso nao seja selecionado nenhum valor de PER_EN valido, o mesmo fica num ciclo




verificaCodigoPepe:
	
	MOV R1, 24H					; guarda no R1 o endereço do ultimo periferico que lê o cartão PEPE
	MOV R2, TabelaCartoesInicio ; guarda no R2 o endereço do inicio da tabela onde são armazenadas os cartoes pepe
	MOV R3, 4040H				; endereço do ultimo cartao pepe fixo
	MOV R11, UltimoEndrecoPEPE
	MOV R10 ,[R11]
	MOV R9, 10H					; guarda em R9 o valor 10H
	ADD R3, R10					; R3 guarda o endereço do ultimo cartão
cicloVerificaCodigoPepe:
	MOV R0, EntradaCodigoCartao ; guarda no R0 o endereço onde começa o periferico que lê o cartão PEPE					
	MOV R6, R2					; o R6 será usado para selecionar os digitos de cada codigo, neste momento é atribuido ao R6 o endereço do primeiro digito do codigo
	
	
cicloAuxVerificaCodigoPepe:
	MOVB R4, [R0]					; guarda em R4 o digito a ser avaliado do digito introduzido
	MOVB R5, [R6]					; guarda em R5 o digito a ser avaliado do digito do cartão PEPE a ser avaliado
	CMP R4,R5
	JNE FimCicloAux
	ADD R0,1						; vai para o proximo digito do p_entrada do codigo
	ADD R6,1						;vai para o proximo digito do codigo pepe do cartão pepe a ser avaliado
	CMP R0,R1						; se ainda há digitos por avaliar
	JGT FimVerificaCodigoPepe		;continua o ciclo
	JMP cicloAuxVerificaCodigoPepe	;caso contrario será avaliado codigo do proximo cartão pepe

FimCicloAux:
	ADD R2, R9						; é adicionado 10H em R2 para selecionar o proximo cartão pepe para ser avaliado
	CMP R2, R3						; se R2 selecionar um endereço menor do que o endereço do ultimo cartão pepe 
	JLE cicloVerificaCodigoPepe		; continua o ciclo
	JMP Erro_Pepe					; caso contrario, o codigo pepe introduzido não corresponde com nenhum cartão armazenado na tabela


FimVerificaCodigoPepe:
	MOV R9,ApontadorCartaoaUtilizar
	MOV [R9],R2 
	RET
	
Erro_Pepe:
	MOV R2, Menu_Erro_Pepe			;Carrega o endereço do menu de produtos
		CALL MostrarDisplay				;Mostra o menu de produtos
		CALL LimpaPerifericos			;Limpa os perifericos de entrada
	ErroPepe:
	MOV R9,ApontadorCartaoaUtilizar
	MOV [R9],R2 
	MOV R0, PER_EN					;Le o endereço de PER_EN
	MOVB R1, [R0]					;Le o PER_EN da memoria
	CMP R1, 1						;Compara o PER_EN com o valor 1
	JEQ	aux98					 ;Opção Cartao para continuar	
	JMP ErroPepe		

aux98:
JMP ligado

MostraSaldo:

	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R9

	MOV R9,ApontadorCartaoaUtilizar ; guarda em R9 o endereço de memoria onde esta guardado o apntador
	MOV R0, [R9]					; guarda em R0 o endereço que aponta o apontador
	ADD R0, 5						; guarda em R0 o endereço do primeiro digito do saldo do cartão pepe
	MOV R3, R0						
	ADD R3,4 						; guarda em R3 o endereço do ultimo digito do saldo do cartão pepe
	MOV R2,0B97H					; guarda em R2 o endereço onde deve de mostrar o saldo
cicloMostraSaldo:
	
	MOVB R1, [R0]					;guarda em R1 o digito a ser transferido para o display
	MOVB [R2], R1
	ADD R2,1
	ADD R0,1
	CMP R0,R3
	JLE cicloMostraSaldo

	
	POP R9
	POP R3
	POP R2
	POP R1
	POP R0
	RET



MPepeContinuar:
	CALL verificaCodigoPepe
	CALL MostraSaldo
	MOV R2, MenuSaldoPepe			;Carrega o endereço do menu de produtos
	CALL MostrarDisplay				;Mostra o menu de produtos
	CALL LimpaPerifericos			;Limpa os perifericos de entrada
Le_Cart2:
	MOV R0, PER_EN					;Le o endereço de PER_EN
	MOVB R1, [R0]					;Le o PER_EN da memoria
	CMP R1, 1						;Compara o PER_EN com o valor 1
	JEQ	 MComparBilhetej					;Opção MComparBilhete	
	CMP R1, 2						;Compara com o valor de saida 7
	JEQ MRecarregar					;Caso seja igual volta para o inicio
	CMP R1, 3
	JEQ MBilhete
	CMP R1, 7
	JEQ aux99
	JMP Le_Cart2			
	aux99:
	JMP ligado
MComparBilhetej:
	JMP MComparBilhete
MBilhete:
	MOV R2, Bilhtete1			;Carrega o endereço do menu de produtos
		CALL MostrarDisplay				;Mostra o menu de produtos
		CALL LimpaPerifericos			;Limpa os perifericos de entrada
	CiloBilhete1:
	MOV R0, PER_EN					;Le o endereço de PER_EN
	MOVB R1, [R0]					;Le o PER_EN da memoria
	CMP R1, 1						;Compara o PER_EN com o valor 1
	JEQ	MBilhete2 					 ;Opção Cartao para continuar				
	CMP R1, 2						;Compara o PER_EN com o valor 1
	JEQ	aux99 					 ;Opção Cartao para sair
	JMP CiloBilhete1	
MBilhete2:
	MOV R2, Bilhtete2			;Carrega o endereço do menu de produtos
		CALL MostrarDisplay				;Mostra o menu de produtos
		CALL LimpaPerifericos			;Limpa os perifericos de entrada
	CiloBilhete2:
	MOV R0, PER_EN					;Le o endereço de PER_EN
	MOVB R1, [R0]					;Le o PER_EN da memoria
	CMP R1, 1						;Compara o PER_EN com o valor 1
	JEQ	MBilhete3 					 ;Opção Cartao para continuar	
	CMP R1, 2						;Compara o PER_EN com o valor 1
	JEQ	MBilhete 					 ;Opção Cartao para anterior
	JMP CiloBilhete2	
MBilhete3:
	MOV R2, Bilhtete2			;Carrega o endereço do menu de produtos
		CALL MostrarDisplay				;Mostra o menu de produtos
		CALL LimpaPerifericos			;Limpa os perifericos de entrada
	CiloBilhete3:
	MOV R0, PER_EN					;Le o endereço de PER_EN
	MOVB R1, [R0]					;Le o PER_EN da memoria
	CMP R1, 2						;Compara o PER_EN com o valor 1
	JEQ	aux96 					 ;Opção Sair	
	JMP CiloBilhete3					
	
aux96:
	JMP ligado

MRecarregar:
   
	MOV R2, InserirValor			;Carrega o endereço do menu de produtos
		CALL MostrarDisplay				;Mostra o menu de produtos
		CALL LimpaPerifericos			;Limpa os perifericos de entrada
	MRecarregar2:
	MOV R0, PER_EN					;Le o endereço de PER_EN
	MOVB R1, [R0]					;Le o PER_EN da memoria
	CMP R1, 1						;Compara o PER_EN com o valor 1 para selecionar a opção de inserir moedas
	JEQ CarregaPepe			;Opção Cartao para continuar	
	CMP R1, 2						;Compara o PER_EN com o valor 2 para selecionar a opção de continuar
	JEQ	Recarrega			;Opção Cartao para continuar
	JMP MRecarregar2

Recarrega:
		CALL AtualizaSaldoCartao
		MOV R2, TalaoRecarregamento			;Carrega o endereço do menu de produtos
		CALL MostrarDisplay				;Mostra o menu de produtos
		CALL LimpaPerifericos			;Limpa os perifericos de entrada
		MRecarregar22:
		MOV R0, PER_EN					;Le o endereço de PER_EN
		MOVB R1, [R0]					;Le o PER_EN da memoria	
		CMP R1, 1						;Compara o PER_EN com o valor 2 para selecionar a opção de continuar
		JEQ	aux96 			;Opção Cartao para continuar
		JMP MRecarregar22


;------------------------------------------------------------------------------------------------------------------------------------------------------------------
CarregaPepe:
	PUSH R0							;Guarda o R0 na stackpointer
	MOV R2, FormaPag				;Move para R2 a posição do display da Forma de Pagamento
	CALL MostrarDisplay				;Mostra o display da Forma de pagamento
	CALL LimpaPerifericos			;Limpa os perifericos de entrada
Le_Valor:
	MOV R0, PER_EN					;Le para R0 o endereço de memoria do PER_EN 
	MOVB R1, [R0]					;Move para R1 o valor na memoria de R0
	MOV R2, 0DBFH					;Move Para R2 o endereço do valor introduzido no talao intermedio
	CMP R1, 1						;Compara o PER_EN a ver se é igual a 1(5 Euros)
	MOV R0, 615H						;Move para R0 a posição dos 5 euros no display
	MOV R9, 89FH					;Move para R9 a posição do numero de stock de 5 euros
	JEQ ContinuaCarregar						;Se o PER_EN for igual a 1 vai para Pag1 (Onde o Programa faz a inserção no stock, no Talao e no talao intermedio do valor introduzido)
	CMP R1, 2						;Compara o PER_EN a ver se é igual a 2(2 Euros)
	MOV R0, 625H						;Move para R0 a posição dos 2 euros no display
	MOV R9, 8AFH					;Move para R9 a posição do numero de stock de 2 euros
	JEQ ContinuaCarregar						;Se o PER_EN for igual a 2 vai para Pag1 (Onde o Programa faz a inserção no stock, no Talao e no talao intermedio do valor introduzido)
	CMP R1, 3						;Compara o PER_EN a ver se é igual a 3(1 Euro)
	MOV R0, 635H						;Move para R0 a posição dos 1 euro no display
	MOV R9, 8BFH					;Move para R9 a posição do numero de stock de 1 euro
	JEQ	ContinuaCarregar						;Se o PER_EN for igual a 3 vai para Pag1 (Onde o Programa faz a inserção no stock, no Talao e no talao intermedio do valor introduzido)
	CMP R1, 4						;Compara o PER_EN a ver se é igual a 4(50 Centimos)
	MOV R0, 645H						;Move para R0 a posição dos 50 centimos no display
	MOV R9, 8CFH					;Move para R9 a posição do numero de stock de 50 centimos
	JEQ	ContinuaCarregar						;Se o PER_EN for igual a 4 vai para Pag1 (Onde o Programa faz a inserção no stock, no Talao e no talao intermedio do valor introduzido)
	CMP R1, 5						;Compara o PER_EN a ver se é igual a 5(20 Centimos)
	MOV R0, 655H						;Move para R0 a posição dos 20 centimos no display
	MOV R9, 91FH					;Move para R9 a posição do numero de stock de 20 centimos
	JEQ	ContinuaCarregar						;Se o PER_EN for igual a 5 vai para Pag1 (Onde o Programa faz a inserção no stock, no Talao e no talao intermedio do valor introduzido)
	CMP R1, 6						;Compara o PER_EN a ver se é igual a 6(10 Centimos)
	MOV R0, 665H					;Move para R0 a posição dos 10 centimos no display
	MOV R9, 92FH					;Move para R9 a posição do numero de stock de 10 centimos
	JEQ	ContinuaCarregar						;Se o PER_EN for igual a 6 vai para Pag1 (Onde o Programa faz a inserção no stock, no Talao e no talao intermedio do valor introduzido)
	
	JMP Le_Valor						;Caso nao tenha nenhum PER_EN valido fica num ciclo ate ter uma PER_EN valida
ContinuaCarregar:
	MOV R4, 30H						;Move para R4 o valor 30H, correspondente a 0
	MOV R5, 2CH						;Move para R5 o valor 2CH, correspondente a virgula ","
	MOV R6, 0						;Move para R6 o valor 1, para variavel de controlo
	MOV R7, 29H						; Move para R7 o valor 29H que corresponde a " ) "
	MOV R8, 3AH							;
cicloCarregar:
	MOVB R1, [R0]
	MOVB R3, [R2]
	CMP R1, R5
	JEQ ProximoDigitoCarrega

	CMP R1, R7
	JNE ContinuaCicloCarregar
	MOV R1 , R4
ContinuaCicloCarregar:	
	ADD R1, R6
	MOV R6, 0
	ADD R1, R3
	SUB R1, R4
	CMP R1,R8
	JGE Substrae10
	JMP ProximoDigitoCarrega

Substrae10:
	MOV R3, 10
	SUB R1, R3
	ADD R6, 1
	JMP ProximoDigitoCarrega

ProximoDigitoCarrega:
	MOV R3, 0DBBH
	MOVB [R2], R1
	SUB R0,1
	SUB R2,1
	CMP R2,R3
	JGE cicloCarregar
	JLT FimCarregamento

FimCarregamento:
	CALL insereMoeda				;Chama a Rotina insere moeda para inserir as moedas que entram no stock
	CALL ApresentaSaldoInserido
	JMP SomaSaldoCartao
	POP R0							;Restaura o valor de R0
	


ApresentaSaldoInserido:
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3

	MOV R0, 0F4BH
	MOV R1, 0DBBH

	MOV R3, 0F4FH

cicloApresentaSaldoInserido:
	MOVB R2, [R1]
	MOVB [R0], R2
	ADD R1,1
	ADD R0,1
	CMP R0, R3
	JLE cicloApresentaSaldoInserido
	JMP FimApresentaSaldoInserido


FimApresentaSaldoInserido:

	POP R3
	POP R2
	POP R1
	POP R0
	RET



SomaSaldoCartao:
	MOV R0, 0F4FH
	MOV R1, ApontadorCartaoaUtilizar
	MOV R2, [R1]
	ADD R2, 5
	ADD R2, 4
	MOV R4, 30H						;Move para R4 o valor 30H, correspondente a 0
	MOV R5, 2CH						;Move para R5 o valor 2CH, correspondente a virgula ","
	MOV R6, 0						;Move para R6 o valor 1, para variavel de controlo
	mov R7, 0F5FH
	MOV R8, 3AH						;
cicloSomaSaldoCartao:
	MOVB R1, [R0]					; Valor do saldo a carregar
	MOVB R3, [R2]					; valor do saldo guardado
	CMP R1, R5
	JEQ ProximoDigitoSomaSaldoCartao

	ADD R1, R6
	MOV R6, 0
	ADD R1, R3
	SUB R1, R4
	CMP R1,R8
	JGE SomaSaldoCartaoSubstrae10
	JMP ProximoDigitoSomaSaldoCartao

SomaSaldoCartaoSubstrae10:
	MOV R3, 10
	SUB R1, R3
	ADD R6, 1
	JMP ProximoDigitoSomaSaldoCartao

ProximoDigitoSomaSaldoCartao:
	MOV R3, 0F4BH
	MOVB [R7], R1
	SUB R0,1
	SUB R2,1
	SUB R7,1
	CMP R0,R3
	JGE cicloSomaSaldoCartao
	JLT FimSomaSaldoCartao

FimSomaSaldoCartao:
	POP R0							;Restaura o valor de R0
	JMP MRecarregar



AtualizaSaldoCartao:
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3

	MOV R0, 0F5BH
	MOV R1, ApontadorCartaoaUtilizar
	MOV R1, [R1]
	ADD R1, 5

	MOV R3, R1
	ADD R3, 4

cicloAtualizaSaldoCartao:
	MOVB R2, [R0]
	MOVB [R1], R2
	ADD R1,1
	ADD R0,1
	CMP R1, R3
	JLE cicloAtualizaSaldoCartao
	JMP FimAtualizaSaldoCartao 


FimAtualizaSaldoCartao:
	POP R3
	POP R2
	POP R1
	POP R0
	RET




;-----------------------------------------------------------------------------------------------------------------------------------------------------------------	 
ProssegueTalao:
JMP ligado
;-----------------------------------------------
Stock:
	CALL InicStock					;Chama a Rotina de Stock inicial(para por a palavra pass)
	MOV R0, PER_EN					;Move para R0 o endereço de memoria do PER_EN
	MOVB R1, [R0]					;Move para R1 o valor de PER_EN
	CMP R1, 2						;Compara o valor com 2
	JEQ aux95					;Caso seja igual é feito um salto para o ligado do programa
	CALL Stocks						;Chama a Rotina Stocks(Que mostra a lista do Stock de troco)
	JMP ligado					;Salta para o ligado


aux95:
JMP ligado
;------------------------------------------------
MComparBilhete:
	MOV R2, Menu_Estacoes			;Carrega o endereço do menu de estaçoes
	CALL MostrarDisplay				;Mostra o menu de estaçoes
	CALL LimpaPerifericos			;Limpa os perifericos de entrada
Le_Bilhetee:
	MOV R0, PER_EN					;Le o endereço de PER_EN
	MOVB R1, [R0]					;Le o PER_EN da memoria
	CMP R1, 1						;Compara o PER_EN com o valor 1
	JEQ	MLisboa 					;Opção Lisboa	
	CMP R1, 2						;Compara a PER_EN com o valor 2
	JEQ MPorto 					;Opção Porto
	CMP R1, 7						;Compara com o valor de saida 7
	JEQ aux100					;Caso seja igual volta para o inicio
	JMP Le_Bilhetee						;Caso nao seja selecionado nenhum valor de PER_EN valido, o mesmo fica num ciclo

MPorto:
	MOV R2, Menu_Porto				;Move para R2 a posição do display do menu de Porto
	CALL MostrarDisplay				;Mostra o menu de Porto
	CALL LimpaPerifericos			;Limpa os perifericos de entrada
	
Porto_ciclo:
	MOV R0, PER_EN					;Le o endereço de memoria onde esta o PER_EN
	MOVB R1, [R0]					;Le o conteudo do endereço de memoria do PER_EN
	CMP R1, 1						;Compara com o nº1
	JEQ EstacaoCompaPorto1				;Faz um salto para o comprar o 1 Porto
	CMP R1, 2						;Compara com o nº2
	JEQ EstacaoCompaPorto2				;Faz um salto para o comprar o 2 Porto
	CMP R1, 3						;Compara com o nº3
	JEQ aux2						;Faz um salto para o comprar o 3 Porto
	CMP R1, 7						;Compara com o vMRalor para o menu seguinte
	JEQ EstacaoPortoAseguir					;Faz um salto para o proximo menu de Porto
	CMP R1, 0						;Comapra com o valor 0, valor de saida
	JEQ aux100					;Caso seja igual volta para o ligado
	JMP Porto_ciclo					;Faz um loop ate o PER_EN ser valido
EstacaoPortoAseguir:
	MOV R2, Menu_Porto_2			;Move para R2 a posição do display do menu de Porto 2
	CALL MostrarDisplay				;Mostra o menu de Porto 2
	CALL LimpaPerifericos			;Limpa os perifericos de entrada
Porto_ciclo_2:
	MOV R0, PER_EN					;Move para R0 o endereço de memoria do PER_EN
	MOVB R1, [R0]					;Le o PER_EN da memoria
	CMP R1, 4						;Compara com o nº4
	JEQ EstacaoCompaPorto1				;Faz um salto para o comprar o 4 Porto(reutilização de codigo)
	CMP R1, 5						;Compara com o nº5
	JEQ EstacaoCompaPorto2				;Faz um salto para o comprar o 5 Porto(reutilização de codigo)
	CMP R1, 6						;Compara com o nº6
	JEQ EstacaoCompaPorto3				;Faz um salto para o comprar o 6 Porto(reutilização de codigo)
	CMP R1, 7						;Compara com o valor para o menu anterior
	JEQ MPorto						;Faz um salto para o menu de Porto anterior
	CMP R1, 0						;Comapra com o valor 0, valor de saida
	JEQ aux100					;Caso seja igual volta para o ligado
	JMP Porto_ciclo_2					;Faz um loop ate o PER_EN ser valido
	aux100:
	JMP ligado
MLisboa:
	MOV R2, Menu_Lisboa				;Move para R2 a posição do display do menu Lisboa
	CALL MostrarDisplay				;Mostra o display do menu de Lisboa
	CALL LimpaPerifericos			;Limpa o periferico de entrada
M_Lisbon_ciclo:
	MOV R0, PER_EN					;Move para R0 o endereço de memoria do PER_EN
	MOVB R1, [R0]					;Le o PER_EN da memoria
	CMP R1, 1						;Compara com o nº1
	JEQ EstacaoCompaLisboa1					;Faz um salto para o comprar a 1 Lisboa
	CMP R1, 2						;Compara com o nº2
	JEQ EstacaoCompaLisboa2				;Faz um salto para o comprar a 2 Lisboa
	CMP R1, 3						;Compara com o nº3
	JEQ EstacaoCompaLisboa3				;Faz um salto para o comprar a 3 Lisboa
	CMP R1, 7						;Compara com o valor para o menu seguinte
	JEQ ProxLisboa					;Faz um salto para o menu de Lisboa seguinte
	CMP R1, 0						;Comapra com o valor 0, valor de saida
	JEQ aux100					;Caso seja igual volta para o ligado
	JMP M_Lisbon_ciclo					;Faz um loop ate o PER_EN ser valido
	
ProxLisboa:
	MOV R2, Menu_Lisboa_2			;Move para R2 a posição do display do menu Lisboa dois
	CALL MostrarDisplay				;Mostra o display do menu de Lisboa dois
	CALL LimpaPerifericos			;Limpa o periferico de entrada
M_Lisbon_ciclo_2:
	MOV R0, PER_EN					;Move para R0 o endereço de memoria do PER_EN
	MOVB R1, [R0]					;Le o PER_EN da memoria
	CMP R1, 4						;Compara com o nº4
	JEQ EstacaoCompaLisboa1					;Faz um salto para o comprar a 4 Lisboa (reutilização de codigo)
	CMP R1, 5						;Compara com o nº5
	JEQ EstacaoCompaLisboa2				;Faz um salto para o comprar a 5 Lisboa (reutilização de codigo)
	CMP R1, 6						;Compara com o nº6
	JEQ EstacaoCompaLisboa3				;Faz um salto para o comprar a 6 Lisboa (reutilização de codigo)
	CMP R1, 7						;Compara com o valor para o menu anterior
	JEQ MLisboa					;Faz um salto para o menu de Lisboa anterior
	CMP R1, 0						;Comapra com o valor 0, valor de saida
	JEQ aux97				;Caso seja igual volta para o ligado
	JMP M_Lisbon_ciclo_2				;Faz um loop ate o PER_EN ser valido

aux97:
	JMP ligado	

aux2:
	JMP EstacaoCompaPorto3				;Salto auxiliar, pois constantes out of bonds

EstacaoCompaLisboa1:
	CALL ApagaInt					;Rotina que apaga o valor introduzido anterior
	MOV R0, 72H						;Move para R0 a posição do PER_EN 1 ou 4
	CALL ModificaTalao				;Rotina que modifica o nome do produto comprado no talao
	CALL ModificaTalaopepe
	CALL ModificaPag				;Rotina que modifica o preço do talao intermedio
	CMP R8, 1						;Compara o valor de R8 com o valor 1
	JEQ cil							;Caso este seja igual a 1 significa que ocorreu um erro no stock
	MOV R1,ApontadorCartaoaUtilizar
	MOV R1,[R1]
	MOV R2,NULL
	CMP R1,R2
	JEQ PagaSemPepe
	JNE PagaComPepe						;Fica em loop ate continuar para o menu inicial
EstacaoCompaLisboa2:
	CALL ApagaInt					;Rotina que apaga o valor introduzido anterior
	MOV R0, 82H						;Move para R0 a posição do PER_EN 2 ou 5
	CALL ModificaTalao				;Rotina que modifica o nome do produto comprado no talao
	CALL ModificaTalaopepe
	CALL ModificaPag				;Rotina que modifica o preço do talao intermedio
	CMP R8, 1						;Compara o valor de R8 com o valor 1
	JEQ cil							;Caso este seja igual a 1 significa que ocorreu um erro no stock
	MOV R1,ApontadorCartaoaUtilizar
	MOV R1,[R1]
	MOV R2,NULL
	CMP R1,R2
	JEQ PagaSemPepe
	JNE PagaComPepe						;Fica em loop ate continuar para o menu inicial
EstacaoCompaLisboa3:
	CALL ApagaInt					;Rotina que apaga o valor introduzido anterior
	MOV R0, 92H						;Move para R0 a posição do PER_EN 3 ou 6
	CALL ModificaTalao				;Rotina que modifica o nome do produto comprado no talao
	CALL ModificaTalaopepe
	CALL ModificaPag				;Rotina que modifica o preço do talao intermedio
	CMP R8, 1						;Compara o valor de R8 com o valor 1
	JEQ cil							;Caso este seja igual a 1 significa que ocorreu um erro no stock
	MOV R1,ApontadorCartaoaUtilizar
	MOV R1,[R1]
	MOV R2,NULL
	CMP R1,R2
	JEQ PagaSemPepe
	JNE PagaComPepe							;Fica em loop ate continuar para o menu inicial
	
EstacaoCompaPorto1:
	CALL ApagaInt					;Rotina que apaga o valor introduzido anterior
	MOV R0, 72H						;Move para R0 a posição do PER_EN 1 ou 4
	CALL ModificaTalao				;Rotina que modifica o nome do produto comprado no talao
	CALL ModificaTalaopepe
	CALL ModificaPag				;Rotina que modifica o preço do talao intermedio
	CMP R8, 1						;Compara o valor de R8 com o valor 1
	JEQ cil							;Caso este seja igual a 1 significa que ocorreu um erro no stock
	MOV R1,ApontadorCartaoaUtilizar
	MOV R1,[R1]
	MOV R2,NULL
	CMP R1,R2
	JEQ PagaSemPepe
	JNE PagaComPepe						;Fica em loop ate continuar para o menu inicial
EstacaoCompaPorto2:
	CALL ApagaInt					;Rotina que apaga o valor introduzido anterior
	MOV R0, 82H						;Move para R0 a posição do PER_EN 2 ou 5
	CALL ModificaTalao				;Rotina que modifica o nome do produto comprado no talao
	CALL ModificaTalaopepe
	CALL ModificaPag				;Rotina que modifica o preço do talao intermedio
	CMP R8, 1						;Compara o valor de R8 com o valor 1
	JEQ cil							;Caso este seja igual a 1 significa que ocorreu um erro no stock
	MOV R1,ApontadorCartaoaUtilizar
	MOV R1,[R1]
	MOV R2,NULL
	CMP R1,R2
	JEQ PagaSemPepe
	JNE PagaComPepe						;Fica em loop ate continuar para o menu inicial
EstacaoCompaPorto3:
	CALL ApagaInt					;Rotina que apaga o valor introduzido anterior
	MOV R0, 92H						;Move para R0 a posição do PER_EN 3 ou 6
	CALL ModificaTalao				;Rotina que modifica o nome do produto comprado no talao
	CALL ModificaTalaopepe
	CALL ModificaPag				;Rotina que modifica o preço do talao intermedio
	CMP R8, 1						;Compara o valor de R8 com o valor 1
	JEQ cil							;Caso este seja igual a 1 significa que ocorreu um erro no stock
	MOV R1,ApontadorCartaoaUtilizar
	MOV R1,[R1]
	MOV R2,NULL
	CMP R1,R2
	JEQ PagaSemPepe
	JNE PagaComPepe

FimEstacoes:
	CALL MostrarDisplay				;Mostra o display do talao
	CALL LimpaPerifericos			;Limpa o periferico de entrada
	JMP cil							;Fica em loop ate continuar para o menu inicial
	
cil:
	MOV R0, PER_EN					;Move para R0 o endereço de memoria do PER_EN
	MOVB R1, [R0]					;Le o PER_EN da memoria
	CMP R1, 1						;Compara R1 com o valor
	JEQ	aux101							;Se igual volta para o menu incial
	JMP cil							;Se não fica em loop


aux101:
JMP ligado

PagaSemPepe:
	CALL Paga						;Rotina para fazer o pagamento do produto
	CALL calculaTiraMoeda			;Chama a Rotina para calcular o troco retirado do stock
	CALL IncrementaNPepe
	MOV R2, Talao					;Move para R2 o endereço do display do talao
	JMP FimEstacoes

PagaComPepe:
	MOV R6, ApontadorCartaoaUtilizar
	
adicionaCodigoTalao:
	MOV R0, [R6]
	MOV R1, 0E90H
	MOV R3, R0
	ADD R3, 4
	MOV R2, 19H
	ADD R1,R2

cicloAdicionaCodigoTalao:	
	MOVB R4,[R0]
	MOVB [R1], R4
	ADD R0,1
	ADD R1,1
	CMP R0,R3
	JLE cicloAdicionaCodigoTalao

AdicionaSaldo:	

	MOV R1, 0E90H
	MOV R2, 3BH
	ADD R1, R2
	MOV R3, R0
	ADD R3, 4
cicloAdicionaSaldo:
	MOVB R4,[R0]
	MOVB [R1], R4
	ADD R0,1
	ADD R1,1
	CMP R0,R3
	JLE cicloAdicionaSaldo


FimPagamentoComPepe:
	CALL SaldoRestante
	CALL AtualizaSaldo
	MOV R2, TalaoCartaoPepe					;Move para R2 o endereço do display do talao
	JMP FimEstacoes



SaldoRestante:								;Calcula o troco
	PUSH R0							;Guarda o valor de R0 na Sp
	PUSH R1							;Guarda o valor de R1 na Sp
	PUSH R2							;Guarda o valor de R2 na Sp
	PUSH R3							;Guarda o valor de R3 na Sp
	PUSH R4							;Guarda o valor de R4 na Sp
	PUSH R5							;Guarda o valor de R5 na Sp
	PUSH R6							;Guarda o valor de R6 na Sp
	PUSH R7							;Guarda o valor de R7 na Sp
	PUSH R8							;Guarda o valor de R8 na Sp
	PUSH R9							;Guarda o valor de R9 na Sp
	PUSH R10						;Guarda o valor de R10 na Sp
	MOV R0, 0ECEH					;Move para R0 a posiçao dos centimos do valor guardado no cartão pepe no talao final
	MOV R2, 0EBEH					;Move para R2 a posiçao dos centimos do valor da compra no talao final
	MOV R4, 0AH						;Move para R4 o valor 10
	MOV R5, 0EDEH					;Move para R5 a posição dos centimos do troco no talao final
	MOV R6, 30H						;Move para R6 o valor de 30H (String 0)
	MOV R7, 0ECBH					;Move para R7 o valor do digito mais significativo do valor guardado no cartão pepe
	MOV R8, 0						; Move para R8 o valor 0, este registo será usado para ser um "Carry"
	MOV R9, 2CH						;Move para R9 o valor 2CH que representa a figura " , "
	MOV R10, 20H					;Move para a R10 o valor 20H que representa um espaço vazio no display

ComparaValor:
	MOVB R1, [R0]					;Move para R1 o valor do digito do valor guardado no cartão pepe 
	MOVB R3, [R2]					;Move para R3 o valor do digito valor da compra

	CMP R1,R9						; Compara o valor lido com ","
	JEQ proximoRestante				; caso sejam iguais, salta para o proximo digito

	CMP R3, R10						; compara o digito lido do valor da compra com 20H, que representa um caracter vazio
	JNE ContinuaComparar			; caso sejam diferentes continua com a comparação
	MOV R3, R6						; caso R3 == 20H, o R3 passa a ser 0, R3= 0
ContinuaComparar:
	SUB R1,R8						; R1 = R1 - carry(R8)
	MOV R8,0						; Carry(R8) = 0
	CMP R1,R3						;Compara os valores
	JGE	cero						;Se o digito do cartão pepe for maior ou igual que o digito do valor da compra, ele pula para o cero
	JLT	adiciona10					;Caso contrário ele vai para o adiciona10
adiciona10:
	ADD R1, R4						;R1 = R1 + 10
	SUB R1, R3						;R1 = R1 - R3
	ADD R1, R6						;Adiciona 30H a R1 para fazer aparecer a String
	MOVB [R5], R1					;Move o valor do R1 para a posição correspondente no display do saldo restante
	MOV R8, 1						;Carry(R8) = 1
	JMP proximoRestante				;Salta para o proximo digito
cero:								;(Caso o valor dos centimos seja maior que 10)
	SUB R1, R3						;R1 = R1 - R3
	ADD R1, R6						;Adiciona 30H a R1 para fazer a String
	MOVB [R5], R1					;Move o valor do R1 para a posição correspondente no display do saldo restante
	JMP proximoRestante				;Salta para o proximo digito
proximoRestante:								;(Proximo digito do saldo restante)
	SUB R0, 1						;Substrae 1 a R0 para passar para o proximo digito do saldo do cartão pepe
	SUB R2, 1						;Substrae 1 a R2 para passar para o proximo digito do valor a pagar
	SUB R5, 1						;Substrae 1 a R5 para passar para o proximo digito do saldo restante
	CMP R0, R7						;compara R0 com 0ECBH 
	JGE ComparaValor				;caso R0 > 0ECBH ou R0 == 0ECBH, ainda não acabou de fazer a operação 
	JLT FimSaldoRestante			; caso R0 < 0ECBH, significa que já foram avaliados todos os digitos
FimSaldoRestante:

	CMP R8,1						; se a operação acabou e ainda o Carry(R8) conter o valor 1, significa que o saldo no cartão é menor que o valor a pagar
	JEQ Erro_MandaCarregar							; caso Carry(R8) == 1, manda erro e manda a recarregar --- falta carregar
	POP R10							;Restaura o valor de R10
	POP R9							;Restaura o valor de R9
	POP R8							;Restaura o valor de R8
	POP R7							;Restaura o valor de R7
	POP R6							;Restaura o valor de R6
	POP R5							;Restaura o valor de R5
	POP R4							;Restaura o valor de R4
	POP R3							;Restaura o valor de R3
	POP R2							;Restaura o valor de R2
	POP R1							;Restaura o valor de R1
	POP R0							;Restaura o valor de R0
	RET								;Vai para o endereço guardado na SP


Erro_MandaCarregar:
	MOV R2, ErroSaldoInsuficiente			;Carrega o endereço do menu de produtos
		CALL MostrarDisplay				;Mostra o menu de produtos
		CALL LimpaPerifericos			;Limpa os perifericos de entrada
	MandaCarregar: 
	MOV R0, PER_EN					;Le o endereço de PER_EN
	MOVB R1, [R0]					;Le o PER_EN da memoria
	CMP R1, 1						;Compara o PER_EN com o valor 1
	JEQ	aux101					 ;Opção Cartao para cancelar a compra
	CMP R1, 2						;Compara o PER_EN com o valor 2
	JEQ	aux102					 ;Opção Cartao para Recarregar		
	JMP MandaCarregar

aux102:
JMP MRecarregar 

AtualizaSaldo:
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	
	MOV R0, ApontadorCartaoaUtilizar
	MOV R0, [R0]
	ADD R0, 5
	MOV R1, 0EDBH
	MOV R2, 0EDFH
	
	
cicloAtualizaSaldo:
	MOVB R3,[R1]
	MOVB [R0], R3
	ADD R1,1
	ADD R0,1
	CMP R1,R2
	JLE cicloAtualizaSaldo
	JMP FimAtualizaSaldo 
	


FimAtualizaSaldo:
	POP R3
	POP R2
	POP R1
	POP R0


IncrementaNPepe:
	PUSH R0
	PUSH R1
	PUSH R2
	PUSH R3
	PUSH R4
	PUSH R5
	PUSH R6
	PUSH R7

	MOV R0, novoCodigoPepe; endereço de memoria do contador 
	MOV R2, 3AH
	MOV R3, R0
	MOV R4,	R0
	ADD R4,1
	MOV R5,	R0
	ADD R5,2
	MOV R7, 30H
	PrimeiroDigito:
	MOVB R1, [R5]
	ADD R1, 1
	CMP R1,R2
	JEQ SegundoDigito
	MOVB [R5], R1
	JMP FimIncrementaNPepe

	SegundoDigito:
	MOVB [R5], R7
	MOVB R1, [R4]
	ADD R1,1
	CMP R1,R2
	JEQ TerceiroDigito
	MOVB [R4],R1
	JMP FimIncrementaNPepe

	TerceiroDigito:
	MOVB [R5], R7
	MOVB [R4], R7
	MOVB R1, [R3]
	ADD R1,1
	MOVB [R3], R1
	CMP R1,R2
	JLT FimIncrementaNPepe
	MOVB [R3], R7
	MOVB [R4], R7
	MOVB [R5], R7
FimIncrementaNPepe:
	MOV R6, 051DH
	MOVB R1, [R3]
	MOVB [R6], R1 
	ADD R6,1
	MOVB R1, [R4]
	MOVB [R6], R1 
	ADD R6,1
	MOVB R1, [R5]
	MOVB [R6], R1 

	POP R7
	POP R6
	POP R5
	POP R4
	POP R3
	POP R2
	POP R1
	POP R0
	RET

Paga:
	PUSH R0							;Guarda o valor R0
	PUSH R1							;Guarda o valor R1
	PUSH R2							;Guarda o valor R2
	PUSH R3							;Guarda o valor R3
PayL:
	CALL Pagamento					;Rotina onde se realiza o pagamento
	MOV R0, 5ACH					;Posição onde fica o valor introduzido no talao intermedio
	MOV R2, 5CCH					;Posição do preço a pagar
	MOVB R1, [R0]					;Move para R1 o valor do byte do valor introduzido
	MOVB R3, [R2]					;Move para R3 o valor do byte do valor a pagar
	CMP R1, R3						;Compra os dois
	JGT fim							;Se o introduzido for maior pode sair do pagar
	JLT	PayL						;Se for menor tem de pagar o restante
	ADD R0, 2						;Adiciona 2 para verificar o 1 byte dos centimos no valor introduzido
	ADD R2, 2						;Adiciona 2 para verificar o 1 byte dos centimos no valor a pagar
	MOVB R1, [R0]					;Move para R1 o valor do byte do valor introduzido
	MOVB R3, [R2]					;Move para R3 o valor do byte do valor a pagar
	CMP R1, R3						;Compara os dois
	JLT PayL						;Se o valor introduzido for menor tem vai para pagar o restante
fim:
	CALL Trc						;Chama a Rotina para calcular o troco
	POP R3							;Mete R3 como era inicialmente
	POP R2							;Mete R2 como era inicialmente
	POP R1							;Mete R1 como era inicialmente
	POP R0							;Mete R0 como era inicialmente
	RET								;Vai para o endereço guardado na stackpointer

Pagamento:
	MOV R2, TalaoInt				;Move para R2 a posição do display do Talao Intermedio
	CALL MostrarDisplay				;Mostra o display do menu do Talao intermedio
	CALL LimpaPerifericos			;Limpa os perifericos de entrada
OP:
	MOV R0, PER_EN					;Le para R0 o endereço de memoria do PER_EN
	MOVB R1, [R0]					;Move para R1 o valor na memoria de R0
	CMP R1, 1						;Verifica se R1 é igual a 1
	JEQ	PAG							;Se for igual a 1 ele vai para o PAg
	JMP OP							;Se não fica a espera de que o PER_EN seja valido
PAG:
	CALL MenuPag					;Chama a Rotina MenuPag
	RET								;Salta para o endereço de memoria guardado na stackpointer
	
MenuPag:
	PUSH R0							;Guarda o R0 na stackpointer
	MOV R2, FormaPag				;Move para R2 a posição do display da Forma de Pagamento
	CALL MostrarDisplay				;Mostra o display da Forma de pagamento
	CALL LimpaPerifericos			;Limpa os perifericos de entrada
Le_Op:
	MOV R0, PER_EN					;Le para R0 o endereço de memoria do PER_EN 
	MOVB R1, [R0]					;Move para R1 o valor na memoria de R0
	MOV R2, 05ACH					;Move Para R2 o endereço do valor introduzido no talao intermedio
	CMP R1, 1						;Compara o PER_EN a ver se é igual a 1(5 Euros)
	MOV R0, 52H						;Move para R0 a posição dos 5 euros no display
	MOV R9, 89FH					;Move para R9 a posição do numero de stock de 5 euros
	JEQ Pag1						;Se o PER_EN for igual a 1 vai para Pag1 (Onde o Programa faz a inserção no stock, no Talao e no talao intermedio do valor introduzido)
	CMP R1, 2						;Compara o PER_EN a ver se é igual a 2(2 Euros)
	MOV R0, 62H						;Move para R0 a posição dos 2 euros no display
	MOV R9, 8AFH					;Move para R9 a posição do numero de stock de 2 euros
	JEQ Pag1						;Se o PER_EN for igual a 2 vai para Pag1 (Onde o Programa faz a inserção no stock, no Talao e no talao intermedio do valor introduzido)
	CMP R1, 3						;Compara o PER_EN a ver se é igual a 3(1 Euro)
	MOV R0, 72H						;Move para R0 a posição dos 1 euro no display
	MOV R9, 8BFH					;Move para R9 a posição do numero de stock de 1 euro
	JEQ	Pag1						;Se o PER_EN for igual a 3 vai para Pag1 (Onde o Programa faz a inserção no stock, no Talao e no talao intermedio do valor introduzido)
	CMP R1, 4						;Compara o PER_EN a ver se é igual a 4(50 Centimos)
	MOV R0, 82H						;Move para R0 a posição dos 50 centimos no display
	MOV R9, 8CFH					;Move para R9 a posição do numero de stock de 50 centimos
	JEQ	Pag1						;Se o PER_EN for igual a 4 vai para Pag1 (Onde o Programa faz a inserção no stock, no Talao e no talao intermedio do valor introduzido)
	CMP R1, 5						;Compara o PER_EN a ver se é igual a 5(20 Centimos)
	MOV R0, 92H						;Move para R0 a posição dos 20 centimos no display
	MOV R9, 91FH					;Move para R9 a posição do numero de stock de 20 centimos
	JEQ	Pag1						;Se o PER_EN for igual a 5 vai para Pag1 (Onde o Programa faz a inserção no stock, no Talao e no talao intermedio do valor introduzido)
	CMP R1, 6						;Compara o PER_EN a ver se é igual a 6(10 Centimos)
	MOV R0, 0A2H					;Move para R0 a posição dos 10 centimos no display
	MOV R9, 92FH					;Move para R9 a posição do numero de stock de 10 centimos
	JEQ	Pag1						;Se o PER_EN for igual a 6 vai para Pag1 (Onde o Programa faz a inserção no stock, no Talao e no talao intermedio do valor introduzido)
	
	JMP Le_Op						;Caso nao tenha nenhum PER_EN valido fica num ciclo ate ter uma PER_EN valida
Pag1:
	MOV R7, 053CH					;Move Para R7 o valor da posição de memoria do valor inserido no talao final
	MOV R4, 30H						;Move para R4 o valor 30H, correspondente a 0
	MOV R5, 2CH						;Move para R5 o valor 2CH, correspondente a virgula ","
	MOV R6, 1						;Move para R6 o valor 1, para variavel de controlo
MPag1:
	MOVB R1, [R0]					;Move para R1 o valor na memoria de R0(No display onde esta a moeda/nota a introduzir)
	MOVB R3, [R2]					;Move para R3 o valor na memoria de R2(Valor do talao valor introduzido do talao intermedio )
	CMP R1, R5						;Compara se o valor de R1 é o da virgula
	JEQ prox						;Caso seja passa para a proxima unidade
	SUB R1, R4						;Retira ao R1 o valor de 30H
	ADD R1, R3						;Soma R1 com R3 (Valor que ja estava no Introduzido)
	MOVB [R2], R1					;Move o novo Valor introduzido para o talao intermedio
	MOVB [R7], R1					;Move o novo valor introduzido para o talao final
prox:	
	ADD R2, 1						;Adiciona 1 unidade para passa para o proximo digito do valor introduzido no talao intermedio
	ADD R7, 1						;Adiciona 1 unidade para passa para o proximo digito do valor introduzido no talao final
	ADD R0, 1						;Adiciona 1 unidade para passa para o proximo digito do valor introduzido do PER_EN
	ADD R6, 1						;Adiciona 1 a variavel de controle
	CMP R6, 4						;Compara para ver se a variavel de controle ja chegou ao fim, que é quando a variavel em o valor 5
	JLE MPag1						;Se for menor ou igual pula para MPAG1, fazer o mesmo so que nas unidades restantes
	JMP Fim_MPag					;Se ja tiver acabado passa para o Fim do menu de pagamento
Fim_MPag:
	MOV R7, 053EH					;Move para R7 o valor do endereço memoria do valor inserido do talao final
	MOV R2, 05AEH					;Move para R2 o valor do endereço memoria do valor inserido do talao intermedio
	MOV R3, 03AH					;Move para R3 o valor de 3AH, ou seja maior que o valor 39H que corresponde ao 9
	MOV R4, 0AH						;Move para R4 o valor 0AH, ou seja, o valor 10
	MOVB R1, [R2]					;Move para R1 o valor da memoria de R2
	CMP R1, R3						;Compara o R1 com R3
	JLT Fimm_Mpag					;Se R1 tiver um valor menor que R3, ou seja seja no maximo 39H (9 em string), ele pula para o Fim
	SUB R1, R4						;Subtrai R1 por R4, ou seja tira 0AH, para que o valor esteja dentos dos valores 30H ate 39H
	MOVB [R2], R1					;Move para a memoria R2 o valor de R1
	MOVB [R7], R1					;Move para a memoria R7 o valor de R1
	ADD R2, -2						;Adiciona -2 unidades a R2, para apontar para o digito dos euros
	ADD R7, -2						;Adiciona -2 unidades a R7, para apontar para o digito dos euros
	MOVB R1, [R2]					;Move para R1 o valor do digito dos euros de R2
	ADD R1, 1						;Adiciona 1 unidade
	MOVB [R2], R1					;Guarda o valor do digito dos euros no talao intermedio
	MOVB [R7], R1					;Guarda o valor do digito dos euros no talao final
Fimm_Mpag:
	CALL insereMoeda				;Chama a Rotina insere moeda para inserir as moedas que entram no stock
	POP R0							;Restaura o valor de R0
	RET								;Volta para o endereço que a SP guardo

Trc:								;Calcula o troco
	PUSH R0							;Guarda o valor de R0 na Sp
	PUSH R1							;Guarda o valor de R1 na Sp
	PUSH R2							;Guarda o valor de R2 na Sp
	PUSH R3							;Guarda o valor de R3 na Sp
	MOV R0, 53EH					;Move para R0 a posiçao dos centimos do valor inserido no talao final
	MOV R2, 52EH					;Move para R2 a posiçao dos centimos do valor da compra no talao final
	MOV R5, 54EH					;Move para R5 a posição dos centimos do troco no talao final
	MOV R6, 30H						;Move para R6 o valor de 30H (String 0)
Comperetrc:
	MOVB R1, [R0]					;Move para R1 o valor da memoria dos centimos do valor inserido 
	MOVB R3, [R2]					;Move para R3 o valor da memoria dos centimos do valor da compra
	CMP R1,R3						;Compara os valores
	JGE	zero						;Se o valor inserido for maior ou igual ele pula para o zero
	JLT	add10						;Se o valor for menor ele vai para o add10
add10:
	MOV R4, 0AH						;Move para R4 o valor 10
	ADD R1, R4						;Adiciona R4 a R1
	SUB R1, R3						;Subtrai R1 por R3(Retira os centimos da compra)
	ADD R1, R6						;Adiciona 30H a R1 para fazer aparecer a String
	MOVB [R5], R1					;Move o valor do R1 para a posição dos centimos do troco
	MOV R4, 1						;Move o valor 1 para R4
	JMP protrc						;Salta para o protrc
zero:								;(Caso o valor dos centimos seja maior que 10)
	MOV R4, 0						;Move o valor 0 para R4
	SUB R1, R3						;Subtrai R1 por R3
	ADD R1, R6						;Adiciona 30H a R1 para fazer a String
	MOVB [R5], R1					;Move o valor de R1 para a posição dos centimos do troco
	JMP protrc						;Salta para o protrc
protrc:								;(Proximo Troco)
	ADD R0, -2						;Adiciona -2 a R0 para passar para os euros
	ADD R2, -2						;Adiciona -2 a R0 para passar para os euros
	ADD R5, -2						;Adiciona -2 a R0 para passar para os euros
	MOVB R1, [R0]					;Move para R1 o valor dos euros do valor inserido
	MOVB R3, [R2]					;Move para R2 o valor dos euros do valor da compra
	SUB R1, R3						;Subtrai R1 por R3
	SUB R1, R4						;Subtrai R1 por R4 por 1(Caso seja necessario buscar 1 aos euros para fazer o troco dos centimos), por 0 caso nao seja necessario
	ADD R1, R6						;Adiciona 30H a R1 para fazer a conversao para String
	MOVB [R5], R1					;Move o R1 para o valor dos euros no troco
	POP R3							;Restaura o valor de R3
	POP R2							;Restaura o valor de R2
	POP R1							;Restaura o valor de R1
	POP R0							;Restaura o valor de R0
	RET								;Vai para o endereço guardado na SP
	
;---------------------------------------------------Taloes e Modificaçoes associadas----------------------------------------------------------------

	
;--------------------Faz uma limpeza nas moedas Inseridas no talao intermediario-------------------------------
ApagaInt:
	PUSH R0							;Guarda o valor de R0 na Sp
	PUSH R1							;Guarda o valor de R1 na Sp
	PUSH R2							;Guarda o valor de R2 na Sp
	PUSH R3							;Guarda o valor de R3 na Sp
	MOV R0, 5ACH					;Move para R0 o valor do endereço de memoria do valor introduzido do talao intermedio 
	MOV R2, 2CH						;Move para R2 o valor da virgula
	MOV R3, 1						;Move 1 para R3 para ser a variavel de controlo
Compereint:
	MOVB R1, [R0]					;Move para R1 o valor apontado por R0 do valor introduzido
	CMP R1, R2						;Verifica se é uma virgula 
	JEQ proint						;Se for a virgula pula para o proximo endereço
	MOV R1, 30H						;Caso nao seja a virgula mete a 0
	MOVB [R0], R1					;Move R1 para a memoria de R0
proint:
	ADD R0, 1						;Adiciona 1 a R0 para passar para o proximo endereço
	ADD R3, 1						;Adiciona 1 a variavel de controlo
	CMP R3, 4						;Compara a variavel de controlo com o valor 4
	JLE Compereint					;Caso nao seja 5 ele faz para os restantes digitos
	POP R3							;Restaura o valor de R3
	POP R2							;Restaura o valor de R2
	POP R1							;Restaura o valor de R1
	POP R0							;Restaura o valor de R0
	RET								;Vai para o endereço de memoria guardado pela Sp
	

;------------------------Modifica Preço para colocar no Talão------------	
ModificaPag:						;(Modifica o preço no talao intermedio)
	PUSH R0							;Guarda o valor de R0 na Sp
	PUSH R1							;Guarda o valor de R1 na Sp
	PUSH R2							;Guarda o valor de R2 na Sp
	MOV R3, 1						;Move para R3 o valor 1 para ser a variavel de controlo
	MOV R2, 05CCH					;Move para R2 o valor do endereço de memoria o valor do preço a pagar do talao intermedio
	MOV R5, 10						;Move para R5 o valor 10
	ADD R0, R5						;Adiciona a R0 o valor de R5
ModPag:
	MOV R1, [R0]					;Move para R1 os digitos do preço do produto a comprar
	MOV [R2], R1					;Move para R2(Valor a pagar no talao intermedio) o valor do produto
	ADD R0, 2						;Adiciona 2 a R0 para passar para os ultimos 2 digitos
	ADD R2, 2						;Adiciona 2 a R2 para passar para os ultimos 2 digitos
	ADD R3, 1						;Adiciona 1 a variavel de controlo
	CMP R3, 2						;Compara a mesma com o valor 2
	JLE ModPag						;Se a variavel de controlo for menor ou igual a 2 pula para ModPag
	POP R2							;Restaura o valor de R2
	POP R1							;Restaura o valor de R1
	POP R0							;Restaura o valor de R0
	RET								;Vai para o endereço de memoria guardado pela Sp
	
;----------------------------COLOCA O NOME DO PRODUTO QUE O CLIENTE COMPROU----------------------------------------
ModificaTalao:						;(Modifica o talao final de compra, coloca o nome do produto e o respetivo preço que quer comprar)
	PUSH R0							;Guarda o valor de R0 na Sp
	PUSH R1							;Guarda o valor de R1 na Sp
	PUSH R2							;Guarda o valor de R2 na Sp
	MOV R3, 1						;Move para R3 o valor de 1 para variavel de controle
	MOV R2, 522H					;Move para R2 o endereço de memoria do talao final para colocar o nome do produto a comprar
ModfTa:
	MOV R1, [R0]					;Move para R1 as letras do produto a comprar e o preço
	MOV [R2], R1					;Coloca em na posição de memoria de R2 o nome do produto e o preço
	ADD R0, 2						;Adiciona 2 a R0 para passar para as proximas letras
	ADD R2, 2						;Adiciona 2 a R2 para passar para as proximo lugar para escrever o nome do prod
	ADD R3, 1						;Adiciona 1 unidade a variavel de controlo
	CMP R3, 7						;Compara a mesma com o valor 7
	JLE ModfTa						;Caso esta seja menor ou igual a 7 volta para o ModfTa
	POP R2							;Restaura o valor de R2
	POP R1							;Restaura o valor de R1
	POP R0							;Restaira o valor de R0
	RET								;Vai para o endereço de memoria guardado pela Sp

;----------------------------COLOCA O NOME DO PRODUTO QUE O CLIENTE COMPROU----------------------------------------
ModificaTalaopepe:						;(Modifica o talao final de compra, coloca o nome do produto e o respetivo preço que quer comprar)
	PUSH R0							;Guarda o valor de R0 na Sp
	PUSH R1							;Guarda o valor de R1 na Sp
	PUSH R2							;Guarda o valor de R2 na Sp
	MOV R3, 1						;Move para R3 o valor de 1 para variavel de controle
	MOV R2, 0EB2H					;Move para R2 o endereço de memoria do talao final para colocar o nome do produto a comprar
ModfTaPEPE:
	MOV R1, [R0]					;Move para R1 as letras do produto a comprar e o preço
	MOV [R2], R1					;Coloca em na posição de memoria de R2 o nome do produto e o preço
	ADD R0, 2						;Adiciona 2 a R0 para passar para as proximas letras
	ADD R2, 2						;Adiciona 2 a R2 para passar para as proximo lugar para escrever o nome do prod
	ADD R3, 1						;Adiciona 1 unidade a variavel de controlo
	CMP R3, 7						;Compara a mesma com o valor 7
	JLE ModfTaPEPE					;Caso esta seja menor ou igual a 7 volta para o ModfTaPEPE
	POP R2							;Restaura o valor de R2
	POP R1							;Restaura o valor de R1
	POP R0							;Restaira o valor de R0
	RET								;Vai para o endereço de memoria guardado pela Sp	
;---------------------------------------------------------------------------------------------------------------------

InicStock:
	MOV R2, StockIni				;Carrega o endereço do menu de Stock
	CALL MostrarDisplay				;Mostra o menu de produtos
	CALL LimpaPerifericos			;Limpa os perifericos de entrada

Pass_OP:							;(NOTA: Só é possivel prosseguir/voltar atraz depois de introduzir a password)
	MOV R0, PER_EN					;Move para R0 o endereço de memoria do PER_EN
	MOVB R1, [R0]					;Move para R1 o valor do PER_EN
	CMP R1, 1						;Caso esta seja 1 verifica a password
	JEQ verificaPassword				;Salta para verifica a password
	CMP R1, 2						;Caso seja dois voltra ao menu inicial
	JEQ acabar						;Salta para acabar
	JMP Pass_OP						;Caso contrario fica em loop ate conseguir ter um PER_EN valido

verificaPassword:
	MOV R0, EntradaCodigoCartao ; guarda no R0 o endereço onde começa o periferico que lê o cartão PEPE
	MOV R1, 24H					; guarda no R1 o endereço do ultimo periferico que lê o codigo introduzido
	MOV R2, PasswordLugar ; guarda no R2 o endereço onde está armazenado a palavra-passe
	MOV R3, 4040H				; endereço do ultimo cartao pepe
cicloVerificaPassword:
	MOVB R4, [R0]				; guarda no R4 o valor do digito a ser avaliado que se encontra no endereço guardado 					; adiciona o valor 30H porque assim poderá coincidir com o valor guardado na password
	MOVB R5, [R2]				; guarda no R5 o digito da password que será avaliado
	CMP R4,R5					
	JNE Erro					;se o digito introduzido for diferente ao digito avaliado significa que não coincidem, saltando para o erro
	ADD R0,1					; caso contrario é adicionado 1 valor aos endereços dos digitos para avaliar os seguintes digitos
	ADD R2,1
	CMP R0,R1					; compara o endereço do seguinte digito introduzido com o ultimo endereço do periferico de entrada
	JGT FimVerificaPassword		; se o endereço for maior do que o ultimo endereço do periferico de entrada, significa que todos os digitos coincidiram, logo a palavra- passe coincide
	JMP cicloVerificaPassword	; caso contrario, volta ao inicio do ciclo

FimVerificaPassword:
	RET
	
Erro:
	MOV R2, StockErr				;Move para R2 o endereço do display do StockErr
	CALL MostrarDisplay				;Chama a Rotina para Mostrar o display
	CALL LimpaPerifericos			;Limpa os perifericos de entrada
ErroCicl:
	MOV R0, PER_EN					;Move para R0 o endereço do PER_EN
	MOVB R1, [R0]					;Move para R1 o valor da memoria do PER_EN
	CMP R1, 1						;Compara o valor do PER_EN com 1
	JEQ InicStock					;Se for igual salta para InicStock
	CMP R1, 2						;Compara o valor do PER_EN com 2
	JEQ acabar						;Se for igual salta para acabar
	JMP ErroCicl					;Fica em cilco ate conseguir ter um PER_EN valido
acabar:
	RET								;Volta para o endereço de memoria guardado pela Sp
	
Stocks:
	MOV R2, Stock1					;Move para R2 o valor do endereço de memoria do Stock1
	CALL MostrarDisplay				;Chama a Rotina para Mostrar o display
	CALL LimpaPerifericos			;Limpa os perifericos de entrada
StocksCiclo:
	MOV R0, PER_EN					;Move para R0 o endereço do PER_EN
	MOVB R1, [R0]					;Move para R1 o valor da memoria do PER_EN
	CMP R1, 1						;Compara o valor do PER_EN com 1
	JEQ	Stockss2					;Se for igual salta para Stockss2
	CMP R1, 2						;Compara o valor do PER_EN com 2
	JEQ acabar						;Se for igual salta para acabar
	JMP StocksCiclo				;Fica em cilco ate conseguir ter um PER_EN valido
					
Stockss2:
	MOV R2, Stock2					;Move para R2 o valor do endereço de memoria do Stock1
	CALL MostrarDisplay				;Chama a Rotina para Mostrar o display
	CALL LimpaPerifericos			;Limpa os perifericos de entrada
Stocks2Ciclo:
	MOV R0, PER_EN					;Move para R0 o endereço do PER_EN
	MOVB R1, [R0]					;Move para R1 o valor da memoria do PER_EN
	CMP R1, 1						;Compara o valor do PER_EN com 1
	JEQ	Stocks					;Se for igual salta para Stockss2
	CMP R1, 2						;Compara o valor do PER_EN com 2
	JEQ acabar					;Se for igual salta para Stockss3
	JMP Stocks2Ciclo					;Fica em cilco ate conseguir ter um PER_EN valido

insereMoeda:
	PUSH R0							;Guarda o valor de R0 na Sp
	PUSH R1							;Guarda o valor de R1 na Sp
	PUSH R2							;Guarda o valor de R2 na Sp
	PUSH R9							;Guarda o valor de R9 na Sp
	MOV R1, 9						;Move para R1 o valor 9
	MOV R3, 39H						;Move para R3 o valor 39H(String 9)
	MOV R2, 1						;Move para R2 o valor 1(Variavel de Controlo)
	CALL verf						;Chama a Rotina verf(Para verificar se o stock das moedas nao esta cehio)
	CMP R4, 0						;Compara R4 com o valor 0
	JEQ fimm						;Caso sejam iguais pula para fimm, pois quer dizer que o stock das moedas está cheio
insereMoedascil:					;Caso contrario adiciona uma unidade ao stock,
	MOVB R0, [R9]					;Move para R0 o valor de da memoria de R9(Posição da memoria do stock da moeda)
	CMP R0, R3						;Compara R0 com R3 (R0 tem o endereço onde fica o PER_EN de pagamento no display)
	JLT pula						;Se R0 menor que R3 entao vai para o pula
	SUB R0, R1						;Se nao tira 9 ao R0
	MOVB [R9], R0					;E mete o valor no stock da moeda
	ADD R9, -1						;Passa para a proxima unidade do stock
	ADD R2, 1						;Adiciona 1 unidade a R2, variavel de controlo
	CMP R2, 4						;Compara R2 com o valor 4
	JLE insereMoedascil				;Caso seja menor ou igual, ele pula para insereMoedascil
	JMP fimm						;Faz um pulo para fim
pula:
	ADD R0, 1						;Adiciona 1 unidade a R0
	MOVB [R9], R0					;Move R0 para o a memoria de R9(Para o digito do stock que esta a apontar)
fimm:
	POP R9							;Restaura o valor de R9
	POP R2							;Restaura o valor de R2
	POP R1							;Restaura o valor de R1
	POP R0							;Restaura o valor de R0
	RET								;Volta para o endereço de memoria guardado pela Sp
	
verf:
	PUSH R2							;Guarda o valor de R2 na Sp
	PUSH R9							;Guarda o valor de R9 na Sp
verff:
	MOVB R0, [R9]					;Move para R0 o valor da memoria de R9
	CMP R0, R3						;Compara R0 com R3
	JLT podes						;Caso R0 seja menor que R3 ele pula para podes
	ADD R9, -1						;Se nao, adiciona -1 a R9(Passar para o proximo digito)
	ADD R2, 1						;Adiciona 1 a R2, variavel de controlo
	CMP R2, 4						;Compara R2 com o valor 4
	JLE verff						;Se for menor ou igual a 4 ele pula para verff
	MOV R4, 0						;Caso seja maior, ele poe o R4=0(Para dizer que ja esta cheio o stock)
	JMP finn						;Salta para o finn
podes:
	MOV R4, 1						;Move para R4 o valor 1, caso o Stock ainda possa receber moedas
finn:
	POP R9							;Restaura o valor de R9
	POP R2							;Restaura o valor de R2
	RET								;Volta para o endereço de memoria guardado pela Sp

calculaTiraMoeda:
	PUSH R0							;Guarda o valor de R0 na Sp
	PUSH R1							;Guarda o valor de R1 na Sp
	PUSH R2							;Guarda o valor de R2 na Sp
	PUSH R3							;Guarda o valor de R3 na Sp
	PUSH R4							;Guarda o valor de R4 na Sp
	PUSH R5							;Guarda o valor de R5 na Sp
	PUSH R6							;Guarda o valor de R6 na Sp
	PUSH R7							;Guarda o valor de R7 na Sp
	PUSH R8							;Guarda o valor de R8 na Sp
	PUSH R9							;Guarda o valor de R9 na Sp
	PUSH R10						;Guarda o valor de R10 na Sp
	PUSH R11						;Guarda o valor de R11 na Sp
	MOV R4, 30H						;Move para R4 o valor 30H (Zero em String)
	MOV R0, 54CH					;Move para R0 o valor da posição do troco
	MOVB R1, [R0]					;Troco Digito dos Euros
	PUSH R5							;Guarda o valor de R5 na Sp
	SUB R1, R4						;Subtrai a R1 o valor de 30H para termos o valor em numero decimal
	MOV R5, 64H						;Move para R5 o valor 64H, em decimal o valor 100
	MUL R1, R5						;Multiplica R1 por R5, para ficarmos, com o euro em centimos
	POP R5							;Restaura o valor de R5
chill:
	MOV R11, 1						;Move para R11 o valor 1, variavel de controlo
	MOV R2, 1F4H					;Move para R2 o valor de 5 euros, que nesta conversão é 500 centimos, pois o valor esta em centimos
	MOV R3, 89FH					;Move para R3 o valor do endereço de memoria do stock dos 5 euros
	CALL vefifmoeda					;Chama a Rotina vefifmoeda para verificar se exitem moedas em stock
	CMP R8, 1						;Compara R8 com o valor 1
	JEQ euro2						;Caso seja igual, significa que nao existe moedas em stock por isso passa para a proxima moeda, neste caso a moeda de 2 euros
	CMP R1, R2						;Caso haja moedas, compara o valor do troco com o valor da moeda a ser retirada
	JGE Tirass						;Caso o valor do troco seja maior do que o valor da moeda a ser retirada, ele tira do stock 1 moeda, e faz R1-500
euro2:
	MOV R2, 0C8H					;Move para R2 o valor de 2 euros, que nesta conversão é 200 centimos, pois o valor esta em centimos
	MOV R3, 8AFH					;Move para R3 o valor do endereço de memoria do stock dos 2 euros
	CALL vefifmoeda					;Chama a Rotina vefifmoeda para verificar se exitem moedas em stock
	CMP R8, 1						;Compara R8 com o valor 1
	JEQ euro1						;Caso seja igual, significa que nao existe moedas em stock por isso passa para a proxima moeda, neste caso a moeda de 1 euro
	CMP R1, R2						;Caso haja moedas, compara o valor do troco com o valor da moeda a ser retirada
	JGE Tirass						;Caso o valor do troco seja maior do que o valor da moeda a ser retirada, ele tira do stock 1 moeda, e faz R1-200
euro1:
	MOV R2, 64H						;Move para R2 o valor de 1 euro, que nesta conversão é 100 centimos, pois o valor esta em centimos
	MOV R3, 8BFH					;Move para R3 o valor do endereço de memoria do stock do 1 euro
	CALL vefifmoeda					;Chama a Rotina vefifmoeda para verificar se exitem moedas em stock
	CMP R8, 1						;Compara R8 com o valor 1
	JEQ euro50						;Caso seja igual, significa que nao existe moedas em stock por isso passa para a proxima moeda, neste caso a moeda de 50 centimos
	CMP R1, R2						;Caso haja moedas, compara o valor do troco com o valor da moeda a ser retirada
	JGE Tirass						;Caso o valor do troco seja maior do que o valor da moeda a ser retirada, ele tira do stock 1 moeda, e faz R1-100
euro50:
	MOV R2, 32H						;Move para R2 o valor de 50 centimos, pois o valor esta em centimos
	MOV R3, 8CFH					;Move para R3 o valor do endereço de memoria do stock dos 50 centimos
	CALL vefifmoeda					;Chama a Rotina vefifmoeda para verificar se exitem moedas em stock
	CMP R8, 1						;Compara R8 com o valor 1
	JEQ euro20						;Caso seja igual, significa que nao existe moedas em stock por isso passa para a proxima moeda, neste caso a moeda de 20 centimos
	CMP R1, R2						;Caso haja moedas, compara o valor do troco com o valor da moeda a ser retirada
	JGE Tirass						;Caso o valor do troco seja maior do que o valor da moeda a ser retirada, ele tira do stock 1 moeda, e faz R1-50
euro20:
	MOV R2, 14H						;Move para R2 o valor de 20 centimos, pois o valor esta em centimos
	MOV R3, 91FH					;Move para R3 o valor do endereço de memoria do stock dos 20 centimos
	CALL vefifmoeda					;Chama a Rotina vefifmoeda para verificar se exitem moedas em stock
	CMP R8, 1						;Compara R8 com o valor 1
	JEQ euro10						;Caso seja igual, significa que nao existe moedas em stock por isso passa para a proxima moeda, neste caso a moeda de 10 centimos
	CMP R1, R2						;Caso haja moedas, compara o valor do troco com o valor da moeda a ser retirada
	JGE Tirass						;Caso o valor do troco seja maior do que o valor da moeda a ser retirada, ele tira do stock 1 moeda, e faz R1-20
euro10:								;(Neste caso, caso nao haja moedas ele apenas faz o codigo sem retirar nada do stock pois nao tem nada para retirar)
	MOV R2, 0AH						;Move para R2 o valor de 10 centimos, pois o valor esta em centimos
	MOV R3, 92FH					;Move para R3 o valor do endereço de memoria do stock dos 10 centimos
	CMP R1, R2						;Caso haja moedas, compara o valor do troco com o valor da moeda a ser retirada
	JGE Tirass						;Caso o valor do troco seja maior do que o valor da moeda a ser retirada, ele tira do stock 1 moeda, e faz R1-10
	ADD R0, 2						;Adiciona a R0 2 unidades, para passar para o digito dos centimos
	MOVB R1, [R0]					;Move para R1 os centimos que falta dar o troco
	PUSH R5							;Guarda o valor de R5 na Sp
	SUB R1, R4						;Subtrai de R1 o valor de 30H, para obtermos o valor em decimal
	MOV R5, 64H						;Move para R5 o valor de 64H
	MUL R1, R5						;Multiplica por 100, pois ao tirarmos so o digito dos centimos temos, se 50 cenmtimos, 35H que ao retirar 30h temos o valor 5 que tem de ser multiplicado por 100 para se obter os 500 centimos
	POP R5							;Restaura o valor de R5
chill2:
	MOV R11, 1						;Move para R11 o valor 1, variavel de controlo
	MOV R2, 1F4H					;Move para R2 o valor de 50 centimos, que nesta conversão é 500 centimos, pois o valor esta em centimos multiplicado por 10
	MOV R3, 8CFH					;Move para R3 o valor do endereço de memoria do stock dos 50 centimos
	CALL vefifmoeda					;Chama a Rotina vefifmoeda para verificar se exitem moedas em stock
	CMP R8, 1						;Compara R8 com o valor 1
	JEQ cent20						;Caso seja igual, significa que nao existe moedas em stock por isso passa para a proxima moeda, neste caso a moeda de 20 centimos
	CMP R1, R2						;Caso haja moedas, compara o valor do troco com o valor da moeda a ser retirada
	JGE Tirass						;Caso o valor do troco seja maior do que o valor da moeda a ser retirada, ele tira do stock 1 moeda, e faz R1-500
cent20:
	MOV R2, 0C8H					;Move para R2 o valor de 20 centimos, que nesta conversão é 200 centimos, pois o valor esta em centimos multiplicado por 10
	MOV R3, 91FH					;Move para R3 o valor do endereço de memoria do stock dos 20 centimos
	CALL vefifmoeda					;Chama a Rotina vefifmoeda para verificar se exitem moedas em stock
	CMP R8, 1						;Compara R8 com o valor 1
	JEQ cent10						;Caso seja igual, significa que nao existe moedas em stock por isso passa para a proxima moeda, neste caso a moeda de 10 centimos
	CMP R1, R2						;Caso haja moedas, compara o valor do troco com o valor da moeda a ser retirada
	JGE Tirass						;Caso o valor do troco seja maior do que o valor da moeda a ser retirada, ele tira do stock 1 moeda, e faz R1-200
cent10:								;(Neste caso, caso nao haja moedas ele apenas faz o codigo sem retirar nada do stock pois nao tem nada para retirar)
	MOV R2, 64H						;Move para R2 o valor de 10 centimos, que nesta conversão é 100 centimos, pois o valor esta em centimos multiplicado por 10
	MOV R3, 92FH					;Move para R3 o valor do endereço de memoria do stock dos 10 centimos
	CMP R1, R2						;Caso haja moedas, compara o valor do troco com o valor da moeda a ser retirada
	JGE Tirass						;Caso o valor do troco seja maior do que o valor da moeda a ser retirada, ele tira do stock 1 moeda, e faz R1-200
	JMP finito						;Pula para o fim do calcula o tira moeda
Tirass:
	MOV R6, R3						;Guarda o valor da memoria do stock onde esta a moeda 
Tirassss:	
	MOVB R5, [R3]					;Move para R5 o valor da quantidade da moeda 
	CMP R5, R4						;Compara o valor de R5 com o 30H, para ver se é zero
	JGT Tiramsm						;Caso nao seja 0 ele vai para o tiramsm
	ADD R3, -1						;Adiciona a R3 -1
	ADD R11, 1						;Adiciona a R11 o valor 1, variavel de controlo
	CMP R11, 4						;Compara o R11 com 4
	JLE Tirassss					;Se for menor ou igual a 4 ele vai paara o Tirassss
	JMP Tiraste						;Se nao ele pula para o Tiraste
Tiramsm:
	CMP R3, R6						;Compara R3 com R6
	JEQ	Tirasegg					;Caso sejam iguais, pula para Tirasegg
	MOVB R7, [R6]					;Caso sejam diferentes(Apontam para digitos diferentes), move para R7, o valor do digito anterior
	MOV R10, 9						;Move para R10 o valor 9
	ADD R7, R10						;Adiciona a R7, R10
	MOVB [R6], R7					;Move para a posição de R6 o valor de R7
	ADD R6, -1						;Adiciona -1 a R6, para passar para o proximo digito
	JMP Tiramsm						;Salta para Tiramsm
Tirasegg:
	SUB R5, 1						;Subtrai a R5, 1 unidade, tira do stock das moedas 1 unidade
	MOVB [R3], R5					;Coloca o valor R5, no stock das moedas
Tiraste:
	SUB R1, R2						;Subtrai ao R1 o valor de R2(ao valor que falta para que as moedas que façam o troco, o valor da moeda)
	MOV R9, 54CH					;Move para R9 o valor do digito dos euros do troco
	CMP R0, R9						;Compara R0 a R9
	JEQ chill						;Caso R0 e R9 sejam iguais ele vai para chill(que calcula as moedas do troco dos euros)
	JMP chill2						;Caso contrario salta para chill2(que calcula as moedas do troco dos centimos)
finito:
	POP R11							;Restaura o valor de R11
	POP R10							;Restaura o valor de R10
	POP R9							;Restaura o valor de R9
	POP R8							;Restaura o valor de R8
	POP R7							;Restaura o valor de R7
	POP R6							;Restaura o valor de R6
	POP R5							;Restaura o valor de R5
	POP R4							;Restaura o valor de R4
	POP R3							;Restaura o valor de R3
	POP R2							;Restaura o valor de R2
	POP R1							;Restaura o valor de R1
	POP R0							;Restaura o valor de R0
	RET								;Volta para o endereço de memoria guardado pela Sp
	
vefifmoeda:
	PUSH R0							;Guarda o valor de R0 na Sp
	PUSH R1							;Guarda o valor de R1 na Sp
	PUSH R2							;Guarda o valor de R2 na Sp
	PUSH R3							;Guarda o valor de R3 na Sp
	PUSH R4							;Guarda o valor de R4 na Sp
	PUSH R5							;Guarda o valor de R5 na Sp
	MOV R4, 1						;Move para R4 o valor 1, variavel de controlo
	MOV R0, 30H						;Move para R0 o valor 30H, String 0
vefimoedacil:
	MOVB R1, [R3]					;Move para R1 o valor da quantidade do stock da moeda
	CMP R1, R0						;Compara o valor com R0, 30H para verificar se tem stock
	JGT goodbye						;Caso seja maior que dizer que tem stock, por isso vai para o goodbye
	ADD R3, -1						;Caso nao tenha stock naquele digito falta ver os outros, por isso adicionar -1 a R3
	ADD R4,1						;Adiciona 1 a R4 para aumentar a variavel de controlo
	CMP R4, 4						;Compara R4 com o valor 4
	JLE vefimoedacil				;Caso seja menor ou igual a 4 vai para vefimoedacil
	MOV R8, 1						;Move para R8 o valor 1, o que quer dizer que nao existe sotck da moeda
	JMP goodbyee					;Salta para goodbyee para acabar a rotina
goodbye:
	MOV R8, 0						;Move para R8 o valor 0, o que quer dizer que existe sotck da moeda
goodbyee:
	POP R5							;Restaura o valor de R5
	POP R4							;Restaura o valor de R4
	POP R3							;Restaura o valor de R3
	POP R2							;Restaura o valor de R2
	POP R1							;Restaura o valor de R1
	POP R0							;Restaura o valor de R0
	RET								;Volta para o endereço de memoria guardado pela Sp

MostrarDisplay:
	PUSH R0							;Guarda o valor de R0 na Sp
	PUSH R1							;Guarda o valor de R1 na Sp
	PUSH R2							;Guarda o valor de R2 na Sp
	PUSH R3							;Guarda o valor de R3 na Sp
	MOV R0, Display					;Move para R0 o inicio do display
	MOV R1, Display_end				;Move para R1 o fim do display
CicloDisplay:
	MOV R3, [R2]					;Move para R3 o valor na memoria de R2
	MOV [R0], R3					;Move para a memoria de R0 o valor de R3
	ADD R2, 2						;Adiciona a R2 2 unidades (R2 tem o valor que aponta para a informação a ser colocada no display)
	ADD R0, 2						;Adiciona R0 2 unidades
	CMP R0, R1						;Compara R0 com R1, para ver se ja chegou ao fim do display
	JLE CicloDisplay				;Se for menor ou igual pula para CicloDisplay
	POP R3							;Restaura o valor de R3
	POP R2							;Restaura o valor de R2
	POP R1							;Restaura o valor de R1
	POP R0							;Restaura o valor de R0
	RET								;Volta para o endereço de memoria guardado pela Sp
	

	;Limpa Perifericos
	;--------------------
	LimpaPerifericos:
		PUSH R0
		PUSH R1
		PUSH R2
		PUSH R3
		PUSH R4
		PUSH R5
		PUSH R6
		MOV R0,ON_OFF      ; guarda em R0 o valor do endereco de ON_OFF
		MOV R1,PER_EN     ; guarda em R1 o valor do endereco de PER_EN
		MOV R2,EntradaCodigoCartao ; guarda em R2 o endereço do periferico onde é introduzido o código pepe
		MOV R5, EntradaColocardinheiroCartao
		MOV R3,20H	           ; guarda em R3 o valor 20h
		MOVB [R0],R3       ; passa a 0 o que esta em R0 
		MOVB [R1],R3       ; passa a 0 o que esta em R1

		MOV R4, 24H		; é atrubuido a R4 o valor 24H que será utilizado para limpar as entradas do codigo PEPE
		MOV R6, 14H
	cicloLimpaCodigo:
		MOVB [R2],R3		; limpa a entrada do periferico 	
		ADD R2,1			; É somado 1 ao R2 para este apontar ao próximo per_Entrada do código  
		ADD R5,1
		CMP R5,R6
		JGT FimLimpaPerifericos ; se R2 for maior que 24H, significa que limpu todos os per_entrada e acaba a rutina
		CMP R2, R4		; é comparado com 24H para saber se já limpou todas as entradas do código do PEPE
		JGT FimLimpaPerifericos ; se R2 for maior que 24H, significa que limpu todos os per_entrada e acaba a rutina
		JMP cicloLimpaCodigo	;Caso contrário repete o ciclo
	FimLimpaPerifericos:	
		POP R6
	    POP R5
		POP R4	
		POP R3
		POP R2
		POP R1
		POP R0
		RET
		;--------------------
	;LIMPA DISPLAY
	;--------------------
	LimpaDisplay:        ;Faz a Limpeza do diplay
		PUSH R0
		PUSH R1
		PUSH R3
		MOV R0,Display      ; move para R0 o endereco de Diplay
		MOV R1,Display_end  ; move para R1 o endereco de Display_end
	CicloLimpar:         ; Ciclo para a limpeza caracter a caracter  
		MOV R2,CaracterVazio    ; coloca em R2 o valor guardado em CaracterVazio
		MOVB [R0],R2     ; Move para R2 o byte de R0 
		ADD R0,1         ; adiciona a R0, 1
		CMP R0,R1        ; compara r0 com r1 
		JLE CicloLimpar  ; salta em caso de ser menor ou igual 
		POP R3
		POP R1
		POP R0
		RET