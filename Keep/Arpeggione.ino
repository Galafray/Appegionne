/*
 Arpeggione
 Co-ordinates the computer, Music-keyboard, sound-modules, volume pedal, LED pointer and detector
 Written by George Cox of Code Research limited
 
Use Alt Space to move this window on the Raspberry Pi

 Arduino Mega 
   USB    (Serial  I/O) Computer
   
   Pin 18 (Serial1 out) MIDI synth Integra)
   Pin 19 (Serial1  in) Keyboard 
   
   Pin 16 (Serial2 out) MIDI synth SC-88
   Pin 17 (Serial2  in) Roland GL-10
   
   //Pin 15 (Serial3  in) Pointer 
   
 The circuit:
 * digital in 1 connected to MIDI jack pin 5
 * MIDI jack pin 2 connected to ground
 * MIDI jack pin 4 connected to +5V through 220-ohm resistor
 */


/*
#ifdef __arm__
// should use uinstd.h to define sbrk but Due causes a conflict
extern "C" char* sbrk(int incr);
#else  // __ARM__
extern char *__brkval;
#endif  // __arm__
 
int freeMemory() {
  char top;
#ifdef __arm__
  return &top - reinterpret_cast<char*>(sbrk(0));
#elif defined(CORE_TEENSY) || (ARDUINO > 103 && ARDUINO != 151)
  return &top - __brkval;
#else  // __arm__
  return __brkval ? &top - __brkval : &top - __malloc_heap_start;
#endif  // __arm__
}
*/

 
// Global variables
struct Event {
  int s; //Which synth, 1 to 3 
    //3 UARTs are available for synths on the mega
    //If s contains 0, it's a timimg record, not sent to a synth
    //Integra 1 
    //SC-88 2
  int c; //Command
  int n; //Pitch of note
  int v; //Velocity
};
//const int EventSize = 400; //Max size of the array.
const int EventSize = 600; //Max size of the array.
                           //Could be up to 750
//const int EventSize = 750; //Max size of the array.
const int exPressionPin = A15;
const int PointerPin = 22;
boolean PointerAllowed;
boolean PointerOn;
const int ReceiverPin = 2;
volatile boolean ReceiveState;
boolean prevReceiveState;

struct Event Events[EventSize]; 

struct SpeedTrap {
  //Used for setting Speedfactor
  unsigned long ThisTime; 
  int PrevDelta;
  int ThisDelta; //Command
  float SpeedFactor = 1.04;  
  unsigned long LastTime = 0;
  unsigned long NextTime = 0;
};
SpeedTrap ST;
const float Delta2Millis = 25/24;

long EventsUsed = 0;
String SerStr1, SerStr2, SerStr3; 
const int led = 13; //Pin 13 is the onboard led. 
//Toggles with input from a midi controller

int eIndexH = 11; //Index to the Events array head. The   
                  //end of the practice array below
int eIndexT = 0; //Index to the Events array tail.
                //Next one to be played
boolean AutoPlay = false;//Plays no matter what
//boolean AutoTrig = false; //Play from timing record where cmd = 01
byte ThisVel = 0x40; //Velocity of note just played
byte LastVel = 0x40; //Initial guess at volume
byte PedlVel = 0x00;
float PedlFactor = 0.65;
byte HoldVel = 0x00;
byte bCount = 0;
byte pCount = 0;
//long TimeNextEvent = 0; //In milliseconds
//long LastTrigger = 0;

byte KeyboardTriggers = 0; 
//0 Default, plays event array. 1 To Integra. 2 To SC-88 
boolean GuitarIsTrigger  = true;


