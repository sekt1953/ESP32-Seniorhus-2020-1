# ESP32-Seniorhus-2020-1 Robot & Microprosessor Kursus
Min ide er at oprette et kursus hvor vi bruger en lille microprossor ESP32 som har både Bluetooth, Wifi og Flash disk indbygget, med den kan vi styre vores udstyr fra en Smartphone eller iPad.  
Jeg vil bruge Platformio, Microsoft’s  Visual Studio Code, sammen med Arduino IDE, når vi kommer i gang skal vi samarbejde med 3D holdet om at lave dele til en robot, bil eller andet som vi kan styre.  
Jeg har lavet ESP32 udviklings kit til dette kursus som eleverne får udleveret ved kursus start, softwaren vi skal bruge er gratis. 
Eleverne skal selv medbringe en Pc til kursuset, undervisningen vil bruge et mødelokale til teori og 1.sal på metal værkstedet til praktiske opgaver.

Kursus starter den 5/2 2020 kl.: 12:30, mødested metalværkstedet  
* Niels Jørgen Jensen vil holde de første møder fra 5/2 til 26/2, hvor i vil begynde at definere den robot I skal bruge.
* Svenn-Erik K. Thomsen vil begynde undervisning i programering den 4/3 2020 kl.: 12:30

## Tilmelding kan ske på ved af udfyllde spørgsmålene i disse link
Robot & Microprosessor Kursus 2020 :
https://docs.google.com/forms/d/e/1FAIpQLSfGfbgsCQq_kk3sPVGyZUx6m9FqPH_HSMDtQ0DwIxAxN89SXg/viewform

## PCB Layout
![PCH Images](/Fritzing/ESP32_PCB_A_002_b_bb.png)

## ESP 32 Pin Layout
![ESP32](http://forum.fritzing.org/uploads/default/optimized/2X/a/ae3dc4cc089ce3e73de2d367da5dbf22102bd7c3_1_690x399.jpg)  
[ESP32S-HiLetgo Dev Boad with Pinout Template](https://forum.fritzing.org/t/esp32s-hiletgo-dev-boad-with-pinout-template/5357)

## Matrialer til CPU kort
| Navn | Link | Pris DKr.|
| ---- |--- | ---|
| ESP32 | https://www.aliexpress.com/item/32807887667.html?spm=a2g0s.9042311.0.0.21714c4dOmX9y0 | 32.00 |
| Ole Display | https://www.aliexpress.com/item/32780054633.html?spm=a2g0s.9042311.0.0.21714c4dOmX9y0 | 32.00 |
| LED UltraBright | https://www.aliexpress.com/item/32262805477.html?spm=a2g0s.9042311.0.0.21714c4dOmX9y0 | 2.00 |
| 15mm rotary encoder | https://www.aliexpress.com/item/33050894285.html?spm=a2g0s.9042311.0.0.21714c4dOmX9y0 | 7.00 |
| PCB Stripboard | https://www.aliexpress.com/item/32367760106.html?spm=a2g0s.9042311.0.0.21714c4dOmX9y0 | 11.00 |
| Momentary Pushbutton | https://www.aliexpress.com/item/32545141968.html?spm=a2g0s.9042311.0.0.21714c4dOmX9y0 | 2.00 |
| 3296W series 3296W 103 10K ohm Top regulation Multiturn | https://www.aliexpress.com/item/32508075902.html?spm=a2g0s.9042311.0.0.27424c4dPDYsiU | 2.50 |
| Colorful Breakable Pin Header | https://www.aliexpress.com/item/32992080490.html?spm=a2g0s.9042311.0.0.27424c4dPDYsiU | 5.00 |
| 20cm Female to Female | https://www.aliexpress.com/item/32836050778.html?spm=a2g0s.9042311.0.0.27424c4dPDYsiU | 8.00 |
| breakaway Straight female header 40 pins | https://www.aliexpress.com/item/2046245030.html?spm=a2g0s.9042311.0.0.27424c4dcyutn6 | 3.00 |
| SMD 220 Ohm | https://www.aliexpress.com/item/32847115923.html?spm=a2g0o.productlist.0.0.79b47e92Q9RMe2&algo_pvid=513a7157-4b4c-47b4-a368-329f278bac1f&algo_expid=513a7157-4b4c-47b4-a368-329f278bac1f-0&btsid=5dde7322-30b2-443f-abcf-61bfba64a9b9&ws_ab_test=searchweb0_0,searchweb201602_7,searchweb201603_53 | 1.00 |
| Sokkel til Print | 3D Print | 13.00 |

## Installation af VSC & PlatformIO
Se denne video fra Andreas Spiess:
* [#264 PlatformIO for Arduino, ESP8266, and ESP32 Tutorial](https://www.youtube.com/watch?v=0poh_2rBq7E&list=PL3XBzmAj53RnZPeWe799F-uoXERBldhn9&index=38)  

Hent Visual Studio Code her:
* https://code.visualstudio.com/download  

For linux bruger åben terminal og indsæt
```bash
mkdir -p ~/.local/bin
PATH="$PATH:$HOME/bin"

sudo usermod -a -G dialout $USER

sudo apt update
sudo apt full-upgrade -y

sudo apt install -y git pinta geany* vlc putty

mkdir ~/Dokumenter/ESP32/
cd ~/Dokumenter/ESP32/
git clone https://github.com/sekt1953/ESP32-Seniorhus-2020-1.git
```
## Start et nyt Project i PlatformIO
### PlatformIO - New Project
| Option | Værdi |
| -----|------ | 
| Name: | ? | 
| Board: | Espressif ESP32 Dev Module |
| Framework: | Arduino |
| Location: | ~/Dokumenter/ESP32/ |
