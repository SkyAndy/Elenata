# DK1LO 22.03.2024
# Ab Kernel >= 6.5.7

export nur mit Basisnummer vom GPIO-Chip + GPIO-Pin

Zuordungen einnfach auslesen aus der Debugdatei:
/sys/kernel/debug/gpio

root@elenata:/home/svxlink# grep GPIO13 /sys/kernel/debug/gpio
---> gpio-525 <--- (GPIO13              |sysfs               ) out lo

export 525 > /sys/class/gpio/export
export 538 > /sys/class/gpio/export

Hier wieder die Nummer des Großbuchstaben GPIOxxx nutzen
PTT-Links
pinctrl set 13 op pd dl
SQL-Links
pinctrl set 26 ip pd

egrep -e "PTT_PIN|SQL_PIN" /usr/local/etc/svxlink/*.conf | sed -e "/#/d"

Quick und nur für Linken Kanal die neue gpio-xxx Nummer verwenden
sed -i 's/GPIO_SQL_PIN.*$/GPIO_SQL_PIN=gpio538/' *.conf
sed -i 's/PTT_PIN.*$/PTT_PIN=gpio525/' *.conf

-=# MERKTABELLE ab XS Version #=-
517 (5) OUT PTT Links
518 (6) IN SQL Links
AUDIO_CHANNEL=0

525 (13) OUT PTT Rechts
538 (26) IN SQL Rechts
AUDIO_CHANNEL=1


