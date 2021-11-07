unit Unit2;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, Math;

type
  TForm2 = class(TForm)
    Image1: TImage;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.FormCreate(Sender: TObject);
var
  Stream: TResourceStream;
  Image: TBitmap;
begin
  Stream := TResourceStream.Create(HInstance, 'PandaImage', RT_RCDATA);
  try
    Image := TBitmap.Create;
    try
      Stream.Position := 0;
      Image.LoadFromStream(Stream);
      Image1.Bitmap := Image;
    finally
      Image.Free;
    end;
  finally
    Stream.Free;
  end;

end;

procedure TForm2.Image1Click(Sender: TObject);
begin
  ShowMessage('Don''t worry, you are safe.' + #13 + 'Just exit the program and everything will be fine.' + #13 + '- Alan Richard');
end;

procedure TForm2.Timer1Timer(Sender: TObject);
begin
  self.Left := RandomRange(0, Round(Screen.Width - self.Width));
  self.Top := RandomRange(0, Round(Screen.Height - self.Height));
end;

end.
