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

<img src="http://www.sciweavers.org/tex2img.php?eq=Obw%20%3D%20%20%5Cfrac%7B%20G_%7B1%7D%20%7D%7B2%7D%20%2B%20%20%5Cfrac%7B%20G_%7B2%7D%20%7D%7B2%7D%20%2A%20%20%5Csqrt%7B2%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt="Obw =  \frac{ G_{1} }{2} +  \frac{ G_{2} }{2} *  \sqrt{2} " width="183" height="43" />
gdzie : </br>
G1 - suma połączeń pikseli z sąsiadami “na wprost”, liczona względem każdego piksela </br>
G2 - suma połączeń pikseli z sąsiadami “na ukos”, liczona względem każdego piksela

<img src="/Example/grid_met_2_1.png" />

# Metoda zewnętrznych boków
W implementacji trzeciej metody zliczamy ilość zewnętrznych boków pikseli konturu (na obrazie przykładowym zaznaczone kolorem niebieskim) oraz ilość wierzchołków konturu 
(zaznaczone kolorem czerwonym). Liczby te po wymnożeniu przez podane współczynniki dają w wyniku poszukiwany obwód.

<img src="http://www.sciweavers.org/tex2img.php?eq=Obw%20%3D%20a%2AK%20-%20b%2AW%20%5C%5C%2A%0Aa%20%3D%20%20%5Cfrac%7B%20%20%5Cpi%20%20%2A%281%2B%20%5Csqrt%7B2%7D%20%29%7D%7B8%7D%20%5C%5C%2A%0Ab%20%3D%20%20%5Cfrac%7B%20%5Cpi%20%7D%7B8%2A%20%5Csqrt%7B2%7D%20%7D%20&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt="Obw = a*K - b*W \\*a =  \frac{  \pi  *(1+ \sqrt{2} )}{8} \\*b =  \frac{ \pi }{8* \sqrt{2} } " width="179" height="112" />

# Metoda czwórek pikseli ("bit quads")
Ostatnia z zaimplementowanych przez nas metod bazowała na analizie pikseli czwórkami(ang. bit quads). Wymaga ona iterowania po całym obrazie i zliczania czwórek pikseli 
należących do odpowiednich grup. Następnie obwód jest wyznaczany jako jako suma ilości wystąpień odpowiednich grup pikseli, które są mnożone przez odpowiednie współczynniki.

<img src="http://www.sciweavers.org/tex2img.php?eq=Obw%20%3D%20%20P_%7B2%7D%20%2B%20%20%5Cfrac%7B1%7D%7B%20%5Csqrt%7B2%7D%20%7D%20%2A%20%28%20P_%7B1%7D%20%2B%20%20P_%7B3%7D%20%2B%20%20P_%7Bd%7D%20%2A%202%29&bc=White&fc=Black&im=jpg&fs=12&ff=arev&edit=0" align="center" border="0" alt="Obw =  P_{2} +  \frac{1}{ \sqrt{2} } * ( P_{1} +  P_{3} +  P_{d} * 2)" width="297" height="44" />
gdzie : </br>
	P1 - liczba wystąpień czwórek, w których suma pikseli wynosi 1 </br>
	P2 - liczba wystąpień czwórek, w których suma pikseli wynosi 2 i nie są one położone na ukos </br>
	P3 - liczba wystąpień czwórek, w których suma pikseli wynosi 3 </br>
	PD - liczba wystąpień czwórek, w których suma pikseli wynosi 2 i są one położone na ukos
