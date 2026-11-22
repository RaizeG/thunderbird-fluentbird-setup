# Thunderbird FluentBird Setup

Persönliches Windows-11-Setup für **Mozilla Thunderbird** auf Basis von [FluentBird](https://github.com/Deathbyteacup/fluentbird) – inklusive eigener Anpassungen und 1-Klick-Installer.

## Was ist enthalten?
- **`chrome/`**: FluentBird-Theme (`userChrome.css`, Fluent-Icons, Titlebar-Icons) + angepasste `custom.css` (entfernt die hellen Rahmen um die E-Mail-Karten im Dark Mode).
- **`user.js`**: Aktiviert automatisch `userChrome.css`, Windows-11-Mica-Transparenz (`widget.windows.mica` / `widget.windows.mica.popups`) und schaltet die Thunderbird-Startseite („Welcome to Freedom“) ab.
- **`install_fluentbird.bat`**: Erkennt automatisch das aktive Thunderbird-Profil und kopiert `chrome/` sowie `user.js` hinein.

## Installation nach dem Neuaufsetzen
1. Thunderbird installieren (z. B. via `winget install --id=Mozilla.Thunderbird -e --silent`).
2. Thunderbird einmal kurz starten (damit ein Profil angelegt wird) und wieder schließen.
3. Dieses Repo herunterladen oder klonen und **`install_fluentbird.bat`** per Doppelklick ausführen.
4. Thunderbird neu starten – fertig! *(Hinweis: In Thunderbird muss das Standard-**System Theme** aktiv sein.)*

## Credits
Basiert auf [Deathbyteacup/fluentbird](https://github.com/Deathbyteacup/fluentbird) (MIT License) und den Fluent Design Icons von Microsoft (MIT License).
