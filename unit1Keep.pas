unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Unit2, Classes, Serial, SysUtils, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls, Grids, ExtCtrls, ComCtrls, Menus, StrUtils,
  DateUtils, mouseandkeyinput, LCLTYPE, ClipBrd, types;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnLoadMidiFile: TButton;
    btnMakeNoteList: TButton;
    btnOn: TButton;
    btnOff: TButton;
    btnParseArray: TButton;
    btnSave: TButton;
    btnSend: TButton;
    btnSortNoteList: TButton;
    btnStartArduino: TButton;
    btnStop: TButton;
    btnLoadNoteList: TButton;
    btnPause: TButton;
    btnFind: TButton;
    btnFindNote: TButton;
    btnFindNoteInList: TButton;
    btnSoundOff: TButton;
    btnLoad: TButton;
    btnGetChInst: TButton;
    btnChangeUsedChannel: TButton;
    btnMakeGM2: TButton;
    btnIntegra7Search: TButton;
    btnMakeGM: TButton;
    btnToIntegra: TButton;
    btnToArray: TButton;
    btnPostback: TButton;
    btnMakeAuto: TButton;
    btnLoadMusicXmlFile: TButton;
    btnMakeArdList: TButton;
    btnDeleteRow: TButton;
    btnToArduino: TButton;
    btnToMemEvents: TButton;
    btnInsertRow: TButton;
    btnGetSibelius: TButton;
    btnPageTurn: TButton;
    btnPageBreak: TButton;
    btnPractPoint: TButton;
    btnPractPrev: TButton;
    btnPractNext: TButton;
    cbPatch: TComboBox;
    cgChannel: TCheckGroup;
    cbAllowPointer: TCheckBox;
    edC2: TEdit;
    edC3: TEdit;
    edC4: TEdit;
    edFind: TEdit;
    edFIndNote: TEdit;
    edFindNoteInList: TEdit;
    edC1: TEdit;
    edAutoFrom: TEdit;
    edAutoTo: TEdit;
    edFromChn: TEdit;
    edToChn: TEdit;
    edSearchI7: TEdit;
    edStartEvent: TEdit;
    labChInst1: TLabel;
    labChInst10: TLabel;
    labChInst11: TLabel;
    labChInst12: TLabel;
    labChInst13: TLabel;
    labChInst14: TLabel;
    labChInst15: TLabel;
    labChInst2: TLabel;
    labChInst3: TLabel;
    labChInst4: TLabel;
    labChInst5: TLabel;
    labChInst6: TLabel;
    labChInst7: TLabel;
    labChInst8: TLabel;
    labChInst9: TLabel;
    Label1: TLabel;
    labAttrib: TLabel;
    labChInst0: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    labUsedEvents: TLabel;
    labEventsUsed: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    labRow: TLabel;
    labVol0: TLabel;
    labVol1: TLabel;
    labVolA: TLabel;
    labVol2: TLabel;
    labVol3: TLabel;
    labVol4: TLabel;
    labVol5: TLabel;
    labVol6: TLabel;
    labVol7: TLabel;
    labVol8: TLabel;
    labVol9: TLabel;
    labVolB: TLabel;
    labVolC: TLabel;
    labVolD: TLabel;
    labVolE: TLabel;
    labVolF: TLabel;
    labVolume: TLabel;
    labFineVolume: TLabel;
    labInst1: TLabel;
    labInst2: TLabel;
    labInst3: TLabel;
    labStarted: TLabel;
    labStatus: TLabel;
    lbReceived: TListBox;
    lbMidiNotes: TListBox;
    memEvents: TMemo;
    memXml: TMemo;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    ProgressBar1: TProgressBar;
    rbPhas: TRadioButton;
    rbDel: TRadioButton;
    rbCho: TRadioButton;
    rbTrem: TRadioButton;
    rbRev: TRadioButton;
    rbVDel: TRadioButton;
    rbVdep: TRadioButton;
    rbVra: TRadioButton;
    rbDec: TRadioButton;
    rbFil: TRadioButton;
    rbAtt: TRadioButton;
    rbRel: TRadioButton;
    rbTim: TRadioButton;
    rbVar: TRadioButton;
    rgAttrib: TRadioGroup;
    rgKeyboard: TRadioGroup;
    sgEventTable: TStringGrid;
    sgMidiTable: TStringGrid;
    sgIntegra7: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    UpDn1: TUpDown;
    UpDn2: TUpDown;
    UpDn3: TUpDown;
    udMove: TUpDown;


    procedure btnChangeUsedChannelClick(Sender: TObject);
    procedure btnDeleteRowClick(Sender: TObject);
    procedure btnGetSibeliusClick(Sender: TObject);
    //procedure btnGotoClick(Sender: TObject);
    procedure btnInsertRowClick(Sender: TObject);
    procedure btnMakeAutoClick(Sender: TObject);
    procedure btnMakeGM2Click(Sender: TObject);
    procedure btnMakeGMClick(Sender: TObject);
    procedure btnPageBreakClick(Sender: TObject);
    procedure btnPageTurnClick(Sender: TObject);
    procedure btnPostbackClick(Sender: TObject);
    procedure btnPractPointClick(Sender: TObject);
    procedure btnPractPrevClick(Sender: TObject);
    procedure btnPractNextClick(Sender: TObject);
    procedure btnToArduinoClick(Sender: TObject);
    procedure btnToIntegraClick(Sender: TObject);
    procedure btnToArrayClick(Sender: TObject);
    procedure btnToMemEventsClick(Sender: TObject);
    procedure cbAllowPointerChange(Sender: TObject);
    procedure EditNoteRow(Sender: TObject);
    procedure edStartEventDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GetChInst();
    procedure btnGetChInstClick(Sender: TObject);
    procedure labEventsUsedClick(Sender: TObject);
    procedure labFineVolumeClick(Sender: TObject);
    procedure labUsedEventsClick(Sender: TObject);
    procedure labVolumeClick(Sender: TObject);
    procedure OnProgramStart(Sender: TObject);
    procedure AllSoundOff(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnFindNoteClick(Sender: TObject);
    procedure labAttribClick(Sender: TObject);
    procedure LoadNoteList;
    procedure btnLoadNoteListClick(Sender: TObject);
    procedure btnOnClick(Sender: TObject);
    procedure btnOffClick(Sender: TObject);
    procedure btnPauseClick(Sender: TObject);
    procedure btnLoadClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure cbPatchChange(Sender: TObject);
    procedure FindNoteInList(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SearchI7List(Sender: TObject);
    procedure SetInstrument(Sender: TObject);
    procedure sgEventTableDblClick(Sender: TObject);
    procedure ThroughOrTrigger();
    procedure rgGuitarClick(Sender: TObject);
    procedure rgKeyboardClick(Sender: TObject);
    procedure Transmit(s: string);
    procedure SendIt;
    procedure btnSendClick(Sender: TObject);
    procedure DisplayExpression(ComIn: string);
    procedure DisplayEventsUsed(ComIn: string);
    procedure ActionAsk(ComIn: string);
    procedure btnStartArduinoClick(Sender: TObject);
    procedure SendNote();
    //procedure btnToSynth(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure ClearReceived(Sender: TObject);
    procedure SortNoteListClick(Sender: TObject);
    function FourByteStr(b0, b1, b2, b3: byte): String;
    procedure PanTremMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure MakeAttribString;
    procedure udMoveClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDn1Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDn2Click(Sender: TObject; Button: TUDBtnType);
    procedure UpDn3Click(Sender: TObject; Button: TUDBtnType);
    function VLN(var midIx: integer): LongInt;
    procedure LoadMidiFile;
    procedure LoadMidiFileClick(Sender: TObject);
    procedure DisplayEventGrid();
    procedure MakeNoteList(Sender: TObject);
    procedure ParseArray(Sender: TObject);

    procedure btnLoadMusicXmlFileClick(Sender: TObject);
    procedure PutInstrumentDetails(ThisInstrument: string; PartNumber: integer);
    procedure btnMakeArdListClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

  TrackType = Record
    Number: integer;
    trackStart: integer; {Where in the midi-file}
    trackEnd: integer;
    eventStart: integer; {Where in the Event array}
    eventEnd: integer;
  end;

  EventType = Record
    DeltaTime: LongInt; {The time from previous. The VLN (variable length number)}
    RunningDelta: LongInt; {Sum of previous deltas for this track}
    WhichSynth: integer;
    Byte1: byte; {Channel}
    Byte2: byte; {Note}
    Byte3: byte; {Velocity}
    Sort: integer; {The order the array is to be played}
  end;

  InstrumentType = record {Used when getting data}
    PartNumber: integer; {From <part id="P1">}
    SoundName: string; {Bb Clarinet}
    TransposeChromatic: integer; {Add to pitch}
    Volume: integer;
  end;

  InstrumentXmlType = record
    Name: string;
    IntegraNo: integer;
  end;

  txMidiOutRec = record
    ReplyingToAsk: boolean;
    StartEvent: LongInt;
    LastEvent: LongInt;
    Many: LongInt;
  end;

const
  Cr = #13;
  Lf = #10;
  xmlInstCount = 3;

var  {Global}
  Form1: TForm1;
  SerialHandle: LongInt;
  glSerialRunning: Boolean;
  ComIn: String;
  midiArr: array of byte;
  midArrLen: longInt;
  midArrIx: longInt; {Index to midArr}

  midiFileName: string;
  ardFileName: string;
  xmlFilename: string;

  trackCount: integer;
  trackRecArray: array of TrackType;
  trackIndex: integer;

  clicksPerCrotchet: longInt; {Sometimes known as PPQ or PPQN
    pulses per quarter note}
  CrotchetsPerBar: longint;
  BeatsPerBar: integer;

  EventRecArray: array of EventType;
  EventCount: longint;
  EventIx: longint; {Index to EventRecArray}

  LastEventIxToArduino: longint;

  MidiNoteVals: array [0..120] of string[4];
  InstArraySC88: array [0..415-1] of string;

  xmlInstruments: array [0..xmlInstCount - 1] of InstrumentXmlType;
  sgEventIndex: integer;

  Part: array[1..16] of InstrumentType; {For xml data}
  //StartTimeRunning: longInt;

  txMidiOut: txMidiOutRec;

  //EventNumbGl: integer;

implementation

{$R *.lfm}

procedure Delay(aMilliSeconds: dWord);
var DW: dWord;
begin
  DW := GetTickCount64;
  while (GetTickCount64 < DW + aMilliSeconds) and
   (not Application.Terminated) do begin
     Application.ProcessMessages;
   end;
end;

Function MsB(Delta: integer): integer;
begin
  MsB := Delta and $FF00;
  MsB := MsB div $FF;
end;


Function LsB(Delta: integer): integer;
begin
  LsB := Delta and $FF;
end;


function GetTag(aStr: string) : string;
var  {Brackets not stripped off}
  aPos1, aPos2: integer;
begin
  GetTag := ''; {Default}
  aPos1 := Pos('<',aStr);
  aPos2 := Pos('>',aStr);
  GetTag := midStr(aStr, aPos1, aPos2 - aPos1 + 1)
end;


function ExtractInstrumentName(aStr: string): string;
{Assumes that aStr does have an instrument name}
var
  Pos1, Pos2: integer;
begin
  ExtractInstrumentName := 'Not found';
  //Pos1 := 19; {Already known}
  Pos1 := Pos('>', aStr) + 1;
  Pos2 := nPos('<', aStr, 2);
  ExtractInstrumentName := midStr(aStr, Pos1, Pos2 - Pos1);
end;


function ExtractChromatic(aStr: string): integer;
{<chromatic>-2</chromatic>}
var
  Pos1, Pos2: integer;
  Hold: String;
begin
  ExtractChromatic := 0;
  Pos1 := Pos('>', aStr) + 1;
  Pos2 := nPos('<', aStr, 2);
  Hold := midStr(aStr, Pos1, Pos2 - Pos1);
  ExtractChromatic := StrToInt(Hold);
end;


function ExtractPartNumber(aTag: string): integer;
{Like <score-part id="P1"> , <part id="P12">}
{Returns 1..16}
var
  Pos1: integer;
  Hold: string;
begin
  Pos1 := Pos('id="P', aTag) + 5;
  Hold := midStr(aTag, Pos1, 2);
  if Hold[2] = '"' then
    ExtractPartNumber := StrToInt(Hold[1])
  else
    ExtractPartNumber := StrToInt(Hold[1..2]);
end;

function ExtractNote(aStr: string): string;
{<step>D</step>}
begin
  ExtractNote := aStr[7];
end;

function ExtractVolume(aStr: string): Integer;
{<volume>78.7402</volume>}
var
  Pos1, Pos2: integer;
  Vol: real;
  Hold: string;
begin
  //ExtractVolume := 0;
  Pos1 := Pos('>', aStr) + 1;
  Pos2 := nPos('<', aStr, 2);
  Hold := midStr(aStr, Pos1, Pos2 - Pos1);
  Vol := StrToFloat(Hold);
  Vol := $7F * (Vol / 100);
  ExtractVolume := Round(Vol);
end;

function ExtractAlter(aStr: string): integer;
{<alter>1</alter>}
{Alters the note chromatically}
var
  Pos1, Pos2: integer;
  Hold: String;
begin
  ExtractAlter := 0;
  Pos1 := Pos('>', aStr) + 1;
  Pos2 := nPos('<', aStr, 2);
  Hold := midStr(aStr, Pos1, Pos2 - Pos1);
  ExtractAlter := StrToInt(Hold);
end;


function ExtractOctave(aStr: string): string;
{<octave>5</octave>}
begin
  ExtractOctave := aStr[9];
end;


function GetMidiNote(Note, Octave: string): integer;
var
  Index: integer;
begin
  GetMidiNote := 0; {Default}
  {Put Note into same format as the MidiNoteVals array}
  Note := Note + ' ' + Octave;
  for Index := 0 to 120 do begin
    if MidiNoteVals[Index] = Note then begin
      GetMidiNote := Index;
      break;
    end;
  end;
end;

function ExtractDuration(aStr: string): integer;
{<duration>256</duration>}
var
  Pos1, Pos2: integer;
  Hold: String;
begin
  ExtractDuration := 0;
  Pos1 := Pos('>', aStr) + 1;
  Pos2 := nPos('<', aStr, 2);
  Hold := midStr(aStr, Pos1, Pos2 - Pos1);
  ExtractDuration := StrToInt(Hold);
end;



{ TForm1 }


function TForm1.FourByteStr(b0, b1, b2, b3: byte): String;
{All data sent to arduino will be an 8 byte string representing
4 bytes in hex string format.}
var Hold: string;
begin
  Hold := HexStr(b0, 2) + HexStr(b1, 2) + HexStr(b2, 2) + HexStr(b3, 2);
  Result := Hold;
end;

procedure TForm1.PanTremMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var GoodShake: integer;
    s: string;
begin
  {Just experimenting}
  //Y := Y div 2;
  GoodShake := X * 2; {Width of panel is 63, so range is 2 to 126}
  labStatus.Caption := inttostr(GoodShake);
  if glSerialRunning then
  begin
    s := '13FFB007';
    Transmit(s);
    s := '11';
    s := s + HexStr(GoodShake, 2) + 'zzzz';
    Transmit(s);
  end;
end;


procedure TForm1.MakeAttribString;
var Chn: byte;
  s: String;
begin
  s := '';
  {Update the string for Arduino in labAttrib}
  {Which channel?}
  for Chn := 0 to $0F do begin
    if cgChannel.Checked[Chn] then
    begin
      s := s + '11'; {Address packet to Arduino}
      //s := '12'; {For SC-88}
      s :=s + 'B' + HexStr(Chn, 1);

      {Which Attrib?}
      if rbVar.Checked then s := s + HexStr(rbVar.Tag, 2);
      if rbRel.Checked then s := s + HexStr(rbRel.Tag, 2);
      if rbFil.Checked then s := s + HexStr(rbFil.Tag, 2);
      if rbVra.Checked then s := s + HexStr(rbVar.Tag, 2);
      if rbVDel.Checked then s := s + HexStr(rbVDel.Tag, 2);
      if rbTrem.Checked then s := s + HexStr(rbTrem.Tag, 2);
      if rbDel.Checked then s := s + HexStr(rbDel.Tag, 2);
      if rbTim.Checked then s := s + HexStr(rbTim.Tag, 2);
      if rbAtt.Checked then s := s + HexStr(rbAtt.Tag, 2);
      if rbDec.Checked then s := s + HexStr(rbDec.Tag, 2);
      if rbVdep.Checked then s := s + HexStr(rbVdep.Tag, 2);
      if rbRev.Checked then s := s + HexStr(rbRev.Tag, 2);
      if rbCho.Checked then s := s + HexStr(rbCho.Tag, 2);
      if rbPhas.Checked then s := s + HexStr(rbPhas.Tag, 2);
      s := s + HexStr(UpDn1.Position, 2);
    end;
  end;
  labAttrib.Caption := s;
  Clipboard.AsText := s;
end;

procedure TForm1.udMoveClick(Sender: TObject; Button: TUDBtnType);
var
  CurrRow: longInt;
  HoldEvent: EventType;
begin
  {Adjust the position of the current event in the array}
  CurrRow := sgEventTable.Row;
  case Button of
    btPrev: begin {Actually, next}
      HoldEvent := EventRecArray[CurrRow + 1];
      EventRecArray[CurrRow + 1] := EventRecArray[CurrRow];
      sgEventTable.Row := CurrRow + 1;
    end;
    btNext: begin {Actually, prev}
      HoldEvent := EventRecArray[CurrRow - 1];
      EventRecArray[CurrRow - 1] := EventRecArray[CurrRow];
      sgEventTable.Row := CurrRow - 1;
    end;
  end;
  EventRecArray[CurrRow] := HoldEvent;
  DisplayEventGrid;
end;

procedure TForm1.UpDn1Click(Sender: TObject; Button: TUDBtnType);
begin
  MakeAttribString;
end;

procedure TForm1.UpDn2Click(Sender: TObject; Button: TUDBtnType);
var Chn: byte;
  s: String;
begin
  {Which channel?}
  for Chn := 0 to $0F do begin
    if cgChannel.Checked[Chn] then
    begin
      s := '11'; {Address packet to Arduino and Integra}
      //s := '12'; {Address packet to Arduino and SC-88}
      {Update the string for Arduino in labAttrib}
      s :=s + 'B' + HexStr(Chn, 1);

      {Which Attrib?}
      s := s + '0B';
      s := s + HexStr(UpDn2.Position, 2);
    end;
  labFineVolume.Caption := s
  end;
end;

procedure TForm1.UpDn3Click(Sender: TObject; Button: TUDBtnType);
var Chn: byte;
  s: String;
begin
  {Which channel?}
  for Chn := 0 to $0F do begin
    if cgChannel.Checked[Chn] then
    begin
      s := '12'; {Address packet to Arduino}
      {Update the string for Arduino in labAttrib}
      s :=s + 'B' + HexStr(Chn, 1);

      {Which Attrib?}
      s := s + '07';
      s := s + HexStr(UpDn3.Position, 2);
    end;
  labVolume.Caption := s
  end;
end;


function TForm1.VLN(var midIx: integer): LongInt;
{This decodes the "variable length number" from in the midi byte array
at index midIx}
var
  Hold, F, anInt: integer;
begin
  Hold := 0;
  for F := midIx to midIx + 3 do {I think VLNs can be only this big}
  begin
    anInt := midiArr[F];
    if anInt >= $80 then
    begin
      anInt := anInt and $7F; {'msb reset to 0}
      Hold := Hold + anInt;
      Hold := Hold * $80; {Move it right 7 bits to make room. There's more coming}
      inc(midIx); {Move index along 1}
    end
    else
    begin
       Hold := Hold + anInt;
       inc(midIx); {Move index along 1}
       Break; {Out of the for loop}
    end;
  end; {for F}
  Result := Hold;
end;

procedure TForm1.LoadMidiFile;
var
  aFile: file of byte;
  F: integer;
begin
  AssignFile(aFile, midiFileName);
  Reset(aFile);
  midArrLen := FileSize(midiFileName);
  SetLength(midiArr, midArrLen);
  sgMidiTable.RowCount := midArrLen + 1; { + 1 for the header row}

  For F := 0 to (FileSize(afile) - 1) do
  begin
    Read(afile, midiArr[F]);
    with sgMidiTable do
    begin
      Cells[0 ,F + 1] := intToStr(F);
      Cells[1 ,F + 1] := intToHex(midiArr[F], 2); {Hex}
      Cells[2 ,F + 1] := intToStr(midiArr[F]); {Dec}
      Cells[3 ,F + 1] := Char(midiArr[F]); {Chr}
    end;
  end;
  CloseFile(afile);

  labStatus.caption := 'File read in.';
  Form1.Caption := 'Arpegionne ' + ExtractFileName(midiFileName);
end;

procedure TForm1.LoadMidiFileClick(Sender: TObject);
var
  aFolder: string;
begin
  aFolder := GetCurrentDir;
  aFolder := aFolder + '\MidFiles';
  OpenDialog1.InitialDir := aFolder;
  OpenDialog1.Filter := 'Midi files|*.mid';
  if OpenDialog1.Execute then
     midiFileName := OpenDialog1.Filename
  else  exit;

  LoadMidiFile;

  ardFileName := midiFileName;
  ardFileName := ChangeFileExt(ardFileName, '.Ard');

  edStartEvent.Text := '1';
end;

procedure TForm1.OnProgramStart(Sender: TObject);
var aFile: TextFile;
    aStr: string;
    Index: integer;
begin
  Form1.Left := 0;
  Form1.Top := 300;

  {Load in the file of midi notes}
  AssignFile(aFile, 'C:\Arpeggione\Midi note table.txt');
  Reset(aFile); Index := 0;
  while not eof(aFile) do begin
    readln(aFile, aStr);
    MidiNoteVals[Index] := aStr;
    aStr := HexStr(Index, 2) + ' ' + aStr;
    lbMidiNotes.Items.Add(aStr);
    Index := Index + 1;
  end;
  CloseFile(afile);

  if SetCurrentDir('C:\Arpeggione\Scores') then
    aStr := 'Good directory'; {For debugging}

  {Load in the SC-88 Sound map file}
  //AssignFile(aFile, 'C:\Arpeggione\SC-88 Sound map.txt');
  AssignFile(aFile, 'C:\Arpeggione\SC-88 Sound map 2.txt');
  Reset(aFile);
  cbPatch.Items.Clear;
  Index := 0;
  while not eof(aFile) do
  begin
    readln(aFile, aStr);
    cbPatch.Items.Add(aStr);
    inc(Index);
    InstArraySC88[Index] := aStr;
  end;
  CloseFile(afile);

  {Load in the INTEGRA-7 Sound map file}
  AssignFile(aFile, 'C:\Arpeggione\INTEGRA-7 Sound map.txt');
  Reset(aFile);
  //Index := 1;
  with sgIntegra7 do begin
    sgIntegra7.RowCount := 6087 + 1; { + 1 for the header row}
    Index := 0;
    while not eof(aFile) do begin
      readln(aFile, aStr);
      inc(Index);
      Cells[0 ,Index] := IntToStr(Index); {No.}
      Cells[1 ,Index] := MidStr(aStr, 10, 16); {Instrument}
      Cells[2 ,Index] := MidStr(aStr, 0, 2); {MSB}
      Cells[3 ,Index] := MidStr(aStr, 4, 2); {LSB}
      Cells[4 ,Index] := MidStr(aStr, 7, 2); {PC}
    end;
  end;
  CloseFile(afile);

  {Load in the file of GM2 instruments}
  AssignFile(aFile, 'C:\Arpeggione\xml Instruments.txt');
  Reset(aFile); Index := 0;
  while not eof(aFile) do
  begin
    readln(aFile, aStr);
    xmlInstruments[Index].Name := aStr;
    readln(aFile, aStr);
    xmlInstruments[Index].IntegraNo := StrToInt(aStr);
    inc(Index);
  end;
  CloseFile(aFile);

  {Init global variables}
  midArrLen := 0;
  midArrIx := 0;
  with sgMidiTable do
  begin
    ColWidths[0] := 90; {Pos}
    ColWidths[1] := 30; {Hex}
    ColWidths[2] := 40; {Dec}
    ColWidths[3] := 25; {Chr}
    ColWidths[4] := 250;{Comment}
    Options := [
      goFixedVertLine,
      goFixedHorzLine,
      goVertLine,
      goHorzLine,
     goRangeSelect];
  end;
  with sgEventTable do
  begin
    ColWidths[0] := 80; {Item}
    ColWidths[1] := 80; {Start time}
    ColWidths[2] := 60; {Delta time}
    ColWidths[3] := 60; {Symth}
    ColWidths[4] := 45;{Cmd}
    ColWidths[5] := 45;{Note}
    ColWidths[6] := 45;{Velocity}
    ColWidths[7] := 45;{Sort}
    Options := [
      goFixedVertLine,
      goFixedHorzLine,
      goVertLine,
      goHorzLine,
      goRangeSelect];
  end;

  cgChannel.Checked[0] := true;


  with sgIntegra7 do
  begin
    ColWidths[1] := 80; {No.}
    ColWidths[1] := 180; {Instrument name}
    ColWidths[2] := 50; {Most significant byte}
    ColWidths[3] := 50; {Least significant byte}
    ColWidths[4] := 50; {Program change}
    Options := [
      goFixedVertLine,
      goFixedHorzLine,
      goVertLine,
      goHorzLine,
      goRangeSelect];
  end;

  trackCount:= 0;
  LastEventIxToArduino:= 0;
  lbReceived.Color := $C0DCC0; {A greeny khaki}

  PageControl1.ActivePage := TabSheet1; {The Arduino tab}
  cbPatch.ItemIndex := 0; {Instrument}

  rgKeyboard.ItemIndex := 0; {0 Trigger, 1 Integra, 2 SC-88}
  //rgGuitar.ItemIndex := 1; {0 Though, 1 Trigger}

end;


procedure TForm1.GetChInst();
var Chn: integer;
    Inst, LSB, BankVar, Volume: integer;
    aStr: string;

  procedure FromSynth1; {Integra}
  var InstInx: integer;
      bStr: string;
  begin
    for InstInx := 1 to 6087 do begin  {Number of Integra7 instruments}
      bStr := sgIntegra7.Cells[2, InstInx];
      bStr := bStr + ' ' + sgIntegra7.Cells[3, InstInx];
      bStr := bStr + ' ' + sgIntegra7.Cells[4, InstInx];
      if bStr = aStr then begin
        aStr := 'Chan ' + HexStr(Chn, 2) + ' ' + aStr + '  ' + sgIntegra7.Cells[1, InstInx];
        system.break;
      end;
    end
  end;

  procedure FromSynth2; {SC-88}
  var InstInx: integer;
  begin
    for InstInx := 0 to 415 - 1 do begin {Number of SC-88 instruments}
      if LeftStr(InstArraySC88[InstInx], 8) = aStr then begin
        aStr := 'Chan ' + HexStr(Chn, 2) + '  ' + InstArraySC88[InstInx];
        system.break;
      end;
    end
  end;


begin {GetChInst}
  labChInst0.Caption := 'Chan 00';
  labChInst1.Caption := 'Chan 01';
  labChInst2.Caption := 'Chan 02';
  labChInst3.Caption := 'Chan 03';
  labChInst4.Caption := 'Chan 04';
  labChInst5.Caption := 'Chan 05';
  labChInst6.Caption := 'Chan 06';
  labChInst7.Caption := 'Chan 07';
  labChInst8.Caption := 'Chan 08';
  labChInst9.Caption := 'Chan 09';
  labChInst10.Caption := 'Chan 0A';
  labChInst11.Caption := 'Chan 0B';
  labChInst12.Caption := 'Chan 0C';
  labChInst13.Caption := 'Chan 0D';
  labChInst14.Caption := 'Chan 0E';
  labChInst15.Caption := 'Chan 0F';

  labVol0.Caption := '00';
  labVol1.Caption := '00';
  labVol2.Caption := '00';
  labVol3.Caption := '00';
  labVol4.Caption := '00';
  labVol5.Caption := '00';
  labVol6.Caption := '00';
  labVol7.Caption := '00';
  labVol8.Caption := '00';
  labVol9.Caption := '00';
  labVolA.Caption := '00';
  labVolB.Caption := '00';
  labVolC.Caption := '00';
  labVolD.Caption := '00';
  labVolE.Caption := '00';
  labVolF.Caption := '00';

  for EventIx := 1 to EventCount do begin
    with EventRecArray[EventIx] do begin
      {Indicator of an instrument}
      if Byte1 = $FF then begin
        Chn := Byte2 - $C0;
        case Chn of
          $0..$F: begin
            Inst := Byte3;
            LSB := EventRecArray[EventIx - 1].Byte3;
            BankVar := EventRecArray[EventIx - 2].Byte3;
          end;
        end;
        aStr := HexStr(BankVar, 2) + ' ' + HexStr(LSB, 2) + ' ' + HexStr(Inst, 2);

        {Decide on which synth}
        case EventRecArray[EventIx].WhichSynth of
          1: FromSynth1;
          2..3: FromSynth2;
        end;

        case Chn of
          $0: labChInst0.Caption := aStr;
          $1: labChInst1.Caption := aStr;
          $2: labChInst2.Caption := aStr;
          $3: labChInst3.Caption := aStr;
          $4: labChInst4.Caption := aStr;
          $5: labChInst5.Caption := aStr;
          $6: labChInst6.Caption := aStr;
          $7: labChInst7.Caption := aStr;
          $8: labChInst8.Caption := aStr;
          $9: labChInst9.Caption := aStr;
          $A: labChInst10.Caption := aStr;
          $B: labChInst11.Caption := aStr;
          $C: labChInst12.Caption := aStr;
          $D: labChInst13.Caption := aStr;
          $E: labChInst14.Caption := aStr;
          $F: labChInst15.Caption := aStr;
        end;
      end;
      if (Byte2 = $07) then begin {Initial volume setting}
        Chn := Byte1 - $B0;
        case Chn of
          $0..$F: begin
            Volume := Byte3;
            aStr := HexStr(Volume, 2);
            case Chn of
              $0: labVol0.Caption := aStr;
              $1: labVol1.Caption := aStr;
              $2: labVol2.Caption := aStr;
              $3: labVol3.Caption := aStr;
              $4: labVol4.Caption := aStr;
              $5: labVol5.Caption := aStr;
              $6: labVol6.Caption := aStr;
              $7: labVol7.Caption := aStr;
              $8: labVol8.Caption := aStr;
              $9: labVol9.Caption := aStr;
              $A: labVolA.Caption := aStr;
              $B: labVolB.Caption := aStr;
              $C: labVolC.Caption := aStr;
              $D: labVolD.Caption := aStr;
              $E: labVolE.Caption := aStr;
              $F: labVolF.Caption := aStr;
            end;
          end;
        end;
      end;
    end;
  end;
end; {GetChInst}

procedure TForm1.btnChangeUsedChannelClick(Sender: TObject);
var
  FromChn,
  ToChn: integer;
  Cmd,
  Chn: integer;
begin
  if Length(edFromChn.Text) <> 2 then begin
    Application.MessageBox('Bad channel number', 'Change channel', MB_ICONINFORMATION);
    exit;
  end;
  if Length(edToChn.Text) <> 2 then begin
    Application.MessageBox('Bad channel number', 'Change channel', MB_ICONINFORMATION);
    exit;
  end;
    FromChn := Hex2Dec(edFromChn.Text);
    ToChn := Hex2Dec(edToChn.Text);
    for EventIx := 1 to EventCount do begin
    with EventRecArray[EventIx] do begin
      if Byte1 = $FF then begin
        Cmd := Byte2 and $F0;   {Most significant nybble}
        Chn := Byte2 and $0F;   {Lsn}
        if Chn = FromChn then Chn := ToChn;
        Byte2 := Cmd + Chn;
      end;
      Cmd := Byte1 and $F0;   {Most significant nybble}
      Chn := Byte1 and $0F;   {Lsn}
      case Cmd of
        $80, $90, $B0, $C0: begin
          if Chn = FromChn then Chn := ToChn;
          Byte1 := Cmd + Chn;
        end;
      end;
    end;
  end;
  DisplayEventGrid;
end;

procedure TForm1.btnDeleteRowClick(Sender: TObject);
var CurrRow: longInt;
begin
  CurrRow := sgEventTable.Row;
  for EventIx := CurrRow to EventCount - 1 do begin
    EventRecArray[EventIx] := EventRecArray[EventIx + 1]
  end;
  dec(EventCount);
  sgEventTable.RowCount := EventCount + 1;
  DisplayEventGrid;
  sgEventTable.Row := CurrRow;
end;

procedure TForm1.btnGetSibeliusClick(Sender: TObject);
var {The left-hand edge of Sibelius should be at X = 640}
  x, y: integer;
  ForSibelius: string;

  procedure KeySendString(aString: string); {Nested}
  var F, G: integer;

  begin
    aString := UpperCase(aString);
    for F := 1 to length(aString) do begin
      G := ord(aString[F]);
      case G of
        $23: begin
          KeyInput.Down(VK_SHIFT);
          KeyInput.Press($33); {Sharp - Hash - Shift-5}
          KeyInput.Up(VK_SHIFT);
        end;
        $27: begin
          KeyInput.Press($DE); {Single quote}
        end;
        $2C: begin
          KeyInput.Press($BC); {Comma keyed}
        end;
        $2D: begin
          KeyInput.Press($BD); {Hyphen keyed}
        end;
        $2E: begin
          KeyInput.Press($BE); {Full-stop keyed}
        end;
        $3A: begin
          KeyInput.Down(VK_SHIFT);
          KeyInput.Press($BA); {Colon}
          KeyInput.Up(VK_SHIFT);
        end;
        $5C: begin
          KeyInput.Press($DC); {Back-slash keyed}
        end;
        else KeyInput.Press(G);
      end;
      //KeyInput.Press(G);
      Application.ProcessMessages;
    end;
  end;

begin
  x := 680; {Over the File menu-item}
  y := 45;
  MouseInput.Click(mbLeft, [], x, y);
  Application.ProcessMessages;
  y := 145; {Over Open}
  MouseInput.Click(mbLeft, [], x, y);
  ForSibelius := ardFileName;
  ForSibelius := ExtractFileName(ForSibelius);
  ForSibelius := ChangeFileExt(ForSibelius, '.Sib');
  ForSibelius := 'C:\Arpeggione\Scores\SibFiles\' + ForSibelius;
  Application.ProcessMessages;
  Delay(1000);
  KeySendString(ForSibelius); {Nested above}
  KeyInput.Press(VK_RETURN);
end;


(*
procedure TForm1.btnGotoClick(Sender: TObject);
var TheRow: integer;
begin
  Form2.ShowModal;
  if Form2.ModalResult = mrOk then begin
    TheRow := Form2.Tag;
    if TheRow <= sgEventTable.RowCount then begin
      labEventsUsed.Caption := IntToStr(TheRow);
      sgEventTable.Row := TheRow;
    end;
  end;
  Form2.Close;
end;
*)

procedure TForm1.btnInsertRowClick(Sender: TObject);
var CurrRow: longInt;
begin
  inc(EventCount);
  SetLength(EventRecArray, EventCount + 1); {Stretch array}
  CurrRow := sgEventTable.Row;
  for EventIx := EventCount - 1 downto CurrRow do begin
    EventRecArray[EventIx + 1] := EventRecArray[EventIx]
  end;
  {Fill the current row with 00s
  EventRecArray[CurrRow].Byte1 := $00;
  EventRecArray[CurrRow].Byte2 := $00;
  EventRecArray[CurrRow].Byte3 := $00;
  EventRecArray[CurrRow].DeltaTime := $00;
  EventRecArray[CurrRow].RunningDelta := $00;
  EventRecArray[CurrRow].Sort := $00; }

  sgEventTable.RowCount := EventCount + 1;
  DisplayEventGrid;
  sgEventTable.Row := CurrRow;
end;


procedure TForm1.btnMakeAutoClick(Sender: TObject);
var
  FromRow, ToRow:longInt;
  NoteOnFound: boolean;
  HoldIndex: longInt;
begin
  if (edAutoFrom.Caption = '') OR (edAutoTo.Caption = '') then begin
    {Nothing in the ed boxes, so check the whole array}
    NoteOnFound := false;
    HoldIndex := 1; {Assume the first one is a timing record}
    for EventIx := 2 to EventCount do begin {Skip top one}
      if EventRecArray[EventIx].WhichSynth > $00 then begin
        {A non-timing record}
        if (EventRecArray[EventIx].byte1 >= $90) and
          (EventRecArray[EventIx].byte1 <= $9F) then
            NoteOnFound := true;
      end else begin
        {A timing record}
        if NoteOnFound = false then begin
          EventRecArray[HoldIndex].byte1 := $01; {Cmd. Record made automatic}
        end;
        HoldIndex := EventIx;
        NoteOnFound := false;
      end;
    end;
    DisplayEventGrid;
    exit;
  end;

  {Do only those rows requested}
  FromRow := StrToInt(edAutoFrom.Caption);
  ToRow := StrToInt(edAutoTo.Caption);
  for EventIx := FromRow to ToRow do begin
    if EventRecArray[EventIx].WhichSynth = 0 then begin
      EventRecArray[EventIx].Byte1 := 1; {Cmd}
    end;
  end;
  sgEventTable.Row := ToRow;
  DisplayEventGrid;
end;


procedure TForm1.btnMakeGMClick(Sender: TObject);
begin
  for EventIx := 1 to EventCount do begin
    with EventRecArray[EventIx] do begin
      {Ignore it if this is a page-turn, of similar}
      if WhichSynth <> 4 then begin
        if WhichSynth <> $00 then
          {It is not a timing record}
          WhichSynth := $02; {SC-88}
        if Byte1 = $FF then
          {Fix instrument selection}
          EventRecArray[EventIx - 2].Byte3 := $00; {GM}
      end;
    end;
  end;
  DisplayEventGrid;
end;

procedure TForm1.btnPageBreakClick(Sender: TObject);
var CurrRow: longInt;
begin
  inc(EventCount);
  SetLength(EventRecArray, EventCount + 1); {Stretch array}
  CurrRow := sgEventTable.Row;
  for EventIx := EventCount - 1 downto CurrRow do begin
    EventRecArray[EventIx + 1] := EventRecArray[EventIx]
  end;
  inc(CurrRow);
  {Fill the current row}
  EventRecArray[CurrRow].WhichSynth := 4;
  EventRecArray[CurrRow].Byte1 := $02;
  EventRecArray[CurrRow].Byte2 := $FF;
  EventRecArray[CurrRow].Byte3 := $FF;

  sgEventTable.RowCount := EventCount + 1;
  DisplayEventGrid;
  sgEventTable.Row := CurrRow + 1;
end;

procedure TForm1.btnPageTurnClick(Sender: TObject);
var
  aMouse: TMouse;
  aPoint: TPoint;
  x, y: integer;
  HoldX, HoldY: integer;
begin
  HoldX := aMouse.CursorPos.X;
  HoldY := aMouse.CursorPos.Y;

  x := 1890; {Over the Sibelius scroll-bar right bottom}
  y := 1040;
  MouseInput.Click(mbLeft, [], x, y);
  Application.ProcessMessages;

  {Return mouse position to wherever it was}
  aPoint.x := HoldX; {Probably the PageTurn button}
  aPoint.y := HoldY;
  aMouse.CursorPos := aPoint;
end;

procedure TForm1.btnPostbackClick(Sender: TObject);
var CurrRow: longInt;
  labCapt: string;
  Good: boolean;

  Function GoodHex(aStr: string): boolean;
  begin
    {Needs finishing}
    Result := true;

  end;

begin
  labCapt := LabRow.Caption;
  labCapt := RightStr(labCapt, Length(labCapt) - 4);
  CurrRow := StrToInt(labCapt);

  Good := true;
  if not GoodHex(EdC1.Text) then Good := false;
  if not GoodHex(EdC2.Text) then Good := false;
  if not GoodHex(EdC3.Text) then Good := false;
  if not GoodHex(EdC4.Text) then Good := false;
  if not Good then
  begin
    Application.MessageBox('Bad post back number', 'Post back', MB_ICONINFORMATION);
    exit;
  end;
  //Application.MessageBox('Bad post back number', 'Post back', MB_ICONINFORMATION);

  EventRecArray[CurrRow].WhichSynth := StrToInt(EdC1.Text); {WhichSynth}
  EventRecArray[CurrRow].Byte1 := Hex2Dec(EdC2.Text); {Channel}
  EventRecArray[CurrRow].Byte2 := Hex2Dec(EdC3.Text); {Note}
  EventRecArray[CurrRow].Byte3 := Hex2Dec(EdC4.Text); {Velocity}
  DisplayEventGrid;
  sgEventTable.Row := CurrRow;
end;

procedure TForm1.btnPractPointClick(Sender: TObject);
var CurrRow: longInt;
begin
  inc(EventCount);
  SetLength(EventRecArray, EventCount + 1); {Stretch array}
  CurrRow := sgEventTable.Row;
  for EventIx := EventCount - 1 downto CurrRow do begin
    EventRecArray[EventIx + 1] := EventRecArray[EventIx]
  end;
  inc(CurrRow);
  {Fill the current row}
  EventRecArray[CurrRow].WhichSynth := 4;
  EventRecArray[CurrRow].Byte1 := $02;
  EventRecArray[CurrRow].Byte2 := $AA;
  EventRecArray[CurrRow].Byte3 := $AA;

  sgEventTable.RowCount := EventCount + 1;
  DisplayEventGrid;
  sgEventTable.Row := CurrRow + 1;
end;

procedure TForm1.btnPractPrevClick(Sender: TObject);
var
  EventsUsed, F: integer;
  aMouse: TMouse;
  aPoint: TPoint;
  x, y: integer;
  HoldX, HoldY: integer;
  s: String;
begin
  {Quieten the synths}
  lbReceived.Clear;
  s := '050zzzzz'; {Stop playing. Arduino runs the MuteAllChannels routine}
  Transmit(s);

  {Whereabouts in the file are we}
  {Assumes Pause was clicked}
  EventsUsed := StrToInt(labEventsUsed.Caption);
  for F := EventsUsed - 1 downto 1 do begin
    if EventRecArray[F].WhichSynth = $04 then begin
      if EventRecArray[F].Byte1 = $02 then begin
        if EventRecArray[F].Byte2 = $AA then begin {A practice point}
          edStartEvent.Text := IntToStr(F + 1);
          labEventsUsed.Caption := IntToStr(F - 1);
          labUsedEvents.Caption := IntToStr(F + 1);
          Clipboard.AsText := edStartEvent.Text;
          exit;
        end;
        if EventRecArray[F].Byte2 = $FF then begin {A page forward found}
          {Reverse page forward}
          HoldX := aMouse.CursorPos.X;
          HoldY := aMouse.CursorPos.Y;

          x := 680; {Over the Sibelius scroll-bar bottom left}
          y := 1040;
          MouseInput.Click(mbLeft, [], x, y);
          Application.ProcessMessages;

          {Return mouse position to wherever it was}
          aPoint.x := HoldX;
          aPoint.y := HoldY;
          aMouse.CursorPos := aPoint;
        end;
      end;
    end;
  end;
end;

procedure TForm1.btnPractNextClick(Sender: TObject);
var
  EventsUsed, F: integer;
  aMouse: TMouse;
  aPoint: TPoint;
  x, y: integer;
  HoldX, HoldY: integer;
  s: String;
begin
  {Quieten the synths}
  lbReceived.Clear;
  s := '050zzzzz'; {Stop playing. Arduino runs the MuteAllChannels routine}
  Transmit(s);

  {Where in the file are we?}
  {Assumes Pause was clicked}
  EventsUsed := StrToInt(labEventsUsed.Caption);
  for F := EventsUsed + 1 to EventCount do begin
    if EventRecArray[F].WhichSynth = $04 then begin
      if EventRecArray[F].Byte1 = $02 then begin
        if EventRecArray[F].Byte2 = $AA then begin {A practice point}
          edStartEvent.Text := IntToStr(F + 1);
          labEventsUsed.Caption := IntToStr(F + 1);
          labUsedEvents.Caption := IntToStr(F + 1);
          Clipboard.AsText := edStartEvent.Text;
          exit;
        end;
        if EventRecArray[F].Byte2 = $FF then begin {A page forward}
          HoldX := aMouse.CursorPos.X;
          HoldY := aMouse.CursorPos.Y;

          x := 1890; {Over the Sibelius scroll-bar right bottom}
          y := 1040;
          MouseInput.Click(mbLeft, [], x, y);
          Application.ProcessMessages;

          {Return mouse position to wherever it was}
          aPoint.x := HoldX;
          aPoint.y := HoldY;
          aMouse.CursorPos := aPoint;
        end;
        if EventRecArray[F].Byte2 = $BB then begin {A page back}
          HoldX := aMouse.CursorPos.X;
          HoldY := aMouse.CursorPos.Y;

          x := 680; {Over the Sibelius scroll-bar bottom left}
          y := 1040;
          MouseInput.Click(mbLeft, [], x, y);
          Application.ProcessMessages;

          {Return mouse position to wherever it was}
          aPoint.x := HoldX;
          aPoint.y := HoldY;
          aMouse.CursorPos := aPoint;
        end;
      end;
    end;
  end;
end;

procedure TForm1.btnToArduinoClick(Sender: TObject);
{Assumes serial started}
Var
  s: String;
  F: integer;
begin
  s := '';
  for F := 0 to memEvents.lines.Count -1 do begin
    s := s + memEvents.lines[F];
  end;

  if glSerialRunning then Transmit(s);
end;

procedure TForm1.btnToIntegraClick(Sender: TObject);
Var Chn: byte;
  sForArduino: String;
begin
  for Chn := 0 to $0F do
  begin
    if cgChannel.Checked[Chn] then begin
      sForArduino := '11B' + HexStr(Chn, 1) + '00' + sgIntegra7.Cells[2, sgIntegra7.Row];
      sForArduino := sForArduino +
        '11B' + HexStr(Chn, 1) + '20' + sgIntegra7.Cells[3, sgIntegra7.Row];
      sForArduino := sForArduino +
        '11FFC' + HexStr(Chn, 1) + sgIntegra7.Cells[4, sgIntegra7.Row];
      if glSerialRunning then Transmit(sForArduino);
    end;
  end;
  labStatus.caption := sForArduino;
end;

procedure TForm1.btnToArrayClick(Sender: TObject);
var Chn: byte;
begin
  for EventIx := 1 to EventCount do
  begin
    if EventRecArray[EventIx].Byte1 = $FF then
    begin
      {This is an instrument change. What channel?}
      Chn := EventRecArray[EventIx].Byte2 and $0F;
      if  cgChannel.Checked[Chn] then begin
        EventRecArray[EventIx - 0].Byte3 :=
          Hex2Dec(sgIntegra7.Cells[4, sgIntegra7.Row]);
        EventRecArray[EventIx - 1].Byte3 :=
          Hex2Dec(sgIntegra7.Cells[3, sgIntegra7.Row]);
        EventRecArray[EventIx - 2].Byte3 :=
          Hex2Dec(sgIntegra7.Cells[2, sgIntegra7.Row]);
      end;
    end;
  end;
  DisplayEventGrid;
end;

procedure TForm1.btnToMemEventsClick(Sender: TObject);
Var Chn: byte;
begin
  memEvents.Clear;
  for Chn := 0 to $0F do begin
    if cgChannel.Checked[Chn] then begin
      memEvents.Text := '11B' + HexStr(Chn, 1) + '00' +
        sgIntegra7.Cells[2, sgIntegra7.Row] + Cr +
        '11B' + HexStr(Chn, 1) + '20' +
        sgIntegra7.Cells[3, sgIntegra7.Row] + Cr +
        '11FFC' + HexStr(Chn, 1) +
        sgIntegra7.Cells[4, sgIntegra7.Row];
    end;
  end;
  labStatus.caption := 'See memEvents on the SC-88VL tab.';
end;

procedure TForm1.cbAllowPointerChange(Sender: TObject);
var
  s: String;
begin
  if cbAllowPointer.Checked then begin
    s := '07100000';
  end else begin
    s := '07200000';
  end;
  Transmit(s);
  labStatus.Caption := s;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if(key=ord('P')) and (ssCtrl in Shift) then begin
    {Click the Pract-point button}
     btnPractPoint.onclick(self)
  end;
end;

procedure TForm1.EditNoteRow(Sender: TObject);
var CurrRow: longInt;
begin
  CurrRow := sgEventTable.Row;
  LabRow.Caption := 'Row ' + inttostr(CurrRow);
  EdC1.Text := sgEventTable.Cells[3, CurrRow];
  EdC2.Text := sgEventTable.Cells[4, CurrRow];
  EdC3.Text := sgEventTable.Cells[5, CurrRow];
  EdC4.Text := sgEventTable.Cells[6, CurrRow];
end;

procedure TForm1.edStartEventDblClick(Sender: TObject);
begin
  edStartEvent.Text := '1';
end;


procedure TForm1.btnMakeGM2Click(Sender: TObject);
begin
  for EventIx := 1 to EventCount do begin
    with EventRecArray[EventIx] do begin
      {Ignore it if this is a page-turn, of similar}
      if WhichSynth <> 4 then begin
        if WhichSynth <> $00 then
          {It is not a timing record}
          WhichSynth := $01; {Integra}
        if Byte1 = $FF then
          {Fix instrument selection}
          EventRecArray[EventIx - 2].Byte3 := $79; {GM2}
      end;
    end;
  end;
  DisplayEventGrid;
end;


procedure TForm1.btnGetChInstClick(Sender: TObject);
begin
  GetChInst;
end;

procedure TForm1.labEventsUsedClick(Sender: TObject);
var TheRow: integer;
begin
  Form2.ShowModal;
  if Form2.ModalResult = mrOk then begin
    TheRow := Form2.Tag;
    if TheRow <= sgEventTable.RowCount then begin
      labEventsUsed.Caption := IntToStr(TheRow);
      sgEventTable.Row := TheRow - 2;
      sgEventTable.Row := TheRow - 1;
      sgEventTable.SetFocus;
    end;
  end;
  Form2.Close;
end;


procedure TForm1.labFineVolumeClick(Sender: TObject);
var Response: integer;
  s: String;
begin
  s := labFineVolume.Caption;
  Response := Application.MessageBox('Send?', 'Attributes', MB_ICONQUESTION + MB_YESNO);
  if Response <> IDYES then exit;
  if glSerialRunning then Transmit(s);
end;

procedure TForm1.labUsedEventsClick(Sender: TObject);
{It assumes serial has started}
var
  s: String;
begin
  s := '050zzzzz'; {Stop playing. Arduino runs the MuteAllChannels routine}
  Transmit(s);
  PageControl1.ActivePageIndex := 2; {Note list}
  sgEventTable.Row := StrToInt(labUsedEvents.Caption);
  sgEventTable.SetFocus;
end;


procedure TForm1.labVolumeClick(Sender: TObject);
Var Response: integer;
  sForArduino, sForClipboard: String;
begin
  sForArduino := labVolume.Caption;
  sForClipboard := '03' + rightStr(sForArduino, 6);
  Clipboard.AsText := sForClipboard;
  Response := Application.MessageBox('Send?', 'Attributes', MB_ICONQUESTION + MB_YESNO);
  if Response <> IDYES then exit;
  if glSerialRunning then Transmit(sForArduino);
end;

procedure TForm1.ParseArray(Sender: TObject);
var
  initArr: array [0..3] of char = ('M','T','h','d');
  trakArr: array [0..3] of char = ('M','T','r','k');
  holdMidArrIx: integer;
  int2byte: integer;
  int4byte: integer;
  aVLN: LongInt;
  Channel: byte;

begin
{1. Check that the midi file has been read in}
  if midArrLen = 0 then
  begin
    labStatus.caption := 'File not yet read in';
    exit;
  end;

{2. Is it a midi file? Check the first 4 bytes}
  midArrIx := 0;
  for midArrIx := midArrIx to midArrIx + 3 do
  begin
    if midiArr[midArrIx] <> ord(initArr[midArrIx]) then
    begin
      labStatus.caption := 'Not a valid midi file';
      exit;
    end;
  end;
  inc(midArrIx);
  sgMidiTable.Cells[4, midArrIx] := 'MThd is a valid midi file';
  Application.ProcessMessages;

{3. Now get value of next 4 bytes for the length of the rest of the header}
  {Not much use}
  int4byte := 0;
  for midArrIx := midArrIx to midArrIx + 3 do
  begin
    int4byte := (int4byte * 256) + midiArr[midArrIx];
  end;
  labStatus.caption := IntToStr(int4byte);
  inc(midArrIx);
  sgMidiTable.Cells[4, midArrIx] := 'Remaining length of header';

{4. Is it a type 1 midi file?}
  int2byte := 0;
  for midArrIx := midArrIx to midArrIx + 1 do
  begin
    int2byte := (int2byte * 256) + midiArr[midArrIx];
  end;
  if int2byte = 1 then
  begin
    labStatus.caption := 'Type 1 midi file ok';
    {Type 0 has only one track. Type 2 can be ignored}
  end
  else
  begin
    labStatus.caption := 'Not a type 1 midi file';
    exit;
  end;
  inc(midArrIx);
  sgMidiTable.Cells[4, midArrIx] := 'Is a type 1 midi file';

{5. How many tracks?}
  int2byte := 0;
  for midArrIx := midArrIx to midArrIx + 1 do
  begin
    int2byte := (int2byte * 256) + midiArr[midArrIx];
  end;
  trackCount:= int2byte;
  if trackCount = 0 then
  begin
    labStatus.caption := 'Zero tracks found';
    exit;
  end;
  inc(midArrIx);
  sgMidiTable.Cells[4, midArrIx] := 'Count of tracks';

  {Declaring the array of track-record types. }
  SetLength(trackRecArray, trackCount + 1); {All track records created here}
  {The trackRecArray is zero based but element 0 will not be used}
  trackIndex := 1;

{6. Tempo, clicksPerCrotchet}
  int2byte := 0;
  for midArrIx := midArrIx to midArrIx + 1 do
  begin
    int2byte := (int2byte * 256) + midiArr[midArrIx];
  end;
  clicksPerCrotchet := int2byte;
  labStatus.caption :=  inttostr(clicksPerCrotchet);
  inc(midArrIx);
  //sgMidiTable.Cells[4, midArrIx] := intToHex(clicksPerCrotchet, 4) + ' clicks per crotchet';
  sgMidiTable.Cells[4, midArrIx] := intToStr(clicksPerCrotchet) + ' clicks per crotchet';
  {Once the VLN is found, it is divided by clicksPerCrotchet and
   multiplied by 1000 to get the delay in milliseconds}

{7. Is there a track 1 header?}
  holdMidArrIx := midArrIx;
  for midArrIx := midArrIx to midArrIx + 3 do
  begin
    if midiArr[midArrIx] <> ord(trakArr[midArrIx - holdMidArrIx]) then
    begin
      labStatus.caption := 'Track ' +  intToStr(trackIndex) + ' header not found';
      exit;
    end;
  end;
  inc(midArrIx);
  sgMidiTable.Cells[4, midArrIx] := 'Track ' + intToStr(trackIndex) + ' header';

  trackIndex := 1;
  trackRecArray[trackIndex].trackStart := midArrIx - 4;

{8. Find the length of track 1
  This value is incorrect in about 50% of
  MIDI files, and should be ignored}
  int4byte := 0;
  for midArrIx := midArrIx to midArrIx + 3 do
  begin
    int4byte := (int4byte * 256) + midiArr[midArrIx];
  end;
  labStatus.caption := IntToStr(midArrIx);
  sgMidiTable.Cells[4, midArrIx] := 'Supposed length of track 1';
  inc(midArrIx);
  sgMidiTable.Cells[4, midArrIx] := 'last byte at pos ' +
    inttostr(midArrIx + int4byte - 1);
  labStatus.caption := IntToStr(midArrIx);
  trackRecArray[trackIndex].trackEnd := midArrIx -1;

  holdMidArrIx := midArrIx; //New code to find the beats per bar

  inc(midArrIx, int4byte); {Leap to the second track despite the advice}

    //New code to find the beats per bar
  for holdMidArrIx := holdMidArrIx + 1 to midArrIx -1 do
  begin
    if midiArr[holdMidArrIx] = $FF then
      if midiArr[holdMidArrIx + 1] = $58 then
      begin
         sgMidiTable.Cells[4, holdMidArrIx + 2] := 'Beats per bar ';
         BeatsPerBar := midiArr[holdMidArrIx + 3];
         sgMidiTable.Cells[4, holdMidArrIx + 4] := inttostr(BeatsPerBar);
         Break; {Exit for}
       end;
  end;

{9. Beginning of loop through the remaining tracks}
  EventCount := 0;
  for trackIndex := 2 to trackCount do
  begin
    holdMidArrIx := midArrIx;
    for midArrIx := midArrIx to midArrIx + 3 do {Is there a track header here?}
    begin
      if midiArr[midArrIx] <> ord(trakArr[midArrIx - holdMidArrIx]) then
      begin
        labStatus.caption := 'Track ' +  intToStr(trackIndex) + ' header not found';
        exit;
      end;
    end;
    inc(midArrIx);
    sgMidiTable.Cells[4, midArrIx] := 'Track ' + intToStr(trackIndex) + ' header';
    {Save the position of the track-start}
    trackRecArray[trackIndex].trackStart := midArrIx - 4;

{10. Where is the end of this track}
    int4byte := 0;
    for midArrIx := midArrIx to midArrIx + 3 do
    begin
      int4byte := (int4byte * 256) + midiArr[midArrIx];
    end;
    labStatus.caption := IntToStr(midArrIx);
    sgMidiTable.Cells[4, midArrIx] := 'Supposed length of this track';
    inc(midArrIx);
    sgMidiTable.Cells[4, midArrIx] := 'last byte at pos ' + inttostr(midArrIx + int4byte - 1);
    labStatus.caption := IntToStr(midArrIx);
    {Save the position of the track-end}
    trackRecArray[trackIndex].trackEnd := midArrIx  + int4byte - 1;

{11. Status messages until the end of the track}
    //inc(midArrIx);
    While midArrIx <= trackRecArray[trackIndex].trackEnd do
    begin
      {I presume everything in the track hereafter is preceded by timestamp}
      aVLN := VLN(midArrIx);
      sgMidiTable.Cells[4, midArrIx] := inttostr(aVLN) + ' timestamp';
      case midiArr[midArrIx] of
        $B0..$BF: begin
          sgMidiTable.Cells[4, midArrIx + 1] := 'Control/Mode change';
          sgMidiTable.Cells[4, midArrIx + 2] := '   just send';
          sgMidiTable.Cells[4, midArrIx + 3] := '   3 bytes';
          inc(midArrIx, 3);
        end;
        $C0..$CF: begin
          sgMidiTable.Cells[4, midArrIx + 1] := 'Instrument';
          sgMidiTable.Cells[4, midArrIx + 2] := '   change';
          inc(midArrIx, 2);
        end;
        $FF: begin {A meta event}
          sgMidiTable.Cells[4, midArrIx + 1] := 'Meta event';
          inc(midArrIx);
          sgMidiTable.Cells[4, midArrIx + 1] := '   number ' + intToStr(midiArr[midArrIx]);
          {Now follows a VLN which is the number of bytes to the end of the meta data}
          inc(midArrIx);
          aVLN := VLN(midArrIx);
          sgMidiTable.Cells[4, midArrIx] := '   leap of ' + intToStr(aVLN);
          inc(midArrIx, aVLN); {Go there}
        end;
        $80..$8F: begin {Note off data}
          Channel := midiArr[midArrIx] and $0F;
          sgMidiTable.Cells[4, midArrIx + 1] := 'Sound off channel ' + intToStr(Channel);
          inc(midArrIx);
          sgMidiTable.Cells[4, midArrIx + 1] := '  note';
          inc(midArrIx);
          sgMidiTable.Cells[4, midArrIx + 1] := '  velocity';
          inc(midArrIx);
        end;
        $90..$9F: begin {Note on data}
          Channel := midiArr[midArrIx] and $0F;
          sgMidiTable.Cells[4, midArrIx + 1] := 'Sound on channel ' + intToStr(Channel);
          inc(midArrIx);
          sgMidiTable.Cells[4, midArrIx + 1] := '  note';
          inc(midArrIx);
          sgMidiTable.Cells[4, midArrIx + 1] := '  velocity';
          inc(midArrIx);
        end;
      else
        inc(midArrIx)
      end;
    end;

    {Jump to the start of the next track}
    midArrIx := trackRecArray[trackIndex].trackEnd + 1
  end; {for trackIndex in Section 9}
  labStatus.caption := 'Parse completed.';
end; {ParseArray}

procedure TForm1.btnLoadMusicXmlFileClick(Sender: TObject);
var
  aFolder: string;
begin
  //memXml.lines.LoadFromFile('C:\Arpeggione\Scores\XmlFiles\Junk.musicxml');
  aFolder := GetCurrentDir;
  aFolder := aFolder + '\XmlFiles';
  OpenDialog1.InitialDir := aFolder;
  OpenDialog1.Filter := 'MusicXml files|*.MusicXml';
  if OpenDialog1.Execute then
     xmlFilename := OpenDialog1.Filename
  else exit;

  memXml.lines.LoadFromFile(xmlFilename);
  ardFileName := xmlFilename;
  ardFileName := ChangeFileExt(ardFileName, '.Ard');

  edStartEvent.Text := '1';
end;

procedure TForm1.DisplayEventGrid();
begin
  with sgEventTable do
  begin
    {RowCount := 1;  Seems to help}
    RowCount := EventCount + 1;
    for EventIx := 1 to EventCount do
    begin
      with EventRecArray[EventIx] do begin
        Cells[0, EventIx] := IntToStr(EventIx);
        Cells[1, EventIx] := FloatToStr(RunningDelta);
        Cells[2, EventIx] := FloatToStr(DeltaTime);
        Cells[3, EventIx] := intToStr(WhichSynth);
        Cells[4, EventIx] := intToHex(Byte1, 2);
        Cells[5, EventIx] := intToHex(Byte2, 2);
        Cells[6, EventIx] := intToHex(Byte3, 2);
        Cells[7, EventIx] := intToStr(Sort);
        {Overwrite Sort with the note description}
        case Byte1 of
          $90..$9F: {Note on only}
          begin
            if Byte2 <= 120 then
              Cells[7, EventIx] := MidiNoteVals[Byte2];
          end
          else
            Cells[7, EventIx] := '';
        end;
      end;
    end;
  end;
end;

procedure TForm1.MakeNoteList(Sender: TObject);
var {From a midi file}
  LocalRunningDelta: LongWord;
  aVLN: LongInt;

begin {Looking for notes to play from the midi import}
  EventCount := 0; {Record 0 is not used}
  SetLength(EventRecArray, EventCount + 1);
  for trackIndex := 2 to trackCount do begin {Loop through each track}
    trackRecArray[trackIndex].eventStart := EventCount + 1;
    midArrIx := trackRecArray[trackIndex].trackStart;
    inc(midArrIx, 8); {To get to the first timestamp}
    LocalRunningDelta := 0; {Reset for each track}
    {Now loop until the end of the track}
    while midArrIx < trackRecArray[trackIndex].trackEnd do begin
      inc(EventCount);
      SetLength(EventRecArray, EventCount + 1);
      {The EventRecArray is zero based but element 0 will not be used}
      EventRecArray[EventCount].Sort := EventCount; {Preliminary only. Will be set later}
      {I presume everything in the track hereafter is prefixed by timestamp}
      aVLN := VLN(midArrIx);
      {aVLN := aVLN * 1000;
      aVLN := aVLN div clicksPerCrotchet;
      It is better to leave one second as 960 milliseconds
      It saves awkwardness, eg 412 being regarded as half 825
      This will speed-up the playback by a tiny amount}

      EventRecArray[EventCount].DeltaTime := aVLN;
      LocalRunningDelta := LocalRunningDelta + EventRecArray[EventCount].DeltaTime;
      EventRecArray[EventCount].RunningDelta := LocalRunningDelta;
      {I expect that midArrIx has been updated according to VLN byes used}

      case midiArr[midArrIx] of
        $B0..$BF: begin {Control/Mode change. Just send these 3 bytes}
          EventRecArray[EventCount].WhichSynth := 2; {General midi}
          EventRecArray[EventCount].Byte1 := midiArr[midArrIx];
          inc(midArrIx);
          EventRecArray[EventCount].Byte2 := midiArr[midArrIx];
          inc(midArrIx);
          EventRecArray[EventCount].Byte3 := midiArr[midArrIx];
          inc(midArrIx);
        end;
        $C0..$CF: begin {Instrument change}
          EventRecArray[EventCount].WhichSynth := 2; {General midi};
          EventRecArray[EventCount].Byte1 := $FF;
          EventRecArray[EventCount].Byte2 := midiArr[midArrIx];
          inc(midArrIx);
          EventRecArray[EventCount].Byte3 := midiArr[midArrIx];
          inc(midArrIx);
        end;
        $FF: begin {A meta event - which we ignore}
          {Now follows a VLN which is the number of bytes to the
           end of the meta data}
          inc(midArrIx,2);
          aVLN := VLN(midArrIx);
          inc(midArrIx, aVLN); {Go there}
          {Alas an event record has been created for this, so ...}
          dec(EventCount); {will see this is overwritten}
        end;
        $80..$9F: begin {Note on or off data}
          EventRecArray[EventCount].WhichSynth := 2; {General midi};
          EventRecArray[EventCount].Byte1 := midiArr[midArrIx];
          inc(midArrIx);
          EventRecArray[EventCount].Byte2 := midiArr[midArrIx];
          inc(midArrIx);
          EventRecArray[EventCount].Byte3 := midiArr[midArrIx];
          inc(midArrIx);
        end;
        else
          inc(midArrIx)
      end; {Case}
    end; {While midArrIx}
    trackRecArray[trackIndex].eventEnd := EventCount;
  end; {for trackIndex}
  DisplayEventGrid;
  labStatus.caption := 'Note list completed.';
end; {MakeNoteList}

procedure TForm1.SortNoteListClick(Sender: TObject);
{Sort the EventRecArray by the RunningDelta field.
This is necessary because of multiple tracks.
If there is already an event for this time,
 the next one will have it's delta time reset to zero.
This is not a standard sort, but rather a zipping
together of two or more sorted lists, by RunningDelta.
We start at track 2. Each subsequent track is sorted into it.
}
var
  ItemPos1: integer; {A pointer for each track}
  ItemPos2: integer; {A pointer for the other tracks in turn}
  HoldEvent: EventType;
  HoldDelta: LongWord;
  PrevDelta: LongWord;
  HoldRunning: LongWord;
  DeltaCount: integer;

  //LocalRecArray: array of EventType;
  //Completed: boolean;
  //aStr: String;

begin
  {Bubble, recode later to do an efficiant zipping togethter}
  for ItemPos1 := EventCount downto 2 do
  begin
    for ItemPos2 := 2 to ItemPos1 do
    begin
      if EventRecArray[ItemPos2 - 1].RunningDelta >
        EventRecArray[ItemPos2].RunningDelta then
      begin
        HoldEvent := EventRecArray[ItemPos2 - 1];
        EventRecArray[ItemPos2 - 1] := EventRecArray[ItemPos2];
        EventRecArray[ItemPos2] := HoldEvent;
      end;
    end;
  end;

  //DisplayEventGrid; exit;

  {Remove the duplicated delta-times}
  HoldRunning :=  EventRecArray[1].RunningDelta;
  for ItemPos1 := 2 to EventCount do {1 done in the preceding line}
  begin
    EventRecArray[ItemPos1].DeltaTime := 0; {Default}
    if EventRecArray[ItemPos1].RunningDelta <> HoldRunning then
    begin {Redo the DeltaTime from the RunningDelta and the previous event}
      EventRecArray[ItemPos1].DeltaTime :=
        EventRecArray[ItemPos1].RunningDelta - HoldRunning;
      HoldRunning := EventRecArray[ItemPos1].RunningDelta;
    end;
  end; {Duplications gone}

  //DisplayEventGrid; exit;

  {Shifting them back to the start of their zero block}
  HoldDelta := 0;
  DeltaCount := 0; {Taking the oppunity in this loop to count these}
  for ItemPos1 := EventCount downto 1 do
  begin {Going backwards}
    if EventRecArray[ItemPos1].DeltaTime <> 0 then
    begin {Have found a delta}
      inc(DeltaCount); {For later}
      if HoldDelta = 0 then {Must be the last one in the list.
                             The first one actioned}
      begin
        HoldDelta := EventRecArray[ItemPos1].DeltaTime; {Get it}
        PrevDelta := HoldDelta;
        //EventRecArray[ItemPos1].DeltaTime := 1000; {An honourary number for Arduino's software}
        EventRecArray[ItemPos1].DeltaTime := $2222;
          { $2222 is about 8.7 seconds. Pleanty of time for the user
           to trigger a reload }
      end
      else
      begin
        {Something here}
        HoldDelta := EventRecArray[ItemPos1].DeltaTime; {Get it}
        EventRecArray[ItemPos1].DeltaTime := PrevDelta;
        PrevDelta := HoldDelta;
      end;
    end;
  end;
  {Fix up the one at the begining}
  EventRecArray[1].DeltaTime := PrevDelta;
  inc(DeltaCount);

  //DisplayEventGrid; Exit;

  {Delta-times are given their own event. This is so that the timer can be
   set, and the immeiate following zero-delta-time based events
   can be sent to the midi synth straight away, while the time
   is used up}
  SetLength(EventRecArray, EventCount + DeltaCount + 1);

  for EventIx := EventCount downto 1 do
  begin
    if EventRecArray[EventIx].DeltaTime <> 0 then
      {This is a record with a delta-time, and it is at
      the start of a block.}
    begin
      HoldRunning := EventRecArray[EventIx].RunningDelta;
      HoldDelta := EventRecArray[EventIx].DeltaTime;
      {These two form the basis of the timing record}

      for ItemPos1 := EventCount + DeltaCount downto EventIx + 1 do
      begin {Shuffle the trailing events along the array to make room}
        {Backwards as usual}
        EventRecArray[ItemPos1] := EventRecArray[ItemPos1 - 1];
      end;

      {Make up a delta event with milliseconds in the fields}
      with EventRecArray[EventIx] do
      begin
        RunningDelta := HoldRunning;
        DeltaTime := HoldDelta;
        WhichSynth := 0; {A flag to Arduino, it's a time, not a synth}
        Byte1 := (HoldDelta and $FF0000) div $FFFF;
        Byte2 := (HoldDelta and $00FF00) div $FF;
        Byte3 := (HoldDelta and $0000FF);
        Sort := 1111;
      end;
      EventRecArray[EventIx + 1].DeltaTime := 0;
      //inc(EventCount);
      //DisplayEventGrid; Exit;
    end;
  end;
  EventCount := EventCount + DeltaCount; {Update global variable}

  DisplayEventGrid;
  labStatus.caption := 'Sorting completed.';
end; {SortNoteListClick}

procedure TForm1.btnSaveClick(Sender: TObject);
{This saves the grid. Delta time (as VLN), send, cmd and note
ready to be imported into Arduino-mega}
var
  fName: string;
  tfOut: TextFile;
begin

  if EventCount = 0 then
  begin
    ShowMessage('No events found to save.');
    exit;
  end;

  labStatus.caption := 'Saving';
  ardFileName := ExtractFileName(ardFileName);
  ChangeFileExt(ardFileName, '.Ard');
  ardFileName := 'C:\Arpeggione\Scores\ArdFiles\' + ardFileName;
  fName := ardFileName;
  //fName := leftStr(ardFileName, Length(ardFileName) - 3);
  //fName := fName + 'Ard';
  {Catch errors in case the file cannot be created}
  try
    {Create text file, write to it and free it to prevent memory leaks}
    AssignFile(tfOut, fName);
    Rewrite(tfOut);
    for EventIx := 1 to EventCount do
       with EventRecArray[EventIx] do
       begin
         Write(tfOut, intToHex(WhichSynth, 2));
         Write(tfOut, intToHex(Byte1, 2));
         Write(tfOut, intToHex(Byte2, 2));
         Writeln(tfOut, intToHex(Byte3, 2));
       end;
    CloseFile(tfOut);
  except {Handle errors}
    on E:Exception do
      labStatus.caption := fName + ' not saved: ' +  E.Message;
  end;
  labStatus.caption := ExtractFileName(fName) + ' created ok.';
end;

procedure TForm1.cbPatchChange(Sender: TObject);
var Chn: byte;
  s: String;
begin
  {Update the string for Arduino in labAttrib}
  {Which channel?}
  for Chn := 0 to $0F do begin
    if cgChannel.Checked[Chn] then
    begin
      s := '12'; {Address packet to Arduino}
      s :=s + 'B' + HexStr(Chn, 1);

      labInst1.Caption := '12B' + HexStr(Chn, 1) + '00' + MidStr(cbPatch.Text, 1, 2);
      labInst2.Caption := '12B' + HexStr(Chn, 1) + '20' + MidStr(cbPatch.Text, 4, 2);
      labInst3.Caption := '12FFC' + HexStr(Chn, 1) + MidStr(cbPatch.Text, 7, 2);

      memEvents.Clear;
      memEvents.text := '12B' + HexStr(Chn, 1) + '00' + MidStr(cbPatch.Text, 1, 2)
        + Cr + '12B' + HexStr(Chn, 1) + '20' + MidStr(cbPatch.Text, 4, 2)
        + Cr + '12FFC' + HexStr(Chn, 1) + MidStr(cbPatch.Text, 7, 2);
    end;
  end;
end;

procedure TForm1.FindNoteInList(Sender: TObject);
var HoldRow: longint;
  edStr: String;
  Found: boolean;

  procedure RunItFrom(This, That: LongInt);
  var F: LongInt;
    sgStr: string;
  begin
    with sgEventTable do
    begin
      For F := This + 1 to That do
      begin
        sgStr :=  sgEventTable.Cells[5, F];
        if sgStr = edStr then
        begin
          sgEventTable.Row := F;
          sgEventTable.Col := 5;
          sgEventTable.SetFocus;
          Found := True;
          Break;
        end;
      end;
    end;
  end;

begin
  edStr := edFindNoteInList.Text;
  if length(edStr) <> 2 then Exit;
  HoldRow := sgEventTable.Row;
  Found := false;
  RunItFrom(HoldRow, EventCount);
  if not Found then
    RunItFrom(1, HoldRow);
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  if PageControl1.TabIndex = 2 then begin
    {Note list tab}
    sgEventTable.SetFocus;
  end;
end;

procedure TForm1.SearchI7List(Sender: TObject);
var Index: integer;
  Hold: string;
  thePos: integer;
begin
  Hold := UpperCase(edSearchI7.text);
  for Index := sgIntegra7.Row + 1 to 6087 do
  begin
    //aStr := sgIntegra7.Cells[1, Index];
    thePos := Pos(Hold, UpperCase(sgIntegra7.Cells[1, Index]));
    if thePos > 0 then begin
      labStatus.Caption := intToStr(Index);
      sgIntegra7.Row := Index;
      sgIntegra7.Col := 0;
      sgIntegra7.SetFocus;
      break;
    end;

  end;
end;


procedure TForm1.SetInstrument(Sender: TObject);
Var Response: integer;
  s: String;
begin
  s := labInst1.Caption + labInst2.Caption + labInst3.Caption;
  Response := Application.MessageBox('Send?', 'Instrument', MB_ICONQUESTION + MB_YESNO);
  if Response <> IDYES then exit;

  if glSerialRunning then Transmit(s);
end;

procedure TForm1.sgEventTableDblClick(Sender: TObject);
var CurrRow: longInt;
begin
  CurrRow := sgEventTable.Row;
  if EventRecArray[CurrRow].DeltaTime = $00 then
    exit; {Can only do this to timing records}
  if EventRecArray[CurrRow].Byte1 = $00 then
    EventRecArray[CurrRow].Byte1 := $01
  else
    EventRecArray[CurrRow].Byte1 := $00;
  DisplayEventGrid;
  sgEventTable.Row := CurrRow;
end;

procedure TForm1.ThroughOrTrigger();
var
  s: string;
begin
  case rgKeyboard.ItemIndex of
    0: s := '30zzzz00'; {Trigger}
    1: s := '30zzzz01'; {Through to Integra}
    2: s := '30zzzz02'; {Through to SC-88}
  end;
  Transmit(s);
  labStatus.Caption := s ;

  //case rgGuitar.ItemIndex of
  //  0: s := '40zzzzzz'; {Through}
  //  1: s := '41zzzzzz'; {Trigger}
  //end;
  //Transmit(s);
  //labStatus.Caption := 'Trigger or through sent';
end;

procedure TForm1.rgKeyboardClick(Sender: TObject);
begin
  ThroughOrTrigger;
end;

procedure TForm1.rgGuitarClick(Sender: TObject);
begin
  ThroughOrTrigger;
end;

procedure TForm1.Transmit(s: string);
var
  status: LongInt;
  writecount: integer;
begin
  labStatus.Caption := s; Application.ProcessMessages;
  writecount := length(s);
  status := SerWrite(SerialHandle, s[1], writecount);
end;

procedure TForm1.SendIt;
{Assumes serial started. Send the first 600 records, or up to EventCount}
var
  s: String;
  //StartEvent: longInt;
begin
  if EventCount = 0 then begin
    ShowMessage('No note file loaded.');
    exit;
  end;

  {All records are 4 bytes long, as an 8 byte hex string}
  s := '070'; {Reset eIndexH & eIndexT,
    and send starting event-number in the next 5 nibbles (1,000,000) }
  {Starting event in edStartEvent}
  txMidiout.StartEvent := StrToInt(edStartEvent.Text);
  s := s + HexStr(txMidiout.StartEvent - 1, 5);
  Transmit(s);

  EventIx := 600;  {Hex $258 is the usual number to request}
  btnSend.Enabled := false;
  Application.ProcessMessages;
  for EventIx := txMidiout.StartEvent to txMidiout.StartEvent + 599 do begin
    if EventIx <= EventCount then begin {Don't overshoot the array.}
      with EventRecArray[EventIx] do begin
        s := FourByteStr(WhichSynth,
                          Byte1,
                          Byte2,
                          Byte3);
        Transmit(s);
        LastEventIxToArduino := EventIx;
      end;
    end;
    labStatus.Caption := s;
  end;
  btnSend.Enabled := true;
  Application.ProcessMessages;
  labStatus.caption := 'Event array sent to Arduino.'
end;


procedure TForm1.btnSendClick(Sender: TObject);
//var StartEvent: LongInt;
begin
  if edStartEvent.Text = '' then begin
    edStartEvent.Text := '1';
  end;
  txMidiOut.StartEvent := StrToInt(edStartEvent.Text);
  if txMidiOut.StartEvent > EventCount - 1 then begin
    ShowMessage(edStartEvent.Text + ' is too big for the event array.');
    exit;
  end;
  {Check that the first event is a timing record}
  labEventsUsed.Caption := edStartEvent.Text;
  if EventRecArray[txMidiOut.StartEvent].WhichSynth > $00 then begin
    ShowMessage('Not a timing record.');
    exit;
  end;
  if EventRecArray[txMidiOut.StartEvent].Byte1 > $00 then begin
    ShowMessage('Cannot start at an auto-playing time record.');
    exit;
  end;


  AllSoundOff(Sender);
  SendIt;
  lbReceived.Clear;
end;


procedure TForm1.DisplayExpression(ComIn: string);
var
  aStr: string;
  Vol: byte;
begin
  {This is about the volume pedal}
  if midStr(ComIn, 3, 2) = '01' then begin
    aStr := midStr(ComIn, 7, 2);
    Vol := Hex2Dec(aStr);
    ProgressBar1.Position := Vol;
    Exit;
  end;
  lbReceived.Items.Add(ComIn);
  lbReceived.TopIndex := lbReceived.Items.Count - 1;
end;

procedure TForm1.DisplayEventsUsed(ComIn: string);
var Used: longint;
begin
  {The incoming string has the prefix 'EU'}
  ComIn := midStr(ComIn, 3, 999);
  Used := Hex2Dec(ComIn);
  if Used < 0 then begin
    {The Arduino's int has gone around-the-clock}
    Used := 65536 + Used;
  end;

  labUsedEvents.Caption := IntToStr(Used);
  labEventsUsed.Caption := IntToStr(Used);
end;

procedure TurnSibeliusPage(aStr: string);
var {A request for a page turn}
  aMouse: TMouse;
  aPoint: TPoint;
  x ,y, HoldX, HoldY: Integer;
begin
  {Store mouse position}
  HoldX := aMouse.CursorPos.X;
  HoldY := aMouse.CursorPos.Y;

  if aStr = 'PageF' then begin
    x := 1890; {Over the Sibelius scroll-bar bottom right}
    y := 1040;
  end else begin
    x := 680; {Over the Sibelius scroll-bar bottom left}
    y := 1040;
  end;
  MouseInput.Click(mbLeft, [], x, y);
  Application.ProcessMessages;

  {Restore mouse position}
  aPoint.x := HoldX;
  aPoint.y := HoldY;
  aMouse.CursorPos := aPoint;
  Application.ProcessMessages;
end;

procedure TForm1.ActionAsk(ComIn: string);
        {This code is no longer used.
         See nested procedures in btnStartArduinoClick.}
var
  StartEvent, Many: longInt;
  s: string;
begin
  if EventCount = 0 then begin
    ShowMessage('No file of notes loaded.');
    exit;
  end;

  btnSend.Enabled := false;
  StartEvent := Hex2Dec(midStr(ComIn, 3, 1));
  if StartEvent = 0 then begin {200zzzz as opposed to 201zzzz}
    {This code is run when the music is to reload from the begining}
    StartEvent := 1;
    LastEventIxToArduino := 0;
    s := '07000000'; {Reset eIndexH & eIndexT}
    Transmit(s);
  end else begin
     StartEvent := LastEventIxToArduino + 1;
  end;

  Many := Hex2Dec(RightStr(ComIn, 3));
  if  StartEvent + Many -1 > EventCount then begin
     Many := EventCount - StartEvent + 1;
  end;

  for EventIx := StartEvent to StartEvent + Many -1 do begin
    with EventRecArray[EventIx] do begin
      s := FourByteStr(WhichSynth,
                        Byte1,
                        Byte2,
                        Byte3);
      Transmit(s);
      LastEventIxToArduino := EventIx;
    end;
    labStatus.Caption := s;
  end;
  lbReceived.Items.Add(intToStr(EventIx));
  lbReceived.TopIndex := lbReceived.Items.Count - 1;
  btnSend.Enabled := true;
end;

procedure TForm1.btnStartArduinoClick(Sender: TObject);
var
  ComPortName: String;
  Flags      : TSerialFlags; {TSerialFlags = set of (RtsCtsFlowControl);}
  status     : LongInt;
  ch         : Char;
  s          : string;
  EventsUsed : Longint;
  //ReplyingToAsk: boolean;
  //StartEvent, LastEvent, Many: longInt;

  procedure PrepareToActionAsk; {Nested}
  begin
    lbReceived.Items.Add(ComIn);
    lbReceived.TopIndex := lbReceived.Items.Count - 1;

    if EventCount = 0 then begin
      ShowMessage('No file of notes loaded.');
      exit;
    end;
    txMidiout.ReplyingToAsk := true;

    btnSend.Enabled := false;
    txMidiout.StartEvent := Hex2Dec(midStr(ComIn, 3, 1));
    if txMidiout.StartEvent = 0 then begin {200zzzz as opposed to 201zzzz}
      {This code is run when the music is to reloaded from the begining}
      txMidiout.StartEvent := 1;
      LastEventIxToArduino := 0;
      s := '07000000'; {Reset eIndexH & eIndexT}
      Transmit(s);
    end else begin
       txMidiout.StartEvent := LastEventIxToArduino + 1;
    end;

    txMidiout.Many := Hex2Dec(RightStr(ComIn, 3));
    if  txMidiout.StartEvent + txMidiout.Many -1 > EventCount then begin
       txMidiout.Many := EventCount - txMidiout.StartEvent + 1;
    end;

    {Set index limits}
    EventIx := txMidiout.StartEvent;
    txMidiout.LastEvent := txMidiout.StartEvent + txMidiout.Many - 1;
  end; {Nested}

  procedure SendNextEvent; {Nested}
  begin
    with EventRecArray[EventIx] do begin
      s := FourByteStr(WhichSynth,
                        Byte1,
                        Byte2,
                        Byte3);
      Transmit(s);
      LastEventIxToArduino := EventIx;
      labStatus.Caption := s;
    end;

    if EventIx = txMidiout.LastEvent then begin
      txMidiout.ReplyingToAsk := false;
      lbReceived.Items.Add(intToStr(EventIx));
      lbReceived.TopIndex := lbReceived.Items.Count - 1;
      btnSend.Enabled := true;
    end;
    inc(EventIx);
  end; {Nested}



begin {btnStartArduinoClick}
  //ComPortName:= '/dev/ttyUSB0'; {Linux}
  //ComPortName:= '/dev/ttyACM0'; {Linux}
  ComPortName:= 'COM3';
  labStatus.Caption := 'Using ' + ComPortname;

  SerialHandle := SerOpen(ComPortName); {Global varible}
  Flags:= [ ]; // None
  SerSetParams(SerialHandle, 9600, 8, NoneParity, 1, Flags); //RPi cannot do 31250
  //SerSetParams(SerialHandle, 19200, 8, NoneParity, 1, Flags); //RPi cannot do 31250
  {Having to press the reset button to start the Arduino at 19200.
   It needs respite to clear the UART's input buffer}
  labStatus.Caption := 'Started.';
  labStarted.Color := clMoneyGreen;
  ThroughOrTrigger;
  txMidiout.ReplyingToAsk := false;

  {Start a perpetual loop}
  glSerialRunning := True;
  while glSerialRunning do begin {Looping in order to receive from arduino.
    Any gui button-press will interrupt the loop.}
    if txMidiout.ReplyingToAsk then SendNextEvent; {Nested above}

    ch := #0;
    status := SerRead(SerialHandle, ch, 1);
    if (status > 0) then begin
      //ComIn := ComIn + ch;
      case ch of
        #10 : begin {Line feed, do nothing} end;
        #13 :
        begin //Cariage return
          //lbReceived.Items.Add(ComIn);
          //labStatus.Caption := ComIn;
          if leftstr(ComIn, 12) = 'Events used ' then begin
            ComIn := midStr(ComIn, 13, 999);
            EventsUsed := StrToInt(ComIn);
            if EventsUsed < 0 then begin
              {The Arduino's int has gone around-the-clock}
              EventsUsed := 65536 + EventsUsed;
            end;
            lbReceived.Items.Add('Events used ' + IntToStr(EventsUsed));
            lbReceived.TopIndex := lbReceived.Items.Count - 1;
            if EventsUsed <= EventCount then begin
              labEventsUsed.Caption := IntToStr(EventsUsed);
              sgEventTable.Row := EventsUsed;
              //Application.ProcessMessages;
              //sgEventTable.SetFocus;
            end;
          end;
          if (leftStr(ComIn, 2) = '20') and (length(ComIn) = 8) then begin
            {A request for more notes from Arduino}
            PrepareToActionAsk; {Nested above}
            //lbReceived.Items.Add(ComIn);
            //lbReceived.TopIndex := lbReceived.Items.Count - 1;

            //ActionAsk(ComIn);
          end;
          if (leftStr(ComIn, 2) = 'EP') then begin
            DisplayExpression(ComIn);
          end;
          //if (leftStr(ComIn, 2) = '22') and (length(ComIn) = 8) then begin
          if (leftStr(ComIn, 2) = 'EU') then begin
            {Arduino says Events Used}
            DisplayEventsUsed(ComIn);
          end;
          if leftstr(ComIn, 4) = 'Page' then begin
            TurnSibeliusPage(ComIn);
            lbReceived.Items.Add('Sibelius turn ' + ComIn);
            lbReceived.TopIndex := lbReceived.Items.Count - 1;
          end;
          ComIn := '';
        end else
          ComIn := ComIn + ch;
      end;
      ch := #0;
    end;
    Application.ProcessMessages;
  end;
end; {btnStartArduinoClick}

procedure TForm1.SendNote();
var
  s: String;
begin
  s := '13'; {Three bytes for synth}
  s := s + intToHex(EventRecArray[EventIx].Byte1, 2);
  s := s + intToHex(EventRecArray[EventIx].Byte2, 2);
  s := s + intToHex(EventRecArray[EventIx].Byte3, 2);
  labStatus.Caption := s;
  Transmit(s);
end;

procedure TForm1.btnStopClick(Sender: TObject);
begin
  SerFlush(SerialHandle); {Discard any remaining output}
  SerClose(SerialHandle);
  glSerialRunning := False;
  labStatus.Caption := 'Stopped.';
  labStarted.Color := clRed;;
  {StopSerial;}
end;


procedure TForm1.ClearReceived(Sender: TObject);
begin
  lbReceived.Clear;
  ComIn := '';
end;

procedure TForm1.btnPauseClick(Sender: TObject);
{It assumes serial has started}
var
  s: String;
begin
  s := '050zzzzz'; {Stop playing. Arduino runs the MuteAllChannels routine}
  Transmit(s);
  lbReceived.Clear;
end;

procedure TForm1.btnLoadClick(Sender: TObject);
begin
  AllSoundOff(Sender);
  LoadNoteList;
  if glSerialRunning then SendIt;
  labEventsUsed.Caption := '1';
  labUsedEvents.Caption := '1';
  lbReceived.Clear;
end;

procedure TForm1.btnOnClick(Sender: TObject);
var
  s: String;
begin
  //Turn on led at port 13
  s := '0601' + HexStr(13, 2) + '01';
  Transmit(s);
end;

procedure TForm1.btnOffClick(Sender: TObject);
var
  s: String;
begin
  //Turn on led at port 13
  s := '0601' + HexStr(13, 2) + '00';
  Transmit(s);
end;

procedure TForm1.LoadNoteList;
var
  aFile: TextFile;
  aStr, aFolder: string;
  RunningTime: longInt;
  r, c:Integer;
begin
  aFolder := GetCurrentDir;
  aFolder := aFolder + '\ArdFiles';
  OpenDialog1.InitialDir := aFolder;
  OpenDialog1.Filter := 'Note files|*.Ard';
  if OpenDialog1.Execute then
     ardFileName := OpenDialog1.Filename
  else exit;

  //for r := 0 to Pred(sgEventTable.RowCount) do
  for r := 1 to Pred(sgEventTable.RowCount) do
    for c := 0 to Pred(sgEventTable.ColCount) do
      sgEventTable.Cells[c, r] := '';
  sgEventTable.Rowcount := 1;

  AssignFile(aFile, ardFileName);
  Reset(aFile);
  edStartEvent.Text := '1';
  labEventsUsed.Caption := '1';

  EventCount := 0; {But not using element 0}
  RunningTime := 0;
  while not eof(aFile) do
  begin
    readln(aFile, aStr);
    inc(EventCount);
    SetLength(EventRecArray, EventCount + 1);
    with EventRecArray[EventCount] do
    begin
      WhichSynth := Hex2Dec(leftStr(aStr, 2));
      Byte1 := Hex2Dec(midStr(aStr, 3, 2));
      Byte2 := Hex2Dec(midStr(aStr, 5, 2));
      Byte3 := Hex2Dec(rightStr(aStr, 2));
      {Reconstruct these}
      if WhichSynth = 0 then
      begin
        //DeltaTime := Byte1 * 65536;
        //DeltaTime := DeltaTime + Byte2 * 256;
        DeltaTime := Byte2 * 256;
        DeltaTime := DeltaTime + Byte3;
        RunningTime := RunningTime + DeltaTime;
        RunningDelta := RunningTime;
      end;
    end; {With}
  end;
  CloseFile(afile);
  DisplayEventGrid();
  labStatus.caption := 'File read in.';
  Form1.Caption := 'Arpegionne ' + ExtractFileName(ardFileName);

  labChInst0.Caption := 'Chan 00';
  labChInst1.Caption := 'Chan 01';
  labChInst2.Caption := 'Chan 02';
  labChInst3.Caption := 'Chan 03';
  labChInst4.Caption := 'Chan 04';
  labChInst5.Caption := 'Chan 05';
  labChInst6.Caption := 'Chan 06';
  labChInst7.Caption := 'Chan 07';
  labChInst8.Caption := 'Chan 08';
  labChInst9.Caption := 'Chan 09';
  labChInst10.Caption := 'Chan 0A';
  labChInst11.Caption := 'Chan 0B';
  labChInst12.Caption := 'Chan 0C';
  labChInst13.Caption := 'Chan 0D';
  labChInst14.Caption := 'Chan 0E';
  labChInst15.Caption := 'Chan 0F';

end;

procedure TForm1.btnLoadNoteListClick(Sender: TObject);
//var r, c:Integer;
begin
  AllSoundOff(Sender);
  LoadNoteList;
  if glSerialRunning then SendIt;
  lbReceived.Clear;
end;

procedure TForm1.btnFindClick(Sender: TObject);
var HoldRow: longint; {Find Hex in the midi grid}
  edStr: String;
  Found: boolean;

  procedure RunItFrom(This, That: LongInt);
  var F: LongInt;
    sgStr: string;
  begin
    with sgMidiTable do
    begin
      For F := This + 1 to That do
      begin
        sgStr :=  sgMidiTable.Cells[1, F];
        if sgStr = edStr then
        begin
          sgMidiTable.Row := F;
          sgMidiTable.Col := 1;
          sgMidiTable.SetFocus;
          Found := True;
          Break;
        end;
      end;
    end;
  end;

begin
  edStr := edFind.Text;
  if length(edStr) <> 2 then Exit;
  HoldRow := sgMidiTable.Row;
  Found := false;
  RunItFrom(HoldRow, midArrLen);
  if not Found then
    RunItFrom(1, HoldRow);
end;

procedure TForm1.AllSoundOff(Sender: TObject);
var s: string;
  Chan: integer; {Each channel. Could just send '050zzzzz'
    to run the MuteAllChannels routine}
begin
  labStatus.Caption := 'All sound off.';
  if glSerialRunning then begin
    for Chan := 0 to 15 do begin {Turn off each channel in turn}
      {Synth 1 SC-88}
      s := '11B' + HexStr(Chan, 1) + '7B00'; {Channel message 123}
      labStatus.Caption := s;
      Transmit(s);
      {Synth 2 Integra}
      s := '12B' + HexStr(Chan, 1) + '7B00'; {Channel message 123}
      labStatus.Caption := s;
      Transmit(s);
    end;
  end;
end;

procedure TForm1.btnFindNoteClick(Sender: TObject);
var HoldRow: longint; {Actually, It's find a cmd in the note list}
  edStr: String;
  Found: boolean;

  procedure RunItFrom(This, That: LongInt);
  var F: LongInt;
    sgStr: string;
  begin
    with sgEventTable do
    begin
      For F := This + 1 to That do
      begin
        sgStr :=  sgEventTable.Cells[4, F];
        if sgStr = edStr then
        begin
          sgEventTable.Row := F;
          sgEventTable.Col := 4;
          sgEventTable.SetFocus;
          Found := True;
          Break;
        end;
      end;
    end;
  end;

begin
  edStr := edFindNote.Text;
  if length(edStr) <> 2 then Exit;
  HoldRow := sgEventTable.Row;
  Found := false;
  //RunItFrom(HoldRow, midArrLen);
  RunItFrom(HoldRow, EventCount);
  if not Found then
    RunItFrom(1, HoldRow);
end;


procedure TForm1.labAttribClick(Sender: TObject);
Var Response: integer;
  s: String;
begin
  s := labAttrib.Caption;
  Clipboard.AsText := s;
  Response := Application.MessageBox('Send?', 'Attributes', MB_ICONQUESTION + MB_YESNO);
  if Response <> IDYES then exit;
  if glSerialRunning then Transmit(s);
end;




              {Start of XML procedures}
procedure TForm1.PutInstrumentDetails(ThisInstrument: string; PartNumber: integer);
var
  iIx: integer; {Instrument index}
  Vel1, Vel2, Vel3: byte;
begin
  for iIx := 0 to xmlInstCount - 1 do begin
    if xmlInstruments[iIx].Name = ThisInstrument then begin
      Vel1 := Hex2Dec(sgIntegra7.Cells[2, xmlInstruments[iIx].IntegraNo]);
      Vel2 := Hex2Dec(sgIntegra7.Cells[3, xmlInstruments[iIx].IntegraNo]);
      Vel3 := Hex2Dec(sgIntegra7.Cells[4, xmlInstruments[iIx].IntegraNo]);

      {Set channel instrument}
      inc(EventCount);
      SetLength(EventRecArray, EventCount + 1);
      with EventRecArray[EventCount] do begin
        DeltaTime := 0;
        RunningDelta := 0;
        WhichSynth := 1;
        Byte1 := $B0 + Part[PartNumber].PartNumber - 1; {Channel}
        Byte2 := $00; {Note}
        Byte3 := Vel1; {Velocity}
        Sort := 0; {The order the array is to be played}
      end;

      inc(EventCount);
      SetLength(EventRecArray, EventCount + 1);
      with EventRecArray[EventCount] do begin
        DeltaTime := 0;
        RunningDelta := 0;
        WhichSynth := 1;
        Byte1 := $B0 + Part[PartNumber].PartNumber - 1; {Channel}
        Byte2 := $20; {Note}
        Byte3 := Vel2; {Velocity}
        Sort := 0; {The order the array is to be played}
      end;

      inc(EventCount);
      SetLength(EventRecArray, EventCount + 1);
      with EventRecArray[EventCount] do begin
        DeltaTime := 0;
        RunningDelta := 0;
        WhichSynth := 1;
        Byte1 := $FF; {Channel}
        Byte2 := $C0 + Part[PartNumber].PartNumber - 1;; {Note}
        Byte3 := Vel3; {Velocity}
        Sort := 0; {The order the array is to be played}
      end;

      {Set channel parameters}
      inc(EventCount);
      SetLength(EventRecArray, EventCount + 1);
      with EventRecArray[EventCount] do begin
        DeltaTime := 0;
        RunningDelta := 0;
        WhichSynth := 1;
        Byte1 := $B0 + Part[PartNumber].PartNumber - 1; {Channel}
        Byte2 := $07; {Note}
        Byte3 := $64; {Velocity}
        Sort := 0; {The order the array is to be played}
      end;
    end;
  end;
end;

procedure TForm1.btnMakeArdListClick(Sender: TObject);
{From an XML file. Prepares for GM2 on Integra-7}
var
  PartNumber: integer;
  xmlRow: integer;
  aStr: string;
  aTag: string;
  Note: string;
  Alter: integer;
  Octave: string;
  MidiNote: integer;
  HolDbl: double;
  Duration: LongInt;
  LocalRunningDelta: LongWord;
  RestFlagged,
  BackupFlagged: boolean;
  Repeating: boolean;
  RepeatFromRow: integer;

  procedure MakeNoteRecord(Delta, PartNumber, MidiNote: integer); {Nested}
  begin
    inc(EventCount);
    SetLength(EventRecArray, EventCount + 1);
    with EventRecArray[EventCount] do begin
      DeltaTime := 0;
      //LocalRunningDelta := LocalRunningDelta + DeltaTime;
      RunningDelta := LocalRunningDelta;
      WhichSynth := 1;
      Byte1 := $90 + PartNumber - 1; {Cmd}
      Byte2 := MidiNote + Part[PartNumber].TransposeChromatic; {Note}
      Byte3 := $5F; {Velocity}
      Sort := EventCount; {Preliminary only. Will be set later}
    end;
            EventRecArray[EventCount].Sort := EventCount;
    {The note off record}
    inc(EventCount);
    SetLength(EventRecArray, EventCount + 1);
    LocalRunningDelta := LocalRunningDelta + Delta;
    with EventRecArray[EventCount] do begin
      DeltaTime := Delta;
      RunningDelta := LocalRunningDelta;
      WhichSynth := 1;
      Byte1 := $80 + PartNumber - 1; {Cmd}
      Byte2 := MidiNote + Part[PartNumber].TransposeChromatic; {Note}
      Byte3 := $5F; {Velocity}
      Sort := EventCount;  {Preliminary only. Will be set later}
    end;
  end;

  begin {Start of btnMakeArdListClick}
  {Parsing memXml memo box which should already be filled}
  EventCount := 0; {Record 0 is not used}
  SetLength(EventRecArray, EventCount + 1);
  PartNumber := 0; {Will be from 1 to 16}
  EventIx := 0;
  RestFlagged := false;
  BackupFlagged := false;
  Alter := 0;
  Repeating := false;

  xmlRow := -1;
  while xmlRow < memXml.Lines.Count - 1 do begin
    {Single pass system}
    {First find instruments}
    inc(xmlRow);
    aStr := memXml.Lines[xmlRow];
    aStr := Trim(aStr);
    aTag := GetTag(aStr); {Includes tags}

    if leftStr(aTag, 17) = '<score-part id="P' then begin
      PartNumber := ExtractPartNumber(aTag); {1..16}
      Part[PartNumber].PartNumber := PartNumber;
    end;
    if leftStr(aTag, 11) = '<part id="P' then begin
      PartNumber := ExtractPartNumber(aTag); {1..16}
      LocalRunningDelta := 0;
      Repeating := false;
      RepeatFromRow := xmlRow; {If needed or not}
    end;

    case aTag of
      '<instrument-name>': begin
        Part[PartNumber].SoundName := ExtractInstrumentName(aStr);
        PutInstrumentDetails(Part[PartNumber].SoundName, PartNumber);
        LocalRunningDelta := 0; {Reset for each track}
      end;
      '<chromatic>': begin
        Part[PartNumber].TransposeChromatic := ExtractChromatic(aStr);
      end;
      '<step>': begin
        Note := ExtractNote(aStr);
      end;
      '<alter>': begin
        Alter := ExtractAlter(aStr);
      end;
      '<octave>': begin
        Octave := ExtractOctave(aStr);
        MidiNote := GetMidiNote(Note, Octave) + Alter;
        Alter := 0;
      end;
      '<volume>': begin
         Part[PartNumber].Volume := ExtractVolume(aStr);
      end;
      '<backup>': begin
        BackupFlagged := true;
      end;
      '<repeat direction="backward"/>': begin
        if Repeating then begin
          {Must be at the end of the repeat}
          Repeating := false;
          RepeatFromRow := xmlRow + 1;
        end else begin
          {Start of repeat}
          Repeating := true;
          xmlRow := RepeatFromRow;
        end;
      end;
      '<repeat direction="forward"/>': begin
        Repeating := false;
        RepeatFromRow := xmlRow + 1;
      end;
      '<rest/>': begin
        RestFlagged := true;
      end;
      '<duration>': begin
        HolDbl := ExtractDuration(aStr);
        //HolDbl := HolDbl * (960 / 256);
        HolDbl := HolDbl * 160;
        Duration := Trunc(HolDbl);
        if RestFlagged then
          LocalRunningDelta := LocalRunningDelta + Duration;
        if BackupFlagged then
          LocalRunningDelta := LocalRunningDelta - Duration;
        if (not RestFlagged) and (not BackupFlagged) then begin
          {Write a note record}
          MakeNoteRecord(Duration, PartNumber, MidiNote); {Nested above}
        end else begin
          RestFlagged := false;
          BackupFlagged := false;
        end;
      end;
      '<chord/>': begin
        {Go again with the last duration}
        LocalRunningDelta := LocalRunningDelta - Duration;
      end;
    end; {Case}
  end; {For}
  DisplayEventGrid;
  labStatus.Caption := 'Note list finished.';
end;


end.

(*
An 8 char string is sent as a packet to arduino. One nybble per char.
Each pair is a hex string, so in effect it represents 4 bytes

Str[1] is the address of the device on the network
  00, This is a timing record.
  0000 turn auto-play off
  0001 Auto play up to the next 0000 timing record

  The last two bytes have the number ov milliseconds taken,
  65535 being just over 65 seconds.

  01, 02, or 03 Arduino to put these into the event array
    at its next eIndexH position. The second nybble denotes which
    synth Integra 1, SC-88 2, obsolete 3, back to computer 4
  050 Stop/pause playing       Change to 070 and 071
  051 Auto-play the event array
  05 A call for a change in a port's outward, or poll
  05XX the pin's number
  0600XXzz Peek port pin value
  0601XX00 Poke port pin low
  0601XX01 Poke port pin high
  070HHHHH Reset eIndexH and eIndexT



  1  Codes sent straight to a synth (not put in the event array)
  11 Arduino to send the following 3 bytes to Synth 1 Integra
  12 Arduino to send the following 3 bytes to Synth 2 SC-88
  2 The number of the Rasperry Pi
  //200zz190 Send first 400 records from the note array
  200zz190 Send first 600 records from the note array
  //201zzzC8 Send next 200 records
  201zzzC8 Send next 300 records
  21zzzzzz Display this packet
  3 The number of the keyboard
  30zzzz
    00 Keyboard is trigger for event array (default)
    01 Keyboard is to be put through to Integra
    02 Keyboard is to be put through to SC-88
  4 The number of the guitar GL-10
  40zzzzzz Tell the arduino that the
    guitar is to be put through to Sc-88 (Default)
  41zzzzzz Guitar is trigger only


*)

