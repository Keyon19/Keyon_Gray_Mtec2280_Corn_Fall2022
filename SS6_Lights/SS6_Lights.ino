/*
  Button - Continuous Press

  Turns on and off a light emitting diode(LED) connected to digital pin 13,
  when pressing a pushbutton attached to pin 2.

  The circuit:
  - LED attached from pin 13 to ground with 330 or 220 resistor.
  - pushbutton attached to pin 2 from +5V
  - 10K resistor attached to pin 2 from ground

  Note: this sketch should work but not totally consistently when pressing the button.
  See next debouncing sketch for more accurate button detection.

  Slightly modified from Arduino IDE example code in the public domain:
  http://www.arduino.cc/en/Tutorial/Button
*/

// sets up constant integer variables for pins (will not change)
const int buttonPin = 2;     // creates variable called buttonPin and assigns value of 2
const int LED =  13;      // creates variable called LED and assigns value of 13
const int LED2 = 12;
const int LED3 = 11;
const int LED4 = 10;

// sets up integer variable that will change over time
; int buttonState = 0;        // creates variable to track buttonState, assigns initial value of 0


// setup runs once at startup
void setup() {
  pinMode(LED, OUTPUT);  // initialize LED pin as an output.
  pinMode(buttonPin, INPUT);  // initialize pushbutton pin as an input.
  pinMode(LED2, OUTPUT); 
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);
}

// loop runs infinitely
void loop() {
  buttonState = digitalRead(buttonPin);    // read the state of the pushbutton value
  delay (10); //small delay for debouncing, to increase accuracy

  // conditional statement
  if (buttonState == HIGH) { // if button is pressed (voltage received on pin 2)
    // turn off voltage to LED pin
    digitalWrite(LED2, HIGH);      
    delay(10);
    digitalWrite(LED, HIGH);
    delay(50);
    digitalWrite(LED4, HIGH);
    delay(50);
    digitalWrite(LED3, HIGH);
    delay(250);  
    digitalWrite(LED3, LOW);
    delay(100);
    digitalWrite(LED2, LOW); 
    delay(50); 
    digitalWrite(LED, LOW); 
    delay(500);
    digitalWrite(LED4, LOW); 
    delay(10);
    digitalWrite(LED2, HIGH);      
    delay(300);
    digitalWrite(LED, HIGH);
    delay(10);
    digitalWrite(LED4, HIGH);
    delay(10);
    digitalWrite(LED3, HIGH);
    delay(50);
       
  } else {   //otherwise
    digitalWrite(LED, LOW);      // send voltage to LED pin
    delay(500);
    digitalWrite(LED2, LOW);
    delay(500);
    digitalWrite(LED3, LOW);
    delay(500);
    digitalWrite(LED4, LOW);
  }
}
