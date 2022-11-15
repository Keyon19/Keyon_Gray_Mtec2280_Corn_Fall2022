const int SENSOR = A0; //sensor hooked up to analog pin A0
const int BUTTON = 2;
const int LED = 11;
int sensor_val = 0;
int button_val = 0;
int LEDState = 0;
int buttonState = HIGH;
int lastButtonState = HIGH;


void setup() {
  pinMode (SENSOR, INPUT);
  pinMode (LED, OUTPUT);
  pinMode (BUTTON, INPUT_PULLUP);
  Serial.begin(115200); // Start serial communication at 9600 baud
}

void loop() {
  sensor_val = analogRead(SENSOR); 
  button_val = digitalRead(BUTTON);
  analogWrite(LED, sensor_val/4);

  Serial.print('H'); 
  Serial.print(",");
  Serial.print(sensor_val,DEC);
  Serial.print(",");
  Serial.print(button_val,DEC);
  Serial.print(",");  
  Serial.println();  

  delay(30); 

    buttonState = digitalRead(BUTTON);
  delay(10);

  if(buttonState == LOW && lastButtonState == HIGH){
      LEDState++;
      button_val++;
      if(LEDState > 2){
          LEDState = 0;
        }
    } else {
      }
         if(button_val > 2){
          button_val = 0;
        } else {
      }
    

   lastButtonState = buttonState;

}
