unit UDel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,UData, UTable, UnitForm;

type
  TFormDel = class(TForm)
    pnl1: TPanel;
    lblDelFName: TLabel;
    edtInpFName: TEdit;
    btnDel: TButton;
    btnCancel: TButton;
    procedure edtInpFNameChange(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormDel: TFormDel;

implementation

{$R *.dfm}

procedure TFormDel.edtInpFNameChange(Sender: TObject);
  begin
      btnDel.Enabled:=edtInpFName.Text<>'';
  end;

procedure TFormDel.btnDelClick(Sender: TObject);
var Empty:boolean;
  begin
    if (not Table.Delete(Trim(edtInpFName.Text))) then
        showmessage('Фильм с таким названием отсутствует')

    else
      begin
        FormMain.Grid.RowCount:=FormMain.Grid.RowCount-1;
        Empty:=Table.IsEmpty();
        FormMain.mDel.Enabled:=not Empty;
        FormMain.mTask.Enabled:= not Empty;
        if (Not Empty) then
          begin
            FormMain.GridClear();
            Table.Print(FormMain.Grid);
          end

        else
            FormMain.GridClear();

        close();
      end;

    edtInpFName.Text:='';
    FormMain.Enabled:=true;
  end;

procedure TFormDel.btnCancelClick(Sender: TObject);
var Empty:boolean;
  begin
     Empty:=Table.IsEmpty();
     FormMain.mEdit.Enabled:=true;
     FormMain.mDel.Enabled:=not Empty;
     FormMain.mTask.Enabled:= not Empty;
     FormMain.Enabled:=true;
     edtInpFName.Text:='';
     close();
  end;

procedure TFormDel.FormClose(Sender: TObject; var Action: TCloseAction);
var Empty:boolean;
  begin
     Empty:=Table.IsEmpty();
     FormMain.mEdit.Enabled:=true;
     FormMain.mDel.Enabled:=not Empty;
     FormMain.mTask.Enabled:= not Empty;
     edtInpFName.Text:='';
     FormMain.Enabled:=true;
  end;

end.
