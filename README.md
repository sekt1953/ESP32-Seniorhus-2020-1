# ESP32-Seniorhus-2020-1 Robot & Microprosessor Kursus
Min ide er at oprette et kursus hvor vi bruger en lille microprossor ESP32 som har både Bluetooth, Wifi og Flash disk indbygget, med den kan vi styre vores udstyr fra en Smartphone eller iPad.  
Jeg vil bruge Platformio, Microsoft’s  Visual Studio Code, sammen med Arduino IDE, når vi kommer i gang skal vi samarbejde med 3D holdet om at lave dele til en robot, bil eller andet som vi kan styre.  
Jeg har lavet ESP32 udviklings kit til dette kursus som eleverne får udleveret ved kursus start, softwaren vi skal bruge er gratis. 
Eleverne skal selv medbringe en Pc til kursuset, undervisningen vil bruge et mødelokale til teori og 1.sal på metal værkstedet til praktiske opgaver.

Kursus starter den 8/1 2020 kl.: 12:30, mødested metalværkstedet  
* Niels Jørgen Jensen vil holde de første møder fra 8/1 til 26/2, hvor i vil begynde at definere den robot I skal bruge.
* Svenn-Erik K. Thomsen vil begynde undervisning i programering den 8/1 2020 kl.: 12:30

## Tilmelding kan ske på ved af udfyllde spørgsmålene i disse link
Robot & Microprosessor Kursus 2020 :
https://docs.google.com/forms/d/e/1FAIpQLSfGfbgsCQq_kk3sPVGyZUx6m9FqPH_HSMDtQ0DwIxAxN89SXg/viewform

## PCB Layout :
![PCB Images](/Fritzing/ESP32_PCB_A_002_b_bb.png)