void setup() {                
  //Init the digital led pin as an output.
  pinMode(led, OUTPUT);  
  digitalWrite(led, HIGH);
  pinMode(PointerPin, OUTPUT);
  digitalWrite(PointerPin, LOW);
  attachInterrupt(digitalPinToInterrupt(ReceiverPin), IsrReceived, CHANGE);
  PointerAllowed = false;
  PointerOn = false;
  prevReceiveState = ReceiveState; //Equal at start
  Serial.begin(9600);   //Serial with computer. 
                        //RPi cannot do 31250
  Serial.println("Arpeggione");                      
  //Set MIDI baud rates 
  Serial1.begin(31250); //Serial Keyboard In
                        //Serial to Integra-7 Out
  Serial2.begin(31250); //Roland GL-10 In 
                        //Roland SC-88 Out
  //Serial3.begin(31250); //Pointer In 
  
  
//Some sample data for use with when developing
  Events[0].s = 0x00; //Timing
  Events[0].c = 0x00; //Initial delta time
  Events[0].n = 0x01;
  Events[0].v = 0x90;

  Events[1].s = 0x02; //Which synth
  Events[1].c = 0x90; //For playing middle C
  Events[1].n = 0x3C; //C3
  Events[1].v = 0x50; //Velocity
  
  Events[2].s = 0x00; //Timing
  Events[2].c = 0x00; //Next delta time
  Events[2].n = 0x01;
  Events[2].v = 0x90;
  
  Events[3].s = 0x02; //Which synth
  Events[3].c = 0x80; //For Stoping middle C
  Events[3].n = 0x3C;
  Events[3].v = 0x00;  

  Events[4].s = 0x02; //Which synth
  Events[4].c = 0x90; //For playing D
  Events[4].n = 0x3E;
  Events[4].v = 0x50;
  
  Events[5].s = 0x00; //Timing
  Events[5].c = 0x00; //Next delta time
  Events[5].n = 0x06;
  Events[5].v = 0x40;
  
  Events[6].s = 0x02; //Which synth
  Events[6].c = 0x80; //Silence D
  Events[6].n = 0x3E;
  Events[6].v = 0x00;  

  Events[7].s = 0x02; //Which synth
  Events[7].c = 0x90; //For playing middle C
  Events[7].n = 0x3C; //C3
  Events[7].v = 0x50; //Velocity
  
  Events[8].s = 0x02; //Which synth
  Events[8].c = 0x90; //For playing E3
  Events[8].n = 0x40; //E3
  Events[8].v = 0x50; //Velocity

  Events[9].s = 0x00; //Timing
  Events[9].c = 0x00; //Delta time
  Events[9].n = 0x00; 
  Events[9].v = 0x00; 
  
  Events[10].s = 0x02; //Which synth
  Events[10].c = 0x80; //Silence middle C
  Events[10].n = 0x3C; //C3
  Events[10].v = 0x00; //Velocity
  
  Events[11].s = 0x02; //Which synth
  Events[11].c = 0x80; //Silence E
  Events[11].n = 0x40; //E3
  Events[11].v = 0x00; //Velocity      
}


void InitEventArray() {
  for (int Rec = 0; Rec < EventSize; Rec++) {
    Events[Rec].s = 0x00; 
    Events[Rec].c = 0x00; 
    Events[Rec].n = 0x00; 
    Events[Rec].v = 0x00; 
  }
}


byte HexStrToByte(String aStr, byte Numb) {
//The length of the string will usually be a packet of 8 char
//containing 4 bytes of Hex
char aChar;
byte nybl1, nybl2, theByte;
  Numb = (Numb * 2) - 2;
  aChar = aStr[Numb]; //Zero based
  //Serial.println(aChar);
  
  nybl1 = aChar;
  if (nybl1 > 64) {
    nybl1 = nybl1 - 55;
  }  
  else {
    nybl1 = nybl1 -48;
  }
  nybl1 = nybl1 * 16;
  //Serial.println(nybl1);
  
  //Now the least signif nybble
  Numb = Numb + 1;
  aChar = aStr[Numb]; //Zero based
  //Serial.println(aChar);
  
  nybl2 = aChar;
  if (nybl2 > 64) {
    nybl2 = nybl2 - 55;
  }  
  else {
    nybl2 = nybl2 -48;
  }
  //Serial.println(nybl2);
  theByte = nybl1 + nybl2;
  //Serial.println(theByte);
  return theByte;
}


void ToggleLed() {
  digitalWrite(led, !digitalRead(led));  
}


byte ReadExp() { //Read the pot in the expression pedal
int ExpVelocity = 0;
  ExpVelocity = analogRead(exPressionPin);
  ExpVelocity = map(ExpVelocity, 0, 1023, 0x00, 0x7F);
  return ExpVelocity;
}

void CheckExpressionPedal() {
  PedlVel = ReadExp();
  if (abs(PedlVel - HoldVel) > 2) {
    //Must vary by more than 2 to stop jitters
    if (PedlVel < 0x10) {
      Serial.print("2101zz0"); //Leading naught
      digitalWrite(PointerPin, LOW);
      PointerOn = false;
    } else  {
      Serial.print("2101zz"); 
      if (PointerAllowed) {
        digitalWrite(PointerPin, HIGH);
        PointerOn = true;
      }  
    }  
    Serial.println(PedlVel, HEX);
    HoldVel = PedlVel;
    PedlFactor = (float)PedlVel / (float)0x7F;
  }
}  


