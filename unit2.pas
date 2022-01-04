unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

var aCaption: string;

type

  { TForm2 }

  TForm2 = class(TForm)
    btnCancel: TButton;
    labEventNumber: TLabel;
    lab0: TLabel;
    lab1: TLabel;
    lab2: TLabel;
    lab3: TLabel;
    lab4: TLabel;
    lab5: TLabel;
    lab6: TLabel;
    lab7: TLabel;
    lab8: TLabel;
    lab9: TLabel;
    procedure btnCancelClick(Sender: TObject);
    procedure labEventNumberClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lab0Click(Sender: TObject);
    procedure lab1Click(Sender: TObject);
    procedure lab2Click(Sender: TObject);
    procedure lab3Click(Sender: TObject);
    procedure lab4Click(Sender: TObject);
    procedure lab5Click(Sender: TObject);
    procedure lab6Click(Sender: TObject);
    procedure lab7Click(Sender: TObject);
    procedure lab8Click(Sender: TObject);
    procedure lab9Click(Sender: TObject);
  private

  public

  end;

var
  Form2: TForm2;


implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.FormActivate(Sender: TObject);
begin
  labEventNumber.Caption := '';
  Tag := 0;
end;

procedure TForm2.labEventNumberClick(Sender: TObject);
begin
  if labEventNumber.Caption = '' then exit;
  Form2.ModalResult := mrOk;
  Tag := StrToInt(labEventNumber.Caption);
  Form2.Hide;
end;

procedure TForm2.btnCancelClick(Sender: TObject);
begin
  Form2.ModalResult := mrCancel;
  Form2.Hide;
end;

procedure TForm2.lab0Click(Sender: TObject);
begin
  labEventNumber.Caption := labEventNumber.Caption + '0';
end;

procedure TForm2.lab1Click(Sender: TObject);
begin
  labEventNumber.Caption := labEventNumber.Caption + '1';
end;

procedure TForm2.lab2Click(Sender: TObject);
begin
  labEventNumber.Caption := labEventNumber.Caption + '2';
end;

procedure TForm2.lab3Click(Sender: TObject);
begin
  labEventNumber.Caption := labEventNumber.Caption + '3';
end;

procedure TForm2.lab4Click(Sender: TObject);
begin
  labEventNumber.Caption := labEventNumber.Caption + '4';
end;

procedure TForm2.lab5Click(Sender: TObject);
begin
  labEventNumber.Caption := labEventNumber.Caption + '5';
end;

procedure TForm2.lab6Click(Sender: TObject);
begin
  labEventNumber.Caption := labEventNumber.Caption + '6';
end;

procedure TForm2.lab7Click(Sender: TObject);
begin
  labEventNumber.Caption := labEventNumber.Caption + '7';
end;

procedure TForm2.lab8Click(Sender: TObject);
begin
  labEventNumber.Caption := labEventNumber.Caption + '8';
end;

procedure TForm2.lab9Click(Sender: TObject);
begin
  labEventNumber.Caption := labEventNumber.Caption + '9';
end;


end.

