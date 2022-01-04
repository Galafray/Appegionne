/*
 Arpeggione
 Co-ordinates the computer, Music-keyboard, sound-modules, volume pedal, LED pointer and detector
 Written by George Cox of Code Research 
 
Use Alt Space to move this window on the Raspberry Pi

 Arduino Mega 2560
   USB    (Serial  I/O) Computer
   
   Pin 18 (Serial1 out) MIDI synth Integra)
   Pin 19 (Serial1  in) MIDI Keyboard 
   
   Pin 16 (Serial2 out) MIDI synth SC-88
   Pin 17 (Serial2  in) Roland GL-10
   
   //Pin 15 (Serial3  in) Pointer 
*/

 
// Global variables
//Pin assignments
const int exPressionPin = A15;
const int PointerPin = 22;
const int led = 13; //Pin 13 is the onboard led. 
const int ReceiverPin = 2;

const int EventSize = 600; //Max size of the array.
                           //Could be up to 750
struct EventRec {
  int synth; //Which synth, 1 to 3 
    //3 UARTs are available for synths on the mega.
    //If synth contains 0, it's a timimg record, not sent to a synth.
    //1 Integra
    //2 SC-88
    //3 SC-88 For backward compatability
    //4 Other commands
  int comm; //Command
  int note; //Pitch of note
  int velo; //Velocity
};
EventRec Events[EventSize]; 

long EventsUsed = 0;
int eIndexH = 11;  //Index to the Events array head. 11 is for the   
                  //end of the practice array below
                 //It points to the last event loaded 
int eIndexT = 0; //Index to the Events array tail.
                //Next one to be played

struct PointerRec { //And receiver
  boolean PointerAllowed;
  boolean PointerOn;
  volatile boolean ReceiveState;
  boolean prevReceiveState;
};
PointerRec Point;

struct PacketRec {
  int ByteCount = 0;
  int synth = 0;
  int comm = 0; //Command
  int note = 0; //Pitch of note
  int velo = 0; //Velocity
};
PacketRec Packet; //Four bytes in from the computer
PacketRec KbdPacket; //Three bytes in from the midi keyboard


struct TempoRec {
  //Used for setting Factor
  unsigned long ThisTime = 0; 
  int PrevDelta = 9;
  int ThisDelta = 0; //From note and velo fields of a timing record
  const float Delta2Millis = 25/24; // 1000 / 960 = 1.0417
  float Factor = 1.04;  //The larger Factor is, the slower the music
  unsigned long LastTime = 0;
  unsigned long NextTime = 0;
};
TempoRec Tempo;


struct VolumeRec {
  byte KybdVel = 0x40; //Velocity of note just played
  byte PrevKybdVel = 0x00;
  byte PedlVel = 0x00;
  float PedlFactor = 0.65; //The higher the value, the louder it is.
};
VolumeRec Vol;


struct TrillRec {
  boolean Trilling = false;
  int Parts = 1;
  int Period = 0;
  unsigned long Next;
  int Idx; //Index to tEvents
  EventRec tEvents[8]; 
};
TrillRec Trill;  //Use like this Trill.tEvents[3].synth = 2;


struct BendRec { //Bend-pitch used for trilling
  boolean Trilling = false;
  int synth = 1;
  int Period = 0;
  unsigned long Next;
  int Idx; //Index to tEvents
  EventRec tEvents[2]; 
};
BendRec Bend;  //Alternative way to trill


struct SwellRec { //Cresc, decresc
  boolean Swelling = false;
  int synth = 1;
  int Chnl = 0;
  int HoldCC7 = 0x6A;
  int CcMin = 0x5F;
  int CcMax = 0x7F;
  int CcGain = 1;
  int Period = 0;
  unsigned long Next;
};
SwellRec Swell;


byte KeyboardTriggers = 0; 
// 0 Default, plays event array. 
// 1 To Integra. 
// 2 To SC-88 


