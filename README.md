# Modul2b_Software

## Update


## 15.11.2019

- Aufgabenboxen an die Broschüre angepasst
- Station 2 teilweise angepasst
- Station 3 angepasst

![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/Aufgabenbox.png) <br>

Prinzipiell sind alle Stationen schon durchführbar.

## 11.10.2019

- Icon hinzugefügt
- "freie Auflösung" hinzugefügt <br>
Wenn als Auflösung in den Einstellung als "frei" eingestellt ist, kann sie beliebig angepasst werden. Verändere die Größe des Fensters und drücke dann irgendeine Taste auf dem Keyboard (z.B. Enter oder Leertaste). Dadurch wird die Größe des Fensters und aller Elemente darin auf die neue Größe angepasst.
- Baselinesetzung (beachte neuen Arduino Code)
- kleinere Anpassungen Station 2 - Mensch vs. Sensor
- Autosave Optionen angepasst
- Auswertung TVOC-Duelle angepasst

![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/TVOC-Duelle_Design2.png) <br>


## 10.10. 2019

- Damit der PC keine Probleme hat riesige Datenmengen zu speichern, werden die Daten ab sofort in Datenpakete aufgeteilt und in eigene Ordner gespeichert. Jeden Tag wird nun ein neuer Ordner angelegt, in dem nur die Daten des jeweiligen Tages gespeichert werden.

## 09.10.2019

- eCO2 ist rausgeflogen
- falsche Zwischenschritte in der Achsenskalierung von CO2 sind korrigiert
- "Verbinden" und "Fehler anzeigen" in den Einstellungen ist entfernt
- Wenn man im Stationsmenü auf "Einstellungen" klickt, kommt man auch zu den Einstellungen

### To Do
- Variablere Zwischenschritte in der Achsenskalierung einfügen
- Messwertgrafik schmaler machen

## 16.09.2019
- Allgemein: kleinere Verbesserungen (Fehlerbalken in Station 4, Kurzbeschreibung der Stationen, fette Schrift, ...)<br>
- Daten werden automatisch gespeichert, sobald man das Programm beendet (auf das "X" oben rechts klickt)<br>
<br>
Ich würde behaupten, dass das Programm zu 90% fertig ist. Die Platzhalter der TVOC Duelle müssen noch ersetzt werden, und der Ausschlag bei der Sensormessung justiert werden. Anschließend noch eine Integration der Daten einer chemischen Analyse.


### Bekannte Fehler
- Messintervall im Tutorial (schwierig einzustellen, da die Tutorial Daten zufällig beim Start des Programms initialisiert werden)
- Manchmal stimmt die Einstellung der Achsenskalierung nicht mit den vorgegebenen Werten überein --> Detail
- Station 1: Manchmal erscheint nach Ablauf der Zeit kein Button zur nächsten Aufgabe. In den Einstellungen können aber alle Aufgaben  dieser Station freigegeben werden, falls das der Fall ist.

## 13.09.2019
- Allgemein: Das alte Sensormenü (Auswahl zwischen verschiedenen Sensoren) ist rausgeflogen und wurde durch zwei andere Menüpunkte ersetzt. Ich persönlich habe sowieso immer "alle Sensoren" benutzt. Jetzt hat man die Auswahl zwischen "Messwerte gegen Zeit" oder "Messwerte gegen Messwerte" auftragen zu lassen. <br>
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/Sensormenue.png) <br>
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/MesswertMesswert.png) <br>
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/MesswertMesswert2.png) <br>
<br>
- Station 2: Ordnen der Proben funktioniert nur bei normaler Auflösung <br>


## 12.09.2019
- Performance-Verbesserung. Das Programm geht in den "Sleep-Modus" (5 Frames pro Sekunde) sobald 3 Sekunden weder die Maus innerhalb des Programmfensters bewegt, noch eine Maustaste geklickt wird. Ansonsten wird das Programm auf 20 FPS gedrosselt.
- 10-teiliges Tutorial zur Bedienung der Software integriert (Seite 9 muss noch etwas überarbeitet werden)
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/Tutorial.png) <br>
## 11.09.2019
- Allgemein: Problem mit Fehlerbalken behoben
- Fehler werden von nun an auch beim aktuellen Wert angezeigt
- Integration von Checkboxen, um nicht immer in die Optionen gehen zu müssen, um einzustellen ob Fehlerbalken gezeichnet werden sollen oder die Messwerte verbunden werden sollen
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/Fehlerbalken.png) <br>

