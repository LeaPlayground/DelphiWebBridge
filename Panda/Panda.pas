unit Panda;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects, Vcl.Imaging.pngimage;

type
  TForm2 = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
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
  Stream := TMemoryStream.Create;
  try
    Image := TBitmap.Create;
    try
      Stream.Position := 0;
      Image.LoadFromStream(Stream);
      Image1.Picture.Graphic := Image;
    finally
      Image.Free;
    end;
  finally
    Stream.Free;
end;

end.
