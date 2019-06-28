# Modul2b_Software
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
folgt...
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
[] Schönere Auswahl zwischen Messwerten<br>
[] Verbessertes Menü bei den Stationen - Echte Platine als Vorbild?<br>
[] Station 1<br>
[] Station 2<br>
[] Station 3<br>
[] Station 4<br>
[] Einstellungen<br>
