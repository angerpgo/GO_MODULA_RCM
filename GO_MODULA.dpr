program GO_MODULA;









{$R 'ZZVERSIONE_GO_EXE.res' '..\..\..\go_1010\src_101002\ZZVERSIONE_GO_EXE.rc'}

uses
  madExcept,
  Vcl.Forms,
  DMARC in '..\..\..\go_1010\src_101002\DMARC.pas' {ARC: TDataModule},
  GGLOGIN in '..\..\..\go_1010\src_101002\GGLOGIN.pas' {LOGIN},
  GGBASE in '..\..\..\go_1010\src_101002\GGBASE.pas' {BASE},
  GGFORMBASE in '..\..\..\go_1010\src_101002\GGFORMBASE.pas' {FORMBASE},
  GGSTAMPA in '..\..\..\go_1010\src_101002\GGSTAMPA.pas' {STAMPA},
  DMCLOUD in 'DMCLOUD.pas' {CLOUD: TDataModule},
  FRMDITTA in 'FRMDITTA.pas' {DITTA: TFrame},
  GGMENU in 'GGMENU.pas' {MENUGG};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TCLOUD, CLOUD);
  Application.CreateForm(TARC, ARC);
  Application.CreateForm(TLOGIN, LOGIN);
  Application.Run;
end.                                  \
