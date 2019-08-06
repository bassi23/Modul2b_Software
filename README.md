# Modul2b_Software

## Update
### 06.08.2019
- Dropdown Menü für die Auswahl der Sensordaten integriert
- "Sensoren" --> "Alle Sensoren" als neuer Menüpunkt zur Ansicht aller Sensoredaten in einem Diagramm


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