Die Fehler basieren auf den Datenblättern der Sensoren:

<b>SCD</b> <br>
CO2: 30 +/- 3%<br>
Luftfeuchte: +/- 2% Relative Feuchte (= absoluter Messwert)<br>
Temperatur: +/- 0,5 °C<br>
<br>
<b>SGP</b><br>
TVOC: +/- 15% <br>
eCO2: +/- 10% <br>
<br>
<b>SGP</b><br>
alle PM: 10 (wenn < 100 µg/m³), 10% darüber<br>
## 10.09.2019
- Allgemein: Optionen erweitert --> Fehlerbalken, Messwerte verbinden und die Möglichkeit alle Stationen frei zu geben, falls es ein Problem  gibt (insbesondere wenn der weiter Button bei Station 4 nicht erscheint. Ich habe nämlich keine Ahnung warum er das manchmal nicht tut.)
- Station 4: Noch einmal eine Messung mit neuen Sensoren durchgeführt. Hier die Ergebnisse

![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/Station4_Temperatur.png) <br>
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/Station4_CO2.png) <br>
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/Station4_TVOC.png) <br>
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/CO2_TVOC.png) <br>
Im Programm selbst sah es so aus:

![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/Zusammenfassung_TVOC.png) <br>
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/Zusammenfassung_CO2.png) <br>
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/ohne_Lüfter.png) <br>
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/50_Lüfter.png) <br>
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/100_Lüfter.png) <br>

## 28.08.2019
- Station 4: Integration eines Analysetools der Daten. Sobald man einen Wert gegen die Zeit aufträgt kann man ab sofort einzelne Bereiche genauer analysieren, indem Merkmale, wie Maximum, Minimum, Mittelwert und Steigung in einem Intervall berechnet werden. Zur Berechnung der Steigung wird eine Regressionsgerade gebildet.
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/Analyse_Station4.png) <br>

## 27.08.2019
- Station 4: Auswertung hinzugefügt. Man kann jetzt auch Messgrößen gegeneinander auftragen, um beispielsweise einen Zusammenhang zwischen CO2 und TVOC sichtbar zu machen.
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/Station4.png) <br>

- Station 2: Proben rasten ein, sobald man die Reihenfolge festgelegt hat.


## 26.08.2019
- Station 4: Design an die aktuelle Version angepasst

## 21.08.2019
- Station 1: Messungen sollten nun alle funktionieren
- Station 1: kleine Designänderungen
- Station 1: PM1 und PM4 rausgeschmissen



## 14.08.2019

- Allgemein: Dropdown Menü durch eigene Bibliothek ersetzt (noch unvollständig)
- Einstellungen: Auflösung einstellbar --> Auswahl zwischen - Niedrig (800 x 450 Pixel) - Mittel (1024 x 600 Pixel) - Standard (1280 x 720 Pixel) - Hoch (1440 x 810 Pixel)

### 13.08.2019
- Allgemein: Code kommentieren
- Anpassung der Optik von Station 4 an Station 1

### 09.08.2019
- Station 1: Design von Referenzmessung überarbeitet und für alle Szenarien übernommen
- Station 1: Aufgabenstellung nach Abschluss der 3 Messungen hinzugefügt
- Station 1: Auswertung hinzugefügt:
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/station1_neu3.png) <br>
### 06.08.2019
- Dropdown Menü für die Auswahl der Sensordaten integriert
- "Sensoren" --> "Alle Sensoren" als neuer Menüpunkt zur Ansicht aller Sensoredaten in einem Diagramm
- Station 1, Unterpunkt Referenzmessung: Drowpdown Menü integriert und Hintergrund des Graphen an die Aufgabenstellung angepasst
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/station1_neu2.png) <br>

### 05.08.2019
Alles was ich am 02.08. gemacht habe wurde nicht gespeichert, weil ich zu blöd bin um "FastHub" zu verwenden.
- Fehler behoben, der bei der Zeichnung der Messwerte aufgetreten ist, wenn man das Aktualisierungsintervall ändert
- Im Graphen wird die Verbindung der ersten beiden Messwerte nun interpoliert, sodass keine Lücke entsteht
- Im Graphen gibt es keine Lücken nach oben mehr

