# Cura Error
## blank menu,  issue_6064 
Får du en blanke felter der hvor cura's menuer skulle være så prøv at   
1. lukke Cura
2. Slette  ~/.cache/qtshadercache bibliotekets indhold, med denne kommando:
```bash
rm ~/.cache/qtshadercache/*
```
3. starte cura igen, og det vil virke.
### Vil du se mere om problemet så følg denne link: 
* https://github.com/Ultimaker/Cura/issues/6064  
  * https://github.com/Ultimaker/Cura/issues/6064#issuecomment-544883756