void setup() {
  pinMode(led, OUTPUT);  
  digitalWrite(led, LOW);
  pinMode(PointerPin, OUTPUT);
  digitalWrite(PointerPin, LOW);
  attachInterrupt(digitalPinToInterrupt(ReceiverPin), IsrReceived, CHANGE);
  Point.PointerAllowed = false;
  Point.PointerOn = false;
  Point.prevReceiveState = Point.ReceiveState; //Equal at start
  Serial.begin(9600);   //Serial with computer. 
                        //RPi cannot do 31250
  Serial.println("Arpeggione");                      
  //Set MIDI baud rates 
  Serial1.begin(31250); //Serial Keyboard In
                        //Serial to Integra-7 Out
  Serial2.begin(31250); //Roland GL-10 In 
                        //Roland SC-88 Out
  
//Some sample data for use with when developing
  Events[0].synth = 0x00; //Timing
  Events[0].comm = 0x00; //Initial delta time
  Events[0].note = 0x01;
  Events[0].velo = 0x90;

  Events[1].synth = 0x02; //Which synth
  Events[1].comm = 0x90; //For playing middle C
  Events[1].note = 0x3C; //C3
  Events[1].velo = 0x50; //Velocity
  
  Events[2].synth = 0x00; //Timing
  Events[2].comm = 0x00; //Next delta time
  Events[2].note = 0x01;
  Events[2].velo = 0x90;
  
  Events[3].synth = 0x02; //Which synth
  Events[3].comm = 0x80; //For Stoping middle C
  Events[3].note = 0x3C;
  Events[3].velo = 0x00;  

  Events[4].synth = 0x02; //Which synth
  Events[4].comm = 0x90; //For playing D
  Events[4].note = 0x3E;
  Events[4].velo = 0x50;
  
  Events[5].synth = 0x00; //Timing
  Events[5].comm = 0x00; //Next delta time
  Events[5].note = 0x06;
  Events[5].velo = 0x40;
  
  Events[6].synth = 0x02; //Which synth
  Events[6].comm = 0x80; //Silence D
  Events[6].note = 0x3E;
  Events[6].velo = 0x00;  

  Events[7].synth = 0x02; //Which synth
  Events[7].comm = 0x90; //For playing middle C
  Events[7].note = 0x3C; //C3
  Events[7].velo = 0x50; //Velocity
  
  Events[8].synth = 0x02; //Which synth
  Events[8].comm = 0x90; //For playing E3
  Events[8].note = 0x40; //E3
  Events[8].velo = 0x50; //Velocity

  Events[9].synth = 0x00; //Timing
  Events[9].comm = 0x00; //Delta time
  Events[9].note = 0x00; 
  Events[9].velo = 0x00; 
  
  Events[10].synth = 0x02; //Which synth
  Events[10].comm = 0x80; //Silence middle C
  Events[10].note = 0x3C; //C3
  Events[10].velo = 0x00; //Velocity
  
  Events[11].synth = 0x02; //Which synth
  Events[11].comm = 0x80; //Silence E
  Events[11].note = 0x40; //E3
  Events[11].velo = 0x00; //Velocity   

  //while (Serial1.available() > 0) { //Clear midi keyboard input buffer
  //  byte KbdRead = Serial1.read();
  //}  
}


void InitEventArray() {
  for (int Rec = 0; Rec < EventSize; Rec++) {
    Events[Rec].synth = 0x00; 
    Events[Rec].comm = 0x00; 
    Events[Rec].note = 0x00; 
    Events[Rec].velo = 0x00; 
  }
}


String IntToHexStr(int Numb) {
String theStr = "";
  if (Numb < 0x10) theStr = "0"; //Leading 0 
  theStr = theStr + String(Numb, HEX);
  theStr.toUpperCase();
  return theStr;
}


String EventToStr(int Idx) {
  String aStr = IntToHexStr(Events[Idx].synth);
  aStr = aStr + IntToHexStr(Events[Idx].comm);
  aStr = aStr + IntToHexStr(Events[Idx].note);
  aStr = aStr + IntToHexStr(Events[Idx].velo);
  return  aStr;
}


