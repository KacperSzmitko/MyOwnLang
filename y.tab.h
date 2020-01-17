
/* A Bison parser, made by GNU Bison 2.4.1.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.
   
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


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     VARIABLE_DECLARATION = 258,
     IF_START = 259,
     WHILE_START = 260,
     THEN = 261,
     ELSE = 262,
     DOT = 263,
     COMMA = 264,
     COLON = 265,
     SPACE = 266,
     TAB = 267,
     PRINT = 268,
     ENDLINE = 269,
     EQUALS = 270,
     PLUS = 271,
     MINUS = 272,
     MUL = 273,
     DIV = 274,
     MOD = 275,
     EQUAL = 276,
     NOT_EQUAL = 277,
     GREATER = 278,
     LESS = 279,
     GREATER_OR_EQUAL = 280,
     LESS_OR_EQUAL = 281,
     INT_VALUE = 282,
     FLOAT_VALUE = 283,
     STRING_VALUE = 284,
     VARIABLE_NAME = 285
   };
#endif
/* Tokens.  */
#define VARIABLE_DECLARATION 258
#define IF_START 259
#define WHILE_START 260
#define THEN 261
#define ELSE 262
#define DOT 263
#define COMMA 264
#define COLON 265
#define SPACE 266
#define TAB 267
#define PRINT 268
#define ENDLINE 269
#define EQUALS 270
#define PLUS 271
#define MINUS 272
#define MUL 273
#define DIV 274
#define MOD 275
#define EQUAL 276
#define NOT_EQUAL 277
#define GREATER 278
#define LESS 279
#define GREATER_OR_EQUAL 280
#define LESS_OR_EQUAL 281
#define INT_VALUE 282
#define FLOAT_VALUE 283
#define STRING_VALUE 284
#define VARIABLE_NAME 285




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 8 "parser.y"
int intVal; float floatVal;char* strVal;char* varName;


/* Line 1676 of yacc.c  */
#line 116 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


