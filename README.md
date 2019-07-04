# Modul2b_Software

## Neuigkeiten

### Zeitplan <br>

05.07: Station 4 <br>
08.07: Einstellungen <br>
### 04.07. <br>
Ich habe heute doch nicht an der Software weitergearbeitet. Dafür habe ich das Experiment aufgebaut und selbst durchgeführt. Wir sollten es so machen: <br>
Ich habe in die Messkammer einen 12x12cm² großen Ventilator eingebaut, dessen Umdrehungsgeschwindigkeit ich mittels Netzteil steuern konnte. In der Messkammer habe ich die Sensoren an der Wand auf Sitzhöhe des Kopfes (1 - 1,20m) befestigt. Ich selbst habe auf einem Hocker in der Messkammer Platz genommen.<br>
Für den Versuch habe ich 3 Mal jeweils 10 Minuten in der Messkammer verbracht. Das erste Mal mit ausgeschaltetem Ventilator, das zweite Mal lief der Ventilator auf halber Kraft (6V statt 12V), und beim dritten Mal war er voll aufgedreht. Die Umdrehungsgeschwindigkeiten und den Volumenstrom muss ich noch im Datenblatt nachsehen (falls ich es finde). <br>

Hier sind die Messkurven:<br>

![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/Temperatur Begehbare Kammer.png)
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/Luftfeuchte.png)
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Readme/TVOC.png)
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
