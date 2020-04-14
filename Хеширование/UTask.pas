unit UTask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UData, UTable, UnitForm;

type
  TFormTask = class(TForm)
    pnl1: TPanel;
    lblFName: TLabel;
    edtInputFName: TEdit;
    btnFind: TButton;
    btnCancel: TButton;
    procedure edtInputFNameChange(Sender: TObject);
    procedure btnFindClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTask: TFormTask;
  res:TFilmInfo;

implementation

uses UShowTask;

{$R *.dfm}

procedure TFormTask.edtInputFNameChange(Sender: TObject);
  begin
      btnFind.Enabled:=edtInputFName.Text<>'';
  end;

procedure TFormTask.btnFindClick(Sender: TObject);
  begin
    res:=TFilmInfo.Create();
    res:=Table.Find(edtInputFName.Text);
    if (res=nil) then
      ShowMessage('Фильм с таким названием не найден!')

    else
      begin
        FormTask.Enabled:=false;
        FormShowTask.Show();
      end;

    edtInputFName.Text:='';
    FormMain.Enabled:=true;
    close();
  end;

procedure TFormTask.btnCancelClick(Sender: TObject);
  begin
    FormMain.Enabled:=true;
    close();
  end;

end.
