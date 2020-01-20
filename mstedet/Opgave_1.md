# Opgave 1. - Delay(), millis() & micros()
* Kilde: 
  * https://www.norwegiancreations.com/2017/09/arduino-tutorial-using-millis-instead-of-delay/  
  * https://www.norwegiancreations.com/2018/10/arduino-tutorial-avoiding-the-overflow-issue-when-using-millis-and-micros/ 

## Start et nyt Project i PlatformIO - New Project :
### Open PlatformIO :
![PlatformIO_Nyt_Project](../Images/PlatformIO_Nyt_Project.png)

  1. Klik PlatformIO Icon  
  2. Klik Open  
  3. Klik New Project   
### Indtast Parameter for nyt project:
![PlatformIO_Project_Wizard](../Images/PlatformIO_Project_Wizard.png)

  4. Name: ESP32_Blink  
  5. Board: Espressif ESP32 Dev Module  
  6. Framework: Arduino  
  7. Location: Use default location  
  8. Tryk på [Finish] når alle felter er udfyldt.  
### Åben og juster *platformio.ini* tilhørende dit project :
![ESP32_Blink_ini](../Images/ESP32_Blink_ini.png)

  9. Åben filhontering  
  10. Åben Project ESP32_Blink  
  11. Åben filen platformio.ini  
  12. tilføj linien, 
```
  "monitor_speed=115200"
```
  12. , den vil angiver den hastighed, der sendes og modtages data via vores serial port.  
  13. Gem nu ændringer med [CTRL]+S

<hr/>  

## Brug millis() i stedet for Delay()
```
int period = 1000;
unsigned long time_now = 0;
 
void setup() {
  Serial.begin(115200);
}
 
void loop() {
  time_now = millis();
   
  Serial.println("Hej");
   
  while(millis() < time_now + period){
    //wait approx. [period] ms
  }
}
```
Hvis du vil have din kode til bare at pause i 1000 ms i slutningen af hver loop-iteration, er koden ovenfor lidt fjollet. Du kan bare bruge forsinkelse (1000) i stedet. Den eneste forskel mellem koden ovenfor og en kode med forsinkelse (1000) i slutningen er, at løkken i ovennævnte kode kører ganske nøjagtigt en gang hvert sekund. Løkken i en kode med forsinkelse (1000) kører lidt mindre hyppigt, da det også tager nogen tid at udføre Serial.println ("Hej").

### Hvorfor bruge millis() ?
#### Præcis timing
Den første fordel, vi drøfter, er nøjagtig timing. Kodemæssigt dækkede vi dette i det sidste kapitel. Med millis () kan vi sikre, at løkken løber så ofte, som vi ønsker, uanset udførelsestid (naturligvis så længe udførelsestiden er mindre tid til den ønskede periode). Med Delay() er dette ikke muligt, da vi ikke ved, hvor lang løbetidets udførelsestid er.  
Præcise timinger som denne er meget nyttige, når man blandt andet prøver med en bestemt frekvens eller kører filtre.

#### Ikke-blokerende
Den anden fordel med millis () er, at det ikke forhindrer os i at køre kode, mens vi ”venter”.   
Lad os sige, at vi vil udskrive "Hej" over serien en gang hvert sekund, mens vi gør andre ting i mellemtiden. Dette er ikke muligt med forsinkelse (), da det sætter hele koden på pause. Her er en måde, vi kan gøre dette på:  
```
int period = 1000;
unsigned long time_now = 0;
 
void setup() {
  Serial.begin(115200);
}
 
void loop() {
  if(millis() >= time_now + period){
    time_now += period;
    Serial.println("Hej");
  }
   
  //Run other code
}
```
Denne kodestykke ligner den første del, bortset fra at den ikke blokerer for resten af programmet, når der ikke udskrives over serie.   

#### Example: a Simple Scheduler
```
#define INTERVAL_MESSAGE1 5000
#define INTERVAL_MESSAGE2 7000
#define INTERVAL_MESSAGE3 11000
#define INTERVAL_MESSAGE4 13000
 
unsigned long time_1 = 0;
unsigned long time_2 = 0;
unsigned long time_3 = 0;
unsigned long time_4 = 0;
 
void print_time(unsigned long time_millis);
 
void setup() {
  Serial.begin(115200);
}
 
void loop() {
  if(millis() >= time_1 + INTERVAL_MESSAGE1){
    time_1 +=INTERVAL_MESSAGE1;
    print_time(time_1);
    Serial.println("I'm message number one!");
  }
   
  if(millis() >= time_2 + INTERVAL_MESSAGE2){
    time_2 +=INTERVAL_MESSAGE2;
    print_time(time_2);
    Serial.println("Hello, I'm the second message.");
  }
   
  if(millis() >= time_3 + INTERVAL_MESSAGE3){
    time_3 +=INTERVAL_MESSAGE3;
    print_time(time_3);
    Serial.println("My name is Message the third.");
  }
   
  if(millis() >= time_4 + INTERVAL_MESSAGE4){
    time_4 += INTERVAL_MESSAGE4;
    print_time(time_4);
    Serial.println("Message four is in the house!");
  }
}
 
void print_time(unsigned long time_millis){
  Serial.print("Time: ");
  Serial.print(time_millis/1000);
  Serial.print("s - ");
}
```
Sådan ser de første 60 sekunder på den serielle skærm ud:  
```

```

## micros() and Overflowing
Ligesom Delay() har en mikrosekundversion, der kaldes delayMicroseconds(), har millis() micros(). Hvis du har brug for bedre opløsning, kan mikro() muligvis være vejen at gå.   

Vær dog opmærksom på, at mikro() vil løbe over efter ca. 70 minutter sammenlignet med millis()'s 50 dage. Dette betyder, at funktionernes returneringsværdier starter overalt fra nul.  

Mere vigtigt er det: for at lære, hvordan du helt kan undgå overløbsproblemet, skal du læse dette blogindlæg "https://www.norwegiancreations.com/2018/10/arduino-tutorial-avoiding-the-overflow-issue-when-using-millis-and-micros/".

### Undgå overløbsproblemet, når du bruger millis() og micros()  
Vi nævnte et advarsel med disse funktioner, og det er, at millis() og 
mikros() overløber efter henholdsvis 50 dage og 70 minutter. Dette potentielle problem kan meget let undgås med en lille ændring af koden fra sidste gang.

Brug af millis() i hele dette indlæg kan udskiftes med mikros().

### Den lette løsning
Lad os se på det enkle ikke-blokerende eksempel, vi inkluderede i det forrige blogindlæg:
```
int period = 1000;
unsigned long time_now = 0;
  
void setup() {
    Serial.begin(115200);
}
  
void loop() {
  if(millis() > time_now + period){
    time_now = millis();
    Serial.println("Hello");
  }
    
  //Run othe
}
```
Her får vi en buggy opførsel efter cirka 50 dage, hvor millis() går fra at returnere et meget højt antal (tæt på (2 ^ 32) -1) til et meget lavt tal. Dette kaldes overflow eller rollover.

### Lad os nu se, hvordan vi kan løse dette:
```
int period = 1000;
unsigned long time_now = 0;
  
void setup() {
  Serial.begin(115200);
}
  
void loop() {
  if(millis() - time_now > period){
    time_now = millis();
    Serial.println("Hello");
  }
    
  //Run other code
}
```
Vi flytter stort set bare time_now til den anden side af ulighedsoperatøren. For at ligningen stadig giver mening, er vi så nødt til at ændre variablenes tegn, derved subtraktionen. Du kan se på dette som at sammenligne en varighed med en vores periodevariabel i stedet for at arbejde med tidsstempler.
