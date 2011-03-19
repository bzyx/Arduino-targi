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

const int ledPin = weNor1;       // the pin that the LED is attached to

// Variables will change:
int buttonPushCounter = 0;   // counter for the number of button presses
int buttonState = 0;         // current state of the button
int lastButtonState = 0;     // previous state of the button
int i = 0;

void loop() {
/*  // count from 0 to 255 and display the number 
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
  
  Serial.print(readTemp);
  Serial.print(" V ");
  Serial.print(temp);
  Serial.print(" C ");
  Serial.println(readLight);
  
  
  analogWrite(pwm1, i);
  analogWrite(pwm2, 255-i);
  i++;
  if(i==255) {
    i=0;
  }
  

  //delay(250);
 
 
  }
  */
  
      digitalWrite(weNor1, HIGH);
    digitalWrite(weNor2, LOW);
    
    
  	/*if (Serial.available() > 0) {
		// read the incoming byte:
		int incomingByte = Serial.read();

		// say what you got:
		Serial.print("I received: ");
		Serial.println(incomingByte, DEC);
  }*/
  
  
    // read the pushbutton input pin:
 // buttonState = digitalRead(buttonPin);

  // compare the buttonState to its previous state
 /* if (buttonState != lastButtonState) {
    // if the state has changed, increment the counter
    if (buttonState == HIGH) {
      // if the current state is HIGH then the button
      // wend from off to on:
      buttonPushCounter++;
      Serial.println("on");
      Serial.print("number of button pushes:  ");
      Serial.println(buttonPushCounter, DEC);
    }
    else {
      // if the current state is LOW then the button
      // wend from on to off:
      Serial.println("off");
    }
  }*/
  // save the current state as the last state,
  //for next time through the loop
  //lastButtonState = buttonState;

 
  // turns on the LED every four button pushes by
  // checking the modulo of the button push counter.
  // the modulo function gives you the remainder of
  // the division of two numbers:
  /*if (buttonPushCounter % 4 == 0) {
    digitalWrite(ledPin, HIGH);
  } else {
   digitalWrite(ledPin, LOW);
  }*/
}

