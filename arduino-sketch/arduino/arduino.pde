//Pin connected to ST_CP of 74HC595
const int latchPin = 8;
//Pin connected to SH_CP of 74HC595
const int clockPin = 12;
////Pin connected to DS of 74HC595
const int dataPin = 11;

//Diody sterowane z wyjść PWM
const int pwm1 = 6;
const int pwm2 = 5;

//Wejście przyciku
const int buttonPin = 2;

//Wyjścia do "bramki" NOR
const int weNor1 = A5;
const int weNor2 = A4;

//Wejścia sygnału analogowego
const int analogLight = 0;
const int analogTemp = 1;


float temp = 0.0;
int readTemp, readLight;

void setup() {
  //Piny odpowiedzialne za rejestr przesówny
  pinMode(latchPin, OUTPUT);
  pinMode(clockPin, OUTPUT);
  pinMode(dataPin, OUTPUT);
  
  pinMode(pwm1, OUTPUT);
  pinMode(pwm2, OUTPUT);
  
  pinMode(buttonPin, INPUT);
  
  pinMode(weNor1, OUTPUT);
  pinMode(weNor2, OUTPUT);
    
  pinMode(analogLight, INPUT);
  pinMode(analogTemp, INPUT);
  
  analogReference(EXTERNAL);
  
  Serial.begin(9600);
}

int i = 0;

void loop() {
  // count from 0 to 255 and display the number 
  // on the LEDs
  for (int numberToDisplay = 0; numberToDisplay < 256; numberToDisplay++) {
    // take the latchPin low so 
    // the LEDs don't change while you're sending in bits:
    digitalWrite(latchPin, LOW);
    // shift out the bits:
    shiftOut(dataPin, clockPin, MSBFIRST, numberToDisplay);  
    //take the latch pin high so the LEDs will light up:
    digitalWrite(latchPin, HIGH);
    // pause before next value:
    
  analogRead(analogTemp);
  delay(10);
  readTemp = analogRead(analogTemp) * 3.3;
  temp = readTemp / 1024.0;
  temp -= 0.5;
  temp /= 0.01;
 
  readLight = analogRead(analogLight);
  /*
  Serial.print(readTemp);
  Serial.print(" V ");
  Serial.print(temp);
  Serial.print(" C ");
  Serial.println(readLight);
  */
  
  analogWrite(pwm1, i);
  analogWrite(pwm2, 255-i);
  i++;
  if(i==255) {
    i=0;
  }
  

  //delay(250);
 
 
  }
  
      digitalWrite(weNor1, HIGH);
    digitalWrite(weNor2, HIGH);
    
    
  	if (Serial.available() > 0) {
		// read the incoming byte:
		int incomingByte = Serial.read();

		// say what you got:
		Serial.print("I received: ");
		Serial.println(incomingByte, DEC);
  }
}

