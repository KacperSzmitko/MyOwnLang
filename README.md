# MyOwnLang

Twórcy:
Kacper Szmitko 
Marcin Tajsner 


Celem projektu było stworzenie interpretera prostego języka programowania, który mógłby być używany w edukacji wczesnoszkolnej w celu jednoczesnej nauki podstaw programowania, interpunkcji i ortografii.

Słowa kluczowe takiego języka miały by być pisane po polsku, z zachowaniem zasad stylistyki i interpunkcji, w przeciwieństwie do większości innych języków programowania, gdzie stylistyka nie ma dużego znaczenia (np. nie zwraca się uwagę na ilość spacji).

Przykładowe stylistyczne różnice w porównaniu do języka C:
- Liczby zmiennoprzecinkowe zapisuje się z użyciem przecinka, a nie kropki
- Każda instrukcja stara się być poprawnym gramatycznie zdaniem, zaczynającym się od dużej liter, a kończącym kropką
- Brak jakichkolwiek nawiasów, role nawiasów klamrowych pełnią tabulatory (podobnie jak w Pythonie)

Opis metody
Interpreter języka został napisany w C przy pomocy programów Flex i Bison. Flex odpowiada za analizę leksykalną, a Bison za analizę składniową. Flex dzieli otrzymaną instrukcje na sekwencje tokenów, a Bison wykrywa strukturę gramatyczną tokenów i wywołuje odpowiednie funkcje.
Przykład dla instrukcji: Utwórz zmienną a = 2.
Tokeny:
- VARIABLE_DECLARATION (regex: "Utwórz zmienną")
- VARIABLE_NAME (regex: "[a-zA-Z][_a-zA-Z0-9]*")
- EQUALS (regex: "=")
- INT_VALUE (regex: "[\-]?[0-9]+")
- DOT (regex: "\.")
- ENDLINE (regex: "\n")