### 02.08.2019
Ab sofort werde ich (falls es etwas Neues gibt) nur noch einmal pro Tag die neuste Version hochladen. 
- Das Problem der unsichtbaren Buttons sollte gelöst sein. Man kann also nur noch die Buttons anklicken, die man wirklich sieht, und gelangt so nicht ungewollt auf andere Seiten im Programm.
- Station 4: Messwerte werden nicht mehr außerhalb des Graphen gezeichnet [x]
- Station 4: Zeit auf 5 Minuten angehoben (statt wie bisher 30 Sekunden zum Debuggen)
- Station 4: Aufgabenstellung reicht nicht mehr über die Seite hinaus. [x]
- Station 4: Zwischenlinien für die y-Achse hinzugefügt 
- Station 2: Gepunktete Linien überschreiten die Höhe des Graphen nicht mehr [x]
- Station 2: Zwischenlinien für die Zeit hinzugefügt [x]
- Station 3: Neue Geruchskala integriert [x]
- Allgemein: Die Indizes von CO_2 und eCO_2 sind jetzt endlich überall tiefergestellt [x]



______________________

- Linien der Graphen überschreiten die Begrenzung nicht mehr
- Station 2 - neue gestrichelte Linie, die den Durchschnitt anzeigt wurde hinzugefügt
- Arduino Code aktualisiert
- Man kann den Mikrocontroller nun einaml vom PC abziehen und wieder dranhängen, ohne, dass das Programm abstürzt. Die Datenaufnahme geht nach einer kurzen Wartezeit (2-5 Sekunden) normal weiter.

## Neue Geruchsskala

Bisher haben wir die Skala von 0 - 10 für die Einschätzung der TVOC-Emission benutzt. Ein Kollege von mir arbeitet hauptsächlich an Geruchsmessung mit Sensoren, und er hat mir eine Skala von 0 - 6 empfohlen, da diese üblicherweise verwendet wird. Die Skala kommt aus der VDI 3882 Blatt 1: Olfaktometrie Bestimmung der Geruchsintensität, Okt 1992

![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/Readme/Geruch_Skala.jpg) <br>


## bekannte Fehler
- Seit dem drosseln auf 930 Werte geht die Anzeige unter dem Graphen nicht weiter als "Zeit in Minuten", auch wenn die Skala bereits bei Stunden ist --> behoben
- hier und da sind Buttons noch "unsichtbar aktiv". Das heißt, man klickt irgendwo hin, wo auf anderer Seite ein Button ist, und klickt ihn dadurch
- Zeitskalierung: Wenn man beispielsweise 72 Stunden eingibt, bisher aber nur 1 Stunde an Daten aufgenommen wurde, so sollten die Werte im Graph auch nur 1/72 der Breite ausmachen --> behoben
- diverse "Schönheitsfehler", wie z.B. zu viele Nachkommastellen, Überlappungen, Text außerhalb des Bildschirms, keine Zwischenlinien...

## Neuigkeiten

### Zeitplan <br>

08.07: Einstellungen + Behebung bekannter Fehler<br>
09.07: Automatisches Speichern der Daten der Stationen<br>
10.07: Feedback einarbeiten <br>
ab 11.07: 2 Wochen Urlaub<br>


## 08.07. <br>
Einstellungen: <br>
- Angeschlossene COM-Ports werden angezeigt, und man kann auswählen von welchem man Daten empfängt
- Man muss das Programm nicht mehr neu starten, wenn man den Mikrontroller abschließt, sondern man kann ihn erneut verbinden
## 05.07. <br>
Station 2 - Mensch vs. Sensor <br>
- Zwischenlinien im Graphen ergänzt
- Reset Button eingefügt
- Graph ist jetzt skalierbar
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/img/MenschSensorNeu2.png) <br>
- Beim Vergleich war die Reihenfolge des Sensors verkehrt herum --> gefixt

<br>

Station 4 sieht so aus (Rechtschreibfehler wird noch korrigiert):
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/img/innenraum.png) <br>
Aufgabe: Setze dich 3 Mal 5 Minuten in den Kasten und miss Temperatur, Luftfeuchtigkeit, TVOC, CO2 und eCO2. Einmal mit Lüfter aus, einmal mit Lüfter auf 50% und einmal mit Lüfter auf 100%. <br>

Die Daten werden auch in einem Extra Ordner ("Messdaten/Innenraum") gespeichert, sofern speichern aktiviert ist. <br>

Was hier noch zu tun ist:
- Auswertungsseite am Ende, auf der man alle Verläufe miteinander vergleichen kann.
- Zwischenlinien
- Bessere Farbauswahl (momentan ist die aktuelle Messung fett, die anderen nicht fett --> kein guter Kontrast)

