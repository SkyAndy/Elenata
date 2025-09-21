#!/bin/bash
# Script: fix-raspbian-keys.sh
# Zweck: Fehlende Raspbian-Keys automatisch importieren und apt update testen
# DK1LO 21.Sep.2025

set -e
# Verzeichnis für APT-Keyring
KEYRING_DIR="/etc/apt/trusted.gpg.d"
KEY_FILE="$KEYRING_DIR/raspbian-archive.gpg"
echo "1️⃣ Alte Key-Datei entfernen (falls vorhanden)..."
sudo rm -f "$KEY_FILE"
echo "2️⃣ Offiziellen Raspbian Key herunterladen und dearmorn..."
curl -fsSL https://archive.raspbian.org/raspbian.public.key | gpg --dearmor | sudo tee "$KEY_FILE" > /dev/null
echo "3️⃣ Prüfen, ob Key importiert wurde..."
gpg --no-default-keyring --keyring "$KEY_FILE" --list-keys
echo "4️⃣ apt Update testen..."
sudo apt update
echo "✅ Fertig! Raspbian Keys sind korrigiert."