## ESP 32 Pin Layout :
![ESP32 PinLayout](https://forum.fritzing.org/uploads/default/optimized/2X/a/ae3dc4cc089ce3e73de2d367da5dbf22102bd7c3_2_690x399.jpg)  
[ESP32S-HiLetgo Dev Boad with Pinout Template](https://forum.fritzing.org/t/esp32s-hiletgo-dev-boad-with-pinout-template/5357)

## Matrialer til CPU kort :
| Navn | Link |
| ---- |--- |
| ESP32 | https://www.aliexpress.com/item/32807887667.html?spm=a2g0s.9042311.0.0.21714c4dOmX9y0 |
| Ole Display | https://www.aliexpress.com/item/32780054633.html?spm=a2g0s.9042311.0.0.21714c4dOmX9y0 |
| LED UltraBright | https://www.aliexpress.com/item/32262805477.html?spm=a2g0s.9042311.0.0.21714c4dOmX9y0 |
| 15mm rotary encoder | https://www.aliexpress.com/item/33050894285.html?spm=a2g0s.9042311.0.0.21714c4dOmX9y0 |
| PCB Stripboard | https://www.aliexpress.com/item/32367760106.html?spm=a2g0s.9042311.0.0.21714c4dOmX9y0 |
| Momentary Pushbutton | https://www.aliexpress.com/item/32545141968.html?spm=a2g0s.9042311.0.0.21714c4dOmX9y0 |
| 3296W series 3296W 103 10K ohm Top regulation Multiturn | https://www.aliexpress.com/item/32508075902.html?spm=a2g0s.9042311.0.0.27424c4dPDYsiU |
| Colorful Breakable Pin Header | https://www.aliexpress.com/item/32992080490.html?spm=a2g0s.9042311.0.0.27424c4dPDYsiU |
| 20cm Female to Female | https://www.aliexpress.com/item/32836050778.html?spm=a2g0s.9042311.0.0.27424c4dPDYsiU |
| breakaway Straight female header 40 pins | https://www.aliexpress.com/item/2046245030.html?spm=a2g0s.9042311.0.0.27424c4dcyutn6 |
| SMD 220 Ohm | https://www.aliexpress.com/item/32847115923.html?spm=a2g0o.productlist.0.0.79b47e92Q9RMe2&algo_pvid=513a7157-4b4c-47b4-a368-329f278bac1f&algo_expid=513a7157-4b4c-47b4-a368-329f278bac1f-0&btsid=5dde7322-30b2-443f-abcf-61bfba64a9b9&ws_ab_test=searchweb0_0,searchweb201602_7,searchweb201603_53 |
| Sokkel til Print | https://github.com/sekt1953/ESP32-Seniorhus-2020-1/blob/master/FreeCad/Printholder-001.stl |

# Installation af Visual Studio Code (VSC), PlatformIO :
Se denne video fra Andreas Spiess :
* [#264 PlatformIO for Arduino, ESP8266, and ESP32 Tutorial](https://www.youtube.com/watch?v=0poh_2rBq7E&list=PL3XBzmAj53RnZPeWe799F-uoXERBldhn9&index=38)  

For linux bruger åben terminal og indsæt linier en af gangen !!
```bash
# opret directory til dine bin filer
mkdir -p ~/.local/bin
PATH="$PATH:$HOME/bin"

# giv default bruger adgang til serial port
sudo usermod -a -G dialout $USER

# opdater din linux
sudo apt update
sudo apt full-upgrade -y
sudo apt autoremove -y

# installer nogle hjælpe programmer
sudo apt install -y git pinta geany* vlc putty python3-distutils xclip

# opret mappe til projecter
mkdir -p ~/Dokumenter/GitHub/
mkdir -p ~/Dokumenter/FreeCad/
mkdir -p ~/Dokumenter/ESP32/
```

[Klik her for at hente og installer Visual Studio Code](https://code.visualstudio.com/download)

# PlatformIO :
## Installer PlatformIO fra VSC :
* Start VSC
* Åben Extensions med [Ctrl]+[Shift]+X
* Søg efter PlatformIO IDE 
* Tryk install og vent indtil installationen er afsluttet. 
* Genstart når det ønskes.

## Tilpas default settings :
[Klik for at se PlatformIO nyeste userguide](http://docs.platformio.org/en/latest/userguide/cmd_settings.html#projects-dir)  

* Åben new terminal Platformio
  * Klik Platformio logo
  * Klik *New Terminal* under *Miscellaneous*
* indtast nu følgende linie i Terminal vinduet:
```
platformio settings get
```
* vil give et output som dette:

| Name | Current value [Default] | Description |
|-------------------------- |------------------------ |------------ |
| auto_update_libraries     | No | Automatically update libraries (Yes/No) |
| auto_update_platforms     | No | Automatically update platforms (Yes/No) |
| check_libraries_interval  | 7  | Check for the library updates interval (days) |
| check_platformio_interval | 3  | Check for the new PlatformIO interval (days) |
| check_platforms_interval  | 7  | Check for the platform updates interval (days) |
| enable_cache              | Yes | Enable caching for API requests and Library Manager |
| enable_telemetry          | Yes | Telemetry service <http://bit.ly/pio-telemetry> (Yes/No) |
| force_verbose             | No | Force verbose output when processing environments |
| projects_dir              | /home/sekt/Documents/PlatformIO/Projects | Default location for PlatformIO projects (PIO Home) |
| strict_ssl                | No | Strict SSL for PlatformIO Services |

* Ændre nu **projects_dir** til **~/Dokumenter/ESP32**
  * indtast nu følgende linie i terminal vinduet:
```
platformio settings set projects_dir ~/Dokumenter/ESP32
```
# Start et nyt Project i PlatformIO - New Project :
Start et nyt ptoject med disse standard værdier og erstat ? med dit project navn (ESP32_Blink)

| Option | Værdi |
| -----|------ | 
| Name: | ? | 
| Board: | Espressif ESP32 Dev Module |
| Framework: | Arduino |
| Location: | [√] Use default location  |

Tryk på [Finish] når alle felter er udfyldt.

## Åben og juster platformio.ini tilhørende dit project :
Når du åbner filen vil den se ud som denne :
```
;PlatformIO Project Configuration File
;
;   Build options: build flags, source filter
;   Upload options: custom upload port, speed and extra flags
;   Library options: dependencies, extra library storages
;   Advanced options: extra scripting
;
; Please visit documentation for the other options and examples
; https://docs.platformio.org/page/projectconf.html

[env:esp32dev]
platform = espressif32
board = esp32dev
framework = arduino
```
Tilføj nu denne linie, den angiver den hastighed, ved hvilken [bit transmitteres](https://www.mathworks.com/help/matlab/matlab_external/baudrate.html), via vores serial port.

```bash
monitor_speed=115200
```
# Setup Github :
[See Intro to Git & GitHub](https://www.youtube.com/watch?v=IHaTbJPdB-s)  
* [How to Create a GitHub Account](https://www.youtube.com/watch?v=6U7_Om4zffM)  
* [Create GitHub Repositories](https://youtu.be/IHaTbJPdB-s?t=527)  

# Setup Git :
## Install Git :
```bash
sudo apt install -y git
```
## Config Git :
Video : [Git config](https://youtu.be/HfTXHrWMGVY?t=63)
```bash
git config --global user.name "Dit bruger navn på GitHub"
git config --global user.email "Din GitHub email adresse"

git config --global core.editor "code --wait"
```
## Setup Git SSH :
Video : [Opret SSH login on Github](https://youtu.be/HfTXHrWMGVY?t=144)
```bash
# Check for SSH Key
ls ~/.ssh

# Creaate an SSH Key
ssh-keygen -t rsa -b 4096 -C "Din GitHub email adresse"
```
Video : [Opret SSH login on Github - Copy SSH-Key](https://youtu.be/HfTXHrWMGVY?t=219)
```bash
# Copy the SSH Key
sudo apt install -y xclip
xclip -sel clip < ~/.ssh/id_rsa.pub
```
Video : [Opret SSH login on Github - Test SSH-Key](https://youtu.be/HfTXHrWMGVY?t=245)

```bash
# test SSH
ssh -T git@github.com

# Responce somthing like this is fine 
# Hi sekt1953! You've successfully authenticated, but GitHub does not provide shell access.
```
# GitHub Reposetry :
## Fork :
Video : [Git & GitHub Tutorial for Beginners #12 - Forking](https://www.youtube.com/watch?v=HbSjyU2vf6Y)
## Clone :
Video : [Git & GitHub Tutorial for Beginners #12 - Clone](https://youtu.be/HbSjyU2vf6Y?t=129)

```bash
cd ~/Dokumenter/GitHub/
git clone ssh_url
cd ~
```
## Git Add :
Video : [Git & GitHub Tutorial for Beginners #12 - Add]()
```bash
git add .
```
## Git Commit :
Video : [Git & GitHub Tutorial for Beginners #12 - Commit]()
```bash
git commit -m "min commit tekst"
```
## Push
Video : [Git & GitHub Tutorial for Beginners #12 - Clone](https://youtu.be/HbSjyU2vf6Y?t=262)
```bash
git push origin master
```