### 04.07. <br>
Ich habe heute doch nicht an der Software weitergearbeitet. Dafür habe ich das Experiment aufgebaut und selbst durchgeführt. Wir sollten es so machen: <br>
Ich habe in die Messkammer einen 12x12cm² großen Ventilator eingebaut, dessen Umdrehungsgeschwindigkeit ich mittels Netzteil steuern konnte. In der Messkammer habe ich die Sensoren an der Wand auf Sitzhöhe des Kopfes (1 - 1,20m) befestigt. Ich selbst habe auf einem Hocker in der Messkammer Platz genommen.<br>
Für den Versuch habe ich 3 Mal jeweils 10 Minuten in der Messkammer verbracht. Das erste Mal mit ausgeschaltetem Ventilator, das zweite Mal lief der Ventilator auf halber Kraft (6V statt 12V), und beim dritten Mal war er voll aufgedreht. Die Umdrehungsgeschwindigkeiten und den Volumenstrom muss ich noch im Datenblatt nachsehen (falls ich es finde). --> Volumenstrom bei 13,8V: 1,87m³/minute und 1500 Umdrehungen/minute<br>

Hier sind die Messkurven:<br>

![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/img/Temperatur.png)
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/img/Luftfeuchte.png)
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/img/TVOC.png)
![alt text](https://raw.githubusercontent.com/bassi23/Modul2b_Software/master/img/co2.png) <br>

Nach Ablauf der jeweiligen 10 Minuten bin ich aus der Kammer gegangen und habe sie durchgelüftet, indem ich die Tür geöffnet habe, und selbst nicht darin saß. Ich habe so lange gewartet, bis der TVOC Wert wieder um 20 ppb war. Diese Bereiche sind rosa markiert. Die originalen Messwerte habe ich oben hochgeladen. Zwischendrin waren wenige Ausreißer drin, weil sich das Sensorboard 2 Mal von der Wand gelöst hatte.
_____ 
### 03.07. <br>

Station 3 - TVOC-Duelle <br>
Hier müssen noch Bilder der echten Proben eingefügt werden. Auch muss noch angepasst werden welcher TVOC Wert als viel und welcher als wenig gilt. Wir geben hier nicht die genauen ppb Werte an, sondern nur einen Index zwischen 0 (wenig) und 10 (viel).

<br>

Station 2 - Mensch vs Sensor <br>
Die Anzeige wurde überarbeitet. Man sieht nun den Verlauf der letzten 60 Sekunden. Ich habe es auch mit unterschiedlich stark verdünnten Ethanol-Lösungen getestet:
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/MenschSensorNeu.png)

Verwendet habe ich: <br>
1:10<br>
1:100<br>
1:1000<br>
1:10000<br>
1:100000<br>

die 1:10 Lösung war zu viel für den Sensor, und er hat gar nichts mehr angezeigt. 1:100 ist das Maximum. <br>

Die Schönheitsdinge mache ich morgen.
______
### 02.07. <br>
Station 1  - Feinstaubmessung fertiggestellt <br>

Station 2 - Mensch vs. Sensor fertiggestellt


______


### 01.07. <br>
Die Software wurde nach einiger Zeit sehr langsam, weil immer mehr Messwerte gezeichnet werden mussten. Der Graph hat eine Auflösung von 930 Pixel in der Breite. Wenn nun also mehr als 930 Messwerte aufgenommen wurden, macht es keinen Sinn alle zu zeichnen.<br>
Deswegen wird ab sofort, nach Überschreiten der 930 Messwerte, nur noch die Projektion aller Messwerte auf 930 Werte gezeichnet. Dadurch bleibt die Framerate konstant über 50 FPS.

<br> <b>Beispiel</b><br>
Ich habe die Messwerte [1,2,3,4,5,6,7,8,9,10], möchte aber nur 5 zeichnen. Dann verkleinert das Programm nun das Array auf ein Array der Größe 5, indem es das ursprüngliche Array in 5 Teile aufteilt, und nur diese zeichnet:<br>

[1,2,3,4,5,6,7,8,9,10] --> [1.5, 3.5, 5.5, 7.5, 9.5] <br>

Das Array der Messwerte vergrößert sich dabei ständig, wobei das neue Array immer die gleiche Größe hat.
____
## Probleme
a) <br>
Feinstaubemission von Tafelschwamm. Wenn man den Schwamm einfach neben den Sensor legt, misst man so gut wie nichts. Drückt man jedoch auf den Schwamm, so löst sich der Feinstaub und man erhält einen Ausschlag. Das heißt der geplante Versuchsaufbau (Tafel wischen und Schwamm neben den Sensor legen) funktioniert nicht. <br>

