unit Item;

interface

type
  TItem = class(TObject)
  private
    FName: string;
    FDaysForSell: Integer;
    FQuality: Integer;
  public

    constructor Create(const AName: string; const ADaysForSell, AQuality: Integer);

    function ToString      : string; override;

    property Name          : string read FName write FName;
    property DaysForSell   : Integer read FDaysForSell write FDaysForSell;
    property Quality       : Integer read FQuality write FQuality;

  end;

implementation

uses
  System.SysUtils;

{ TItem }

constructor TItem.Create(const AName: string; const ADaysForSell, AQuality: Integer);
begin
  inherited Create;
  FName        := AName;
  FDaysForSell := ADaysForSell;
  FQuality     := AQuality;
end;

function TItem.ToString: string;
begin
  Result := Format('%s, %d, %d', [Name, DaysForSell, Quality]);
end;

end.
