unit GildedRose;

interface

uses
  Item, System.Generics.Collections;

type
  TGildedRose = class(TObject)
  private
    FItems: TObjectList<TItem>;
  public
    constructor Create(const AItems: TObjectList<TItem>);
    procedure UpdateQuality;
    property Items: TObjectList<TItem> read FItems;
  end;

implementation

const
  Aged = 'Aged Brie';
  Backstage = 'Backstage passes to a TAFKAL80ETC concert';
  Sulfuras = 'Sulfuras, Hand of Ragnaros';
  Conjured = 'Conjured Mana Cake';

{ TGildedRose }

constructor TGildedRose.Create(const AItems: TObjectList<TItem>);
begin
  inherited Create;
  FItems := AItems;
end;

procedure TGildedRose.UpdateQuality;
var
  I, aux: Integer; // Conts
begin
  for I := 0 to Items.Count - 1 do
  begin
    aux := 0;

    if (Items[I].Name <> Sulfuras) And (Items[I].Name <> Conjured) then
    begin
      if Items[I].DaysForSell <> 0 then
        begin
          Items[I].DaysForSell := Items[I].DaysForSell - 1
        end;

      if Items[I].Name = Aged then
        begin
          if Items[I].Quality <= 50 then
            Items[I].Quality := Items[I].Quality + 1
        end

      else if Items[I].Name = Backstage then
        begin
          if Items[I].DaysForSell <= 10 then
            begin
              aux := Items[I].Quality + 2;
              if aux <= 50 then
                Items[I].Quality := Items[I].Quality + 2
            end

          else if Items[I].DaysForSell <= 5 then
            begin
              aux := Items[I].Quality + 3;
              if aux <= 50 then
                Items[I].Quality := Items[I].Quality + 3
            end

          else if Items[I].DaysForSell < 0 then
            begin
              if aux <= 50 then
                Items[I].Quality := 0
            end

          else
            begin
              Items[I].Quality := Items[I].Quality + 1;
            end;
        end

      else
        begin
          Items[I].Quality := Items[I].Quality - 1
        end;
    end

    else if Items[I].Name = Sulfuras then
      begin
        Items[I].DaysForSell := 0
      end

    else if Items[I].Name = Conjured then
      begin
        if Items[I].Quality <> 1 then
          begin
            Items[I].DaysForSell := Items[I].DaysForSell - 1;
            Items[I].Quality := Items[I].Quality - 2
          end;
      end;

  end;

end;

end.
