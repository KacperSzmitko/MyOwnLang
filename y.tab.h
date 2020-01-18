
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
     OPEN_FILE = 262,
     READ_FILE = 263,
     WRITE_FILE = 264,
     CLOSE_FILE = 265,
     DOT = 266,
     COMMA = 267,
     COLON = 268,
     SPACE = 269,
     TAB = 270,
     PRINT = 271,
     ENDLINE = 272,
     EQUALS = 273,
     PLUS = 274,
     MINUS = 275,
     MUL = 276,
     DIV = 277,
     MOD = 278,
     EQUAL = 279,
     NOT_EQUAL = 280,
     GREATER = 281,
     LESS = 282,
     GREATER_OR_EQUAL = 283,
     LESS_OR_EQUAL = 284,
     INT_VALUE = 285,
     FLOAT_VALUE = 286,
     STRING_VALUE = 287,
     VARIABLE_NAME = 288
   };
#endif
/* Tokens.  */
#define VARIABLE_DECLARATION 258
#define IF_START 259
#define WHILE_START 260
#define THEN 261
#define OPEN_FILE 262
#define READ_FILE 263
#define WRITE_FILE 264
#define CLOSE_FILE 265
#define DOT 266
#define COMMA 267
#define COLON 268
#define SPACE 269
#define TAB 270
#define PRINT 271
#define ENDLINE 272
#define EQUALS 273
#define PLUS 274
#define MINUS 275
#define MUL 276
#define DIV 277
#define MOD 278
#define EQUAL 279
#define NOT_EQUAL 280
#define GREATER 281
#define LESS 282
#define GREATER_OR_EQUAL 283
#define LESS_OR_EQUAL 284
#define INT_VALUE 285
#define FLOAT_VALUE 286
#define STRING_VALUE 287
#define VARIABLE_NAME 288




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 1676 of yacc.c  */
#line 8 "parser.y"
int intVal; float floatVal;char* strVal;char* varName;


/* Line 1676 of yacc.c  */
#line 122 "y.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;


