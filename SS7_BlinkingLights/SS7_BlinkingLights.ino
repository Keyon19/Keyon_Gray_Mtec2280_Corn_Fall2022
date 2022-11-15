const int buttonPin = 2;
const int LED1 = 5;
const int LED2 = 6;
const int LED3 = 10;
const int LED4 = 11;

int LEDState = 0;
int buttonState = HIGH;
int lastButtonState = HIGH;

unsigned long previousMillis = 0;
const unsigned long interval = 500;
const unsigned long interval2 = 1000;
bool blinkState = false;

void setup() {
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(LED3, OUTPUT);
  pinMode(LED4, OUTPUT);  

  pinMode(buttonPin, INPUT_PULLUP);
}

void loop() {
  unsigned long currentMillis = millis();

  buttonState = digitalRead(buttonPin);
  delay(10);

  if(buttonState == LOW && lastButtonState == HIGH){
      LEDState++;
      if(LEDState > 2){
          LEDState = 0;
        }
    } else {
      }

   lastButtonState = buttonState;

   if(LEDState == 1){
      if(currentMillis - previousMillis >= interval){
          previousMillis = currentMillis;

          if(blinkState == true){
              digitalWrite(LED1,LOW);
              delay(50);
              digitalWrite(LED2,LOW);
              delay(70);              
              digitalWrite(LED3,LOW);
              delay(100);              
              digitalWrite(LED4,LOW);
              delay(130);                            
            } else {
                digitalWrite(LED1, HIGH);
                delay(130);
                digitalWrite(LED2, HIGH);
                delay(100);
                digitalWrite(LED3, HIGH);
                delay(70);
                digitalWrite(LED4, HIGH); 
                delay(50);               
              }

              blinkState = !blinkState;
        }
    } else if(LEDState == 2){
        if(currentMillis - previousMillis >= interval2){
            previousMillis = currentMillis;

            if(blinkState == true){
                digitalWrite(LED1,LOW);
                digitalWrite(LED2,HIGH);
                digitalWrite(LED3,LOW);
                digitalWrite(LED4,HIGH); 
            
              } else {
                  digitalWrite(LED1,HIGH);
                  digitalWrite(LED2,LOW);
                  digitalWrite(LED3,HIGH);
                  digitalWrite(LED4,LOW);                  
                }

                blinkState = !blinkState;
          }
      } else {
          digitalWrite(LED1,LOW);
          digitalWrite(LED2,LOW);
          digitalWrite(LED3,LOW);
          digitalWrite(LED4,LOW);      

          blinkState = false;    
        }
}
