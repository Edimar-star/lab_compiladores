/* A Bison parser, made by GNU Bison 3.5.1.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015, 2018-2020 Free Software Foundation,
   Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Undocumented macros, especially those whose name start with YY_,
   are private implementation details.  Do not rely on them.  */

#ifndef YY_YY_LAB02_HPP_INCLUDED
# define YY_YY_LAB02_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    ASIGN = 258,
    DIF = 259,
    MAYORIGQ = 260,
    MENORIGQ = 261,
    MAYORQ = 262,
    MENORQ = 263,
    EQUAL = 264,
    SUMA = 265,
    RESTA = 266,
    DIV = 267,
    ASTER = 268,
    PARENTABRE = 269,
    PARENTCIERRA = 270,
    COMA = 271,
    PUNTCOMA = 272,
    IDENTIFICADOR = 273,
    CADENA = 274,
    NUM_ENTERO = 275,
    NUM_DECIMAL = 276,
    CREATE_TABLE = 277,
    DROP_TABLE = 278,
    INSERT = 279,
    DELETE = 280,
    UPDATE = 281,
    SELECT = 282,
    WHERE = 283,
    GROUP_BY = 284,
    ORDER_BY = 285,
    MAX = 286,
    MIN = 287,
    AVG = 288,
    COUNT = 289,
    INTO = 290,
    VALUES = 291,
    FROM = 292,
    SET = 293,
    ASC = 294,
    DESC = 295,
    INTEGER = 296,
    DECIMAL = 297,
    VARCHAR = 298,
    AND = 299,
    OR = 300,
    MAL_IDENTIFICADOR = 301,
    OTHER = 302
  };
#endif
/* Tokens.  */
#define ASIGN 258
#define DIF 259
#define MAYORIGQ 260
#define MENORIGQ 261
#define MAYORQ 262
#define MENORQ 263
#define EQUAL 264
#define SUMA 265
#define RESTA 266
#define DIV 267
#define ASTER 268
#define PARENTABRE 269
#define PARENTCIERRA 270
#define COMA 271
#define PUNTCOMA 272
#define IDENTIFICADOR 273
#define CADENA 274
#define NUM_ENTERO 275
#define NUM_DECIMAL 276
#define CREATE_TABLE 277
#define DROP_TABLE 278
#define INSERT 279
#define DELETE 280
#define UPDATE 281
#define SELECT 282
#define WHERE 283
#define GROUP_BY 284
#define ORDER_BY 285
#define MAX 286
#define MIN 287
#define AVG 288
#define COUNT 289
#define INTO 290
#define VALUES 291
#define FROM 292
#define SET 293
#define ASC 294
#define DESC 295
#define INTEGER 296
#define DECIMAL 297
#define VARCHAR 298
#define AND 299
#define OR 300
#define MAL_IDENTIFICADOR 301
#define OTHER 302

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_LAB02_HPP_INCLUDED  */