void ReportStatus() {  
String aStr;  
  aStr = IntToHexStr(Vol.PedlVel);
  Serial.print("Pedal ");  Serial.println(aStr);
  
  aStr = String(Vol.PedlFactor);
  Serial.print("PedlFactor ");  Serial.println(aStr);

  aStr = String(Tempo.Factor);
  Serial.print("TempoFactor ");  Serial.println(aStr);
  
  if (Point.PointerAllowed) {
    Serial.println("Pointer allowed");
  } else {
    Serial.println("Pointer not allowed");
  }

  Serial.print("Keyboard to ");
  switch (KeyboardTriggers) {
    case 0: Serial.println("array trigger"); break;
    case 1: Serial.println("Integra 7"); break;
    case 2: Serial.println("SC-88"); break;
  }
    
  aStr = IntToHexStr(eIndexH);
  Serial.print("eIndexH ");  Serial.println(aStr);
  
  aStr = IntToHexStr(eIndexT);
  Serial.print("eIndexT ");  Serial.println(aStr);
  
  for (int Ix = 0; Ix < 8; Ix++) {
    aStr = IntToHexStr(eIndexT + Ix);
    aStr = aStr + " ";
    aStr = aStr + EventToStr(eIndexT + Ix);
    Serial.println(aStr);  
  } 
  while (Serial1.available() > 0) { 
    byte KbdRead = Serial1.read();
    
  }  

  /* 
  Serial.print("Trilling ");  Serial.println(Trill.Trilling);  
  Serial.print("Parts ");  Serial.println(Trill.Parts);  
  Serial.print("Period ");  Serial.println(Trill.Period);  
  Serial.print("Idx ");  Serial.println(Trill.Idx);  
  for (int Ix = 0; Ix < 8; Ix++) {
    aStr = IntToHexStr(Trill.tEvents[Ix].synth); aStr = aStr + " ";
    aStr = aStr + IntToHexStr(Trill.tEvents[Ix].comm); aStr = aStr + " ";
    aStr = aStr + IntToHexStr(Trill.tEvents[Ix].note); aStr = aStr + " ";
    aStr = aStr + IntToHexStr(Trill.tEvents[Ix].velo); 
    Serial.println(aStr);  
  }  
  Serial.print("Bend-trill ");  Serial.println(Bend.Trilling);  
  Serial.print("Period ");  Serial.println(Bend.Period);  
  Serial.print("Synth ");  Serial.println(Bend.synth);  
  Serial.print("Idx ");  Serial.println(Bend.Idx);  
  for (int Ix = 0; Ix < 2; Ix++) {
    aStr = IntToHexStr(Bend.tEvents[Ix].synth); aStr = aStr + " ";
    aStr = aStr + IntToHexStr(Bend.tEvents[Ix].comm); aStr = aStr + " ";
    aStr = aStr + IntToHexStr(Bend.tEvents[Ix].note); aStr = aStr + " ";
    aStr = aStr + IntToHexStr(Bend.tEvents[Ix].velo); 
    Serial.println(aStr);  
  } 
  */ 
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
  Vol.PedlVel = ReadExp();
  if (abs(Vol.PedlVel - Vol.PrevKybdVel) > 2) {
    //Must vary by more than 2 to stop jitters
    if (Vol.PedlVel < 0x10) {
      Serial.print("EP01zz0"); //Leading naught
      digitalWrite(PointerPin, LOW);
      Point.PointerOn = false;
    } else  {
      Serial.print("EP01zz"); 
      if (Point.PointerAllowed) {
        digitalWrite(PointerPin, HIGH);
        Point.PointerOn = true;
      }  
    }  
    Serial.println(Vol.PedlVel, HEX);
    Vol.PrevKybdVel = Vol.PedlVel;
    Vol.PedlFactor = (float)Vol.PedlVel / (float)0x7F;
  }
}  


void PokeEventArray() {
  eIndexH = eIndexH + 1;  
  if (eIndexH == EventSize)  
    eIndexH = 0; //Wrap
  Events[eIndexH].synth = Packet.synth;
  Events[eIndexH].comm  = Packet.comm;
  Events[eIndexH].note  = Packet.note;
  Events[eIndexH].velo  = Packet.velo;
}


void incIndexT() {  
  //Each index pointer moves contiguously from 0 to EventSize, and then loops back
  EventsUsed = EventsUsed + 1;
  eIndexT = eIndexT + 1;    
  if (eIndexT == eIndexH + 1) { //Tortoise passes Hare
    MuteAllChannels();
    InitEventArray();
    eIndexH = -1;
    eIndexT = 0;
    EventsUsed = 0;
    String aStr = "200z0258"; //Ask for first records
    //Will get 600 initially, 300 after that
    Serial.println(aStr);      
  }
  if (eIndexT > EventSize - 1) { //Means we've overshot the array
    eIndexT = 0; //Wrap
    //break;
  }  
  if  ((eIndexH == 299) && (eIndexT == 0)) {
    String aStr = "201z012C"; //Ask for next lot of records
    //Got 600 initially, 300 after that
    Serial.println(aStr);
    //break;
  }  
  if  ((eIndexH == 599) && (eIndexT == 300)) {
    String aStr = "201z012C"; //Ask for next lot of records
    Serial.println(aStr);
  }  
}


