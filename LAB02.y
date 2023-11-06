%{
#include <iostream>
#include <vector>

using namespace std;

int yylex();
int yyerror(const char* s);
extern "C" FILE* yyin;

vector<int> error_lineas;
int numLinea = 1;
%}

%token ASIGN DIF MAYORIGQ MENORIGQ MAYORQ MENORQ EQUAL
%token SUMA RESTA DIV ASTER
%token PARENTABRE PARENTCIERRA COMA PUNTCOMA
%token IDENTIFICADOR CADENA
%token NUM_ENTERO
%token NUM_DECIMAL
%token CREATE_TABLE DROP_TABLE
%token INSERT DELETE UPDATE
%token SELECT WHERE GROUP_BY ORDER_BY
%token MAX MIN AVG COUNT
%token INTO VALUES FROM SET ASC DESC
%token INTEGER DECIMAL VARCHAR
%token AND OR
%token OTHER

%%

start: comandos start_
start_: | comandos start
comandos: creacion_tabla { numLinea++; }
        | eliminacion_tabla { numLinea++; }
        | insercion_dato { numLinea++; }
        | eliminacion_dato { numLinea++; }
        | actualizacion { numLinea++; }
        | seleccion { numLinea++; }
        | error PUNTCOMA { error_lineas.push_back(numLinea++); }

creacion_tabla: CREATE_TABLE IDENTIFICADOR PARENTABRE campos PARENTCIERRA PUNTCOMA;
campos: campo campos_
campos_: | COMA campos
campo: IDENTIFICADOR tipoDato dato | IDENTIFICADOR tipoDato;
tipoDato: INTEGER | DECIMAL | VARCHAR
dato: PARENTABRE NUM_ENTERO PARENTCIERRA;

eliminacion_tabla: DROP_TABLE IDENTIFICADOR PUNTCOMA;

insercion_dato: INSERT INTO IDENTIFICADOR VALUES PARENTABRE valores PARENTCIERRA PUNTCOMA;
valores: valor valores_
valores_: | COMA valores
valor: NUM_ENTERO | NUM_DECIMAL | CADENA

eliminacion_dato: DELETE FROM IDENTIFICADOR WHERE condiciones PUNTCOMA;
condiciones: condicion condiciones_
condiciones_: | AND condiciones | OR condiciones 
condicion: IDENTIFICADOR operador_ar valor | valor operador_ar IDENTIFICADOR;
operador_ar: ASIGN | DIF | MAYORIGQ | MENORIGQ | MAYORQ | MENORQ | EQUAL

actualizacion: UPDATE IDENTIFICADOR SET IDENTIFICADOR EQUAL option WHERE condiciones PUNTCOMA;
option: IDENTIFICADOR | condiciones;

seleccion: SELECT busqueda FROM IDENTIFICADOR condicionado agrupacion ordenacion PUNTCOMA;
busqueda: ASTER | combinado;
combinado: IDENTIFICADOR | funcion | IDENTIFICADOR COMA combinado | funcion COMA combinado;
funcion: tipoFuncion PARENTABRE IDENTIFICADOR PARENTCIERRA;
tipoFuncion: MAX | MIN | AVG | COUNT;
condicionado: | WHERE condiciones;
agrupacion: | GROUP_BY IDENTIFICADOR;
ordenacion: | ORDER_BY identificadores orden;
orden: ASC | DESC;
identificadores: IDENTIFICADOR | IDENTIFICADOR COMA identificadores;

%%

int main(int argc, char* argv[]) {
    if (argc != 2) {
        cerr<<"Uso: "<<argv[0]<<" archivo.txt\n";
        return 1;
    }

    yyin = fopen(argv[1], "r");
    if (!yyin) {
        cerr<<"No se pudo abrir el archivo "<<argv[1]<<endl;
        return 1;
    }

    yyparse();
    fclose(yyin);

    if (error_lineas.size() > 0) {
        cout<<"\n\nIncorrecto\n\n";
        for (int linea : error_lineas) {
            cout<<"Error en la linea "<<linea<<endl;
        }
        error_lineas.clear();
    } else {
        cout<<"\n\nCorrecto\n";
    }

    return 0;
}

int yyerror(const char* mensaje) {
    return 1;
}