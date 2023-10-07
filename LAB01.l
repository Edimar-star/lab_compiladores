%{
#include <iostream>
#include <fstream>
#include <string>
#include <algorithm>
#include <map>

using namespace std;

extern FILE* yyin; // Declarar yyin como una variable externa

map<string, string> mapa;
int errores_lexicos = 0;
%}

%option noyywrap

/* COMANDOS */
TABLAS "CREATE TABLE"|"DROP TABLE"
MANIP "INSERT"|"DELETE"|"UPDATE"
BUSQ "SELECT"|"WHERE"|"GROUP BY"|"ORDER BY"
FUNC "MAX"|"MIN"|"AVG"|"COUNT"
KEYWORDS "INTO"|"VALUES"|"FROM"|"SET"|"ASC"|"DESC"
DATO "ENTERO"|"DECIMAL"|"VARCHAR"
COND "AND"|"OR"

/* OPERADORES LOGICOS */
ASIGN "="
DIF "<>"
MAYORIGQ ">="
MENORIGQ "<="
MAYORQ ">"
MENORQ "<"

/* OPERADORES ARITMETICOS */
SUMA "+"
RESTA "-"
DIV "/"
ASTER "*"

/* SEPARADORES */
PARENTABRE "("
PARENTCIERRA ")"
COMA ","
PUNTCOMA ";"

/* TOKENS */
LETRA [A-Za-z]
LETRAS {LETRA}+
DIGITO [0-9]
ALFANUM {LETRA}|{DIGITO}
IDENTIFICADOR {LETRA}{ALFANUM}*
ENTERO {DIGITO}+
DECIMAL {ENTERO}["."]{ENTERO}
CADENA (\"[^\n"]*\")|(\'[^\n']*\')
MAL_IDENTIFICADOR {DIGITO}({LETRA}|{DIGITO})*

%%

{ASIGN} { cout<<" asign="<<yytext; }
{DIF} { cout<<" dif="<<yytext; }
{MAYORIGQ} { cout<<" mayorigq="<<yytext; }
{MENORIGQ} { cout<<" menorigq="<<yytext; }
{MAYORQ} { cout<<" mayorq="<<yytext; }
{MENORQ} { cout<<" menorq="<<yytext; }

{SUMA} { cout<<" suma="<<yytext; }
{RESTA} { cout<<" resta="<<yytext; }
{DIV} { cout<<" div="<<yytext; }
{ASTER} { cout<<"aster="<<yytext; }

{PARENTABRE} { cout<<" parabre="<<yytext; }
{PARENTCIERRA} { cout<<" parcierr="<<yytext; }
{COMA} { cout<<" coma="<<yytext; }
{PUNTCOMA} { cout<<" puntcoma="<<yytext; }

{ENTERO} { cout<<" entero="<<yytext; }
{DECIMAL} { cout<<" decimal="<<yytext; }
{CADENA} { cout<<" cadena="<<yytext; }

{MAL_IDENTIFICADOR} {
    errores_lexicos += 1;
    cout<<"Error="<<yytext;
}
{IDENTIFICADOR} {
    string cadena = yytext;
    transform(cadena.begin(), cadena.end(), cadena.begin(), ::toupper);
    bool banderas = cadena == "CREATE" || cadena == "DROP" || cadena == "TABLE" || cadena == "INSERT" || cadena == "DELETE" || 
                    cadena == "UPDATE" || cadena == "SELECT" || cadena == "WHERE" || cadena == "GROUP" || cadena == "ORDER" || 
                    cadena == "BY" || cadena == "MAX" || cadena == "MIN" || cadena == "AVG" || cadena == "COUNT" || 
                    cadena == "INTO" || cadena == "VALUES" || cadena == "FROM" || cadena == "SET" || cadena == "ASC" || 
                    cadena == "DESC" || cadena == "INTEGER" || cadena == "DECIMAL" || cadena == "VARCHAR" || cadena == "AND" || cadena == "OR";
    
    if (banderas) {
        cout<<cadena;
    } else {
        if (mapa.find(yytext) == mapa.end()) {
            mapa[yytext] = "id" + to_string(mapa.size() + 1);
        }
        cout<<" "<<mapa[yytext]<<"="<<yytext;
    }
}

[ \t\n] { cout<<yytext; }
. {
    errores_lexicos += 1;
    cout<<"Error="<<yytext;
}

%%

int main(int argc, char* argv[]) {
    if (argc != 2) {
        cerr<<"Uso: "<<argv[0]<<" archivo.txt\n";
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (yyin == NULL) {
        cerr<<"No se pudo abrir el archivo "<<argv[1]<<endl;
        return 1;
    }

    yylex();
    fclose(yyin);

    cout<<"\n\n"<<mapa.size()<<" Identificadores\n\n";

    // Creamos un std::multimap para ordenar por valor
    std::multimap<string, string> mapaOrdenadoPorValor;

    // Invertimos los valores y claves en el std::multimap
    for (const auto& par : mapa) {
        mapaOrdenadoPorValor.insert({par.second, par.first});
    }

    // Imprimimos el mapa ordenado por valor
    for (const auto& par : mapaOrdenadoPorValor) {
        cout<<par.first<<"="<<par.second<<endl;
    }

    cout<<"\n"<<errores_lexicos<<" Errores léxicos\n";

    return 0;
}