void PeekPokePort(String aStr) {
byte PeekOrPoke;
byte PortNumb;
byte OnOff;
int val;

  PeekOrPoke = HexStrToByte(aStr, 2);
  PortNumb = HexStrToByte(aStr, 3);
  switch (PeekOrPoke) {
    case 0: //It's a peek
      val = digitalRead(PortNumb); 
      Serial.println(val);
      break;
    case 1: //It's a poke
      OnOff = HexStrToByte(aStr, 4); //Byte 4
      digitalWrite(PortNumb, OnOff);  
      break; 
  }
  
  //Serial.print("Port no ");
  //Serial.println(PortNumb);
  
  //Serial.print("with "); 
  //Serial.println(OnOff);
  
  //String bStr = "43";
  //int aInt = bStr.toInt();
  //Serial.println(aInt * 2);
}


void PokeEventArray(String aStr) {
  incIndex('H'); //Ahead to the next one
  Events[eIndexH].s = HexStrToByte(aStr, 1);
  Events[eIndexH].c = HexStrToByte(aStr, 2);
  Events[eIndexH].n = HexStrToByte(aStr, 3);
  Events[eIndexH].v = HexStrToByte(aStr, 4);
}


void incIndex(char Which) {
  //inc eIndexH or eIndex T?
  //Each index pointer moves contiguously from 0 to 
  //EventSize, and then loops back
  switch (Which) {
  case 'T':
    EventsUsed = EventsUsed + 1;
    eIndexT = eIndexT + 1;    
    if (eIndexT == eIndexH + 1) { //Tortoise passes Hare
      MuteAllChannels();
      InitEventArray();
      AutoPlay = false;
      //AutoTrig = false;
      eIndexH = -1;
      eIndexT = 0;
      EventsUsed = 0;
      //String aStr = String(EventSize, HEX);
 //     String aStr = "200z0190"; //Ask for first records
 //     //Will get 400 initially, 200 after that
      String aStr = "200z0258"; //Ask for first records
      //Will get 600 initially, 300 after that
      Serial.println(aStr);      
    }
    if (eIndexT > EventSize - 1) { //Means we've overshot the array
      eIndexT = 0; //Wrap
      //break;
    }  
    //if  ((eIndexH == 199) && (eIndexT == 0)) {
    if  ((eIndexH == 299) && (eIndexT == 0)) {
  //    String aStr = "201z00C8"; //Ask for next lot of records
  //    //Got 400 initially, 200 after that
      String aStr = "201z012C"; //Ask for next lot of records
      //Got 600 initially, 300 after that
      Serial.println(aStr);
      //break;
    }  
  //  if  ((eIndexH == 399) && (eIndexT == 200)) {
      if  ((eIndexH == 599) && (eIndexT == 300)) {
   //   String aStr = "201z00C8"; //Ask for next lot of records
     String aStr = "201z012C"; //Ask for next lot of records
      Serial.println(aStr);
    }  
    break;

  case 'H': 
    eIndexH = eIndexH + 1;  
    if (eIndexH == EventSize)  
      eIndexH = 0; //Wrap
    break;
  }
}


void StraightToSynth(String aStr) {
//ie. Not going to the event array
char Which;
  Which = aStr[1];
  switch(Which) {
    case '1': //To Integra
      Serial1.write(HexStrToByte(aStr, 2));    
      Serial1.write(HexStrToByte(aStr, 3));
      Serial1.write(HexStrToByte(aStr, 4));
      break;
    case '2': //To SC-88
      Serial2.write(HexStrToByte(aStr, 2));    
      Serial2.write(HexStrToByte(aStr, 3));
      Serial2.write(HexStrToByte(aStr, 4));
      break;
  }   
}


void MuteAllChannels() {
int Channel;  
char aChr;
String aStr;
byte Chn;
  //Serial.println("Mute");    
  for (Channel = 0; Channel <= 15; Channel++) {
    /*
    if (Channel < 10) aChr = Channel + 48;
    else aChr = Channel + 55;
    aStr = "13B" + String(aChr) + "7B00";
    */
    
    Chn = 0xB0 + Channel;
    Serial1.write(Chn);    
    Serial1.write(0x7B);
    Serial1.write((byte)0x00);
    
    Serial2.write(Chn);    
    Serial2.write(0x7B);
    Serial2.write((byte)0x00);
  }
}


