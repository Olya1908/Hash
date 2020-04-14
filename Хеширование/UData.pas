unit UData;

interface
  uses Classes, Grids, SysUtils;

  Type
    TKey=string;
    TFilmInfo=class
      private
        FTitle:TKey;
        FDirector:string;
        FActors:string;
        FSummary:string;
      public
        property Title: string read FTitle write FTitle;
        property Director: string read FDirector write FDirector;
        property Actors: string read FActors write FActors;
        property Summary: string read FSummary write FSummary;

        constructor Create();
        function LoadFromFile(var f:TextFile):boolean;
        procedure SaveToFile(var f:TextFile);
        procedure showToGrid(var grid: TStringGrid; row: Integer);
    end;

                 

implementation

{ TFilmInfo }

constructor TFilmInfo.Create();
  begin    
    inherited Create;
    FTitle:='';
    FDirector:='';
    FActors:='';
    FSummary:='';
  end;

procedure TFilmInfo.showToGrid(var Grid: TStringGrid; row: Integer);
  begin
    Grid.Cells[0,row]:=IntToStr(row);
    Grid.Cells[1,row]:=Title;
    Grid.Cells[2,row]:=Director;
    Grid.Cells[3,row]:=Actors;
    Grid.Cells[4,row]:=Summary;
  end;

function TFilmInfo.LoadFromFile(var f: TextFile): boolean;
  begin
    result:=true;
    Readln(f,FTitle);
    if (FTitle='') then
      result:=false;

    if  result then
      begin
        Readln(f,FDirector);
        Readln(f,FActors);
        Readln(f,FSummary);
      end;
  end;


procedure TFilmInfo.SaveToFile(var f: TextFile);
  begin
    Writeln(f,FTitle);
    Writeln(f,FDirector);
    Writeln(f,FActors);
    Writeln(f,FSummary);
    Writeln(f);
  end;

end.
 