void StraightToSynth() {
  switch(Packet.synth) {
  case 0x11: //To Integra
    Serial1.write(Packet.comm);    
    Serial1.write(Packet.note);
    Serial1.write(Packet.velo);
    break;
  case 0x12: //To SC-88
    Serial2.write(Packet.comm);    
    Serial2.write(Packet.note);
    Serial2.write(Packet.velo);
    break;
  }   
}


void MuteAllChannels() {
int Channel;  
byte Chn;
  for (Channel = 0; Channel <= 15; Channel++) {
    Chn = 0xB0 + Channel;
    Serial1.write(Chn);    
    Serial1.write(0x7B);
    Serial1.write((byte)0x00);
    
    Serial2.write(Chn);    
    Serial2.write(0x7B);
    Serial2.write((byte)0x00);
  }
}

void SendTrill(int Index) {  
  Trill.tEvents[Index].velo = Vol.KybdVel * Vol.PedlFactor;
  Trill.tEvents[Index + 4].velo = Trill.tEvents[Index].velo;
  switch (Trill.tEvents[Index].synth) {
    case 1: { //Integra 
      Serial1.write(Trill.tEvents[Index].comm);    
      Serial1.write(Trill.tEvents[Index].note);
      Serial1.write(Trill.tEvents[Index].velo); 
      if (Trill.Parts == 2) {
        Serial1.write(Trill.tEvents[Index + 4].comm);    
        Serial1.write(Trill.tEvents[Index + 4].note);
        Serial1.write(Trill.tEvents[Index + 4].velo);        
      }
      break;
    }  
    case 2: { //SC-88
      Serial2.write(Trill.tEvents[Index].comm);    
      Serial2.write(Trill.tEvents[Index].note);
      Serial2.write(Trill.tEvents[Index].velo);
      if (Trill.Parts == 2) {
        Serial2.write(Trill.tEvents[Index + 4].comm);    
        Serial2.write(Trill.tEvents[Index + 4].note);
        Serial2.write(Trill.tEvents[Index + 4].velo);        
      }
      break;
    }  
  }
}


void SendBendTrill(int Index) {  
  //Bend.tEvents[Index].velo = Vol.KybdVel * Vol.PedlFactor;
  switch (Bend.synth) {
    case 1: { //Integra 
      Serial1.write(Bend.tEvents[Index].comm);    
      Serial1.write(Bend.tEvents[Index].note);
      Serial1.write(Bend.tEvents[Index].velo); 
      break;
    }  
    case 2: { //SC-88
      Serial2.write(Bend.tEvents[Index].comm);    
      Serial2.write(Bend.tEvents[Index].note);
      Serial2.write(Bend.tEvents[Index].velo);
      break;
    }  
  }
}