long GetDeltaTime(int Index) {
//Two bytes of the array record n, and v are used to 
//make up the time
  //Serial.println(Index);
  //Serial.println(Events[Index].c);
  long Hold = Events[Index].n;
  Hold = Hold * 256;
  Hold = Hold + Events[Index].v;
  //This can be proportionally altered by SpeedFactor
  //The larger SpeedFactor is, the slower the music
  Hold = Hold * (float)ST.SpeedFactor;
  //Serial.println(Hold);
  return Hold;
}

String EventToStr() {
String aStr;
  aStr = "";
  if (Events[eIndexT].c < 0x10) aStr = aStr + "0"; //Leading 0 
  aStr = aStr + String(Events[eIndexT].c, HEX);
  if (Events[eIndexT].n < 0x10) aStr = aStr + "0"; //Leading 0 
  aStr = aStr + String(Events[eIndexT].n, HEX);
  if (Events[eIndexT].v < 0x10) aStr = aStr + "0"; //Leading 0 
  aStr = aStr + String(Events[eIndexT].s, HEX);
  return  aStr;
}

void SendNote(int Index) {
String aStr;
//Plays a MIDI note. Doesn't check data values
  //Serial.println(Index);

  //Get the synth number
  byte theSynth = Events[eIndexT].s;
  //aStr = "21YYYYY" + String(theSynth, HEX);
  //aStr = "21" + EventToStr();
  //Serial.println(aStr);
  switch (theSynth) {
    case 1: { //Integra 
      Serial1.write(Events[eIndexT].c);    
      Serial1.write(Events[eIndexT].n);
      Serial1.write(Events[eIndexT].v);
      break;
    }  
    case 2: { //SC-88
      Serial2.write(Events[eIndexT].c);    
      Serial2.write(Events[eIndexT].n);
      Serial2.write(Events[eIndexT].v);
      //aStr = "21YYYYY" + String(theSynth, HEX);
      //Serial.println(aStr);
      break;
    }  
    case 3: { //SC-88 Old default
      Serial2.write(Events[eIndexT].c);    
      Serial2.write(Events[eIndexT].n);
      Serial2.write(Events[eIndexT].v);
      break;
    }  
    case 4: { //From event array back to computer
      if (Events[eIndexT].c == 0x02) {
        if (Events[eIndexT].n == 0xFF) {
          Serial.println("PageF");
          //break;
        }  
        if (Events[eIndexT].n == 0xBB) {
          Serial.println("PageB");
          //break;
        }  
      }
      break;
    }  
  }   
}


void PlayEventsAuto() {    //Not currently used
long DeltaTime = 0;
  //Serial.print(AutoPlay);
  if (millis() >= ST.NextTime) {
    //Set the ST.TimeNextEvent
    DeltaTime = GetDeltaTime(eIndexT);
    //Serial.println(DeltaTime);
    ST.NextTime = ST.NextTime + DeltaTime;
    incIndex('T'); //Get past timing record
    
    while (Events[eIndexT].s != 0) {
      //Play uninterrupted the current batch of notes
      //Serial.println(LastVel);
      //No attempt to alter the volume when auto-playing
      SendNote(eIndexT);
      incIndex('T'); //Ahead to the next one
    }
    //No need here to test for auto-trig
  }
}


void PlayThisBatch() {
  while (Events[eIndexT].s != 0) { //Send this group
    if ((Events[eIndexT].c > 0x8F) && (Events[eIndexT].c < 0xA0)) {
      //For note-on cmds only, modifying the velocity
      //Events[eIndexT].v = ThisVel;  
      //Events[eIndexT].v = PedlVel;
      Events[eIndexT].v = ThisVel * PedlFactor;
    }  
    SendNote(eIndexT);
    incIndex('T');
  } 
}  


void PlayTriggeredEventsAuto() {
  if (millis() >= ST.NextTime) {
    //Do not have to calculate ST.SpeedFactor
    //Get set for the ST.NextTime
    ST.ThisTime = millis();
    ST.ThisDelta = Events[eIndexT].n * 256;
    ST.ThisDelta = ST.ThisDelta + Events[eIndexT].v;
    incIndex('T'); //Get past timing record
    PlayThisBatch();
    ST.NextTime = ST.ThisTime + (ST.ThisDelta * Delta2Millis * ST.SpeedFactor); 
    ST.PrevDelta = ST.PrevDelta + ST.ThisDelta;
  }
}


