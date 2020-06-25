%{
	#include <iostream>
	#include <stdlib.h>
	#include "basic.tab.h"  /* We want the tokens defined in basic.y. */


%}

%option noyywrap

%%


						/*starting here. */
"PRINT"					{ printf("Found a PRINT\n"); return PRINT; }
"IF"					{ printf("Found an IF\n"); return IF; }
">="|">="|"<>"|"><"|"<"|">"		{ printf("Found a RELOP %s\n", yytext); return RELOP; }
"="						{ printf("Found a =\n"); return EQUAL;}
"THEN"					{ printf("Found a THEN\n"); return THEN; }
"CR"					{ printf("Found a CR\n"); return CR; }
"GOTO"					{ printf("Found a GOTO\n"); return GOTO; }
"INPUT"					{ printf("Found a INPUT\n"); return INPUT; }
"GOSUB"					{ printf("Found a GOSUB\n"); return GOSUB; }
"RETURN"				{ printf("Found a RETURN\n"); return RETURN; }
"CLEAR"					{ printf("Found a CLEAR\n"); return CLEAR; }
"LIST"					{ printf("Found a LIST\n"); return LIST; }
"RUN"					{ printf("Found a RUN\n"); return RUN; }
"END"					{ printf("Found a END\n"); return END; }
"LET"					{ printf("FOUND a LET\n"); return LET; }
\".*\"					{ printf("Found a STRING %s\n", yytext); yylval.string = strdup(yytext); return STRING; }
","						{ printf("Found a COMMA\n"); return COMMA; }
"+"|"-"				{ printf("Found a PLUMIN %s\n", yytext);return PLUMIN; }
"*"|"/"				{ printf("Found a MULDIV %s\n", yytext);return MULDIV; }
"("						{ printf("Found a LPAREN\n"); return LPAREN; }
")"						{ printf("Found a RPAREN\n");return RPAREN; }
[0-9]					{ printf("Found a DIGIT %s\n", yytext); yylval.var_dig = *yytext; return DIGIT; }
[A-Z]					{ printf("Found a VAR %s\n", yytext);yylval.var_dig = *yytext; return VAR; }
[ \r\t\n]+              { /* Ignore white characters. */ }
.                       { std::cerr << "Invalid token" << std::endl; exit(1); }

%%