void SendNote(int Index) {  //What's the point of passing an index number?
String aStr; //Plays a MIDI note. Doesn't check data values
  //aStr = EventToStr(eIndexT);
  //Serial.println(aStr);
  byte theSynth = Events[eIndexT].synth;
  switch (theSynth) {
    case 1: { //Integra 
      Serial1.write(Events[eIndexT].comm);    
      Serial1.write(Events[eIndexT].note);
      Serial1.write(Events[eIndexT].velo);
      break;
    }  
    case 2: { //SC-88
      Serial2.write(Events[eIndexT].comm);    
      Serial2.write(Events[eIndexT].note);
      Serial2.write(Events[eIndexT].velo);
      //aStr = "21YYYYY" + String(theSynth, HEX);
      //Serial.println(aStr);
      break;
    }  
    case 3: { //SC-88 Old default
      Serial2.write(Events[eIndexT].comm);    
      Serial2.write(Events[eIndexT].note);
      Serial2.write(Events[eIndexT].velo);
      break;
    }  
    case 4: { 
      if (Events[eIndexT].comm == 0x02) {
        //From event array back to computer
        if (Events[eIndexT].note == 0xFF) {
          Serial.println("PageF");
          //break;
        }  
        if (Events[eIndexT].note == 0xBB) {
          Serial.println("PageB");
          //break;
        }  
      }
      if (Events[eIndexT].comm == 0xFE) {
        //Load the Trill record
        Trill.Parts = Events[eIndexT].note;
        Trill.Period = Events[eIndexT].velo;
        //Trill.Idx = 0; //Index to tEvents
        //incIndexT();
        for (Trill.Idx = 0; Trill.Idx < ((4 * Trill.Parts)); Trill.Idx++) { //Four events, or eight
          incIndexT();
          Trill.tEvents[Trill.Idx].synth = Events[eIndexT].synth;
          Trill.tEvents[Trill.Idx].comm = Events[eIndexT].comm;
          Trill.tEvents[Trill.Idx].note = Events[eIndexT].note;
          Trill.tEvents[Trill.Idx].velo = Events[eIndexT].velo;
        }
        Trill.Idx = 0;
        Serial.print("Trill loaded ");
        Serial.println(4 * Trill.Parts);
        return;
      }
      if (Events[eIndexT].comm == 0xFD) {
        //Turn trill on
        Trill.Next = millis() + Trill.Period; 
        //Play the first on event
        Trill.Idx = 0; //Idx only gets as high as 3
        SendTrill(Trill.Idx); //CheckTrilling will keep it going
        if (Trill.Parts == 2) SendTrill(Trill.Idx + 4); 
        Trill.Trilling = true;
        Serial.println("Trill start");
        return;
      }
      if (Events[eIndexT].comm == 0xFC) {
        //Turn trill off
        Trill.Idx = Trill.Idx + 1;
        //Trill.Idx will now be 1 or 3 which are off events;
        SendTrill(Trill.Idx);
        if (Trill.Parts == 2) SendTrill(Trill.Idx + 4); 
        Trill.Trilling = false;
        Serial.println("Trill end");
      }
      if (Events[eIndexT].comm == 0xEF) {
        //Load the Trill record
        Bend.synth = Events[eIndexT].note;
        Bend.Period = Events[eIndexT].velo;
        //Bend.Idx = 0; //Index to tEvents
        for (Bend.Idx = 0; Bend.Idx < 2; Bend.Idx++) { //Two events
          incIndexT();
          Bend.tEvents[Bend.Idx].synth = Events[eIndexT].synth;
          Bend.tEvents[Bend.Idx].comm = Events[eIndexT].comm;
          Bend.tEvents[Bend.Idx].note = Events[eIndexT].note;
          Bend.tEvents[Bend.Idx].velo = Events[eIndexT].velo;
        }
        Bend.Idx = 0;
        Serial.println("Bend loaded ");
        return;
      }
      if (Events[eIndexT].comm == 0xEE) {
        //Turn trill on
        //Bend.Next = millis() + Bend.Period; 
        //Play the first on event
        Bend.Idx = 0; //Idx only gets as high as 3
        SendBendTrill(Bend.Idx); //CheckBending will keep it going
        //Bend.Next = millis() + Bend.Period; 
        Bend.Next = millis() + 0x8F; //Longish first trill
        Bend.Trilling = true;
        Serial.println("Bend-trill start");
        return;
      }
      if (Events[eIndexT].comm == 0xED) {
        //Turn trill off
        SendBendTrill(1);
        Bend.Trilling = false;
        Serial.println("Bend-trill end");
      }
     break;
    }  
  }   
}


void PlayThisBatch() {
  while (Events[eIndexT].synth != 0) { //Send this group
    if ((Events[eIndexT].comm > 0x8F) && (Events[eIndexT].comm < 0xA0)) {
      //For note-on cmds only, modifying the velocity
      //Events[eIndexT].velo = KybdVel;  
      //Events[eIndexT].velo = PedlVel;
      Events[eIndexT].velo = Vol.KybdVel * Vol.PedlFactor;
    }  
    SendNote(eIndexT);
    incIndexT();
  } 
  String aStr = "EU" + String(EventsUsed, HEX);
  Serial.println(aStr);
  //aStr = "TF" + String(Tempo.Factor);
  //Serial.println(aStr);    
}  


