%{
#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>
#include <map>
#include "LAB02.hpp"

using namespace std;

map<string, string> mapa;
%}

%option case-insensitive
%option noyywrap

/* TOKENS */
LETRA [A-Za-z]
LETRAS {LETRA}+
DIGITO [0-9]
ALFANUM {LETRA}|{DIGITO}
IDENTIFICADOR {LETRA}{ALFANUM}*
NUM_ENTERO {DIGITO}+
NUM_DECIMAL {NUM_ENTERO}["."]{NUM_ENTERO}
CADENA (\"[^\n"]*\")|(\'[^\n']*\')
MAL_IDENTIFICADOR {DIGITO}({LETRA}|{DIGITO})*

%%

"CREATE TABLE" { return (CREATE_TABLE); }
"DROP TABLE" { return (DROP_TABLE); }

"INSERT" { return (INSERT); }
"DELETE" { return (DELETE); }
"UPDATE" { return (UPDATE); }

"SELECT" { return (SELECT); }
"WHERE" { return (WHERE); }
"GROUP BY" { return (GROUP_BY); }
"ORDER BY" { return (ORDER_BY); }

"MAX" { return (MAX); }
"MIN" { return (MIN); }
"AVG" { return (AVG); }
"COUNT" { return (COUNT); }

"INTO" { return (INTO); }
"VALUES" { return (VALUES); }
"FROM" { return (FROM); }
"SET" { return (SET); }
"ASC" { return (ASC); }
"DESC" { return (DESC); }

"INTEGER" { return (INTEGER); }
"DECIMAL" { return (DECIMAL); }
"VARCHAR" { return (VARCHAR); }

"AND" { return (AND); }
"OR" { return (OR); }

"==" { return (EQUAL); }
"=" { return (ASIGN); }
"<>" { return (DIF); }
">=" { return (MAYORIGQ); }
"<=" { return (MENORIGQ); }
">" { return (MAYORQ); }
"<" { return (MENORQ); }

"+" { return (SUMA); }
"-" { return (RESTA); }
"/" { return (DIV); }
"*" { return (ASTER); }


{NUM_ENTERO} { return (NUM_ENTERO); }
{NUM_DECIMAL} { return (NUM_DECIMAL); }
{CADENA} { return (CADENA); }

{IDENTIFICADOR} { 
    if (mapa.find(yytext) == mapa.end()) {
        mapa[yytext] = "id" + to_string(mapa.size() + 1);
    }
    return (IDENTIFICADOR); 
}

[ \t\n] ;
{MAL_IDENTIFICADOR} { return (MAL_IDENTIFICADOR); }
. { return (OTHER); }