void PacketComplete(String SerStr) {
//Direct program flow
String aStr;
char aChr;
byte abyte;
  //Serial.println(SerStr);
  aChr = SerStr[0];
  //Serial.println(aChr);
  switch (aChr) {
  case '0': //something for arduino to do
    aChr = SerStr[1];
    switch (aChr) { //Second char in SerStr
    case '0' ... '4': //Which synth
      PokeEventArray(SerStr);
      break;
    case '5': //Play, or pause
      aChr = SerStr[2]; //Third char
      switch (aChr) {
      case '0': //050  Pause
        MuteAllChannels();
        AutoPlay = false;
        Serial.println("Head "  + (String(eIndexH)));
        Serial.println("Tail "  + (String(eIndexT)));
        //Serial.println("Events used "  + (String(freeMemory())));
        Serial.println("Events used "  + (String(EventsUsed)));
        break;
      case '1': //051  Play the event array
        ST.NextTime = millis(); 
        AutoPlay = true;
        break;
      }
      break;
    case '6': //Peek or poke a port 
      //Serial.println("Port set"); 
      PeekPokePort(SerStr);
      break;
    case '7':
      aChr = SerStr[2]; //Third char
      switch (aChr) {
      case '0': //070  Reset event array pointers
        eIndexH = -1;
        eIndexT = 0;
        //Get number from the packet
        EventsUsed = HexStrToByte(SerStr, 2) * 65536; 
        EventsUsed = EventsUsed + (HexStrToByte(SerStr, 3) * 256); 
        EventsUsed = EventsUsed + HexStrToByte(SerStr, 4); 
        break;
      case '1': //071
        //Allow pointer
        PointerAllowed = true;
        break;
      case '2': //072
        PointerAllowed = false;
        break;
      }  
    } //End inside switch
    break;
  case '1':
    StraightToSynth(SerStr);
    break;
  case '3': //Directing keyboard's data
    aChr = SerStr[1];
    switch (aChr) {
    case '0':
      //KeyboardIsTrigger = false;
      abyte = HexStrToByte(SerStr, 4);
      KeyboardTriggers = abyte;
      digitalWrite(led, LOW);
      break;
    //case '1':  
    //  KeyboardIsTrigger = true;
    //  digitalWrite(led, HIGH);
    //  break;
    }  
  break;  
    
  case '4': //Directing guitar's data
    aChr = SerStr[1];
    switch (aChr) {
    case '0':
      GuitarIsTrigger = false;
      digitalWrite(led, LOW);
      break;
    case '1':  
      GuitarIsTrigger = true;
      digitalWrite(led, HIGH);
      break;
    }  
    break;
  } //End outside switch
}


void CheckIncomingComp() { //From computer
String aStr;
  if (Serial.available() > 0) {
    char ChrRead = Serial.read();
    SerStr1 = SerStr1 + ChrRead;
    //Serial.println(SerStr1.length());
    if (SerStr1.length() > 7) {
      //Serial.println(SerStr1);
      PacketComplete(SerStr1);
      SerStr1 = "";
    }  
  }
}


void CheckIncomingKybd() { //From music keyboard
String aStr;
long DeltaTime = 0;
  if (Serial1.available() > 0) { 
    char KbdRead = Serial1.read();
    //Serial.println(KeyboardTriggers);
    switch (KeyboardTriggers) {
      case 1: Serial1.write(KbdRead);
              goto DoNot;
              break;
      case 2: Serial2.write(KbdRead);
              goto DoNot;
              break;
    }
    aStr = String(KbdRead, HEX);  
    if (aStr.substring(0, 3) == "ff9") {
      SerStr2 = aStr;
      bCount = 1;
      goto DoNot;}
    if (bCount == 1) {
      SerStr2 = SerStr2 + aStr;
      bCount = 2;
      goto DoNot;}
    if (bCount == 2) { 
      SerStr2 = SerStr2 + aStr;
      //Serial.println(SerStr2);
      
      SerStr2 = ""; //This third byte is the velocity
      ThisVel = KbdRead;
      bCount = 0;
      if (ThisVel == 0) {//Note on cmd, but zero vel
        goto DoNot;}
      LastVel = ThisVel; //LastVel used when auto playing

      if (Events[eIndexT].c == 0x01) { //If there was an auto that has not played, do it now
        //Especially good for slurred or staccato notes that have not turned off
        incIndex('T');
        PlayThisBatch();
      }

      ST.ThisTime = millis();
      ST.ThisDelta = Events[eIndexT].n * 256;
      ST.ThisDelta = ST.ThisDelta + Events[eIndexT].v;
      incIndex('T');
      PlayThisBatch();

      //ST.SpeedFactor = ((float)ST.PrevDelta * (float)Delta2Millis) / (float)(ST.ThisTime - ST.LastTime);
      if (ST.PrevDelta > 0)
        ST.SpeedFactor = (float)(ST.ThisTime - ST.LastTime) / ((float)ST.PrevDelta * (float)Delta2Millis);
      if (ST.SpeedFactor < 0.3 || ST.SpeedFactor > 3) 
        ST.SpeedFactor = 1; //In case of a long pause before continuing
      //Serial.println(ST.SpeedFactor);

      ST.NextTime = ST.ThisTime + ((float)ST.ThisDelta * (float)Delta2Millis * (float)ST.SpeedFactor); 
      ST.LastTime = ST.ThisTime;
      ST.PrevDelta = ST.ThisDelta;
      //Serial.println(ST.TimeNextEvent);
      ToggleLed();
    }  
DoNot:
    aStr = ""; //Need something after a label
  } 
}  

