const int SENSOR1= A0; // potentiometer
const int SENSOR2= 8; // button
const int SENSOR3 = 5; // piezo

int sensor1val = 0;  
int sensor2val = 0;  
int sensor3val = 0;

bool buttonPressed = false;
int buttonSend = 255;
int inByte = 0; 

void setup() {
  Serial.begin(9600);  // start serial communication:
  while (!Serial) {  //if serial not connected
    ;   // wait for serial port to connect. 
  }

  //set pins as inputs
  pinMode(SENSOR1, INPUT);  
  pinMode(SENSOR2, INPUT_PULLUP);
  pinMode(SENSOR3, OUTPUT);
  
  establishContact();
}

void loop() {
  // if we get a valid byte, read sensor inputs:
  if (Serial.available() > 0) {
    // get incoming byte:
    inByte = Serial.read();
    
    // read first analog input, divide by 4 to make the range 0-255:
    sensor1val = analogRead(SENSOR1)/4;
    // delay 10ms to let the ADC recover:
    delay(50);

    sensor2val = digitalRead(SENSOR2);
    if(sensor2val == LOW && !buttonPressed){
      buttonPressed = true;
      buttonSend = 0;
      tone(SENSOR3,900,70);
      
    }
    else{
      buttonSend = 255;
      noTone(SENSOR3);
    }

    if(sensor2val == HIGH && buttonPressed){
      buttonPressed = false;
    }

         
    Serial.write(sensor1val);
    Serial.write(buttonSend);

      }
}

void establishContact() {
  while (Serial.available() <= 0) {
    Serial.print('A');   // send a capital A
    delay(300);
  }
}
