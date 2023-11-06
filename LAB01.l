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

"CREATE TABLE" { cout<<"CREATE TABLE"; return (CREATE_TABLE); }
"DROP TABLE" { cout<<"DROP TABLE"; return (DROP_TABLE); }

"INSERT" { cout<<"INSERT"; return (INSERT); }
"DELETE" { cout<<"DELETE"; return (DELETE); }
"UPDATE" { cout<<"UPDATE"; return (UPDATE); }

"SELECT" { cout<<"SELECT"; return (SELECT); }
"WHERE" { cout<<"WHERE"; return (WHERE); }
"GROUP BY" { cout<<"GROUP BY"; return (GROUP_BY); }
"ORDER BY" { cout<<"ORDER BY"; return (ORDER_BY); }

"MAX" { cout<<"MAX"; return (MAX); }
"MIN" { cout<<"MIN"; return (MIN); }
"AVG" { cout<<"AVG"; return (AVG); }
"COUNT" { cout<<"COUNT"; return (COUNT); }

"INTO" { cout<<"INTO"; return (INTO); }
"VALUES" { cout<<"VALUES"; return (VALUES); }
"FROM" { cout<<"FROM"; return (FROM); }
"SET" { cout<<"SET"; return (SET); }
"ASC" { cout<<"ASC"; return (ASC); }
"DESC" { cout<<"DESC"; return (DESC); }

"INTEGER" { cout<<"INTEGER"; return (INTEGER); }
"DECIMAL" { cout<<"DECIMAL"; return (DECIMAL); }
"VARCHAR" { cout<<"VARCHAR"; return (VARCHAR); }

"AND" { cout<<"AND"; return (AND); }
"OR" { cout<<"OR"; return (OR); }

"==" { cout<<" equal="<<yytext; return (EQUAL); }
"=" { cout<<" asign="<<yytext; return (ASIGN); }
"<>" { cout<<" dif="<<yytext; return (DIF); }
">=" { cout<<" mayorigq="<<yytext; return (MAYORIGQ); }
"<=" { cout<<" menorigq="<<yytext; return (MENORIGQ); }
">" { cout<<" mayorq="<<yytext; return (MAYORQ); }
"<" { cout<<" menorq="<<yytext; return (MENORQ); }

"+" { cout<<" sum="<<yytext; return (SUMA); }
"-" { cout<<" rest="<<yytext; return (RESTA); }
"/" { cout<<" div="<<yytext; return (DIV); }
"*" { cout<<" aster="<<yytext; return (ASTER); }

"(" { cout<<" parentabre="<<yytext; return (PARENTABRE); }
")" { cout<<" parentcierr="<<yytext; return (PARENTCIERRA); }
"," { cout<<" coma="<<yytext; return (COMA); }
";" { cout<<" puntcoma="<<yytext; return (PUNTCOMA); }

{NUM_ENTERO} { cout<<" entero="<<yytext; return (NUM_ENTERO); }
{NUM_DECIMAL} { cout<<" decimal="<<yytext; return (NUM_DECIMAL); }
{CADENA} { cout<<" cadena="<<yytext; return (CADENA); }

{IDENTIFICADOR} { 
    if (mapa.find(yytext) == mapa.end()) {
        mapa[yytext] = "id" + to_string(mapa.size() + 1);
    }
    cout<<" "<<mapa[yytext]<<"="<<yytext; 
    return (IDENTIFICADOR); 
}

[ \t\n] { cout<<yytext; }
{MAL_IDENTIFICADOR} { cout<<" Error="<<yytext; }
. { cout<<" Error="<<yytext; return (OTHER); }

%%