void PlayTriggeredEventsAuto() {
  if (millis() >= Tempo.NextTime) {
    //Do not have to calculate Tempo.Factor
    //Get set for the Tempo.NextTime
    Tempo.ThisTime = millis();
    Tempo.ThisDelta = Events[eIndexT].note * 256; //From the timing record
    Tempo.ThisDelta = Tempo.ThisDelta + Events[eIndexT].velo;
    incIndexT(); //Go past the timing record
    PlayThisBatch();
    Tempo.NextTime = Tempo.ThisTime + (Tempo.ThisDelta * Tempo.Delta2Millis * Tempo.Factor); 
    Tempo.PrevDelta = Tempo.PrevDelta + Tempo.ThisDelta;
  }
}


void CheckTrilling() {
  if (millis() < Trill.Next) return;
  Trill.Next = millis() + Trill.Period;
  Trill.Idx = Trill.Idx + 1;
  //Trill.Idx will now be 1 or 3 which are off events;
  SendTrill(Trill.Idx);
  Trill.Idx = Trill.Idx + 1; //Pointing to an on event
  if (Trill.Idx > 3) Trill.Idx = 0;
  //Now pointing to an on event
  SendTrill(Trill.Idx);
  if (Trill.Parts == 2) SendTrill(Trill.Idx + 4); 
}  


void CheckBendTrilling() {
  if (millis() < Bend.Next) return;
  Bend.Next = millis() + Bend.Period;
  Bend.Idx = Bend.Idx + 1;
  if (Bend.Idx > 1) Bend.Idx = 0;
  SendBendTrill(Bend.Idx);
}  


void SetTempoTime() {
  Tempo.ThisTime = millis();
  Tempo.ThisDelta = Events[eIndexT].note * 256;
  Tempo.ThisDelta = Tempo.ThisDelta + Events[eIndexT].velo;  
}

void SetTempoFactor() { //The larger Tempo.Factor is, the slower the music
float OldTempoFactor = (float)Tempo.Factor;
  if (Tempo.PrevDelta > 0) //Avoid division by naught
    Tempo.Factor = (float)(Tempo.ThisTime - Tempo.LastTime) / ((float)Tempo.PrevDelta * (float)Tempo.Delta2Millis);
  if (Tempo.Factor < 0.3 || Tempo.Factor > 3) 
    Tempo.Factor = 1; //In case of a long pause before continuing

  //Smooth out changes in Tempo.Factor
  Tempo.Factor = (float)Tempo.Factor + (float)OldTempoFactor;
  Tempo.Factor = (float)(Tempo.Factor / 2);

  Tempo.NextTime = Tempo.ThisTime + ((float)Tempo.ThisDelta * (float)Tempo.Delta2Millis * (float)Tempo.Factor); 
  Tempo.LastTime = Tempo.ThisTime;
  Tempo.PrevDelta = Tempo.ThisDelta;  
}


void CheckIncomingPntr() {
//String aStr;
//long DeltaTime = 0;
  if (Point.ReceiveState != Point.prevReceiveState) { //From laser pointer 
    //Comes in here whether going on or off
    if (!Point.ReceiveState) {
      if (Point.PointerOn) {

        //Added 13 Oct 2021 to improve Led pointer performance on Sukiyaki
        if (Events[eIndexT].comm == 0x01) { //If there was an auto that has not played, because
          //the player is too quick, play it now. Especially good for slurred or 
          //staccato notes that have not turned off
          incIndexT();
          while (Events[eIndexT].synth != 0) { //Send this group
            if ((Events[eIndexT].comm > 0x8F) && (Events[eIndexT].comm < 0xA0)) {
              //Events[eIndexT].velo = Events[eIndexT].v * PedlFactor;
              Events[eIndexT].velo = Vol.PedlVel;
            }  
            SendNote(eIndexT);
            incIndexT();
          } 
        }
        SetTempoTime();
        incIndexT();
        while (Events[eIndexT].synth != 0) { //Send this group
          if ((Events[eIndexT].comm > 0x8F) && (Events[eIndexT].comm < 0xA0)) {
            Events[eIndexT].velo = Vol.PedlVel; //Not PedlFactor 
          }  
          SendNote(eIndexT);
          incIndexT();
        } 
        String aStr = "EU" + String(EventsUsed, HEX);
        Serial.println(aStr);
        SetTempoFactor();
        ToggleLed();
      }  
    }
    Point.prevReceiveState = Point.ReceiveState;
  }   
}




