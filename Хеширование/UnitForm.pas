unit UnitForm;

interface

uses
  Windows, Messages, WinProcs, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, UTable, Grids, Menus, ExtCtrls;

type
  TFormMain = class(TForm)
    OpenDialog: TOpenDialog;
    SaveDialog: TSaveDialog;
    MainMenu: TMainMenu;
    mFile: TMenuItem;
    mCreate: TMenuItem;
    mOpen: TMenuItem;
    mSave: TMenuItem;
    mSaveAs: TMenuItem;
    mEdit: TMenuItem;
    mAdd: TMenuItem;
    mDel: TMenuItem;
    mTask: TMenuItem;
    mExit: TMenuItem;
    Grid: TStringGrid;
    procedure mOpenClick(Sender: TObject);
    procedure GridClear();
    procedure mSaveClick(Sender: TObject);
    procedure mSaveAsClick(Sender: TObject);
    procedure mCreateClick(Sender: TObject);
    procedure mAddClick(Sender: TObject);
    procedure mDelClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mTaskClick(Sender: TObject);
    procedure mExitClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure GridDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure FormResize(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
  
var
  FormMain: TFormMain;
  Table:THTable;
  Filename: string;
  FileIsCreate, FileSave, FileClose: boolean;

implementation
  uses UData, UAdd, UDel, UTask;
{$R *.dfm}

procedure TFormMain.FormCreate(Sender: TObject);
  begin
    Grid.Cells[0,0]:='№';
    Grid.Cells[1,0]:='Название фильма';
    Grid.Cells[2,0]:='Режиссер(ы)';
    Grid.Cells[3,0]:='Актеры';
    Grid.Cells[4,0]:='Краткое описание';
  end;

procedure TFormMain.GridClear();
var row,col:integer;
  begin
     for row:=1 to Grid.RowCount do
       for col:=0 to 4 do
        Grid.Cells[col,row]:='';

     Grid.RowCount:=2;
     Grid.RowHeights[1]:=24;
  end;

procedure TFormMain.mOpenClick(Sender: TObject);
var ans:integer;
  begin
   ans:=mrNo;
   if ((FileName<>'') or FileIsCreate) and not FileSave  then
     begin
       ans:=MessageDlg('Сохранить изменения',mtCustom,[mbYes,mbNo,mbCancel], 0);
      if (ans= mrYes)then
          mSaveClick(Sender)
     end;

     if (ans<>mrCancel) then
       begin
         Table.Clear;
         GridClear();
         if OpenDialog.Execute then
           begin
             filename:=OpenDialog.FileName;
             Table.LoadFromFile(filename);
             if (Table.IsEmpty()) then
               showmessage('Ошибка добавления записей')

             else
               begin
                 Grid.Visible:=true;
                 Table.Print(Grid);
                 mSave.Enabled:=true;
                 mSaveAs.enabled:=true;
                 mEdit.enabled:=true;
                 mTask.enabled:=true;
                 mEdit.Enabled:=true;
                 mAdd.Enabled:=true;
                 mDel.Enabled:=true;
               end;
            end;
       end;
  end;

procedure TFormMain.mSaveClick(Sender: TObject);
  begin
     if FileName<>'' then
        begin
          Table.SaveToFile(FileName);
          FileSave:=true;
        end

     else
        mSaveAsClick(Sender);
  end;

procedure TFormMain.mSaveAsClick(Sender: TObject);
  begin
    if (SaveDialog.Execute) then
      if FileExists(SaveDialog.FileName) then
        begin
           if MessageDlg('Файл с таким именем уже существует! Заменить?',
              mtConfirmation,[mbYes,mbNo],0)=mrYes
           then
             begin
                Table.SaveToFile(SaveDialog.FileName);
                FileSave:=true;
             end;
        end
        
      else
        begin
          Table.SaveToFile(SaveDialog.FileName);
          FileSave:=true;
        end;
  end;

procedure TFormMain.mCreateClick(Sender: TObject);
var ans:integer;
  begin
    ans:=mrNo;
     if ((FileName<>'') or FileIsCreate) and not FileSave  then
       begin
         ans:=MessageDlg('Сохранить изменения',mtCustom,[mbYes,mbNo,mbCancel], 0);
         if (ans= mrYes)then
            mSaveClick(Sender)
       end;

       if (ans<>mrCancel) then
         begin
            FileIsCreate:=true;
            Table.Clear;
            GridClear();
            SaveDialog.FileName:='';
            Filename:='';
            Grid.Visible:=true;
            FileSave:=False;
            mAddClick(Sender);
            FileClose:=false;
         end;
  end;

procedure TFormMain.mAddClick(Sender: TObject);
  begin
    FormMain.Enabled:=false;
    FormAdd.Show();
  end;

procedure TFormMain.mDelClick(Sender: TObject);
  begin
    FormMain.Enabled:=false;
    FormDel.Show();
  end;

procedure TFormMain.mTaskClick(Sender: TObject);
  begin
    FormMain.Enabled:=false;
    FormTask.Show();
  end;

procedure TFormMain.mExitClick(Sender: TObject);
var ans:integer;
  begin
    if (not FileSave and (FileName<>'') or FileIsCreate) then
      begin
        if (ans= mrYes)then
          begin
            mSaveClick(sender);
            FileClose:=true;
            close();
          end

        else
          if (ans=mrNo) then
            begin
              FileClose:=true;
              close();
            end;
      end;
  end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
var ans:integer;
  begin
     if (not FileClose and not FileSave and (FileName<>'') or FileIsCreate) then
     begin
       ans:= MessageDlg('Сохранить изменения?',mtCustom,[mbYes,mbNo,mbCancel], 0);
        if (ans=mrYes)then
           begin
             mSaveClick(sender);
             Action:=caFree
           end

        else
          if (ans= mrCancel) then
            Action:=caNone;
     end;
  end;


procedure TFormMain.GridDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var AText: string;
  begin
    with Grid, Grid.Canvas do
      begin
        if (ACol >= FixedCols - 1) and (ARow >= FixedRows - 1) then
        begin
          FillRect(Rect);
          AText := Grid.Cells[ACol, ARow];
          if AText <> '' then
          begin
            DrawText(Handle, PChar(AText), -1, Rect, DT_CALCRECT or DT_WORDBREAK);
            if RowHeights[ARow] < Rect.Bottom - Rect.Top then
              RowHeights[ARow] := Rect.Bottom - Rect.Top;

            DrawText(Handle, PChar(AText), -1, Rect, DT_WORDBREAK);
          end;
        end;
      end;
  end;


procedure TFormMain.FormResize(Sender: TObject);
var newWidth: integer;
  begin
     Grid.Width:=ClientWidth-Grid.Left*2;
     Grid.Height:=ClientHeight-Grid.Top*2;
     newWidth:=(Grid.Width-Grid.ColWidths[0]-Grid.GridLineWidth*Grid.ColCount-2)-Grid.ColWidths[1]-Grid.ColWidths[2]-Grid.ColWidths[3]-15;
     Grid.ColWidths[4]:=newWidth;
  end;

initialization
  Table:= THTable.Create;

finalization
  Table.Free;



end.

