unit UAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UData, UTable, UnitForm;

type
  TFormAdd = class(TForm)
    pnl1: TPanel;
    lblFName: TLabel;
    edtInputFName: TEdit;
    lblDirectro: TLabel;
    edtInputDir: TEdit;
    lblActors: TLabel;
    edtInputAct: TEdit;
    lblSummary: TLabel;
    edtInputSum: TEdit;
    btnAdd: TButton;
    btnCancel: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure edtInputFNameChange(Sender: TObject);
    procedure edtInputDirChange(Sender: TObject);
    procedure edtInputSumChange(Sender: TObject);
    procedure edtInputActChange(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormAdd: TFormAdd;

implementation


{$R *.dfm}

procedure TFormAdd.btnAddClick(Sender: TObject);
var newRec:TFilmInfo;
  begin
      newRec:=TFilmInfo.Create;
      newRec.Title:=edtInputFName.Text;
      newRec.Director:=edtInputDir.Text;
      newRec.Actors:=edtInputAct.Text;
      newRec.Summary:=edtInputSum.Text;
      Table.Add(newRec);
      Table.Print(FormMain.Grid);
      edtInputFName.Text:='';
      edtInputDir.Text:='';
      edtInputAct.Text:='';
      edtInputSum.Text:='';
      FormMain.mEdit.Enabled:=true;
      FormMain.mAdd.Enabled:=true;
      FormMain.mDel.Enabled:=true;
      FormMain.mTask.Enabled:=true;
      FormMain.Enabled:=true;
      close();
  end;

procedure TFormAdd.edtInputFNameChange(Sender: TObject);
  begin
    edtInputDir.Enabled:=edtInputFName.Text<>'';
    btnAdd.Enabled:=((edtInputFName.Text<>'') and (edtInputDir.Text<>'') and (edtInputAct.Text<>'') and (edtInputSum.Text<>''));
  end;

procedure TFormAdd.edtInputDirChange(Sender: TObject);
  begin
    edtInputAct.Enabled:=edtInputDir.Text<>'';
    btnAdd.Enabled:=((edtInputFName.Text<>'') and (edtInputDir.Text<>'') and (edtInputAct.Text<>'') and (edtInputSum.Text<>''));
  end;

procedure TFormAdd.edtInputActChange(Sender: TObject);
  begin
    edtInputSum.Enabled:=edtInputAct.Text<>'';
    btnAdd.Enabled:=((edtInputFName.Text<>'') and (edtInputDir.Text<>'') and (edtInputAct.Text<>'') and (edtInputSum.Text<>''));
  end;

procedure TFormAdd.edtInputSumChange(Sender: TObject);
  begin
     btnAdd.Enabled:=((edtInputFName.Text<>'') and (edtInputDir.Text<>'') and (edtInputAct.Text<>'') and (edtInputSum.Text<>''));
  end;

procedure TFormAdd.FormClose(Sender: TObject; var Action: TCloseAction);
var Empty:boolean;
  begin
     Empty:=Table.IsEmpty();
     FormMain.mEdit.Enabled:=true;
     FormMain.mAdd.Enabled:=true;
     FormMain.mDel.Enabled:=not Empty;
     FormMain.mTask.Enabled:= not Empty;
     edtInputFName.Text:='';
     edtInputDir.Text:='';
     edtInputAct.Text:='';
     edtInputSum.Text:='';
     FormMain.Enabled:=true;
  end;

procedure TFormAdd.btnCancelClick(Sender: TObject);
var Empty:boolean;
  begin
     Empty:=Table.IsEmpty();
     FormMain.mEdit.Enabled:=true;
     FormMain.mAdd.Enabled:=true;
     FormMain.mDel.Enabled:=not Empty;
     FormMain.mTask.Enabled:= not Empty;
     FormMain.Enabled:=true;
     edtInputFName.Text:='';
     edtInputDir.Text:='';
     edtInputAct.Text:='';
     edtInputSum.Text:='';
     close();
  end;
end.
