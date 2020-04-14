unit UTable;

interface
  uses UData, Grids, SysUtils, Dialogs;
  Const
    N=101;

  Type
    TIndex=0..N-1;
    TState=(sfree,sfull,sdel);
    TCell=record
      Info:TFilmInfo;
      State:TState;
      Next:integer;
      end;
    TTable=array[TIndex] of TCell;

    THTable=class
      private
        FCount:integer;
        FTable:TTable;

      protected
      function Hash(key:TKey):integer;

      public
        constructor Create;
        destructor Destroy; override;
        procedure Clear;
        procedure Add(info:TFilmInfo);
        function Find(key:Tkey):TFilmInfo;
        function Delete(key:TKey):boolean;
        procedure Print(var tab:TStringGrid);
        procedure SaveToFile(FileName:string);
        procedure LoadFromFile(FileName:string);
        function getIndex(Key:TKey; var index:integer):integer;
        function IsEmpty():boolean;
      end;


implementation

{ THTable }

function THTable.Hash(key:TKey): integer;
var i: integer;
  begin
    result:=0;
    for i:=1 to length(key) do
      result:=result + ord(key[i]);

    result := (result mod N)+1;
  end;

function THTable.getIndex(Key:TKey; var index:integer):integer;
var first:integer;
    found:boolean;
  begin
    index:= 0;
    result:=Hash(Key);
    first:= result;
    found:= false;

    while (not found and (result <> -1))  do
      begin
        if ((Ftable[result].info <> nil) and (Ftable[result].info.Title=Key))  then
            found:= true

        else
          begin
            index:= result;
            result:= Ftable[result].next;
          end;
      end;

    if (not found) then
        if (Ftable[first].next < 0) then
            index:= first;

  end;


procedure THTable.Add(info: TFilmInfo);
var pos,index:integer;
  begin
    if (Fcount = N) then
        showmessage('Переполнение таблицы!')

    else
      begin
        pos:= getIndex(Info.Title, index);
          if (pos < 0)  then
            begin
              inc(Fcount);
              if (Ftable[index].info = nil) then
                begin
                    Ftable[index].info:= Info;
                    Ftable[index].State:=sfull;
                    Ftable[index].next:= Ftable[index].next;
                end

              else
                begin
                  pos:= index;

                  repeat
                    pos:= pos mod N + 1;
                  until (Ftable[pos].info = nil);

                  Ftable[pos].info:= Info;
                  Ftable[pos].State:=sfull;
                  Ftable[index].next:= pos;
                end;
            end;
      end;
  end;

procedure THTable.Clear;
var i:integer;
  begin
    for i:=0 to n-1 do
      begin
        FTable[i].Info.Free;
        FTable[i].Info:=nil;
        FTable[i].State:=sfree;
      end;
  end;

constructor THTable.Create;
var i:integer;
  begin
    FCount:=0;
    for i:=0 to n-1 do
      begin
        FTable[i].State:=sfree;
        FTable[i].next:=-1;
      end
  end;

function THTable.Delete(key: TKey): boolean;
var  pos,index:integer;
  begin
    if (Fcount > 0) then
      begin
        pos:=getIndex(key, index);
        result:=pos>0;
        if (result) then
          begin
            Ftable[pos].info:=nil;
            Ftable[pos].state:=sdel;
            dec(Fcount);
            if (index=0) then
              Ftable[pos].next:= -1

            else
              Ftable[index].next:= Ftable[pos].next;
          end;
      end

    else
      result:=false;
  end;

destructor THTable.Destroy;
  begin
    Clear;
    inherited;
  end;

function THTable.Find(key: Tkey): TFilmInfo;
var a,pa:integer; res:boolean;
  begin
      a:= getIndex(Key, pa);
      res:= a > 0;
      if (res) then
        result:= Ftable[a].info

      else
        result:=nil;
  end;

function THTable.IsEmpty():boolean;
  begin
    result:=Fcount=0;
  end;

procedure THTable.LoadFromFile(FileName:string);
var f:TextFile;
    info:TFilmInfo;
    ok:boolean;
  begin
    Assign(f,FileName);
    Reset(f);
    ok:= true;
    while (not eof(f)) and ok do
      begin
        info:=TFilmInfo.Create;
        ok:=info.LoadFromFile(f);
        if ok then
          begin
            Add(info);
            if not eof(f) then
              Readln(f);
          end;
      end;
    CloseFile(f);
  end;

procedure THTable.Print(var tab: TStringGrid);
var i,j,indNext:integer;
  begin
    j:= 1;
    for i:=0 to N-1 do
      if (Ftable[i].state = sfull) then
        begin
          Ftable[i].info.showToGrid(tab, j);
          if (Ftable[i].next<>-1) then
            begin
              indNext:=Ftable[i].next;
              while (Ftable[indNext].next<>-1) do
                begin
                  inc(j);
                  if (j>tab.RowCount) then
                    tab.RowCount:=tab.RowCount+1;

                  Ftable[indNext].info.showToGrid(tab, j);
                  inc(indNext);
                end;
            end;
          inc(j);
          if (j>tab.RowCount) then
              tab.RowCount:=tab.RowCount+1;
        end;
  end;

procedure THTable.SaveToFile(FileName: string);
var f:TextFile;
    i:integer;
    p:integer;
  begin
     Assign(f,FileName);
     Rewrite(f);
     for i:=0 to N do
       if FTable[i].State=sfull then
          begin
            Ftable[i].Info.SaveToFile(f);
            p:=FTable[i].next;
            while p<>-1 do
              begin
                FTable[p].Info.SaveToFile(f);
                p:=FTable[p].next;
              end
          end;

     CloseFile(f);
  end;

end.
