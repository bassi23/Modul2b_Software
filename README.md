# Modul2b_Software

## Neuigkeiten

### 02.07. <br>
Station 1 fertiggestellt <br>

Station 2 fertiggestellt


______


### 01.07. <br>
Die Software wurde nach einiger Zeit sehr langsam, weil immer mehr Messwerte gezeichnet werden mussten. Der Graph hat eine Auflösung von 930 Pixel in der Breite. Wenn nun also mehr als 930 Messwerte aufgenommen wurden, macht es keinen Sinn alle zu zeichnen.<br>
Deswegen wird ab sofort, nach Überschreiten der 930 Messwerte, nur noch die Projektion aller Messwerte auf 930 Werte gezeichnet. Dadurch bleibt die Framerate konstant über 50 FPS.

<br> <b>Beispiel</b><br>
Ich habe die Messwerte [1,2,3,4,5,6,7,8,9,10], möchte aber nur 5 zeichnen. Dann verkleinert das Programm nun das Array auf ein Array der Größe 5, indem es das ursprüngliche Array in 5 Teile aufteilt, und nur diese zeichnet:<br>

[1,2,3,4,5,6,7,8,9,10] --> [1.5, 3.5, 5.5, 7.5, 9.5] <br>

Das Array der Messwerte vergrößert sich dabei ständig, wobei das neue Array immer die gleiche Größe hat.

## Zum Laufen bringen

Lade die Datei "Arduino_Code" herunter und lade sie auf den Mikrocontroller.



Lade die Datei "Software.pde" und den Ordner "img" <b>mit allen</b> Bildern runter. Erstelle auf deinem PC einen neuen Ordner mit Namen "Software" und verschiebe die Datei und den img Ordner hinein.
Öffne die .pde Datei mit Processing und klicke auf "play". Eventuell musst du den COM Port Platz in der Datei wechseln. Momentan wird der 1. COM Port genommen [0].




Das Programm sieht momentan so aus:
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Bild1.png)


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
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Feinstaub_1.png)
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Feinstaub_3.png)
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Feinstaub_4.png)

## Mensch vs. Sensor
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/MenschVsSensor_1.png)
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/MenschVsSensor_2.png)
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/MenschVsSensor_3.png)

# Sensoren

Es gibt 3 Buttons, die zu den jeweiligen Sensordaten führen:<br>

![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Bild2.png)


## Sensordaten anzeigen
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Bild3.png)
<br>
Oben in der Mitte kann man auswählen welche Sensordaten des jeweiligen Sensors angezeigt werden. Es können höchstens zwei gleichzeitig ausgewählt werden, damit das Programm nicht zu unübersichtlich wird.

### Achsen skalieren

Man kann die Achsenskalierung ändern. Die Schritte sind dabei vorgegeben.<br>

![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Bild4.png)

### Aktualisierungsintervall

Der Mikrocontroller sendet die Messwerte ca. alle 0,5 Sekunden an das Programm. Erhöht man das Aktualisierungsintervall, so wird nur der Durchschnitt der Messwerte innerhalb des letzten Aktualisierungsintervall aufgenommen und gespeichert.<br>
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Bild5.png)

Beispiel: Aktualisierungsintervall = 60 Sekunden
Es werden alle Messwerte innerhalb von 60 Sekunden in einen Zwischenspeicher gelegt und nach Ablauf dieser Zeit ein Mittelwert gebildet. Nur dieser Mittelwert wird dann angezeigt.

### Zeitachse skalieren

Man hat die Auswahl zwischen verschiedenen Zeitabschnitten.<br>

![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Bild6.png)


### Reset

Durch klicken des Reset-Buttons werden alle bisherigen Daten gelöscht. Um sicherzugehen, dass man nicht aus Versehen darauf geklickt hat, wird man vorher noch gefragt ob man sicher ist.<br>

![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Bild7.png)

# Daten speichern

Standardmäßig werden nur Daten gespeichert, wenn man auf "zurück" klickt. Man kann aber "autosave" in den Einstellungen aktivieren. Dadurch werden die Messdaten kontinuierlich gespeichert.

Zusätzlich kann man nun auswählen ob überhaupt Daten gespeichert werden sollen, und falls ja, in welchem Format (txt, csv oder beides).



# To Do
[x] Zeitachse anpassen<br>
[x] Performance verbessern - Autosave deaktivieren?<br>
[x] Schönere Auswahl zwischen Messwerten<br>
[] Verbessertes Menü bei den Stationen - Echte Platine als Vorbild?<br>
[x] Station 1<br>
[] Station 2<br>
[] Station 3<br>
[] Station 4<br>
[] Einstellungen<br>
