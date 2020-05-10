# MyOwnLang

Twórcy:
Kacper Szmitko, Marcin Tajsner 


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


W samym języku nie ma deklaracji typów zmiennych. O tym jakiego typu jest zmienna decyduje początkowe przypisanie wartości do zmiennej. Jeśli przypisana jest tylko liczba, to zmienna będzie typem int, jeśli przypisana zostanie liczba z wartością po przecinku, zmienna będzie typem float, jeśli przypisany zostanie tekst (znaki w cudzysłowie ""), zmienna będzie typem string (char*). Jeśli zmienna zostanie zadeklarowana bez początkowego przypisania, to będzie domyślnie typem int.
Funkcję dostępne w języku i ich przykłady
- Tworzenie zmiennych typu całkowitego, naturalnego lub tekstowego
- Utwórz zmienną a = 2.
- Utwórz zmienną a = 2,2.
- Utwórz zmienną a = "2".
- Wykonywanie operacji arytmetycznych (dostępne operacje: +, -, *, /, %)
- a = 2 + 2.
- c = b * 4,2 – 7,89.
- Wyświetlanie tekstu lub zawartości zmiennej
- Wyświetl "TEST".
- Wyświetl a.
- Instrukcje warunkowe (dostępne operacje: ==, <, >, <=, >=, !=)
- Jeżeli a > 2, to: Wyświetl a.
- Operacje na plikach: odczytywanie wartości z pliku do zmiennej, zapisywanie wartości z zmiennej do pliku
- Otwórz plik o nazwie "plik_tekstowy.txt".
- Odczytaj z pliku do zmiennej a.
- Wpisz do pliku b.
- Zamknij plik.
