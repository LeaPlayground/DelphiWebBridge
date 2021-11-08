unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.TMSFNCTypes, FMX.TMSFNCUtils, FMX.TMSFNCGraphics, FMX.TMSFNCGraphicsTypes,
  FMX.TMSFNCCustomControl, FMX.TMSFNCWebBrowser;

type
  TForm1 = class(TForm)
    WebBrowser1: TTMSFNCWebBrowser;
    procedure FormCreate(Sender: TObject);
  const
    BridgeName = 'MyBridge';
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TMyBridgeObject = class(TInterfacedPersistent, ITMSFNCCustomWebBrowserBridge) private
    FObjectMessage: string;
    function GetObjectMessage: string;
    procedure SetObjectMessage(const Value: string);
  published
  property
    ObjectMessage: string read GetObjectMessage write
  SetObjectMessage;
  end;

var
  Form1: TForm1;
  BridgeMessage: string;

implementation

{$R *.fmx}

uses Unit2;

function TMyBridgeObject.GetObjectMessage(): string;
begin
  // Return previously saved BridgeMessage
  Exit(BridgeMessage);
end;

procedure TMyBridgeObject.SetObjectMessage(const Value:
string);
begin
  // If the incoming message is 'panda'..
  if (Value = 'panda') then
    // .. then show user the "panda memory"
    Form2.Show();

  // Save the incoming message string into variable BridgeMessage
  BridgeMessage := Value;

  // Display a message box with the incoming value
  ShowMessage('From JS Bridge: ' + #13 + Value);
end;



procedure TForm1.FormCreate(Sender: TObject);
var
  // Declare local variable o with type TMyBridgeObject
  o: TMyBridgeObject;
begin
  // Create TMyBridgeObject
  o := TMyBridgeObject.Create;
  // Assign TMyBridgeObject to TTMSFncWebBrowser
  self.WebBrowser1.AddBridge(BridgeName, o);
end;

end.
