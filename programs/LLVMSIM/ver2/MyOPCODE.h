#ifndef MY_OPCODE_H
#define MY_OPCODE_h

#define ADD 1			/*ADD,INTEGER,INTEGER,INTEGER*/
#define SUB 2			/*SUB,INTEGER,INTEGER,INTEGE*/
#define MUL 3			/*MUL,INTEGER,INTEGER,INTEGE*/
#define UDIV 4			/*UDIV,INTEGER,INTEGER,INTEGE*/
#define ALLOC 5			/*ALLOC,POINTER,INTEGER*/
#define STORE 6			/*STORE,,INTEGER,POINTER*/
#define LOAD 7			/*LOAD,INTEGER,POINTER*/
#define UBR 8			/*unconditional branch,UBR,LABEL*/
#define CBR 9			/*conditonal branch,CBR,INTEGER,LABERL,LABEL*/
#define EQ 10			/* OP1 == OP2 */
#define NEQ 11			/* OP1 != OP2 */
#define GT 12			/* OP1 > OP2,符号あり・符号なしで判定する機能をつける*/
#define GE 13			/* OP1 >= OP2,符号あり・符号なしで判定する機能をつける*/
#define LT 14			/* OP1 < OP2,符号あり・符号なしで判定する機能をつける*/
#define LE 15			/* OP1 <= OP2,符号あり・符号なしで判定する機能をつける*/
#endif
