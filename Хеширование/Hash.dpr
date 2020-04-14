program Hash;

uses
  Forms,
  UnitForm in 'UnitForm.pas' {FormMain},
  UData in 'UData.pas',
  UTable in 'UTable.pas',
  UAdd in 'UAdd.pas' {FormAdd},
  UDel in 'UDel.pas' {FormDel},
  UTask in 'UTask.pas' {FormTask},
  UShowTask in 'UShowTask.pas' {FormShowTask};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormAdd, FormAdd);
  Application.CreateForm(TFormDel, FormDel);
  Application.CreateForm(TFormTask, FormTask);
  Application.CreateForm(TFormShowTask, FormShowTask);
  Application.Run;
end.
