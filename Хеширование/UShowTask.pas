unit UShowTask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, UData, UTable, UnitForm, UTask;

type
  TFormShowTask = class(TForm)
    pnl1: TPanel;
    mOutput: TMemo;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormShowTask: TFormShowTask;

implementation

{$R *.dfm}

procedure TFormShowTask.FormActivate(Sender: TObject);
  begin
    mOutput.Lines.Text:='Название: '+UTask.res.Title+#13#10#13#10+
                        'Режиссер: '+UTask.res.Director+#13#10#13#10+
                        'Актеры: '+UTask.res.Actors+#13#10#13#10+
                        'Краткое описание: '+UTask.res.Summary+#13#10#13#10;
  end;

procedure TFormShowTask.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    mOutput.Lines.Clear();
    FormTask.Enabled:=true;
  end;

end.