### Lösungsmöglichkeiten
a) <br>
1. Den Schülern sagen, sie sollen den Schwamm periodisch zusammendrücken (blöde Lösung)<br>
2. Ventilator in der Messkammer installieren. Tafel wischen lassen, und über einem Teller (o.Ä.) mehrmals zusammendrücken. Dadurch wird der Tafelstaub aufgefangen. Den Teller kann man anschließend in die Messkammer stellen.

_____
## Zum Laufen bringen

Lade die Datei "Arduino_Code" herunter und lade sie auf den Mikrocontroller.



Lade die Datei "Software.pde" und den Ordner "img" <b>mit allen</b> Bildern runter. Erstelle auf deinem PC einen neuen Ordner mit Namen "Software" und verschiebe die Datei und den img Ordner hinein.
Öffne die .pde Datei mit Processing und klicke auf "play". Eventuell musst du den COM Port Platz in der Datei wechseln. Momentan wird der 1. COM Port genommen [0].




Das Programm sieht momentan so aus:
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/Bild1.png)


# Obermenü

Man hat die Auswahl zwischen "Stationen" und "Sensoren".


<b>Stationen</b><br>
Hier hat man die Auswahl zwischen den einzelnen Stationen. Das Layout ist an die Aufgaben angepasst. 
<br>
<b>Sensoren</b><br>
Hier hat man die Auswahl zwischen den einzelnen Sensoren. 
<br>

# Stationen
## Feinstaubmessung
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/Feinstaub_1.png)
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/Feinstaub_3.png)
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/Feinstaub_4.png)

## Mensch vs. Sensor
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/MenschVsSensor_1.png)
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/MenschSensorNeu.png)
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/MenschVsSensor_3.png)

## TVOC-Duelle
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/TVOC_Duelle1.png)
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/TVOC_Duelle2.png)
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/TVOC_Duelle3.png)

# Sensoren

Es gibt 3 Buttons, die zu den jeweiligen Sensordaten führen:<br>

![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/Bild2.png)


## Sensordaten anzeigen
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/Bild3.png)
<br>
Oben in der Mitte kann man auswählen welche Sensordaten des jeweiligen Sensors angezeigt werden. Es können höchstens zwei gleichzeitig ausgewählt werden, damit das Programm nicht zu unübersichtlich wird.

### Achsen skalieren

Man kann die Achsenskalierung ändern. Die Schritte sind dabei vorgegeben.<br>

![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/Bild4.png)

### Aktualisierungsintervall

Der Mikrocontroller sendet die Messwerte ca. alle 0,5 Sekunden an das Programm. Erhöht man das Aktualisierungsintervall, so wird nur der Durchschnitt der Messwerte innerhalb des letzten Aktualisierungsintervall aufgenommen und gespeichert.<br>
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/Bild5.png)

Beispiel: Aktualisierungsintervall = 60 Sekunden
Es werden alle Messwerte innerhalb von 60 Sekunden in einen Zwischenspeicher gelegt und nach Ablauf dieser Zeit ein Mittelwert gebildet. Nur dieser Mittelwert wird dann angezeigt.

### Zeitachse skalieren

Man hat die Auswahl zwischen verschiedenen Zeitabschnitten.<br>

![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/Bild6.png)


### Reset

Durch klicken des Reset-Buttons werden alle bisherigen Daten gelöscht. Um sicherzugehen, dass man nicht aus Versehen darauf geklickt hat, wird man vorher noch gefragt ob man sicher ist.<br>

![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/Bild7.png)

# Daten speichern

Standardmäßig werden nur Daten gespeichert, wenn man auf "zurück" klickt. Man kann aber "autosave" in den Einstellungen aktivieren. Dadurch werden die Messdaten kontinuierlich gespeichert.

Zusätzlich kann man nun auswählen ob überhaupt Daten gespeichert werden sollen, und falls ja, in welchem Format (txt, csv oder beides).



# To Do
[x] Zeitachse anpassen<br>
[x] Performance verbessern - Autosave deaktivieren?<br>
[x] Schönere Auswahl zwischen Messwerten<br>
[] Verbessertes Menü bei den Stationen - Echte Platine als Vorbild?<br>
[x] Station 1<br>
[x] Station 2<br>
[x] Station 3<br>
[] Station 4<br>
[] Einstellungen<br>
