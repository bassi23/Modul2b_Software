# Modul2b_Software
## Zum Laufen bringen

Lade die Datei "Arduino_Code" herunter und lade sie auf den Mikrocontroller.

Lade die Datei "Software.pde" und den Ordner "img" mit allen Bildern runter. Erstelle auf deinem PC einen neuen Ordner mit Namen "Software" und verschiebe die Datei und den img Ordner hinein.
Öffne die .pde Datei mit Processing und klicke auf "play". Eventuell musst du den COM Port Platz in der Datei wechseln. Momentan wird der 1. COM Port genommen [0].




Das Programm sieht momentan so aus:
![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Bild1.png)


# Hauptmenü

Wenn man mit der Maus über das Bild geht, erscheint die Verkabelung. Oben rechts ist ein Kreis.

grün: richtig verkabelt (dauert ein 1-2 Sekunden zum Aktualisieren)
rot: nicht richtig.

Wie funktioniert das? 

Das Programm bekommt ständig Daten über den COM Port. Es werden die letzten 3 Messwerte verglichen. Stimmen diese alle überein, so werden sie anscheinend nicht mehr aktualisiert, da 3 Mal der exakt gleiche Messwert so gut wie unmöglich ist.
Ist der Sensor falsch angeschlossen wird der Messwert, den das Programm erhält nicht mehr aktualisiert.

![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Bild4.png)


# Stationen

Man kann die einzelnen Stationen auswählen. In den Stationen kann man oben auswählen welche Messwerte angezeigt werden sollen (höchstens 2 gleichzeitig). 

![alt text](https://github.com/bassi23/Modul2b_Software/blob/master/Bild2.png)

# Bereits integriert

 - Erkennen ob der Sensor richtig angeschlossen ist
 - richtige Verkabelung
 - y-Achsenskalierung
 - Zeitachsenskalierung (grob)
 - Reset Button
 
 
 - Station 1
 - Station 4
 
# to do

 - Einstellungen hinzufügen
 - Station 2 + 3
 - Daten speichern
 - Zeitskala (Wechsel zwischen Sekunden/Minuten/Stunden unten rechts)
 
