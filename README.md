# Anwendung
Mit diesem Skript kann man einen headless-server erstellen, der dann einen Desktop bereitstellt, den man per rdp ansprechen kann. 

Hat eine Weile gedauert, bis das funktioniert hat. Danach dann aber wenigstens jedesmal. 

Ob es geklappt hat, kann man nur in einem rdp Client sehen. Guacamole ist übrigens auch einer. Oder wenigstens zum Teil. 

*In Guacamole unbedingt darauf achten, dass entsprechende Sicherheitseinstellungen vorgenommen wurden.* 

```
Sicherheitsmodus:	Jede

Serverzertifikat ignorieren: X	
```

Einfach setup.sh als root ausführen.

## VNC

Das Skript `vncsetup.sh` mach im Grunde das gleiche - allerdings wird ein VNC-Server erstellt. Falls man das mal braucht. RDP ist abe die bessere Variante.