/*
void CheckIncomingPntr() {
String aStr;
long DeltaTime = 0;
  if (ReceiveState != prevReceiveState) { //From laser pointer 
    //Comes in here whether going on or off
    if (!ReceiveState) {
      if (PointerOn) {
        if (ST.ThisDelta > 0) {
          ST.SpeedFactor = (float)(millis() - ST.ThisTime) / (float)ST.ThisDelta;
          if (ST.SpeedFactor > 3) 
            ST.SpeedFactor = 1; //In case of a long pause before continuing
          //Serial.println(ST.SpeedFactor);
        }
        ST.ThisTime = millis();
        ST.ThisDelta = Events[eIndexT].n * 256;
        ST.ThisDelta = ST.ThisDelta + Events[eIndexT].v;
        incIndex('T');
        while (Events[eIndexT].s != 0) { //Send this group
          if ((Events[eIndexT].c > 0x8F) && (Events[eIndexT].c < 0xA0)) {
            //Events[eIndexT].v = Events[eIndexT].v * PedlFactor;
            Events[eIndexT].v = PedlVel;
          }  
          SendNote(eIndexT);
          incIndex('T');
        } 
        ST.NextTime = ST.ThisTime + (ST.ThisDelta * ST.SpeedFactor); 
        //Serial.println(ST.TimeNextEvent);
        ToggleLed();
      }  
    }
    prevReceiveState = ReceiveState;
DoNot:
    aStr = ""; //Need something after a label
  }   
}
*/

void CheckIncomingPntr() {
String aStr;
long DeltaTime = 0;
  if (ReceiveState != prevReceiveState) { //From laser pointer 
    //Comes in here whether going on or off
    if (!ReceiveState) {
      if (PointerOn) {
        ST.ThisTime = millis();
        ST.ThisDelta = Events[eIndexT].n * 256;
        ST.ThisDelta = ST.ThisDelta + Events[eIndexT].v;
        incIndex('T');
        while (Events[eIndexT].s != 0) { //Send this group
          if ((Events[eIndexT].c > 0x8F) && (Events[eIndexT].c < 0xA0)) {
            //Events[eIndexT].v = Events[eIndexT].v * PedlFactor;
            Events[eIndexT].v = PedlVel;
          }  
          SendNote(eIndexT);
          incIndex('T');
        } 
        if (ST.PrevDelta > 0)
           ST.SpeedFactor = (float)(ST.ThisTime - ST.LastTime) / ((float)ST.PrevDelta * (float)Delta2Millis);
        if (ST.SpeedFactor < 0.3 || ST.SpeedFactor > 3) 
          ST.SpeedFactor = 1; //In case of a long pause before continuing
        ST.NextTime = ST.ThisTime + ((float)ST.ThisDelta * (float)Delta2Millis * (float)ST.SpeedFactor); 
        ST.LastTime = ST.ThisTime;
        ST.PrevDelta = ST.ThisDelta;
        ToggleLed();
      }  
    }
    prevReceiveState = ReceiveState;
DoNot:
    aStr = ""; //Need something after a label
  }   
}

void loop() {
  CheckIncomingComp();
  CheckExpressionPedal();
  //eIndexT allways points to a timing record
  //in this part of the sketch
  if (Events[eIndexT].c == 0x01) {
    PlayTriggeredEventsAuto();
  }
  CheckIncomingPntr();
  CheckIncomingKybd();
}


void IsrReceived() {
//Interrupt service routine. Executes pin D2 changes 
//For the LED pointer detector
  ReceiveState = !ReceiveState;  
}
