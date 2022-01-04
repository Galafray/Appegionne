unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Unit2, dbf, Classes, Serial, SysUtils, FileUtil, Forms, Controls, Graphics,
  Dialogs, StdCtrls, Grids, ExtCtrls, ComCtrls, Menus, StrUtils,
  DateUtils, mouseandkeyinput, LCLTYPE, ClipBrd, types;

type

  { TForm1 }

  TForm1 = class(TForm)
    btnGetSibelius: TButton;
    btnLoad: TButton;
    btnLoadMidiFile: TButton;
    btnAddTimeToPrev: TButton;
    btnMakeNoteList: TButton;
    btnMplus: TButton;
    btnMrecall: TButton;
    btnToArduino: TButton;
    btnToggleLed: TButton;
    btnPageTurn: TButton;
    btnParseArray: TButton;
    btnPractNext: TButton;
    btnPractPrev: TButton;
    btnSave: TButton;
    btnSend: TButton;
    btnSortNoteList: TButton;
    btnSoundOff1: TButton;
    btnReport: TButton;
    btnToClipboard: TButton;
    btnStartArduino: TButton;
    btnStop: TButton;
    btnFind: TButton;
    btnFindNote: TButton;
    btnFindNoteInList: TButton;
    btnSoundOff: TButton;
    btnGetChInst: TButton;
    btnChangeUsedChannel: TButton;
    btnMakeGM2: TButton;
    btnIntegra7Search: TButton;
    btnMakeGM: TButton;
    btnPostback: TButton;
    btnMakeAuto: TButton;
    btnLoadMusicXmlFile: TButton;
    btnMakeArdList: TButton;
    btnDeleteRow: TButton;
    btnToMemEvents: TButton;
    btnInsertRow: TButton;
    btnPageBreak: TButton;
    btnPractPoint: TButton;
    btnCheckNoteOffs: TButton;
    btnExport: TButton;
    btnChangeChnSynth: TButton;
    btnSc88Search: TButton;
    btnTrill: TButton;
    btnPokeArray: TButton;
    btn2MemEvents: TButton;
    btnBend: TButton;
    btnSwellOutline: TButton;
    cbAllowPointer: TCheckBox;
    cgChannel: TCheckGroup;
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
    edSearchSc88: TEdit;
    edStartEvent: TEdit;
    edSynthChn: TEdit;
    edToChn: TEdit;
    edSearchI7: TEdit;
    edSynthTo: TEdit;
    labAttrib: TLabel;
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
    labChInst0: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    labPan1: TLabel;
    labPanA: TLabel;
    labPanB: TLabel;
    labPanC: TLabel;
    labPanD: TLabel;
    labPanE: TLabel;
    labPanF: TLabel;
    labPan2: TLabel;
    labPan3: TLabel;
    labPan4: TLabel;
    labPan5: TLabel;
    labPan6: TLabel;
    labPan7: TLabel;
    labPan8: TLabel;
    labPan9: TLabel;
    labEventsUsed: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    labReceived: TLabel;
    labRow: TLabel;
    labSent: TLabel;
    labUsedEvents: TLabel;
    labVol0: TLabel;
    labVol1: TLabel;
    labPan0: TLabel;
    labVolA: TLabel;
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
    labVol2: TLabel;
    labStarted: TLabel;
    labStatus: TLabel;
    lbMidiNotes: TListBox;
    lbPractice: TListBox;
    lbReceived: TListBox;
    lbSent: TListBox;
    lbArdFiles: TListBox;
    memEvents: TMemo;
    memXml: TMemo;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    ProgressBar1: TProgressBar;
    rbAtt: TRadioButton;
    rbCho: TRadioButton;
    rbDec: TRadioButton;
    rbDel: TRadioButton;
    rbFil: TRadioButton;
    rbPhas: TRadioButton;
    rbRel: TRadioButton;
    rbRev: TRadioButton;
    rbTim: TRadioButton;
    rbTrem: TRadioButton;
    rbVar: TRadioButton;
    rbVDel: TRadioButton;
    rbVdep: TRadioButton;
    rbVra: TRadioButton;
    rgAttrib: TRadioGroup;
    rgKeyboard: TRadioGroup;
    sgEventTable: TStringGrid;
    sgSc88: TStringGrid;
    sgMidiTable: TStringGrid;
    sgIntegra7: TStringGrid;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet7: TTabSheet;
    TabSheet8: TTabSheet;
    TabSheet9: TTabSheet;
    TvArdFiles: TTreeView;
    UpDn1: TUpDown;
    udMove: TUpDown;


    procedure btn2MemEventsClick(Sender: TObject);
    procedure btnAddTimeToPrevClick(Sender: TObject);
    procedure btnBendClick(Sender: TObject);
    procedure btnChangeChnSynthClick(Sender: TObject);
    procedure btnChangeUsedChannelClick(Sender: TObject);
    procedure btnCheckNoteOffsClick(Sender: TObject);
    procedure btnDeleteRowClick(Sender: TObject);
    procedure btnExportClick(Sender: TObject);
    procedure btnGetSibeliusClick(Sender: TObject);
    procedure btnInsertRowClick(Sender: TObject);
    procedure btnMakeAutoClick(Sender: TObject);
    procedure btnMakeGM2Click(Sender: TObject);
    procedure btnMakeGMClick(Sender: TObject);
    procedure btnMplusClick(Sender: TObject);
    procedure btnMrecallClick(Sender: TObject);
    procedure btnPageBreakClick(Sender: TObject);
    procedure btnPageTurnClick(Sender: TObject);
    procedure btnPokeArrayClick(Sender: TObject);
    procedure btnPostbackClick(Sender: TObject);
    procedure btnPractPointClick(Sender: TObject);
    procedure btnPractPrevClick(Sender: TObject);
    procedure btnPractNextClick(Sender: TObject);
    procedure btnReportClick(Sender: TObject);
    procedure btnSc88SearchClick(Sender: TObject);
    procedure btnSwellOutlineClick(Sender: TObject);
    procedure btnToArduinoClick(Sender: TObject);
    procedure btnToClipboardClick(Sender: TObject);
    procedure btnToMemEventsClick(Sender: TObject);
    procedure btnTrillClick(Sender: TObject);
    procedure cbAllowPointerChange(Sender: TObject);
    procedure edAutoFromDblClick(Sender: TObject);
    procedure edAutoToDblClick(Sender: TObject);
    procedure EditNoteRow(Sender: TObject);
    procedure edStartEventDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GetChInst();
    procedure btnGetChInstClick(Sender: TObject);
    procedure labAttribDblClick(Sender: TObject);
    procedure labEventsUsedClick(Sender: TObject);
    procedure labUsedEventsClick(Sender: TObject);
    procedure lbArdFilesDblClick(Sender: TObject);
    procedure lbMidiNotesDblClick(Sender: TObject);
    procedure lbSentDblClick(Sender: TObject);
    procedure FillArdFileListBox(FolderPath: string);
    procedure OnProgramStart(Sender: TObject);
    procedure AllSoundOff;
    procedure btnFindClick(Sender: TObject);
    procedure btnFindNoteClick(Sender: TObject);
    procedure FillLbPractice(ActiveEvent: Longint);
    procedure LoadNoteList;
    //procedure btnLoadNoteListClick(Sender: TObject);
    //procedure btnOnClick(Sender: TObject);
    procedure btnToggleLedClick(Sender: TObject);
    //procedure btnLoadClick(Sender: TObject);
    procedure SaveArdFile;
    procedure btnSaveClick(Sender: TObject);
    //procedure cbPatchChange(Sender: TObject);
    procedure FindNoteInList(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SearchI7List(Sender: TObject);
    //procedure SetInstrument(Sender: TObject);
    procedure sgEventTableDblClick(Sender: TObject);
    //procedure sgPracticeClick(Sender: TObject);
    //procedure sgPracticeDblClick(Sender: TObject);
    procedure lbPracticeDrawItem(Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure lbPracticeHighlight(ActiveEvent: Longint);
    procedure TabSheet9ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure ThroughOrTrigger();
    procedure rgKeyboardClick(Sender: TObject);
    procedure Transmit(s: string);
    procedure SendIt;
    procedure btnSendClick(Sender: TObject);
    procedure DisplayExpression(ComIn: string);
    procedure DisplayEventsUsed(ComIn: string);
    procedure btnStartArduinoClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure ClearReceived(Sender: TObject);
    procedure lbPracticeClick(Sender: TObject);
    procedure lbPracticeDblClick(Sender: TObject);
    procedure SortNoteListClick(Sender: TObject);
    function FourByteStr(b0, b1, b2, b3: byte): String;
    procedure TvArdFilesDblClick(Sender: TObject);
    procedure udMoveClick(Sender: TObject; Button: TUDBtnType);
    procedure UpDn1Click(Sender: TObject; Button: TUDBtnType);
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

    {The next four fields will be sent to the Arduino}
    //Synth: integer;
    Synth: byte;
    Comm: byte; {Channel, Command, Auto-play}
    Note: byte; {Note}
    Velo: byte; {Velocity}

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
    EventIx: longint; {Index to Events}
    StartEventWanted: LongInt; {Set index limit}
    LastEventWanted: LongInt; {Set index limit}
    LastEventIxToArduino: longint;
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
  ArdFilePath: string;
  ArdFileName: string;
  ArdSubFolder: string;
  xmlFilename: string;

  trackCount: integer;
  trackRecArray: array of TrackType;
  trackIndex: integer;

  clicksPerCrotchet: longInt; {Sometimes known as PPQ or PPQN
    pulses per quarter note}
  CrotchetsPerBar: longint;
  BeatsPerBar: integer;

  Events: array of EventType;
  EventCount: longint;
  //EventIx: longint; {Index to Events}

  MidiNoteVals: array [0..120] of string[4];
  //InstArraySC88: array [0..415-1] of string;

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


Function InRange(aDble, Lowest, Highest: Double): boolean;
begin
  InRange := true;
  if aDble < Lowest then InRange := false;
  if aDble > Highest then InRange := false;
end;


Function LsB(Delta: integer): integer;
begin
  LsB := Delta and $FF;
end;


function GetTag(aStr: string): string;
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


procedure TForm1.TvArdFilesDblClick(Sender: TObject);
var aStr: string;
begin
  ArdSubFolder := TTreeView(Sender).Selected.Text;
  if ArdSubFolder = 'ArdFiles' then begin
    ArdSubFolder := '';
  end else begin
    ArdSubFolder := ArdSubFolder + '\';
  end;
  aStr := ArdFilePath + ArdSubFolder;
  FillArdFileListBox(aStr);
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
      HoldEvent := Events[CurrRow + 1];
      Events[CurrRow + 1] := Events[CurrRow];
      sgEventTable.Row := CurrRow + 1;
    end;
    btNext: begin {Actually, prev}
      HoldEvent := Events[CurrRow - 1];
      Events[CurrRow - 1] := Events[CurrRow];
      sgEventTable.Row := CurrRow - 1;
    end;
  end;
  Events[CurrRow] := HoldEvent;
  DisplayEventGrid;
end;


procedure TForm1.UpDn1Click(Sender: TObject; Button: TUDBtnType);
var Chn: byte;
  s: String;
begin
  { Update labAttrib }
  s := '';
  case rgKeyboard.ItemIndex of {What synth do we want?}
    0: begin
      s := '11'; {Integra}
    end;
    1: begin
      s := '01'; {Integra}
    end;
    2: begin
      s := '02'; {SC-88}
    end;
  end;

  {Which channel?}
  for Chn := 0 to $0F do begin
    if cgChannel.Checked[Chn] then begin
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
    labAttrib.Caption := s;
    Clipboard.AsText := s;
    Exit; {Only doing one channel}
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

  For F := 0 to (FileSize(afile) - 1) do begin
    Read(afile, midiArr[F]);
    with sgMidiTable do begin
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

  ArdFileName := midiFileName;
  ArdFileName := ChangeFileExt(ardFileName, '.Ard');

  edStartEvent.Text := '1';
end;


procedure TForm1.FillArdFileListBox(FolderPath: string);
var
  ArdFiles: TStringList;
  Index: LongInt;
  aStr: string;
begin
  lbArdFiles.Clear;
  ArdFiles := TStringList.Create;
  ArdFiles.Sorted := true;
  try
    //FindAllFiles(ArdFiles, 'C:\Arpeggione\Scores\ArdFiles', '*.Ard', false);
    FindAllFiles(ArdFiles, FolderPath, '*.Ard', false);
    //ShowMessage(Format('Found %d Pascal source files', [PascalFiles.Count]));
    for Index := 0 to ArdFiles.Count - 1 do begin
      aStr := ArdFiles.Strings[Index];
      aStr := ExtractFileName(aStr);
      aStr := leftStr(aStr, length(aStr) - 4);
      lbArdFiles.Items.Add(aStr);
    end;
    labStatus.caption := IntToStr(ArdFiles.Count) + ' note files found.';
  finally
    ArdFiles.Free;
  end;
end;


procedure TForm1.OnProgramStart(Sender: TObject);
var aFile: TextFile;
    aStr: string;
    Index: LongInt;
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
    Index := Index + 1;
  end;
  CloseFile(afile);
  {Display the midi notes in reverse order}
  for Index := Index - 1 downto 1 do begin
    aStr := MidiNoteVals[Index];
    aStr := HexStr(Index, 2) + ' ' + aStr;
    lbMidiNotes.Items.Add(aStr);
  end;
  lbMidiNotes.ItemIndex := 60;

  if SetCurrentDir('C:\Arpeggione\Scores') then
    aStr := 'Good directory'; {For debugging}

  (*
  {Load in the SC-88 Sound map file}
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
  CloseFile(afile);      *)

  {Load in the SC-88 Sound map file}
  AssignFile(aFile, 'C:\Arpeggione\SC-88 Sound map 2.txt');
  Reset(aFile);
  //cbPatch.Items.Clear;
   with sgSc88 do begin
    sgSc88.RowCount := 415 + 1; { + 1 for the header row}
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

  {Load in the INTEGRA-7 Sound map file}
  AssignFile(aFile, 'C:\Arpeggione\INTEGRA-7 Sound map.txt');
  Reset(aFile);
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
  while not eof(aFile) do begin
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
  with sgMidiTable do begin
    ColWidths[0] := 70; {Pos}
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
  with sgEventTable do begin
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

  with sgIntegra7 do begin
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

  with sgSc88 do begin
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
  with txMidiOut do begin
    ReplyingToAsk := false;
    StartEventWanted := 0;;
    LastEventWanted := 0;
    LastEventIxToArduino := 0;
    Many := 0;
  end;

  PageControl1.ActivePage := TabSheet1; {The Arduino tab}
  //cbPatch.ItemIndex := 0; {Instrument}

  rgKeyboard.ItemIndex := 0; {0 Trigger, 1 Integra, 2 SC-88}
  btnMplus.Tag := 1;

  ArdFilePath := 'C:\Arpeggione\Scores\ArdFiles\';
  ArdSubFolder := '';
  ArdFileName := '';

  FillArdFileListBox(ArdFilePath);
  //Application.Processmessages;
  //btnStartArduino.Click; //Locks up from the start
end;


procedure TForm1.GetChInst();
var Chn: integer;
    Inst, LSB, BankVar, Volume, PanPot: integer;
    aStr: string;
    EventIx: longint;

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

  procedure FromSynth2; {SC-88}   // Make ths similar to the above Integra
  var InstInx: integer;
      bStr: string;
  begin
    //for InstInx := 0 to 415 - 1 do begin {Number of SC-88 instruments}
      //if LeftStr(InstArraySC88[InstInx], 8) = aStr then begin
        //aStr := 'Chan ' + HexStr(Chn, 2) + '  ' + InstArraySC88[InstInx];
        //system.break;
      //end;
    for InstInx := 1 to 415 do begin  {Number of Integra7 instruments}
      bStr := sgSc88.Cells[2, InstInx];
      bStr := bStr + ' ' + sgSc88.Cells[3, InstInx];
      bStr := bStr + ' ' + sgSc88.Cells[4, InstInx];
      if bStr = aStr then begin
        aStr := 'Chan ' + HexStr(Chn, 2) + ' ' + aStr + '  ' + sgSc88.Cells[1, InstInx];
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

  labPan0.Caption := '00';
  labPan1.Caption := '00';
  labPan2.Caption := '00';
  labPan3.Caption := '00';
  labPan4.Caption := '00';
  labPan5.Caption := '00';
  labPan6.Caption := '00';
  labPan7.Caption := '00';
  labPan8.Caption := '00';
  labPan9.Caption := '00';
  labPanA.Caption := '00';
  labPanB.Caption := '00';
  labPanC.Caption := '00';
  labPanD.Caption := '00';
  labPanE.Caption := '00';
  labPanF.Caption := '00';

  for EventIx := 1 to EventCount do begin
    with Events[EventIx] do begin
      {Indicator of an instrument}
      if Comm = $FF then begin
        Chn := Note - $C0;
        if not InRange(Events[EventIx - 2].Comm, $B0, $BF) then break;
        if not InRange(Events[EventIx - 1].Comm, $B0, $BF) then break;
        case Chn of
          $0..$F: begin
            Inst := Velo; {The order these appear unfortunatly varies}
            LSB := Events[EventIx - 1].Velo;
            BankVar := Events[EventIx - 2].Velo;
          end;
        end;
        aStr := HexStr(BankVar, 2) + ' ' + HexStr(LSB, 2) + ' ' + HexStr(Inst, 2);

        {Decide which synth}
        case Events[EventIx].Synth of
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
      if (Note = $07) then begin {Initial volume setting}
        Chn := Comm - $B0;
        case Chn of
          $0..$F: begin
            Volume := Velo;
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
      if (Note = $0A) then begin {Panpot. $40 is centred}
        Chn := Comm - $B0;
        case Chn of
          $0..$F: begin
            PanPot := Velo;
            aStr := HexStr(PanPot, 2);
            case Chn of
              $0: labPan0.Caption := aStr;
              $1: labPan1.Caption := aStr;
              $2: labPan2.Caption := aStr;
              $3: labPan3.Caption := aStr;
              $4: labPan4.Caption := aStr;
              $5: labPan5.Caption := aStr;
              $6: labPan6.Caption := aStr;
              $7: labPan7.Caption := aStr;
              $8: labPan8.Caption := aStr;
              $9: labPan9.Caption := aStr;
              $A: labPanA.Caption := aStr;
              $B: labPanB.Caption := aStr;
              $C: labPanC.Caption := aStr;
              $D: labPanD.Caption := aStr;
              $E: labPanE.Caption := aStr;
              $F: labPanF.Caption := aStr;
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
  EventIx: longint;
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
    with Events[EventIx] do begin
      if Comm = $FF then begin
        Cmd := Note and $F0;   {Most significant nybble}
        Chn := Note and $0F;   {Lsn}
        if Chn = FromChn then Chn := ToChn;
        Note := Cmd + Chn;
      end;
      Cmd := Comm and $F0;   {Most significant nybble}
      Chn := Comm and $0F;   {Lsn}
      case Cmd of
        $80, $90, $B0, $C0: begin
          if Chn = FromChn then Chn := ToChn;
          Comm := Cmd + Chn;
        end;
      end;
    end;
  end;
  DisplayEventGrid;
end;


procedure TForm1.btnChangeChnSynthClick(Sender: TObject);
var
  FromChn,
  ToSynth: integer;
  Cmd,
  Chn: integer;
  EventIx: longint;
begin
  labStatus.Caption := 'Changing synth.';
  FromChn := Hex2Dec(edSynthChn.Text);
  ToSynth := Hex2Dec(edSynthTo.Text);
  for EventIx := 1 to EventCount - 1 do begin
    with Events[EventIx] do begin
      Cmd := Comm and $F0;   {Most significant nybble}
      Chn := Comm and $0F;   {Lsn}
      if Comm = $FF then begin
        Cmd := Note and $F0;   {Most significant nybble}
        Chn := Note and $0F;   {Lsn}
      end;
      {Ignore it if this is a page-turn, or similar}
      if Synth <> 4 then begin
        if Comm > $01 then
          {It is not a timing record}
          if Chn = FromChn then
            Synth := ToSynth;

      end;
    end;
  end;
  DisplayEventGrid;
end;


procedure TForm1.btnAddTimeToPrevClick(Sender: TObject);
var
  CurrRow, PrevRow, NewDelta: longInt;
begin
  {Adds this Delta to the previous}
  {Used when simplifying trills}
  CurrRow := sgEventTable.Row;
  if Events[CurrRow].Synth <> 0 then begin
    Application.MessageBox('Not a timing event', 'Add Deltas', MB_OK);
    exit;
  end;
  for PrevRow := CurrRow - 1 downTo 1 do begin
    if Events[PrevRow].Synth = 0 then begin
      {This is the previous timing event}
      NewDelta := Events[CurrRow].DeltaTime +
        Events[PrevRow].DeltaTime;
      with Events[PrevRow] do begin
        {This is hardly needed and it would overwrite auto
        Events[PrevRow].Comm := (NewDelta and $FF0000) div $FFFF;}
        Events[PrevRow].Note := (NewDelta and $00FF00) div $FF;
        Events[PrevRow].Velo := (NewDelta and $0000FF);
        {Display the change}
        with sgEventTable do begin
          Cells[2, PrevRow] := IntToStr(NewDelta);
          Cells[4, PrevRow] := intToHex(Comm, 2);
          Cells[5, PrevRow] := intToHex(Note, 2);
          Cells[6, PrevRow] := intToHex(Velo, 2);
        end;
      end;
      exit;
    end;
  end;
end;


procedure TForm1.btnBendClick(Sender: TObject);
begin
  memEvents.Text := memEvents.Text + '04EF015F' +  Cr; {Notice of next two events for
                                                       Arduino's Bent.tEvent array}
  {The $01 is for the synth.
   The $5F is 95 ms}
  memEvents.Text := memEvents.Text + '02E17F7F' +  Cr; {Trill upper. Channel 1}
  memEvents.Text := memEvents.Text + '02E10040' +  Cr; {Trill lower. Channel 1}
    {This is the notated note}
  memEvents.Text := memEvents.Text + '04EE0000' +  Cr; {Start bend-trill}
  memEvents.Text := memEvents.Text + '04ED0000' +  Cr; {End bend-trill}
end;


procedure TForm1.btn2MemEventsClick(Sender: TObject);
Var Chn: byte;
begin
  memEvents.Clear;
  for Chn := 0 to $0F do begin
    if cgChannel.Checked[Chn] then begin
      memEvents.Text := '02B' + HexStr(Chn, 1) + '00' +
        sgSc88.Cells[2, sgSc88.Row] + Cr +
        '02B' + HexStr(Chn, 1) + '20' +
        sgSc88.Cells[3, sgSc88.Row] + Cr +
        '02FFC' + HexStr(Chn, 1) +
        sgSc88.Cells[4, sgSc88.Row];
    end;
  end;
  labStatus.caption := 'See memEvents on the Channel tab.';
end;


procedure TForm1.btnCheckNoteOffsClick(Sender: TObject);
var
  Notes: array[0..120] of integer;
  Ix, Channel: integer;
  EventIx: longint;
  aStr: string;
begin
  labStatus.Caption := 'Checking.';
  for Channel := $00 to $0F do begin {Loop each channel}
    for Ix := 0 to 120 do begin
      {Init note array for each new channel}
      Notes[Ix] := $00;
    end;
    for EventIx := 1 to EventCount do begin
      with Events[EventIx] do begin
        if Comm = $90 + Channel then begin
          inc(Notes[Note]);
          if Notes[Note] > 1 then begin
            aStr := 'Consecutive ons row ' + IntToStr(EventIx) +
              ' note ' + HexStr(Note, 2) + '.';
            labStatus.Caption := aStr;
            sgEventTable.Row := EventIx;
            exit;
          end;
        end;
        if Comm = $80 + Channel then begin
          dec(Notes[Note]);
          if Notes[Note] < 0 then begin
            aStr := 'Off without on row ' + IntToStr(EventIx) +
              ' note ' + HexStr(Note, 2) + '.';
            labStatus.Caption := aStr;
            sgEventTable.Row := EventIx;
            exit;
          end;
        end;
      end;
    end;
    {Check the're all naughts}
    for Ix := 0 to 120 do begin
      if Notes[Ix] <> $00 then begin
        aStr := 'Problem. Channel ' + HexStr(Channel, 2) + ' note ' +
          HexStr(Ix, 2) + ' count ' + IntToStr(Notes[Ix]);
        labStatus.Caption := aStr;
        exit;
      end;
    end;
  end;
  labStatus.Caption := 'Finished.';
end;


procedure TForm1.btnDeleteRowClick(Sender: TObject);
var CurrRow: longInt;
  EventIx: longint;
begin
  CurrRow := sgEventTable.Row;
  for EventIx := CurrRow to EventCount - 1 do begin
    Events[EventIx] := Events[EventIx + 1]
  end;
  dec(EventCount);
  sgEventTable.RowCount := EventCount + 1;
  DisplayEventGrid;
  sgEventTable.Row := CurrRow;
end;


procedure TForm1.btnExportClick(Sender: TObject);
var
  fName: string;
  tfOut: TextFile;
begin
try
  {Create text file, write to it and free it to prevent memory leaks}
  fName := 'Export.txt';
  AssignFile(tfOut, fName);
  Rewrite(tfOut);
  with sgMidiTable do begin
    for midArrIx := 1 to RowCount - 1 do begin
       Write(tfOut, Cells[0, midArrIx] + ' ');
       Write(tfOut, Cells[1, midArrIx] + ' ');
       Write(tfOut, Cells[2, midArrIx] + ' ');
       Write(tfOut, Cells[3, midArrIx] + ' ');
       Writeln(tfOut, Cells[4, midArrIx]);
     end;
  end;
  CloseFile(tfOut);
except {Handle errors}
  on E:Exception do
    labStatus.caption := fName + ' not saved: ' +  E.Message;
end;
  labStatus.caption := fName + ' created ok.';
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
        $26: begin
          KeyInput.Down(VK_SHIFT);
          KeyInput.Press($37); {Ampersand - Shift-7}
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
  //y := 145; {Over Open}
  y := 150; {Over Open}
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


procedure TForm1.btnInsertRowClick(Sender: TObject);
var CurrRow: longInt;
  EventIx: longint;
begin
  inc(EventCount);
  SetLength(Events, EventCount + 1); {Stretch array}
  CurrRow := sgEventTable.Row;
  for EventIx := EventCount - 1 downto CurrRow do begin
    Events[EventIx + 1] := Events[EventIx]
  end;
  {Fill the current row with 00s
  Events[CurrRow].Comm := $00;
  Events[CurrRow].Note := $00;
  Events[CurrRow].Velo := $00;
  Events[CurrRow].DeltaTime := $00;
  Events[CurrRow].RunningDelta := $00;
  Events[CurrRow].Sort := $00; }

  sgEventTable.RowCount := EventCount + 1;
  DisplayEventGrid;
  sgEventTable.Row := CurrRow;
end;


procedure TForm1.btnMakeAutoClick(Sender: TObject);
var
  FromRow, ToRow:longInt;
  NoteOnFound: boolean;
  EventIx: longint;
  HoldIndex: longInt;
begin
  if (edAutoFrom.Caption = '') OR (edAutoTo.Caption = '') then begin
    {Nothing in the ed boxes, so check the whole array}
    NoteOnFound := false;
    HoldIndex := 1; {Assume the first one is a timing record}
    for EventIx := 2 to EventCount do begin {Skip top one}
      if Events[EventIx].Synth > $00 then begin
        {A non-timing record}
        if (Events[EventIx].Comm >= $90) and
          (Events[EventIx].Comm <= $9F) then
            NoteOnFound := true;
      end else begin
        {A timing record}
        if (NoteOnFound = false) and (HoldIndex > 1) then begin
          Events[HoldIndex].Comm := $01; {Cmd. Record made automatic}
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
    if Events[EventIx].Synth = 0 then begin
      Events[EventIx].Comm := 1; {Cmd}
    end;
  end;
  sgEventTable.Row := ToRow;
  DisplayEventGrid;
end;


procedure TForm1.btnMakeGMClick(Sender: TObject);
var EventIx: longint;
begin
  for EventIx := 1 to EventCount do begin
    with Events[EventIx] do begin
      {Ignore it if this is a page-turn, of similar}
      if Synth <> 4 then begin
        if Synth <> $00 then
          {It is not a timing record}
          Synth := $02; {SC-88}
        if Comm = $FF then
          {Fix instrument selection}
          Events[EventIx - 2].Velo := $00; {GM}
      end;
    end;
  end;
  DisplayEventGrid;
end;


procedure TForm1.btnMplusClick(Sender: TObject);
begin
  btnMplus.Tag := StrToInt(labUsedEvents.Caption) + 1;
  btnMrecall.Click;
end;


procedure TForm1.btnMrecallClick(Sender: TObject);
begin
  edStartEvent.Text := IntToStr(btnMplus.Tag);
end;


procedure TForm1.btnPageBreakClick(Sender: TObject);
var CurrRow,
  EventIx: longint;
begin
  inc(EventCount);
  SetLength(Events, EventCount + 1); {Stretch array}
  CurrRow := sgEventTable.Row;
  for EventIx := EventCount - 1 downto CurrRow do begin
    Events[EventIx + 1] := Events[EventIx]
  end;
  inc(CurrRow);
  {Fill the current row}
  Events[CurrRow].Synth := 4;
  Events[CurrRow].Comm := $02;
  Events[CurrRow].Note := $FF;
  Events[CurrRow].Velo := $FF;

  sgEventTable.RowCount := EventCount + 1;
  DisplayEventGrid;
  sgEventTable.Row := CurrRow + 1;

  {Go back to the start of the group with the page turn}
  for EventIx := CurrRow downto 1 do begin
    if Events[EventIx].Synth = 0 then begin
      {It is a timing record}
      if Events[EventIx].Comm = 0 then begin
        {It is not an automatic-play}
        Break;
      end;
    end;
  end;
  CurrRow := EventIx;

  {Now save, and update the micro-controller}
  SaveArdFile;
  PageControl1.ActivePageIndex := 3; {Arduino}
  edStartEvent.Text := intToStr(CurrRow);
  Clipboard.AsText := edStartEvent.Text;
  btnSend.Click;

  FillLbPractice(CurrRow);
  lbPracticeHighlight(CurrRow);
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
  aPoint.x := HoldX; {Could the PageTurn button}
  aPoint.y := HoldY;
  aMouse.CursorPos := aPoint;
end;


procedure TForm1.btnPokeArrayClick(Sender: TObject);
var
  CurrRow: integer;
  F, EventIx: longint;
  s, aStr: String;
begin
  CurrRow := sgEventTable.Row;
  for F := 0 to memEvents.lines.Count - 1 do begin
    if memEvents.lines[F] <> '' then begin
      inc(EventCount);
      SetLength(Events, EventCount + 1); {Stretch array}
      for EventIx := EventCount - 1 downto CurrRow do begin
        Events[EventIx + 1] := Events[EventIx]
      end;
      {Fill the current row with 00s}
      Events[CurrRow].Synth := $00;
      Events[CurrRow].Comm := $00;
      Events[CurrRow].Note := $00;
      Events[CurrRow].Velo := $00;
      Events[CurrRow].DeltaTime := $00;
      Events[CurrRow].RunningDelta := $00;
      Events[CurrRow].Sort := $00;
    end;
  end;

  s := '';
  for F := 0 to memEvents.lines.Count - 1 do begin
    if memEvents.lines[F] <> '' then begin
      s := memEvents.lines[F];
      aStr := midStr(s, 1, 2);
      Events[CurrRow].Synth := Hex2Dec(aStr);

      aStr := midStr(s, 3, 2);
      Events[CurrRow].Comm := Hex2Dec(aStr);

      aStr := midStr(s, 5, 2);
      Events[CurrRow].Note := Hex2Dec(aStr);

      aStr := midStr(s, 7, 2);
      Events[CurrRow].Velo := Hex2Dec(aStr);
      inc(CurrRow);
    end;
  end;

  sgEventTable.RowCount := EventCount + 1;
  DisplayEventGrid;
  PageControl1.ActivePageIndex := 2; {Note list}
  sgEventTable.SetFocus;
  sgEventTable.Row := CurrRow;

end;


procedure TForm1.btnPostbackClick(Sender: TObject);
var CurrRow: longInt;
  labCapt: string;
  Good: boolean;

  Function GoodHex(aStr: string): boolean; {Nested}
  const Allowed = '0123456789ABCDEF';
  var aIx, cIx: integer;
  begin

    {Not finished}
    GoodHex := true;
    exit;

    if Length(aStr) > 2 then begin
      GoodHex := false;
      exit;
    end;
    for aIx := 1 to Length(aStr) do begin
      GoodHex := false;
      for cIx := 1 to 16 do begin
        if Allowed[cIx] = aStr[aIx] then begin
          GoodHex := True;
          break;
        end;
      end;
      if not GoodHex then exit;
    end;
    GoodHex := true;
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
  if not Good then begin
    Application.MessageBox('Bad post back number', 'Post back', MB_ICONINFORMATION);
    exit;
  end;
  //Application.MessageBox('Bad post back number', 'Post back', MB_ICONINFORMATION);

  Events[CurrRow].Synth := StrToInt(EdC1.Text); {Synth}
  Events[CurrRow].Comm := Hex2Dec(EdC2.Text); {Channel}
  Events[CurrRow].Note := Hex2Dec(EdC3.Text); {Note}
  Events[CurrRow].Velo := Hex2Dec(EdC4.Text); {Velocity}
  DisplayEventGrid;
  sgEventTable.Row := CurrRow;
end;


procedure TForm1.btnPractPointClick(Sender: TObject);
var CurrRow,
  //sgRow,
  EventIx: longint;
begin
  inc(EventCount);
  SetLength(Events, EventCount + 1); {Stretch array}
  CurrRow := sgEventTable.Row;
  for EventIx := EventCount - 1 downto CurrRow do begin
    Events[EventIx + 1] := Events[EventIx]
  end;
  inc(CurrRow);
  {Fill the current row}
  Events[CurrRow].Synth := 4;
  Events[CurrRow].Comm := $02;
  Events[CurrRow].Note := $AA;
  Events[CurrRow].Velo := $AA;

  sgEventTable.RowCount := EventCount + 1;
  DisplayEventGrid;
  inc(CurrRow);
  sgEventTable.Row := CurrRow;

  {Now save, and update the microcontroller}
  SaveArdFile;
  PageControl1.ActivePageIndex := 3; {Arduino}
  edStartEvent.Text := intToStr(CurrRow);
  Clipboard.AsText := edStartEvent.Text;
  btnSend.Click;

  FillLbPractice(CurrRow);
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
  s := '05000000'; {Stop playing. Arduino runs the MuteAllChannels routine}
  Transmit(s);

  {Whereabouts in the file are we?}
  {Assumes Pause was clicked}
  EventsUsed := StrToInt(labEventsUsed.Caption);
  for F := EventsUsed - 1 downto 1 do begin
    if Events[F].Synth = $04 then begin
      if Events[F].Comm = $02 then begin
        if Events[F].Note = $AA then begin {A practice point}
          edStartEvent.Text := IntToStr(F + 1);
          labEventsUsed.Caption := IntToStr(F - 1);
          labUsedEvents.Caption := IntToStr(F + 1);
          Clipboard.AsText := edStartEvent.Text;
          exit;
        end;
        if Events[F].Note = $FF then begin {A page forward found}
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
  if F = 1 then begin
    edStartEvent.Text := '1';
    labEventsUsed.Caption := '1';
    labUsedEvents.Caption := '1';
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
  s := '05000000'; {Stop playing. Arduino runs the MuteAllChannels routine}
  Transmit(s);

  {Where in the file are we?}
  {Assumes Pause was clicked}
  EventsUsed := StrToInt(labEventsUsed.Caption);
  for F := EventsUsed + 1 to EventCount do begin
    if Events[F].Synth = $04 then begin
      if Events[F].Comm = $02 then begin
        if Events[F].Note = $AA then begin {A practice point}
          edStartEvent.Text := IntToStr(F + 1);
          labEventsUsed.Caption := IntToStr(F + 1);
          labUsedEvents.Caption := IntToStr(F + 1);
          Clipboard.AsText := edStartEvent.Text;
          exit;
        end;
        if Events[F].Note = $FF then begin {A page forward}
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
        if Events[F].Note = $BB then begin {A page back}
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

procedure TForm1.btnReportClick(Sender: TObject);
var
  s: String;
begin
  s := '09000000';
  lbSent.Items.Add('Report');
  labSent.Caption := 'Report';
  Transmit(s);
  labStatus.Caption := s;
end;


procedure TForm1.btnSc88SearchClick(Sender: TObject);
  var Index: integer;
  Hold: string;
  thePos: integer;
begin
  Hold := UpperCase(edSearchSc88.text);
  for Index := sgSc88.Row + 1 to 415 do begin
    //aStr := sgSc88.Cells[1, Index];
    thePos := Pos(Hold, UpperCase(sgSc88.Cells[1, Index]));
    if thePos > 0 then begin
      labStatus.Caption := intToStr(Index);
      sgSc88.Row := Index;
      sgSc88.Col := 0;
      sgSc88.SetFocus;
      break;
    end;
  end;
end;


procedure TForm1.btnSwellOutlineClick(Sender: TObject);
begin
  memEvents.Text := memEvents.Text + '04DF0201' +  Cr; {Notice of next two fields for
                                                       Arduino's Swell struct}
  {The $02 is for the synth.
   The $01 is the channel}
  memEvents.Text := memEvents.Text + '02DE5F7F' +  Cr; {5F CC11 min, 7F CC11 max}
  memEvents.Text := memEvents.Text + '02DE6A01' +  Cr; {6A Hold CC7, 01 CC11 gain}
    {This is the event-array's start and finish}
  memEvents.Text := memEvents.Text + '04DE006F' +  Cr; {Start Swell, Period}
  memEvents.Text := memEvents.Text + '04DD4800' +  Cr; {End Swell, }

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


procedure TForm1.btnToClipboardClick(Sender: TObject);
var eIx: Longint;
    s: String;
begin
  s := '';
  for eIx := 1 to EventCount do begin
    with Events[eIx] do begin
       s := s + FourByteStr(Synth,
         Comm,
         Note,
         Velo);
       s := s + cr;
    end;
  end;
  Clipboard.AsText := s;
end;


procedure TForm1.btnToMemEventsClick(Sender: TObject);
Var Chn: byte;
begin
  memEvents.Clear;
  for Chn := 0 to $0F do begin
    if cgChannel.Checked[Chn] then begin
      memEvents.Text := '01B' + HexStr(Chn, 1) + '00' +
        sgIntegra7.Cells[2, sgIntegra7.Row] + Cr +
        '01B' + HexStr(Chn, 1) + '20' +
        sgIntegra7.Cells[3, sgIntegra7.Row] + Cr +
        '01FFC' + HexStr(Chn, 1) +
        sgIntegra7.Cells[4, sgIntegra7.Row];
    end;
  end;
  labStatus.caption := 'See memEvents on the Channel tab.';
end;


procedure TForm1.btnTrillClick(Sender: TObject);
begin
  memEvents.Text := memEvents.Text + '04FE015A' +  Cr; {Notice of Events for
  Arduino's tEvent array.
  01 is the number of parts, 1 or 2.
  5A is the trill period}
  memEvents.Text := memEvents.Text + '02913C1F' +  Cr; {Note on}
  {02 is the synth number. The velocity will be overwritten
  with the PedlFactor}
  memEvents.Text := memEvents.Text + '02813C00' +  Cr; {Note off}
  memEvents.Text := memEvents.Text + '02913E1F' +  Cr; {Note on}
  memEvents.Text := memEvents.Text + '02813E00' +  Cr; {Note off}
  memEvents.Text := memEvents.Text + '04FD0000' +  Cr; {Begin trill}
  memEvents.Text := memEvents.Text + '04FC0000' +  Cr; {End trill}
end;


procedure TForm1.cbAllowPointerChange(Sender: TObject);
var
  s: String;
begin
  if cbAllowPointer.Checked then begin
    //s := '07100000';
    s := '08000001';
    lbSent.Items.Add('Pointer on');
    labSent.Caption := 'Pointer on';
  end else begin
    //s := '07200000';
    s := '08000000';
    lbSent.Items.Add('Pointer off');
    labSent.Caption := 'Pointer off';
  end;
  Transmit(s);
  labStatus.Caption := s;
end;


procedure TForm1.edAutoFromDblClick(Sender: TObject);
var CurrRow: longInt;
begin
  CurrRow := sgEventTable.Row;
  if Events[CurrRow].Synth = 0 then begin
    {Only timing records allowed}
    edAutoFrom.text := IntToStr(sgEventTable.Row);
  end;
end;

procedure TForm1.edAutoToDblClick(Sender: TObject);
var CurrRow: longInt;
begin
  CurrRow := sgEventTable.Row;
  if Events[CurrRow].Synth = 0 then begin
    {Only timing records allowed}
    edAutoTo.text := IntToStr(sgEventTable.Row);
  end;
end;


procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  aMouse: TMouse;
  aPoint: TPoint;
  X, Y, J, K: integer;
begin
  if(key=ord('P')) and (ssCtrl in Shift) then begin
    {Click the Pract-point button}
     btnPractPoint.onclick(self)
  end;






  if Key = 114 then begin  {F3}
    {Going to paste a practice event-number into a boxed-text in Sibelius}
    {The event-number is presumed to be on the clipboard}
    X := aMouse.CursorPos.X;
    Y := aMouse.CursorPos.Y;

    MouseInput.DblClick(mbLeft, [], x, y);
    Application.ProcessMessages;
    Delay(500);

    MouseInput.DblClick(mbLeft, [], x, y);
    Application.ProcessMessages;
    Delay(500);

    KeyInput.Press(edStartEvent.text);
    Application.ProcessMessages;
    Delay(500);
    //J := 563; K := 509;
    J := 543; K := 580;
    MouseInput.Click(mbLeft, [], J, K);

    aPoint.x := X;
    aPoint.y := Y;
    aMouse.CursorPos := aPoint;
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
var EventIx: longint;
begin
  for EventIx := 1 to EventCount do begin
    with Events[EventIx] do begin
      {Ignore it if this is a page-turn, of similar}
      if Synth <> 4 then begin
        if Synth <> $00 then
          {It is not a timing record}
          Synth := $01; {Integra}
        if Comm = $FF then
          {Fix instrument selection}
          Events[EventIx - 2].Velo := $79; {GM2}
      end;
    end;
  end;
  DisplayEventGrid;
end;


procedure TForm1.btnGetChInstClick(Sender: TObject);
begin
  GetChInst;
end;

procedure TForm1.labAttribDblClick(Sender: TObject);
begin
  memEvents.Text := labAttrib.caption;
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


procedure TForm1.labUsedEventsClick(Sender: TObject);
{It assumes serial has started}
var
  s: String;
begin
  s := '05000000'; {Stop playing. Arduino runs the MuteAllChannels routine}
  Transmit(s);
  PageControl1.ActivePageIndex := 2; {Note list}
  sgEventTable.Row := StrToInt(labUsedEvents.Caption);
  sgEventTable.SetFocus;
end;


procedure TForm1.lbArdFilesDblClick(Sender: TObject);
var
  aStr: string;
begin
  AllSoundOff;
  with lbArdFiles do begin
    aStr := Items[ItemIndex];
    aStr := ArdFilePath + ArdSubFolder + aStr + '.Ard';
  end;
  ardFileName := aStr;
  LoadNoteList;
  if glSerialRunning then
    SendIt;
  labUsedEvents.Caption := '1';
  labEventsUsed.Caption := '1';
  edAutoFrom.Text := '';
  edAutoTo.Text := '';
  lbReceived.Clear;
  labReceived.Caption := '';
  lbSent.Clear;
  labSent.Caption := '';
end;


procedure TForm1.lbMidiNotesDblClick(Sender: TObject);
var NoteVal: byte;
  s: String;
begin  {Plays the selected note for one second}
  if glSerialRunning then begin
    NoteVal := 120 - lbMidiNotes.ItemIndex;
    s := '1190' + HexStr(NoteVal, 2) + '1A';
    Transmit(s);
    Delay(1000);
    s := '1180' + HexStr(NoteVal, 2) + '00';
    Transmit(s);
  end;
end;


procedure TForm1.lbSentDblClick(Sender: TObject);
begin
  lbSent.Clear;
  labSent.Caption := '';
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
  if midArrLen = 0 then begin
    labStatus.caption := 'File not yet read in';
    exit;
  end;

{2. Is it a midi file? Check the first 4 bytes}
  midArrIx := 0;
  for midArrIx := midArrIx to midArrIx + 3 do begin
    if midiArr[midArrIx] <> ord(initArr[midArrIx]) then begin
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
var EventIx: longint;
begin
  with sgEventTable do begin
    RowCount := EventCount + 1;
    for EventIx := 1 to EventCount do begin
      with Events[EventIx] do begin
        Cells[0, EventIx] := IntToStr(EventIx);
        Cells[1, EventIx] := FloatToStr(RunningDelta);
        Cells[2, EventIx] := FloatToStr(DeltaTime);
        Cells[3, EventIx] := intToStr(Synth);
        Cells[4, EventIx] := intToHex(Comm, 2);
        Cells[5, EventIx] := intToHex(Note, 2);
        Cells[6, EventIx] := intToHex(Velo, 2);
        Cells[7, EventIx] := intToStr(Sort);
        {Overwrite Sort with the note description}
        case Comm of
          $90..$9F: {Note on only}
          begin
            if Note <= 120 then
              Cells[7, EventIx] := MidiNoteVals[Note];
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
  SetLength(Events, EventCount + 1);
  for trackIndex := 2 to trackCount do begin {Loop through each track}
    trackRecArray[trackIndex].eventStart := EventCount + 1;
    midArrIx := trackRecArray[trackIndex].trackStart;
    inc(midArrIx, 8); {To get to the first timestamp}
    LocalRunningDelta := 0; {Reset for each track}
    {Now loop until the end of the track}
    while midArrIx < trackRecArray[trackIndex].trackEnd do begin
      inc(EventCount);
      SetLength(Events, EventCount + 1);
      {The Events is zero based but element 0 will not be used}
      Events[EventCount].Sort := EventCount; {Preliminary only. Will be set later}
      {I presume everything in the track hereafter is prefixed by timestamp}
      aVLN := VLN(midArrIx);
      {aVLN := aVLN * 1000;
      aVLN := aVLN div clicksPerCrotchet;
      It is better to leave one second as 960 milliseconds
      It saves awkwardness, eg 412 being regarded as half 825
      This will speed-up the playback by a tiny amount}

      Events[EventCount].DeltaTime := aVLN;
      LocalRunningDelta := LocalRunningDelta + Events[EventCount].DeltaTime;
      Events[EventCount].RunningDelta := LocalRunningDelta;
      {I expect that midArrIx has been updated according to VLN byes used}

      case midiArr[midArrIx] of
        $B0..$BF: begin {Control/Mode change. Just send these 3 bytes}
          Events[EventCount].Synth := 2; {General midi}
          Events[EventCount].Comm := midiArr[midArrIx];
          inc(midArrIx);
          Events[EventCount].Note := midiArr[midArrIx];
          inc(midArrIx);
          Events[EventCount].Velo := midiArr[midArrIx];
          inc(midArrIx);
        end;
        $C0..$CF: begin {Instrument change}
          Events[EventCount].Synth := 2; {General midi};
          Events[EventCount].Comm := $FF;
          Events[EventCount].Note := midiArr[midArrIx];
          inc(midArrIx);
          Events[EventCount].Velo := midiArr[midArrIx];
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
          Events[EventCount].Synth := 2; {General midi};
          Events[EventCount].Comm := midiArr[midArrIx];
          inc(midArrIx);
          Events[EventCount].Note := midiArr[midArrIx];
          inc(midArrIx);
          Events[EventCount].Velo := midiArr[midArrIx];
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
{Sort the Events by the RunningDelta field.
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
  EventIx: longint;

  //LocalRecArray: array of EventType;
  //Completed: boolean;
  //aStr: String;

begin
  {Bubble, recode later to do an efficiant zipping togethter}
  for ItemPos1 := EventCount downto 2 do begin
    for ItemPos2 := 2 to ItemPos1 do begin
      if Events[ItemPos2 - 1].RunningDelta >
        Events[ItemPos2].RunningDelta then begin
        HoldEvent := Events[ItemPos2 - 1];
        Events[ItemPos2 - 1] := Events[ItemPos2];
        Events[ItemPos2] := HoldEvent;
      end;
    end;
  end;

  //DisplayEventGrid; exit;

  {Remove the duplicated delta-times}
  HoldRunning :=  Events[1].RunningDelta;
  for ItemPos1 := 2 to EventCount do {1 done in the preceding line}
  begin
    Events[ItemPos1].DeltaTime := 0; {Default}
    if Events[ItemPos1].RunningDelta <> HoldRunning then
    begin {Redo the DeltaTime from the RunningDelta and the previous event}
      Events[ItemPos1].DeltaTime :=
        Events[ItemPos1].RunningDelta - HoldRunning;
      HoldRunning := Events[ItemPos1].RunningDelta;
    end;
  end; {Duplications gone}

  //DisplayEventGrid; exit;

  {Shifting them back to the start of their zero block}
  HoldDelta := 0;
  DeltaCount := 0; {Taking the oppunity in this loop to count these}
  for ItemPos1 := EventCount downto 1 do
  begin {Going backwards}
    if Events[ItemPos1].DeltaTime <> 0 then
    begin {Have found a delta}
      inc(DeltaCount); {For later}
      if HoldDelta = 0 then {Must be the last one in the list.
                             The first one actioned}
      begin
        HoldDelta := Events[ItemPos1].DeltaTime; {Get it}
        PrevDelta := HoldDelta;
        //Events[ItemPos1].DeltaTime := 1000; {An honourary number for Arduino's software}
        Events[ItemPos1].DeltaTime := $2222;
          { $2222 is about 8.7 seconds. Pleanty of time for the user
           to trigger a reload }
      end
      else
      begin
        {Something here}
        HoldDelta := Events[ItemPos1].DeltaTime; {Get it}
        Events[ItemPos1].DeltaTime := PrevDelta;
        PrevDelta := HoldDelta;
      end;
    end;
  end;
  {Fix up the one at the begining}
  Events[1].DeltaTime := PrevDelta;
  inc(DeltaCount);

  //DisplayEventGrid; Exit;

  {Delta-times are given their own event. This is so that the timer can be
   set, and the immeiate following zero-delta-time based events
   can be sent to the midi synth straight away, while the time
   is used up}
  SetLength(Events, EventCount + DeltaCount + 1);

  for EventIx := EventCount downto 1 do
  begin
    if Events[EventIx].DeltaTime <> 0 then
      {This is a record with a delta-time, and it is at
      the start of a block.}
    begin
      HoldRunning := Events[EventIx].RunningDelta;
      HoldDelta := Events[EventIx].DeltaTime;
      {These two form the basis of the timing record}

      for ItemPos1 := EventCount + DeltaCount downto EventIx + 1 do begin
        {Shuffle the trailing events along the array to make room}
        {Backwards as usual}
        Events[ItemPos1] := Events[ItemPos1 - 1];
      end;

      {Make up a delta event with milliseconds in the fields}
      with Events[EventIx] do begin
        RunningDelta := HoldRunning;
        DeltaTime := HoldDelta;
        Synth := 0; {A flag to Arduino, it's a time, not a synth}
        Comm := (HoldDelta and $FF0000) div $FFFF;
        Note := (HoldDelta and $00FF00) div $FF;
        Velo := (HoldDelta and $0000FF);
        Sort := 1111;
      end;
      Events[EventIx + 1].DeltaTime := 0;
    end;
  end;
  EventCount := EventCount + DeltaCount; {Update global variable}

  DisplayEventGrid;
  edAutoFrom.Text := '';
  edAutoTo.Text := '';
  labStatus.caption := 'Sorting completed.';
end; {SortNoteListClick}


procedure TForm1.btnSaveClick(Sender: TObject);
begin
  SaveArdFile;
end;

procedure TForm1.SaveArdFile;
{This saves the grid. Delta time (as VLN), send, cmd and note
ready to be imported into Arduino-mega}
var fName: string;
  tfOut: TextFile;
  EventIx: longint;
begin

  if EventCount = 0 then begin
    ShowMessage('No events found to save.');
    exit;
  end;

  labStatus.caption := 'Saving';
  ardFileName := ExtractFileName(ardFileName);
  ChangeFileExt(ardFileName, '.Ard');
  ArdFileName := ArdFilePath +
    ArdSubFolder + ardFileName;
  fName := ardFileName;
  {Catch errors in case the file cannot be created}
  try
    {Create text file, write to it and free it to prevent memory leaks}
    AssignFile(tfOut, fName);
    Rewrite(tfOut);
    for EventIx := 1 to EventCount do
       with Events[EventIx] do begin
         Write(tfOut, intToHex(Synth, 2));
         Write(tfOut, intToHex(Comm, 2));
         Write(tfOut, intToHex(Note, 2));
         Writeln(tfOut, intToHex(Velo, 2));
       end;
    CloseFile(tfOut);
  except {Handle errors}
    on E:Exception do
      labStatus.caption := fName + ' not saved: ' +  E.Message;
  end;
  labStatus.caption := ExtractFileName(fName) + ' created ok.';
  FillLbPractice(txMidiOut.EventIx);
  //lbPracticeHighlight(StrToInt(edStartEvent.Text));
end;

(*
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
*)

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
  for Index := sgIntegra7.Row + 1 to 6087 do begin
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

(*
procedure TForm1.SetInstrument(Sender: TObject);
Var Response: integer;
  s: String;
begin
  s := labInst1.Caption + labInst2.Caption + labInst3.Caption;
  Response := Application.MessageBox('Send?', 'Instrument', MB_ICONQUESTION + MB_YESNO);
  if Response <> IDYES then exit;

  if glSerialRunning then Transmit(s);
end;
*)

procedure TForm1.sgEventTableDblClick(Sender: TObject);
var CurrRow: longInt;
  s: String;
begin
  CurrRow := sgEventTable.Row;
  with Events[CurrRow] do begin
    case sgEventTable.Col of
      4: begin
        if DeltaTime = $00 then
          exit; {Can only do this to timing records}
        if Comm = $00 then
          Comm := $01
        else
          Comm := $00;
        DisplayEventGrid;
        sgEventTable.Row := CurrRow;
      end;
      7: begin
        if (Comm >= $90) and (Comm <= $9F) then begin
           {Plays the selected note for one seconds}
           s := '1' + HexStr(Synth, 1);
           s := s + HexStr(Comm, 2);
           s := s + HexStr(Note, 2);
           s := s + '1A';
          if glSerialRunning then Transmit(s);
          Delay(1000);
          s := '1' + HexStr(Synth, 1);
          s := s + '8' + HexStr(Comm, 1);
          s := s + HexStr(Note, 2);
          s := s + '00';


          if glSerialRunning then Transmit(s);
        end;
      end;
    end;
  end;
end;


procedure TForm1.lbPracticeDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  l: Integer;
  t: String;
begin
  with lbPractice do begin
    Canvas.FillRect(Rect);
    t := Items[Index];
    l := Rect.Right - Canvas.TextWidth(t) - 1;
    Canvas.TextOut(l, Rect.Top, t);
  end;
end;


procedure TForm1.lbPracticeHighlight(ActiveEvent: Longint);
var Ix: integer;
begin
  {Select the item in lbPractice}
  For Ix := 0 to lbPractice.Count - 1 do begin
    if StrToInt(lbPractice.Items[Ix]) >= ActiveEvent then begin
      lbPractice.ItemIndex := Ix;
      break;
    end;
  end;
end;

procedure TForm1.TabSheet9ContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin

end;


procedure TForm1.lbPracticeClick(Sender: TObject);
begin
  with lbPractice do begin
    edStartEvent.Text := Items[ItemIndex];
  end;
end;


procedure TForm1.lbPracticeDblClick(Sender: TObject);
begin
  with lbPractice do begin
    edStartEvent.Text := Items[ItemIndex];
  end;
  btnSend.Click;
end;


procedure TForm1.ThroughOrTrigger();
var
  s: string;
begin
  case rgKeyboard.ItemIndex of
    0: begin
      //s := '30zzzz00';
      s := '30000000';
      lbSent.Items.Add('Midi keyboard triggers');
      labSent.Caption := 'Midi keyboard triggers';
    end;
    1: begin
      //s := '30zzzz01';
      s := '30000001';
      lbSent.Items.Add('Midi keyboard to Integra');
      labSent.Caption := 'Midi keyboard to Integra';
    end;
    2: begin
      //s := '30zzzz02';
      s := '30000002';
      lbSent.Items.Add('Midi keyboard to SC-88');
      labSent.Caption := 'Midi keyboard to SC-88';
    end;
  end;
  Transmit(s);
  labStatus.Caption := s ;
end;


procedure TForm1.rgKeyboardClick(Sender: TObject);
begin
  ThroughOrTrigger;
end;


procedure TForm1.Transmit(s: string);
var
  status: LongInt;
  writecount: integer;
  Event: EventType;
//const UseShortPacket = true;
begin
  labStatus.Caption := s; Application.ProcessMessages;
  with Event do begin
    Synth := Hex2Dec(midStr(s, 1, 2));;
    Comm := Hex2Dec(midStr(s, 3, 2));
    Note := Hex2Dec(midStr(s, 5, 2));
    Velo := Hex2Dec(midStr(s, 7, 2));
  end;
  //if not UseShortPacket then begin
  //  writecount := length(s);
  //  status := SerWrite(SerialHandle, s[1], writecount);
  //end else begin
    writecount := 1;
    status := SerWrite(SerialHandle, Event.Synth, writecount);
    status := SerWrite(SerialHandle, Event.Comm, writecount);
    status := SerWrite(SerialHandle, Event.Note, writecount);
    status := SerWrite(SerialHandle, Event.Velo, writecount);
  //end;
end;


procedure TForm1.SendIt;
{Assumes serial started. Send the first 600 records, or up to EventCount}
var s: String;
  //EventIx: longint;
begin
  if EventCount = 0 then begin
    ShowMessage('No note file loaded.');
    exit;
  end;

  {All records are 4 bytes long, as an 8 byte hex string}
  s := '070'; {Reset eIndexH & eIndexT, and send
    starting event-number in the next 5 nibbles (1,000,000) }
  {Starting event is in edStartEvent}

  with txMidiOut do begin
    StartEventWanted := StrToInt(edStartEvent.Text);
    s := s + HexStr(StartEventWanted - 1, 5);
    Transmit(s);
    ReplyingToAsk := true; // Change to true to activate
    {600, Hex $258 is the usual number to send}
    Many := 600;
    LastEventWanted := StartEventWanted + Many - 1;
    if StartEventWanted + Many -1 > EventCount then begin
       txMidiOut.Many := EventCount - txMidiOut.StartEventWanted + 1;
    end;
    {Set index limits}
    EventIx := StartEventWanted;
    txMidiOut.LastEventWanted := txMidiOut.StartEventWanted + txMidiOut.Many - 1;
  end;

  btnSend.Enabled := false;
  Application.ProcessMessages;
end;


procedure TForm1.btnSendClick(Sender: TObject);
var TimeEvent: LongInt;
begin
  if edStartEvent.Text = '' then begin
    edStartEvent.Text := '1';
  end;
  txMidiOut.StartEventWanted := StrToInt(edStartEvent.Text);
  if txMidiOut.StartEventWanted > EventCount - 1 then begin
    ShowMessage(edStartEvent.Text + ' is too big for the event array.');
    exit;
  end;
  {Check that the first event wanted is a timing record}
  labEventsUsed.Caption := edStartEvent.Text;
  labUsedEvents.Caption := edStartEvent.Text;
  if Events[txMidiOut.StartEventWanted].Synth > $00 then begin
    for TimeEvent := txMidiOut.StartEventWanted + 1 to EventCount -1 do begin
      if Events[TimeEvent].Synth = $00 then begin
        edStartEvent.Text := intToStr(TimeEvent);
        txMidiOut.StartEventWanted := TimeEvent;
        ShowMessage('Have advanced to the next timing record.');
        break;
      end;
    end;
  end;
  if Events[txMidiOut.StartEventWanted].Comm > $00 then begin
    ShowMessage('Cannot start at an auto-playing time record.');
    exit;
  end;
  AllSoundOff;
  lbPracticeHighlight(StrToInt(edStartEvent.Text));
  SendIt;
  lbReceived.Clear;
  labReceived.Caption := '';
  lbSent.Clear;
  labSent.Caption := '';
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
end;


procedure TForm1.DisplayEventsUsed(ComIn: string);
var
  //Ix,
  Used: longint;
begin
  {The incoming string has the prefix 'EU' Expression User}
  ComIn := midStr(ComIn, 3, 999);
  Used := Hex2Dec(ComIn);
  if Used < 0 then begin
    {The Arduino's int has gone around-the-clock}
    Used := 65536 + Used;
  end;
  labEventsUsed.Caption := IntToStr(Used);
  labUsedEvents.Caption := IntToStr(Used);
  if Events[Used].Velo = 170 then begin {'AA' practice-point}
    //labUsedEvents.Color := clGradientActiveCaption;
    labUsedEvents.Color := $0099DDDA; {Same as practice-point list}
    {Select the item in lbPractice}
    lbPracticeHighlight(Used);
    //For Ix := 0 to lbPractice.Count - 1 do begin
    //  if StrToInt(lbPractice.Items[Ix]) >= Used then begin
    //    break;
    //  end;
    //end;
    //lbPractice.ItemIndex := Ix;
  end else begin
    labUsedEvents.Color := clGradientInactiveCaption;
  end;
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


procedure TForm1.btnStartArduinoClick(Sender: TObject);
var
  ComPortName: String;
  Flags      : TSerialFlags; {TSerialFlags = set of (RtsCtsFlowControl);}
  status     : LongInt;
  ch         : Char;
  s          : string;
  // : longint;

  procedure PrepareToActionAsk; {Nested}
  begin
    lbReceived.Items.Add(ComIn);
    labReceived.Caption := ComIn;
    lbReceived.TopIndex := lbReceived.Items.Count - 1;
    if EventCount = 0 then begin
      ShowMessage('No file of notes loaded.');
      exit;
    end;
    txMidiOut.ReplyingToAsk := true;
    btnSend.Enabled := false;
    txMidiOut.StartEventWanted := Hex2Dec(midStr(ComIn, 3, 1));
    if txMidiOut.StartEventWanted = 0 then begin {200zzzz as opposed to 201zzzz}
      {This code is run when the music is to reload from the begining}
      txMidiOut.StartEventWanted := 1;
      txMidiOut.LastEventIxToArduino := 0;
      s := '07000000'; {Reset eIndexH & eIndexT}
      Transmit(s);
      lbSent.Items.Add('Reset pointers');
      labSent.Caption := 'Reset pointers';
    end else begin
       txMidiOut.StartEventWanted := txMidiOut.LastEventIxToArduino + 1;
    end;
    txMidiOut.Many := Hex2Dec(RightStr(ComIn, 3));
    //if txMidiOut.StartEvent + txMidiOut.Many - 1 > EventCount then begin
    //  txMidiOut.Many := EventCount - txMidiOut.StartEvent + 1;
    //end;
    //Changed to this 14 Oct 2021
    if txMidiOut.StartEventWanted + txMidiOut.Many > EventCount then begin
      txMidiOut.Many := EventCount - txMidiOut.StartEventWanted + 1;
      if txMidiOut.Many <= 0 then begin
        txMidiOut.ReplyingToAsk := false;
        exit;
      end;
    end;
    {Set index limits}
    txMidiOut.EventIx := txMidiOut.StartEventWanted;
    if txMidiOut.EventIx > EventCount then begin
      txMidiOut.ReplyingToAsk := false;
      exit;
    end;
    txMidiOut.LastEventWanted := txMidiOut.StartEventWanted + txMidiOut.Many - 1;
    lbSent.Items.Add('Send ' + IntToStr(txMidiOut.StartEventWanted) +
      ' to ' + IntToStr(txMidiOut.LastEventWanted));
    labSent.Caption := 'Send ' + IntToStr(txMidiOut.StartEventWanted) +
      ' to ' + IntToStr(txMidiOut.LastEventWanted);
  end; {Nested}

  procedure SendNextEvent; {Nested}
  begin
    with Events[txMidiOut.EventIx] do begin
      s := FourByteStr(Synth,
                        Comm,
                        Note,
                        Velo);
      Transmit(s);
      {This will end up going to the PokeEventArray function in Arduino}
      txMidiOut.LastEventIxToArduino := txMidiOut.EventIx;
      labStatus.Caption := s;
    end;
    if txMidiOut.EventIx = txMidiOut.LastEventWanted then begin
      txMidiOut.ReplyingToAsk := false;
      lbSent.Items.Add('Sent ' + intToStr(txMidiOut.EventIx));
      labSent.Caption := 'Sent ' + intToStr(txMidiOut.EventIx);
      //labReceived.Caption := 'Sent ' + intToStr(txMidiOut.EventIx);
      lbSent.TopIndex := lbReceived.Items.Count - 1;
      btnSend.Enabled := true;
    end;
    inc(txMidiOut.EventIx);
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
  txMidiOut.ReplyingToAsk := false;
  btnStartArduino.Enabled := false;
  //EventIx := 1;

  {Start a perpetual loop}
  glSerialRunning := True;
  while glSerialRunning do begin {Looping in order to receive from arduino.
    Any gui button-press will interrupt the loop.}
    if txMidiOut.ReplyingToAsk then
      SendNextEvent; {Nested above}
    ch := #0;
    status := SerRead(SerialHandle, ch, 1);
    if (status > 0) then begin
      //ComIn := ComIn + ch;
      case ch of
        #10 : begin {Line feed, do nothing} end;
        #13 : begin //Cariage return
          if (leftStr(ComIn, 2) = '20') and (length(ComIn) = 8) then begin
            {A request for more notes from Arduino}
            PrepareToActionAsk; {Nested above}
            ComIn := '';
          end;
          if (leftStr(ComIn, 2) = 'EP') then begin
            DisplayExpression(ComIn);
            ComIn := '';
          end;
          if (leftStr(ComIn, 2) = 'EU') then begin
            {Arduino says Events Used}
            DisplayEventsUsed(ComIn);
            ComIn := '';
          end;
          if leftstr(ComIn, 4) = 'Page' then begin
            TurnSibeliusPage(ComIn);
            lbReceived.Items.Add('Sibelius turn ' + ComIn);
            labReceived.Caption := 'Sibelius turn ' + ComIn;
            lbReceived.TopIndex := lbReceived.Items.Count - 1;
            ComIn := '';
          end;
          if ComIn <> '' then begin;
            lbReceived.Items.Add(ComIn);
            labReceived.Caption := ComIn;
            lbReceived.TopIndex := lbReceived.Items.Count - 1;
            ComIn := '';
          end;
        end else
          ComIn := ComIn + ch;
      end;
      ch := #0;
    end;
    Application.ProcessMessages;
  end;
end; {btnStartArduinoClick}

(*
procedure TForm1.SendNote(EventIx: longint);
var s: String;
begin
  s := '13'; {Three bytes for synth}
  s := s + intToHex(Events[EventIx].Comm, 2);
  s := s + intToHex(Events[EventIx].Note, 2);
  s := s + intToHex(Events[EventIx].Velo, 2);
  labStatus.Caption := s;
  Transmit(s);
end;
*)

procedure TForm1.btnStopClick(Sender: TObject);
begin
  SerFlush(SerialHandle); {Discard any remaining output}
  SerClose(SerialHandle);
  glSerialRunning := False;
  labStatus.Caption := 'Stopped.';
  labStarted.Color := clRed;
  btnStartArduino.Enabled := true;
  btnSend.Enabled := true;
  {StopSerial;}
end;


procedure TForm1.ClearReceived(Sender: TObject);
begin
  lbReceived.Clear;
  labReceived.Caption := '';;
end;


procedure TForm1.btnToggleLedClick(Sender: TObject);
var
  s: String;
begin
  //Toggle led at port 13
  s := '06000000';
  Transmit(s);
  lbSent.Items.Add('Led toggled');
  labSent.Caption := 'Led toggled';
end;


procedure TForm1.FillLbPractice(ActiveEvent: Longint);
var
  //lbRow: Integer;
  EventIx: longint;
begin
  //lbRow := 2;
  lbPractice.Clear;
  lbPractice.Items.Add('1');
  For EventIx := 1 to EventCount -1 do begin
    if (Events[EventIx].Comm = $02)
      and (Events[EventIx].Note = $AA) then begin
      {Practice point}
       lbPractice.Items.Add(IntToStr(EventIx + 1));
    end;
  end;
  {Find one to highlight}
  lbPracticeHighlight(ActiveEvent);
  //for lbRow := 0 to lbPractice.Count -1 do begin
  //  if StrToInt(lbPractice.Items[lbRow]) >= ActiveEvent then begin
  //    break;
  // end;
  //end;
  //lbPractice.ItemIndex := lbRow;
end;


procedure TForm1.LoadNoteList;
var
  aFile: TextFile;
  aStr: string;
  //aFolder: string;
  RunningTime: longInt;
  r, c: Integer;
  //gridStyle:TTextStyle;
begin
  (*
  aFolder := GetCurrentDir;
  aFolder := aFolder + '\ArdFiles';
  OpenDialog1.InitialDir := aFolder;
  OpenDialog1.Filter := 'Note files|*.Ard';
  if OpenDialog1.Execute then
     ardFileName := OpenDialog1.Filename
  else exit;
  *)

  //for r := 0 to Pred(sgEventTable.RowCount) do
  for r := 1 to Pred(sgEventTable.RowCount) do
    for c := 0 to Pred(sgEventTable.ColCount) do
      sgEventTable.Cells[c, r] := '';
  sgEventTable.Rowcount := 1;

  AssignFile(aFile, ArdFileName);
  Reset(aFile);
  edStartEvent.Text := '1';
  labEventsUsed.Caption := '1';

  EventCount := 0; {But not using element 0}
  RunningTime := 0;
  while not eof(aFile) do begin
    readln(aFile, aStr);
    inc(EventCount);
    SetLength(Events, EventCount + 1);
    with Events[EventCount] do begin
      Synth := Hex2Dec(leftStr(aStr, 2));
      Comm := Hex2Dec(midStr(aStr, 3, 2));
      Note := Hex2Dec(midStr(aStr, 5, 2));
      Velo := Hex2Dec(rightStr(aStr, 2));
      {Reconstruct these}
      if Synth = 0 then
      begin
        //DeltaTime := Comm * 65536;
        //DeltaTime := DeltaTime + Note * 256;
        DeltaTime := Note * 256;
        DeltaTime := DeltaTime + Velo;
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

  FillLbPractice(1);
end;



procedure TForm1.btnFindClick(Sender: TObject);
var HoldRow: longint; {Find Hex in the midi grid}
  edStr: String;
  Found: boolean;

  procedure RunItFrom(This, That: LongInt); {Nested}
  var F: LongInt;
    sgStr: string;
  begin
    with sgMidiTable do begin
      For F := This + 1 to That do
      begin
        sgStr :=  sgMidiTable.Cells[1, F];
        if sgStr = edStr then begin
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


procedure TForm1.AllSoundOff;
var s: string;
    Chan: integer; {Each channel. Could just send '050zzzzz'
      to run the MuteAllChannels routine, but also runs
      StraightToSynth}
begin
  s := '05000000'; {Stop playing. Arduino runs the MuteAllChannels routine}
  Transmit(s);
  labStatus.Caption := 'All sound off.';
  if glSerialRunning then begin
    for Chan := 0 to 15 do begin {Turn off each channel in turn in both synths}
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
  lbSent.Items.Add('Sound off');
  labSent.Caption:= 'Sound off';
end;


procedure TForm1.btnFindNoteClick(Sender: TObject);
var HoldRow: longint; {Actually, It's find a cmd in the note list}
  edStr: String;
  Found: boolean;

  procedure RunItFrom(This, That: LongInt); {Nested}
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
      SetLength(Events, EventCount + 1);
      with Events[EventCount] do begin
        DeltaTime := 0;
        RunningDelta := 0;
        Synth := 1;
        Comm := $B0 + Part[PartNumber].PartNumber - 1; {Channel}
        Note := $00; {Note}
        Velo := Vel1; {Velocity}
        Sort := 0; {The order the array is to be played}
      end;

      inc(EventCount);
      SetLength(Events, EventCount + 1);
      with Events[EventCount] do begin
        DeltaTime := 0;
        RunningDelta := 0;
        Synth := 1;
        Comm := $B0 + Part[PartNumber].PartNumber - 1; {Channel}
        Note := $20; {Note}
        Velo := Vel2; {Velocity}
        Sort := 0; {The order the array is to be played}
      end;

      inc(EventCount);
      SetLength(Events, EventCount + 1);
      with Events[EventCount] do begin
        DeltaTime := 0;
        RunningDelta := 0;
        Synth := 1;
        Comm := $FF; {Channel}
        Note := $C0 + Part[PartNumber].PartNumber - 1;; {Note}
        Velo := Vel3; {Velocity}
        Sort := 0; {The order the array is to be played}
      end;

      {Set channel parameters}
      inc(EventCount);
      SetLength(Events, EventCount + 1);
      with Events[EventCount] do begin
        DeltaTime := 0;
        RunningDelta := 0;
        Synth := 1;
        Comm := $B0 + Part[PartNumber].PartNumber - 1; {Channel}
        Note := $07; {Note}
        Velo := $64; {Velocity}
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
  //EventIx: longint;

  procedure MakeNoteRecord(Delta, PartNumber, MidiNote: integer); {Nested}
  begin
    inc(EventCount);
    SetLength(Events, EventCount + 1);
    with Events[EventCount] do begin
      DeltaTime := 0;
      //LocalRunningDelta := LocalRunningDelta + DeltaTime;
      RunningDelta := LocalRunningDelta;
      Synth := 1;
      Comm := $90 + PartNumber - 1; {Cmd}
      Note := MidiNote + Part[PartNumber].TransposeChromatic; {Note}
      Velo := $5F; {Velocity}
      Sort := EventCount; {Preliminary only. Will be set later}
    end;
            Events[EventCount].Sort := EventCount;
    {The note off record}
    inc(EventCount);
    SetLength(Events, EventCount + 1);
    LocalRunningDelta := LocalRunningDelta + Delta;
    with Events[EventCount] do begin
      DeltaTime := Delta;
      RunningDelta := LocalRunningDelta;
      Synth := 1;
      Comm := $80 + PartNumber - 1; {Cmd}
      Note := MidiNote + Part[PartNumber].TransposeChromatic; {Note}
      Velo := $5F; {Velocity}
      Sort := EventCount;  {Preliminary only. Will be set later}
    end;
  end;

begin {Start of btnMakeArdListClick}
  {Parsing memXml memo box which should already be filled}
  EventCount := 0; {Record 0 is not used}
  SetLength(Events, EventCount + 1);
  PartNumber := 0; {Will be from 1 to 16}
  //EventIx := 0;
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
  050 Stop/pause playing
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


  Grave – slow and solemn (20–40 BPM)
  Lento – slowly (40–45 BPM)
  Largo – broadly (45–50 BPM)
  Adagio – slow and stately (literally, “at ease”) (55–65 BPM)
  Adagietto – rather slow (65–69 BPM)
  Andante – at a walking pace (73–77 BPM)
  Moderato – moderately (86–97 BPM)
  Allegretto – moderately fast (98–109 BPM)
  Allegro – fast, quickly and bright (109–132 BPM)
  Vivace – lively and fast (132–140 BPM)
  Presto – extremely fast (168–177 BPM)
  Prestissimo – even faster than Presto (178 BPM and over)



  Prestissimo
  Presto
  Vivace
  Allegro
  Allegretto
  Moderato
  Andante
  Adagietto
  Adagio
  Largo
  Lento
  Grave

*)

