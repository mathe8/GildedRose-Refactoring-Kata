program TextTestFixture;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  System.Generics.Collections,
  GildedRose in 'GildedRose.pas',
  Item in 'Item.pas';

var
  ErrorCode: Integer;
  I, J : Integer; // Conts
  Days : Integer;
  Pause : String;
  Items : TObjectList<TItem>;
  App : TGildedRose;
begin
  try

    Items := TObjectList<TItem>.Create;

    Items.Add(TItem.Create('+5 Dexterity Vest', 10, 20));
    Items.Add(TItem.Create('Aged Brie', 2, 0));
    Items.Add(TItem.Create('Elixir of the Mongoose', 5, 7));
    Items.Add(TItem.Create('Sulfuras, Hand of Ragnaros', 0, 80));
    Items.Add(TItem.Create('Sulfuras, Hand of Ragnaros', -1, 80));
    Items.Add(TItem.Create('Backstage passes to a TAFKAL80ETC concert', 15, 20));
    Items.Add(TItem.Create('Backstage passes to a TAFKAL80ETC concert', 10, 49));
    Items.Add(TItem.Create('Backstage passes to a TAFKAL80ETC concert', 5, 49));
    Items.Add(TItem.Create('Conjured Mana Cake', 3, 6));

    App := TGildedRose.Create(Items);

    Days := 5;
    if ParamCount > 0 then
    begin
      Val(ParamStr(1), Days, ErrorCode);
      Inc(Days);
    end;

    for I := 0 to Days - 1 do
    begin
      Writeln(Format('-------- Day %d --------', [I]));
      Writeln('Name, Days for Sell, Quality');
      for J := 0 to Items.Count - 1 do
        Writeln(Items[J].ToString);
      Writeln;

      App.UpdateQuality;
    end;

    Write('Type to continue... '); ReadLn(Pause);

  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
