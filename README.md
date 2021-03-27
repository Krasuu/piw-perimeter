# PIW Perimeter

Celem projektu była implementacja algorytmów przeznaczonych do wyznaczania obwodu w obrazach binarnych oraz porównanie metod. 
W projekcie z wykorzystaniem literatury i środowiska programistycznego Matlab zostały zaimplementowane cztery metody służące do obliczania obwodu figur 
oraz aplikacja graficzna pozwalająca w intuicyjny sposób obsługiwać zaimplementowane funkcje.

<div align="center">

<img src="/Example/example.PNG" width="634" height="510">

</div>

# Metoda zliczania pikseli
Jako pierwsza została zaimplementowana metoda polegająca na zliczaniu wszystkich pikseli należących do konturu analizowanego obiektu.

# Metoda kodów łańcuchowych
Druga z wykorzystanych przez nas metod bazuje na zliczaniu połączeń pomiędzy pikselami konturu. W zależności od tego jak dany piksel połączony jest z sąsiednimi pikselami 
(“na wprost” lub “na ukos”), ma on różny wpływ na obwód, który logicznie odpowiada długości linii łączącej środki pikseli.

<img src="/Example/met2.png" />

gdzie : </br>
G1 - suma połączeń pikseli z sąsiadami “na wprost”, liczona względem każdego piksela </br>
G2 - suma połączeń pikseli z sąsiadami “na ukos”, liczona względem każdego piksela

<img src="/Example/grid_met2_1.png" width="320" heigth="360" />

# Metoda zewnętrznych boków
W implementacji trzeciej metody zliczamy ilość zewnętrznych boków pikseli konturu (na obrazie przykładowym zaznaczone kolorem niebieskim) oraz ilość wierzchołków konturu 
(zaznaczone kolorem czerwonym). Liczby te po wymnożeniu przez podane współczynniki dają w wyniku poszukiwany obwód.

<img src="/Example/met3.png" />

# Metoda czwórek pikseli ("bit quads")
Ostatnia z zaimplementowanych przez nas metod bazowała na analizie pikseli czwórkami(ang. bit quads). Wymaga ona iterowania po całym obrazie i zliczania czwórek pikseli 
należących do odpowiednich grup. Następnie obwód jest wyznaczany jako jako suma ilości wystąpień odpowiednich grup pikseli, które są mnożone przez odpowiednie współczynniki.

<img src="/Example/met4.png" />

gdzie : </br>
	P1 - liczba wystąpień czwórek, w których suma pikseli wynosi 1 </br>
	P2 - liczba wystąpień czwórek, w których suma pikseli wynosi 2 i nie są one położone na ukos </br>
	P3 - liczba wystąpień czwórek, w których suma pikseli wynosi 3 </br>
	PD - liczba wystąpień czwórek, w których suma pikseli wynosi 2 i są one położone na ukos
