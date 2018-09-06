unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Spin;

type

  { TForm1 }

  TForm1 = class(TForm)
    MassLabel: TLabel;
    HeightLabel: TLabel;
    BMITextLabel1: TLabel;
    BMILabel1: TLabel;
    BMILabel2: TLabel;
    MassEdit: TFloatSpinEdit;
    HeightEdit: TFloatSpinEdit;
    procedure BMIValuesChanged(Sender: TObject);
  private
    function calcBMI(m : real; h: real):real;
    function BMItoText(BMI:real):String;
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.BMIValuesChanged(Sender: TObject);
var BMI:real;
begin
  BMI := calcBMI(MassEdit.Value, HeightEdit.Value);
  BMILabel1.Caption := FloattoStrF(BMI,ffFixed,8,2);
  BMILabel2.Caption := 'Damit zählst du als ' + BMItoText(BMI)+ '  !';
end;

function TForm1.calcBMI(m: real; h: real): real;
begin
   result := m / (h * h);
end;

function TForm1.BMItoText(BMI: real): String;
begin
   if BMI < 16 then
      result := 'stark untergewichtig'
   else if BMI < 17 then
      result := 'maessig untergewichtig'
   else if BMI < 18.5 then
      result := 'leicht untergewichtig'
   else if BMI < 25 then
      result := 'normalgewichtig'
   else if BMI < 30 then
      result := 'Präadipositas'
   else if BMI < 35 then
      result := 'Adipositas Grad I'
   else if BMI < 40 then
      result := 'Adipositas Grad II'
   else result := 'Adipositas Grad III'
end;

end.

