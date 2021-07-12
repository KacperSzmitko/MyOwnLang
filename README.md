# Creators
Kacper Szmitko, Marcin Tajsner 

# Goal
The goal of the project was to create an interpreter for a simple programming language, which could be used in early childhood education to simultaneously teach the basics of programming, punctuation and spelling.

The keywords of such programming language would be written in Polish, respecting the rules of style and punctuation, as opposed to most other programming languages, where style is not important (e.g. no attention is paid to the number of spaces).

Examples of stylistic differences compared to the C language:
- Floating point numbers are written with a comma instead of a period
- Each instruction tries to be a grammatically correct sentence, starting with a capital letter and ending with a period
- No brackets at all, tabs are used as curly brackets (like in Python)

# Method description
The language interpreter has been written in C using Flex and Bison programs. Flex is responsible for lexical analysis and Bison for syntactic analysis. Flex divides the received instructions into sequences of tokens, and Bison detects the grammatical structure of the tokens and calls the appropriate functions.
Example for an instruction: Utwórz zmienną a = 2.

Tokens:
- VARIABLE_DECLARATION (regex: "Utwórz zmienną")
- VARIABLE_NAME (regex: "[a-zA-Z][_a-zA-Z0-9]*")
- EQUALS (regex: '=')
- INT_VALUE (regex: '[¯]?[0-9]+')
- DOT (regex: '*')
- ENDLINE (regex: "■")

There is no declaration of variable types in the language itself. What type a variable is is determined by the initial assignment of a value to the variable. If only a number is assigned, the variable will be of type int, if a number with a comma value is assigned, the variable will be of type float, if text (characters in quotes "") is assigned, the variable will be of type string (char*). If a variable is declared without initial assignment, it will be of type int by default.

# Functions available in the language and their examples
Create variables of type integer, natural or text:
- Utwórz zmienną a = 2.
- Utwórz zmienną a = 2,2.
- Utwórz zmienną a = "2".

Perform arithmetic operations (available operations: +, -, *, /, %):
- a = 2 + 2.
- c = b * 4.2 - 7.89.

Displaying text or variable content:
- Wyświetl "TEST".
- Wyświetl a.

Conditional instructions (available operations: ==, <, >, <=, >=, !=):
- Jeżeli a > 2, to: Wyświetl a.

File operations: reading values from file to variable, writing values from variable to file:
- Otwórz plik o nazwie "plik_tekstowy.txt".
- Odczytaj z pliku do zmiennej a.
- Wpisz do pliku b.
- Zamknij plik.
