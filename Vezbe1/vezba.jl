# Zadatak 1. Za proizvoljnu kvadratnu matricu A, izdvojiti sve parne kolone.
A = [1 4 -2 9 6; -1 0 0 3 7; 99 3 -3 4 7; 5 -6 0 -8 3; 1 2 3 4 5]
parne_kolone = A[:,2:2:end]

# Zadatak 2. Za proizvoljnu kvadratnu matricu A, izdvojiti sve elemente koji su deljivi sa 9.
deljivi = A[rem.(A,9) .== 0]

# Zadatak 3. Za proizvoljnu kvadratnu matricu A, izdvojiti elemente koji se nalaze na preseku parnih vrsta i parnih kolona.
vrsta = 2:2:size(A,1)
kolona = 2:2:size(A,2)
presek = A[vrsta,kolona]

# Zadatak 4. 

# Zadatak 5. Napisati funkciju koja za zadatu kvadratnu matricu A, određuje:
# vektor m koji se formira od elemenata sa glavne dijagonale matrice A.
# skalar s koji predstavlja srednju vrednost elemenata iznad glavne dijagonale matrice
# A. (može se koristiti funkcija mean() iz programskog paketa Statistics)
# Zadatak 6. Napisati funkciju koja za zadate kvadratne matrice A i B istih dimenzija određuje:
# vektor m koji se sastoji od elemenata ispod glavne dijagonale matrice A koji su
# pozitivni celi brojevi deljivi sa 3.
# skalar s koji predstavlja srednju vrednost elemenata sa sporedne dijagonale matrice
# B koji su veći od srednje vrednosti elemenata sa glavne dijagonale matrice A.
# Zadatak 7. Za podatke iz tabele T (Primer 4 - Složeni primeri) napisati kod koji
# određuje:
# koliko je ženskih, a koliko muških osoba (poželjno je prikazati i njihova imena),
# prosečnu visinu i težinu ženskih osoba,
# prosečnu visinu i težinu muških osoba,
# najstariju i najmlađu osobu,
# standardnu devijaciju za visinu.
# Zadatak 8. Napisati funkciju koja određuje poziciju nenultih elemenata proizvoljne matrice. Zadatak rešiti bez korišćenja funkcije findall.
# Zadatak 9. Napisati funkciju, po uzoru na funkciju prod, koja određuje proizvod
# svih elemenata vektora.
# Zadatak 10. Napisati funkciju, po uzoru na funkciju sum, koja određuje sumu elemenata proizvoljne matrice. Implementirati opcioni ili imenovani parametar funkcije na osnovu koga će se računati suma elemenata po vrstama ili po kolonama
# matrice.