void CheckIncomingComp() { //From computer
//String aStr;
  if (Serial.available() > 0) {
    byte bytRead = Serial.read();
    Packet.ByteCount = Packet.ByteCount + 1;
    switch (Packet.ByteCount) {
    case 1:
      Packet.synth = bytRead;
      break;  
    case 2:
      Packet.comm = bytRead;
      break;  
    case 3:
      Packet.note = bytRead;
     break;  
    case 4:
      Packet.velo = bytRead;
      //Serial.println("PacketComplete");
      //EchoPacket();
      PacketComplete();
      Packet.ByteCount = 0;
      break;  
    }  
  }
}

void KbdPacketComplete() {
  //String aStr = IntToHexStr(KbdPacket.comm);
  //aStr = aStr + IntToHexStr(KbdPacket.note);
  //aStr = aStr + IntToHexStr(KbdPacket.velo);
  //Serial.println(aStr);
  switch (KbdPacket.comm) {
  case 0x90 ... 0x9F: //Kbd key down. Ignoring everything else
    Vol.KybdVel = KbdPacket.velo;
    if (Vol.KybdVel == 0) {//Note on cmd, but zero vel
      return;
      break;
    }  
    if (Events[eIndexT].comm == 0x01) { //If there was an auto that has not played, because
      //the player is too quick, play it now. Especially good for slurred or 
      //staccato notes that have not turned off
      incIndexT();
      PlayThisBatch();
    }
    SetTempoTime();
    incIndexT();
    PlayThisBatch();
    SetTempoFactor();    
    break;
  }  
} 
  
void CheckIncomingKybd() { //From music keyboard
//String aStr;
//long DeltaTime = 0;
  if (Serial1.available() > 0) { 
    byte KbdRead = Serial1.read();
    //Read as unsigned byte
    switch (KeyboardTriggers) {
    case 1: Serial1.write(KbdRead);
      //Serial.println(IntToHexStr(KbdRead));
      return;
      break;
    case 2: Serial2.write(KbdRead);
      return;
      break;
    }
    KbdPacket.ByteCount = KbdPacket.ByteCount + 1;
    switch (KbdPacket.ByteCount) {
    case 1:
      KbdPacket.comm = KbdRead;
      break;  
    case 2:
      KbdPacket.note = KbdRead;
      break;  
    case 3:
      KbdPacket.velo = KbdRead;
      //EchoPacket();
      KbdPacketComplete();
      KbdPacket.ByteCount = 0;
      break;  
    }  
  }
}


void EchoPacket() { //Back to the computer
  String aStr = IntToHexStr(Packet.ByteCount);
  aStr = aStr + IntToHexStr(Packet.synth);
  aStr = aStr + IntToHexStr(Packet.comm);
  aStr = aStr + IntToHexStr(Packet.note);
  aStr = aStr + IntToHexStr(Packet.velo);
  Serial.println(aStr);
}


void PacketComplete() { //From the computer. Direct the data flow
  switch (Packet.synth) {
  case 0 ... 4: //something for arduino to do
    PokeEventArray();
    break;
  case 5: 
    Trill.Trilling = false;
    MuteAllChannels();
    break;
  case 6: //
    //OnboardLed();
    ToggleLed();
    break;
  case 7: //Reset event-array pointers
    eIndexH = -1;
    eIndexT = 0;
    //Get number from the packet
    EventsUsed = Packet.comm * 65536; 
    EventsUsed = EventsUsed + (Packet.note * 256); 
    EventsUsed = EventsUsed + Packet.velo; 
    break;
  case 8: //LED Pointer
    if (Packet.velo == 1) 
      Point.PointerAllowed = true;
    else 
      Point.PointerAllowed = false;
    break;
  case 9:
    ReportStatus();
    break;
  case 0x11 ... 0x12:
    StraightToSynth();
    break;
  case 0x30: //Directing keyboard's output
    KeyboardTriggers = Packet.velo; 
    digitalWrite(led, LOW);
    break;
  } //End switch
}


void loop() {
  CheckIncomingComp();
  CheckExpressionPedal();
  if (Events[eIndexT].comm == 0x01) { //eIndexT always points to a timing record in this part of the sketch
    PlayTriggeredEventsAuto();
  }
  CheckIncomingPntr();
  CheckIncomingKybd();
  if (Trill.Trilling) CheckTrilling();
 if (Bend.Trilling) CheckBendTrilling();
}


void IsrReceived() {
//Interrupt service routine. Executes pin D2 changes 
//For the LED pointer detector
  Point.ReceiveState = !Point.ReceiveState;  
}
