unit GGMENU;

interface

uses
  inifiles, windows, messages, sysutils, variants, classes, graphics, controls, forms, mask,
  dialogs, grids, stdctrls, extctrls, buttons, toolwin, comctrls, rztabs,
  db, xlsreadwriteii5, strutils, shellapi, math,
  myaccess, imglist, dxgdiplusclasses, menus,
  idbasecomponent, idcomponent, idtcpconnection, idtcpclient, ggbase,
  idexplicittlsclientserverbase, idftp, jpeg,
  rzbutton, dmarc,
  Vcl.DBGrids, RzDBGrid, raizeedit_go, RzEdit, rzlabel, rzpanel, rzdbedit, rzlistvw, rztreevw, rzdbchk,
  rzradchk, rzsplit, rzcmbobx, rzprgres,
  rzspnedt, rzshelldialogs, rzdbcmbo, memds, dbaccess,
  cxgraphics, cxcontrols, cxlookandfeels, cxlookandfeelpainters, cxstyles,
  cxcustomdata, cxfilter, cxdata, cxdatastorage, cxedit, cxdbdata, cxgridlevel,
  cxclasses, cxgridcustomview, cxgridcustomtableview, cxgridtableview,
  cxgriddbtableview, cxgrid, ipwcore, ipwhtmlmailer, query_go,
  Data.Win.ADODB, XLSSheetData5;

type

  tmenugg = class(tbase)
    panel3: trzpanel;
    label1: trzlabel;
    comboedit1: trzedit_go;
    label2: trzlabel;
    comboedit6: trzedit_go;
    label7: trzlabel;
    comboedit2: trzedit_go;
    label8: trzlabel;
    comboedit4: trzedit_go;
    label9: trzlabel;
    comboedit5: trzedit_go;
    label10: trzlabel;
    comboedit3: trzedit_go;
    label11: trzlabel;
    comboedit7: trzedit_go;
    tma: TMyQuery_go;
    groupbox1: tgroupbox;
    rzlabel1: trzlabel;
    rzlabel2: trzlabel;
    rzlabel3: trzlabel;
    timer1: ttimer;
    query: tmyquery_go;
    v_hostname_go: trzedit_go;
    v_databasename_go: trzedit_go;
    v_username_go: trzedit_go;
    v_griglia: trzdbgrid_go;
    v_parametri: TButton;
    dbModula: TADOConnection;
    adoquery: TADOQuery;
    exp_movimenti: TADOQuery;
    query_ds: TDataSource;
    tabella: TMyQuery_go;
    ovt: TMyQuery_go;
    adocancella: TADOQuery;
    exp_giacenze: TADOQuery;
    modula_giacenze: TMyQuery_go;
    XLSWrite: TXLSReadWriteII5;
    mag: TMyQuery_go;
    v_log: TMemo;
    modula: TMyQuery_go;
    modula_log: TMyQuery_go;
    adoquery_righe: TADOQuery;
    v_sincronizza: TButton;
    v_articoli: TCheckBox;
    v_ordini_vendita: TCheckBox;
    v_tutti_articoli: TCheckBox;
    exp_ubicazioni: TADOQuery;

    procedure formcreate(sender: tobject);
    procedure formkeydown(sender: tobject; var key: word; shift: tshiftstate);
    procedure timer1timer(sender: tobject);
    procedure v_parametriClick(Sender: TObject);
    procedure v_sincronizzaClick(Sender: TObject);
  protected
    schedulato: boolean;
    procedure sincronizza_dati;
    procedure sincronizza_dati_go_articoli;
    procedure sincronizza_dati_go_ordini_vendita(tipo_operazione: string);
    procedure sincronizza_magazzino_modula_go(nome_tabella: string);
    function assegna_approntato(quantita: double; gestione: boolean; controllo_quantita: boolean = true): double;
    procedure controlla_giacenze_magazzino_modula_go(nome_tabella: string);
    procedure aggiorna_modula_log(id: integer);
    procedure assegna_query;
    procedure cancella_modulo_log;
    procedure salva_log;
    procedure bottoni_setup(abilita: boolean);
  public
    programma_preferito: string;
    cartella_modula: string;
    ese_codice: string;
    operazione: string;
    ultimo_id: integer;
    procedure taskbar_aggiungi_programma(nome_programma, descrizione_programma: string; nome_form: tbase);
    procedure taskbar_attivazione(nome: string; attivazione: boolean);
    procedure taskbar_rimuovi_programma(nome_programma: string);
    procedure gestione_programmi_preferiti;
  end;

var
  menugg: tmenugg;

implementation

{$r *.dfm}


uses ggmail;

procedure tmenugg.formcreate(sender: tobject);
var
  i: integer;
  attesa: integer;
  stringa: string;
begin
  bottoni_setup(false);

  schedulato := false;
  assegna_parametri_lavoro;

  // --------------------------------------------------------------------------------------------------
  // routine di assegnazione ambiente di lavoro
  // usa l'utente passato come parametro dal comando di esecuzione (es. ...\collegato.exe GO
  // --------------------------------------------------------------------------------------------------
  attesa := 0;
  for i := 1 to system.paramcount do
  begin

    if pos('operazione', paramstr(i)) > 0 then
    begin
      operazione := estrai_tag(paramstr(i), 'operazione');
    end
    else if pos('attesa', paramstr(i)) > 0 then
    begin
      attesa := strtoint(estrai_tag(paramstr(i), 'attesa')) * 1000;
    end;

  end; // for

  if attesa = 0 then
  begin
    attesa := 1;
  end;

  timer1.interval := attesa;
  timer1.enabled := true;


  // --------------------------------------------------------------------------------------------------
  // fine routine di assegnazione ambiente di lavoro
  // --------------------------------------------------------------------------------------------------

  inherited;

  Self.caption := Self.caption + ' versione ' + versione_procedura;

  cartella_modula := copy(cartella_installazione, 1, length(cartella_installazione) - 4) + 'documenti_' + ditta + '\MODULA';
  if not DirectoryExists(cartella_modula) then
  begin
    forcedirectories(cartella_modula);
  end;

  modula.close;
  modula.parambyname('codice').asstring := ditta;
  modula.open;

  comboedit1.text := ditta;
  comboedit2.text := esercizio;
  comboedit3.text := utente;
  comboedit4.text := datetostr(data_inizio);
  comboedit5.text := datetostr(data_fine);
  comboedit6.text := arc.dit.fieldbyname('descrizione1').asstring;
  comboedit7.text := arc.utn.fieldbyname('descrizione').asstring;

  v_hostname_go.text := arc.arcdit.server;
  v_databasename_go.text := arc.arcdit.database;
  v_username_go.text := arc.arcdit.username;

  schedulato := false;

  if parametro_schedulato = 'si' then
  begin
    schedulato := true;
  end;

end;

procedure tmenugg.formkeydown(sender: tobject;
  var
  key: word;
  shift:
  tshiftstate);
begin
  if (key = vk_escape) and (shift = []) then
  begin
    close;
  end;
end;

procedure tmenugg.taskbar_aggiungi_programma(nome_programma, descrizione_programma: string;
  nome_form: tbase);
begin
  // presente perché referenziato da TARC
end;

procedure tmenugg.taskbar_attivazione(nome: string;
  attivazione:
  boolean);
begin
  // presente perché referenziato da TARC
end;

procedure tmenugg.taskbar_rimuovi_programma(nome_programma: string);
begin
  // presente perché referenziato da TARC
end;

procedure tmenugg.timer1timer(sender: tobject);
begin
  timer1.enabled := false;
  if operazione <> '' then
  begin
    sincronizza_dati;
  end
  else
  begin
    v_articoli.checked := true;
    v_ordini_vendita.checked := true;

    v_sincronizza.click;
  end;

  if parametro_schedulato = 'si' then
  begin
    close;
  end;

  bottoni_setup(true);
end;

procedure tmenugg.v_parametriClick(Sender: TObject);
begin
  esegui_programma('GESTMOD', ditta, true);
end;

procedure tmenugg.v_sincronizzaClick(Sender: TObject);
begin

  if v_articoli.checked then
  begin
    operazione := 'ART';
    sincronizza_dati;
  end;

  if v_ordini_vendita.checked then
  begin
    operazione := 'OVT';
    sincronizza_dati;
  end;
  salva_log;

  messaggio(100, 'Sincronizzazione dati terminati');

  bottoni_setup(true);
end;

procedure tmenugg.sincronizza_dati;
begin
  if operazione = '*' then
  begin
    v_log.lines.clear;
  end
  else
  begin
    v_log.lines.add('--------------------------------------------------');
  end;

  v_log.lines.add('utente :' + utente);
  v_log.lines.add('operaz:' + operazione);

  //  v_log.lines.add('inizio timer');
  dbmodula.connected := false;
  dbmodula.connectionstring := 'FILE NAME=' + cartella_installazione + 'MODULA.udl';
  dbmodula.connected := true;

  screen.cursor := crhourglass;
  if operazione = '*' then
  begin
    // da go
    sincronizza_dati_go_articoli;
    sincronizza_dati_go_ordini_vendita('U');
    //sincronizza_dati_go_ordini_vendita('D');

    //da modula
    //  sincronizza_magazzino_modula_go('art');

    // controlli
    //  controlla_giacenze_magazzino_modula_go('art');
    salva_log;
  end
  else if operazione = 'ART' then
  begin
    sincronizza_dati_go_articoli;
  end
  else if operazione = 'OVT' then
  begin
    sincronizza_dati_go_ordini_vendita('U');
    // sincronizza_dati_go_ordini_vendita('D');
  end
  else if operazione = 'SCA' then
  begin
    sincronizza_magazzino_modula_go('art');
    salva_log;
    modula.edit;
    modula.fieldbyname('ultimo_id').asinteger := ultimo_id;
    modula.post;

  end
  else if operazione = 'GIA' then
  begin
    controlla_giacenze_magazzino_modula_go('art');
  end
  else if operazione = 'CAN' then
  begin
    cancella_modulo_log;
  end;

  dbmodula.connected := false;

  screen.cursor := crdefault;
end;

procedure tmenugg.sincronizza_dati_go_articoli;
var
  nr_record: integer;
  testo_sql, art_codice: string;
  art: tmyquery_go;
begin
  art := tmyquery_go.create(nil);
  art.connection := arc.arcdit;
  art.sql.add('select ');
  art.sql.add('art.codice, ');
  art.sql.add('art.descrizione1, ');
  art.sql.add('art.descrizione2, ');
  art.sql.add('art.tum_codice, ');
  art.sql.add('art.note, ');
  art.sql.add('art.tipo_articolo, ');
  art.sql.add('( select bar.CODICE_BARRE from bar WHERE bar.ART_CODICE=art.codice LIMIT 1) codice_barre ');
  //( SELECT COUNT(*) FROM ovr WHERE ovr.art_codice=art.codice ) righe_ovr
  art.sql.add('from art ');
  art.sql.add('where ');
  art.sql.add('art.id=:id and');
  art.sql.add('art.obsoleto=''no'' and');
  art.sql.add('art.tipo_articolo=''fiscale'' ');

  adoquery.close;
  adoquery.sql.clear;
  adoquery.sql.add('select * from IMP_ARTICOLI');
  adoquery.sql.add('where');
  adoquery.sql.add('ART_ARTICOLO=:ART_ARTICOLO');
  (*
    try
    ADOCancella.close;
    ADOCancella.sql.clear;
    ADOCancella.sql.add('delete from IMP_ARTICOLI');
    ADOCancella.execsql;
    except
    end;
  *)
  query_ds.dataset := query;

  apri_transazione;
  try
    try
      if modula.eof then
      begin
        modula.append;
        modula.fieldbyname('codice').asstring := ditta;
        modula.fieldbyname('nome_tabella').asstring := 'art';
        modula.fieldbyname('ultimo_id').asinteger := 0;
        modula.fieldbyname('data_ultimo_aggiornamento').asdatetime := now - 30;
        modula.post;
      end;

      ultimo_id := modula.fieldbyname('ultimo_id').asinteger;
      nr_record := 0;

      assegna_query;

      testo_sql := query.sql.text;
      if v_tutti_articoli.checked then
      begin
        query.close;
        query.sql.clear;
        query.sql.add('select art.id as id_origine, art.* from art');
        query.sql.add('where ');
        query.sql.add('art.obsoleto =''no'' and');
        query.sql.add('art.tipo_articolo=''fiscale'' ');
        query.sql.add('order by codice');
        query.open;
      end
      else
      begin
        query.close;
        query.parambyname('nome_tabella').asstring := 'art';
        query.open;
      end;

      while not query.eof do
      begin
        application.processmessages;

        art.close;
        art.parambyname('id').asinteger := query.fieldbyname('id_origine').asinteger;
        art.open;

        art_codice := art.fieldbyname('codice').asstring;
        if modula.fieldbyname('codice_a_barre').asstring = 'si' then
        begin
          art_codice := art.fieldbyname('codice_barre').asstring;
        end;

        if (not art.eof) and (art_codice <> '') then
        begin
          nr_record := nr_record + 1;

          adoquery.close;
          adoquery.parameters.parambyname('ART_ARTICOLO').value := art_codice;
          adoquery.open;
          if adoquery.eof then
          begin
            adoquery.append;
            adoquery.fieldbyname('ART_ARTICOLO').asstring := art_codice;
            adoquery.fieldbyname('ART_DES').asstring := art.fieldbyname('descrizione1').asstring;
            (*
              adoquery.parameters.parambyname('ART_SOTTOSCO').value := 0;
              adoquery.parameters.parambyname('ART_PMU').value := 0;
              adoquery.parameters.parambyname('ART_AREEABI').value := '';
              adoquery.parameters.parambyname('RT_TIPOGESTART').value := 'V';
              adoquery.parameters.parambyname('ART_FIFOP').value := 0;
              adoquery.parameters.parambyname('ART_FIFOV').value := 0;
              adoquery.parameters.parambyname('ART_NOTE').value := '';
              adoquery.parameters.parambyname('ART_CLAMOV').value := 2;
              adoquery.parameters.parambyname('ART_GRUPPO').value := 0;
              adoquery.parameters.parambyname('ART_TIPOSTOCK').value := '';
              adoquery.parameters.parambyname('RT_ATTR1').value := '';
              adoquery.parameters.parambyname('ART_ATTR2').value := '';
              adoquery.parameters.parambyname('ART_ATTR3').value := '';
              adoquery.parameters.parambyname('ART_ATTR4').value := '';
              adoquery.parameters.parambyname('ART_ATTR5').value := '';
              adoquery.parameters.parambyname('ART_ATTR6').value := '';
              adoquery.parameters.parambyname('ART_ATTR7').value := '';
              adoquery.parameters.parambyname('RT_ATTR8').value := '';
              adoquery.parameters.parambyname('ART_FAMIGLIA').value := '';
              adoquery.parameters.parambyname('ART_RUOLO').value := '';
              adoquery.parameters.parambyname('ART_CATEGORIA1').value := '';
              adoquery.parameters.parambyname('ART_CATEGORIA2').value := '';
              adoquery.parameters.parambyname('ART_CATEGORIA3').value := '';
              adoquery.parameters.parambyname('ART_CATEGORIA4').value := '';
              adoquery.parameters.parambyname('RT_CATEGORIA5').value := '';
              adoquery.parameters.parambyname('ART_VITAUTILE').value := 0;
              adoquery.parameters.parambyname('ART_SCAD_DPRO').value := 0;
              adoquery.parameters.parambyname('ART_TOLLP').value := 0;
              adoquery.parameters.parambyname('ART_TOLLV').value := 0;
              adoquery.parameters.parambyname('ART_TOLLI').value := 0;
              adoquery.parameters.parambyname('ART_CREASCO_TIPO').value := 'NO';
              adoquery.parameters.parambyname('RT_CREASCO_USAABISCO').value := 0;
              adoquery.parameters.parambyname('ART_CREASCO_DIMX').value := 0;
              adoquery.parameters.parambyname('ART_CREASCO_DIMY').value := 0;
              adoquery.parameters.parambyname('ART_CREASCO_DIMZ').value := 0;
              adoquery.parameters.parambyname('ART_CREASCO_LIM').value := 0;
              adoquery.parameters.parambyname('ART_CREASCO_CAP').value := 0;
              adoquery.parameters.parambyname('ART_MAGAZZINO').value := 0;
              adoquery.parameters.parambyname('ART_ERRORE').value := '';
            *)
            try
              adoquery.post;
            except
              on E: exception do
              begin
                showmessage('articoli' + E.message);
              end;
            end
          end
          else
          begin
            adoquery.edit;
            adoquery.fieldbyname('ART_OPERAZIONE').asstring := 'I';
            adoquery.fieldbyname('ART_DES').asstring := art.fieldbyname('descrizione1').asstring + ' ' + art.fieldbyname('descrizione2').asstring;
            adoquery.fieldbyname('ART_UMI').asstring := art.fieldbyname('tum_codice').asstring;
            adoquery.fieldbyname('ART_NOTE').asstring := art.fieldbyname('note').asstring;
            adoquery.fieldbyname('ART_ERRORE').asstring := '';
            adoquery.post;
          end;

        end; // IF

        ultimo_id := query.fieldbyname('id_origine').asinteger;
        aggiorna_modula_log(query.fieldbyname('id').asinteger);

        query.next;
      end; // while
      v_log.lines.add('aggiornati articoli [' + formatfloat('#,###0', nr_record) + ']');

      modula.edit;
      modula.fieldbyname('nome_tabella').asstring := 'ovr';
      modula.fieldbyname('data_ultimo_aggiornamento').asdatetime := now;
      modula.fieldbyname('ultimo_id').asinteger := ultimo_id;
      modula.post;

      commit_transazione;
    except
      on e: exception do
      begin
        rollback_transazione(e.message);
      end;
    end;
  finally
    query.sql.text := testo_sql;

    chiudi_transazione;
    query.close;
    adoquery.close;
    art.close;
    freeandnil(art);
  end;

end;

procedure tmenugg.sincronizza_dati_go_ordini_vendita(tipo_operazione: string);
var
  nr_record, progressivo: integer;
  nome_tabella, art_codice: string;
  flag_ubicazione: boolean;
  ovt, ovt_check, ovr, art, bar: tmyquery_go;
  barcode_check_ok, ovr_check_ok, ovt_check_ok: boolean;
  art_tavn_codice_padre_modula: string;
begin
  art := tmyquery_go.create(nil);
  art.connection := arc.arcdit;
  art.sql.add('select ');
  art.sql.add('art.tavn_codice ');
  art.sql.add('from art ');
  art.sql.add('where ');
  art.sql.add('art.codice=:art_codice ');

  bar := tmyquery_go.create(nil);
  bar.connection := arc.arcdit;
  bar.sql.add('select ');
  bar.sql.add('bar.codice_barre ');
  bar.sql.add('from bar ');
  bar.sql.add('where ');
  bar.sql.add('bar.ART_CODICE=:art_codice ');
  bar.sql.add('order by bar.codice_barre ');
  bar.sql.add('limit 1');

  ovt_check := tmyquery_go.create(nil);
  ovt_check.connection := arc.arcdit;
  ovt_check.sql.add('select ');
  ovt_check.sql.add('m.progressivo ');
  ovt_check.sql.add('from modula_log m');
  ovt_check.sql.add('where ');
  ovt_check.sql.add('m.nome_tabella=:nome_tabella and  ');
  ovt_check.sql.add('m.operazione=:operazione and ');
  ovt_check.sql.add('m.id <:id and ');
  ovt_check.sql.add('m.data_ora_aggiornamento is null ');

  ovt := tmyquery_go.create(nil);
  ovt.connection := arc.arcdit;
  ovt.sql.add('select ');
  ovt.sql.add('ovt.progressivo, ');
  ovt.sql.add('ovt.data_documento, ');
  ovt.sql.add('ovt.numero_documento, ');
  ovt.sql.add('ovt.serie_documento, ');
  ovt.sql.add('ovt.cli_codice, ');
  ovt.sql.add('nom.descrizione1 nom_descrizione1  ');
  ovt.sql.add('from ovt');
  ovt.sql.add('inner join nom on nom.codice=ovt.cli_codice');
  ovt.sql.add('where ');
  ovt.sql.add('ovt.progressivo=:progressivo ');

  ovr := tmyquery_go.create(nil);
  ovr.connection := arc.arcdit;
  ovr.sql.add('select ');
  ovr.sql.add('ovr.progressivo, ');
  ovr.sql.add('ovr.riga, ');
  ovr.sql.add('ovr.art_codice, ');
  ovr.sql.add('ovr.kit, ');
  ovr.sql.add('ovr.descrizione1 art_descrizione1, ');
  ovr.sql.add('ovr.tum_quantita_base, ');
  ovr.sql.add('art.tavn_codice');
  ovr.sql.add('from ovr');
  ovr.sql.add('left join art on art.codice=ovr.art_codice');
  ovr.sql.add('where ');
  ovr.sql.add('ovr.progressivo=:progressivo and ');
  ovr.sql.add('ovr.riga=:riga ');

  //
  assegna_query;

  adoquery.close;
  adoquery.sql.clear;
  adoquery.sql.add('select * from IMP_ORDINI');
  adoquery.sql.add('where');
  adoquery.sql.add('ORD_ORDINE=:ORD_ORDINE ');

  adoquery_righe.close;
  adoquery_righe.sql.clear;
  adoquery_righe.sql.add('select * from IMP_ORDINI_RIGHE');
  adoquery_righe.sql.add('where');
  adoquery_righe.sql.add('RIG_ORDINE=:RIG_ORDINE and');
  adoquery_righe.sql.add('RIG_HOSTINF=:RIG_HOSTINF and');
  adoquery_righe.sql.add('RIG_ARTICOLO=:RIG_ARTICOLO');

  query_ds.dataset := query;

  apri_transazione;
  try
    try

      // righe ordine
      nome_tabella := 'ovr';
      if modula.eof then
      begin
        modula.append;
        modula.fieldbyname('nome_tabella').asstring := nome_tabella;
        modula.fieldbyname('ultimo_id').asinteger := 0;
        modula.fieldbyname('data_ultimo_aggiornamento').asdatetime := now - 30;
        modula.post;
      end;

      query.close;
      query.parambyname('nome_tabella').asstring := nome_tabella;
      query.parambyname('tipo_operazione').asstring := tipo_operazione;
      query.open;

      while not query.eof do
      begin
        application.processmessages;

        if progressivo <> query.fieldbyname('progressivo').asinteger then
        begin
          progressivo := query.fieldbyname('progressivo').asinteger;
          art_tavn_codice_padre_modula := '';
        end;

        // verifico presenza ordine inserito o cancellato precedente
        ovt_check.close;
        ovt_check.parambyname('nome_tabella').asstring := nome_tabella;
        ovt_check.parambyname('id').asinteger := query.fieldbyname('id_origine').asinteger;

        if query.fieldbyname('operazione').asstring = 'D' then
        begin
          ovt_check.parambyname('operazione').asstring := 'U';
        end
        else
        begin
          ovt_check.parambyname('operazione').asstring := 'D';
        end;

        ovt_check.open;

        ovt_check_ok := true;
        barcode_check_ok := true;
        if ovt_check_ok then
        begin
          ovr.close;
          ovr.parambyname('progressivo').asinteger := query.fieldbyname('progressivo').asinteger;
          ovr.parambyname('riga').asinteger := query.fieldbyname('riga').asinteger;
          ovr.open;

          art_codice := query.fieldbyname('art_codice').asstring;
          if modula.fieldbyname('codice_a_barre').asstring = 'si' then
          begin
            barcode_check_ok := false;

            bar.close;
            bar.parambyname('art_codice').asstring := art_codice;
            bar.open;
            art_codice := bar.fieldbyname('codice_barre').asstring;
            if bar.fieldbyname('codice_barre').asstring <> '' then
            begin
              barcode_check_ok := true;
            end;
          end;

          query.edit;
          query.fieldbyname('kit').asstring := ovr.fieldbyname('kit').asstring;
          query.fieldbyname('modula').asstring := 'no';

          // SE KIT MEMORIZZA CODICE VENDITA NEGOZIO
          if ((copy(ovr.fieldbyname('art_codice').asstring, 1, 3) = 'NE.') and (ovr.fieldbyname('kit').asstring = 'pf')) then
          begin
            //              showmessage(art_codice + ' pf' + query.fieldbyname('ubicazioni').asstring);
            read_tabella(art, query.fieldbyname('art_codice').asstring);
            art_tavn_codice_padre_modula := art.fieldbyname('tavn_codice').asstring;
            //              showmessage(art_tavn_codice_padre_modula);
          end;
          query.fieldbyname('tavn_codice').asstring := art_tavn_codice_padre_modula;

          ovr_check_ok := true;

          if art_codice = '' then
          begin
            ovr_check_ok := false;
          end;

          if ovr_check_ok then
          begin
            exp_ubicazioni.close;
            exp_ubicazioni.parameters.parambyname('art_codice').value := art_codice;
            exp_ubicazioni.open;
            if exp_ubicazioni.eof then
            begin
              query.fieldbyname('ubicazioni').asstring := 'no';
              ovr_check_ok := false;
            end
            else
            begin
              if exp_ubicazioni.fieldbyname('nr').asinteger = 0 then
              begin
                query.fieldbyname('ubicazioni').asstring := 'no';
                ovr_check_ok := false;
              end
              else
              begin
                query.fieldbyname('ubicazioni').asstring := 'si';
              end;
            end;
          end;
          query.post;

          // se esisteb ubicazione
          if query.fieldbyname('ubicazioni').asstring = 'si' then
          begin
            adoquery.close;
            adoquery.parameters.parambyname('ORD_ORDINE').value := query.fieldbyname('progressivo').asstring;
            adoquery.open;
            if not(adoquery.eof) then
            begin
              ovr_check_ok := false;
            end;

            // ESCLUSIONE KIT
            query.edit;
            if ((copy(ovr.fieldbyname('art_codice').asstring, 1, 3) = 'NE.') and (ovr.fieldbyname('kit').asstring = 'mp') and
              (art_tavn_codice_padre_modula <> 'MOD')) then
            begin
              ovr_check_ok := false;
            end;

            if ((copy(ovr.fieldbyname('art_codice').asstring, 1, 3) = 'NE.') and (ovr.fieldbyname('kit').asstring = 'no')) then
            begin
              ovr_check_ok := true;
            end;
            if ((copy(ovr.fieldbyname('art_codice').asstring, 1, 3) = 'NE.') and (ovr.fieldbyname('kit').asstring = 'mp') and
              (art_tavn_codice_padre_modula = 'MOD')) then
            begin
              ovr_check_ok := true;
              //            showmessage('kit mp')
            end;

            if (ovr_check_ok) then
            begin
              query.fieldbyname('modula').asstring := 'si';
            end;
            query.post;

          end;
        end;

        query.next;
      end; //

      query.close;
      query.open;
      while not query.eof do
      begin
        application.processmessages;

        if query.fieldbyname('modula').asstring = 'si' then
        begin
          v_log.lines.add('progressivo :' + query.fieldbyname('progressivo').asstring + ' riga:' + query.fieldbyname('riga').asstring + ' ' + art_codice);

          adoquery_righe.close;
          adoquery_righe.parameters.parambyname('RIG_ORDINE').value := query.fieldbyname('progressivo').asstring;
          adoquery_righe.parameters.parambyname('RIG_HOSTINF').value := setta_lunghezza(query.fieldbyname('riga').asstring, 5);
          adoquery_righe.parameters.parambyname('RIG_ARTICOLO').value :=  query.fieldbyname('codice_barre').asstring;
          adoquery_righe.open;
          if adoquery_righe.eof then
          begin
            adoquery_righe.append;
            adoquery_righe.fieldbyname('RIG_ORDINE').asstring := query.fieldbyname('progressivo').asstring;
            adoquery_righe.fieldbyname('RIG_HOSTINF').asstring := setta_lunghezza(query.fieldbyname('riga').asstring, 5);
            adoquery_righe.fieldbyname('RIG_ARTICOLO').asstring := query.fieldbyname('codice_barre').asstring;;
            adoquery_righe.fieldbyname('RIG_PRIO').asinteger := query.fieldbyname('riga').asinteger;
            adoquery_righe.post;
          end;
          adoquery_righe.edit;
          adoquery_righe.fieldbyname('RIG_QTAR').asfloat := adoquery_righe.fieldbyname('RIG_QTAR').asfloat + query.fieldbyname('quantita').asfloat;
          adoquery_righe.post;

        end;

        aggiorna_modula_log(query.fieldbyname('id').asinteger);

        query.next;
      end; //

      nome_tabella := 'ovt';

      if modula.eof then
      begin
        modula.append;
        modula.fieldbyname('nome_tabella').asstring := nome_tabella;
        modula.fieldbyname('ultimo_id').asinteger := 0;
        modula.fieldbyname('data_ultimo_aggiornamento').asdatetime := now - 30;
        modula.post;
      end;

      nr_record := 0;
      ultimo_id := modula.fieldbyname('ultimo_id').asinteger;

      // testata ordine
      query.close;
      query.parambyname('nome_tabella').asstring := nome_tabella;
      query.parambyname('tipo_operazione').asstring := tipo_operazione;
      query.open;

      while not query.eof do
      begin
        application.processmessages;

        // verifico presenza ordine inserito o cancellato precedente
        ovt_check.close;
        ovt_check.parambyname('nome_tabella').asstring := nome_tabella;
        ovt_check.parambyname('id').asinteger := query.fieldbyname('id_origine').asinteger;

        if query.fieldbyname('operazione').asstring = 'D' then
        begin
          ovt_check.parambyname('operazione').asstring := 'U';
        end
        else
        begin
          ovt_check.parambyname('operazione').asstring := 'D';
        end;

        ovt_check.open;
        ovt_check_ok := true;
        if ovt_check_ok then
        begin

          ovt.close;
          ovt.parambyname('progressivo').asinteger := query.fieldbyname('progressivo').asinteger;
          ovt.open;

          if (not ovt.eof) and (ovt.fieldbyname('progressivo').asfloat > 0) then
          begin
            adoquery.close;
            adoquery.parameters.parambyname('ORD_ORDINE').value := ovt.fieldbyname('progressivo').asstring;
            adoquery.open;
            if adoquery.eof then
            begin

              adoquery.append;
              adoquery.fieldbyname('ORD_TIPOOP').asstring := 'P';
              if query.fieldbyname('operazione').asstring <> 'D' then
              begin
                v_log.lines.add('progressivo :' + query.fieldbyname('progressivo').asstring + ' I');

                adoquery.fieldbyname('ORD_OPERAZIONE').asstring := 'I';
              end
              else
              begin
                v_log.lines.add('progressivo :' + query.fieldbyname('progressivo').asstring + ' D');
                adoquery.fieldbyname('ORD_OPERAZIONE').asstring := 'D';
              end;
              adoquery.fieldbyname('ORD_ORDINE').asstring := ovt.fieldbyname('progressivo').asstring;
              adoquery.fieldbyname('ORD_DES').asstring := ovt.fieldbyname('data_documento').asstring + ' ' + ovt.fieldbyname('numero_documento').asstring + '/' + ovt.fieldbyname('serie_documento').asstring;
              adoquery.fieldbyname('ORD_CLIENTE').asstring := ovt.fieldbyname('nom_descrizione1').asstring;
              adoquery.post;

              nr_record := nr_record + 1;
              ultimo_id := query.fieldbyname('id_origine').asinteger;
              aggiorna_modula_log(query.fieldbyname('id').asinteger);
            end;
          end;
        end;

        query.next;
      end;

      adoquery.close;
      adoquery.sql.add('DELETE FROM IMP_ORDINI ');
      adoquery.sql.add('WHERE ');
      adoquery.sql.add('NOT EXISTS ( SELECT RIG_ORDINE FROM IMP_ORDINI_RIGHE R WHERE R.RIG_ORDINE=IMP_ORDINI.ORD_ORDINE ) ');
      adoquery.execsql;

      v_log.lines.add('aggiornati ordini ven operazione ' + tipo_operazione + ' [' + formatfloat('#,###0', nr_record) + ']');

      modula.edit;
      modula.fieldbyname('data_ultimo_aggiornamento').asdatetime := now;
      modula.fieldbyname('ultimo_id').asinteger := ultimo_id;
      modula.post;

      commit_transazione;

    except
      on e: exception do
      begin
        rollback_transazione(e.message);
      end;
    end;
  finally
    v_log.lines.savetofile('..\modula_log.txt');
    chiudi_transazione;
    query.close;
    ovt.close;
    ovr.close;
    bar.close;

    freeandnil(ovt);
    freeandnil(ovr);
    freeandnil(ovt_check);
    freeandnil(bar);
  end;

end;

// da modula
procedure tmenugg.sincronizza_magazzino_modula_go(nome_tabella: string);
var
  nr_record: integer;
  nr_col: integer;
  numero_documento: integer;

begin

  query_ds.dataset := exp_movimenti;

  exp_movimenti.close;
  exp_movimenti.parameters.parambyname('tipo_operazione').value := modula.fieldbyname('causale_scarico').asstring;
  exp_movimenti.parameters.parambyname('ultimo_id').value := ultimo_id;
  exp_movimenti.open;

  while not exp_movimenti.eof do
  begin
    ultimo_id := exp_movimenti.fieldbyname('MOV_ID').asinteger;

    nr_record := nr_record + 1;

    if nr_record > 10 then
    begin
      application.processmessages;
      nr_record := 0;
    end;

    nr_col := ansipos('/', exp_movimenti.fieldbyname('MOV_REQ_NOTE').asstring);

    if nr_col > 0 then
    begin
      ese_codice := '20' + copy(exp_movimenti.fieldbyname('MOV_REQ_NOTE').asstring, nr_col + 1, length(exp_movimenti.fieldbyname('MOV_REQ_NOTE').asstring));

      try
        numero_documento := StrtoInt(trim(copy(exp_movimenti.fieldbyname('MOV_REQ_NOTE').asstring, 1, nr_col - 1)));
      except
        numero_documento := 0;
      end;

    end
    else
    begin
      ese_codice := esercizio;

      try
        numero_documento := exp_movimenti.fieldbyname('MOV_REQ_NOTE').asinteger;
      except
        numero_documento := 0;
      end;

    end;

    ovt.close;
    ovt.parambyname('ese_codice').value := ese_codice;
    ovt.parambyname('numero_documento').value := numero_documento;
    ovt.open;
    if not ovt.eof then
    begin
      tabella.close;
      tabella.parambyname('progressivo').asinteger := ovt.fieldbyname('progressivo').asinteger;
      tabella.parambyname('art_codice').asstring := exp_movimenti.fieldbyname('MOV_ARTICOLO').asstring;
      tabella.open;
      if not tabella.eof then
      begin
        assegna_approntato(exp_movimenti.fieldbyname('MOV_QTA').asfloat, false, false);
      end;
    end;

    exp_movimenti.next;
  end;

  adoquery.close;
  adoquery.sql.clear;
  adoquery.sql.add('delete from EXP_MOVIMENTI');
  adoquery.sql.add('where');
  adoquery.sql.add('MOV_ID<=:ID');
  adoquery.parameters.parambyname('ID').value := ultimo_id;
  adoquery.execsql;

  tabella.close;
  query.close;

end;

function Tmenugg.assegna_approntato(quantita: double;
  gestione:
  boolean;
  controllo_quantita:
  boolean = true): double;
var
  vecchio_quantita: double;
begin
  result := 0;
  if quantita <> 0 then
  begin
    if controllo_quantita and (quantita > tabella.fieldbyname('quantita').asfloat - tabella.fieldbyname('quantita_approntata').asfloat) then
    begin
      quantita := tabella.fieldbyname('quantita').asfloat - tabella.fieldbyname('quantita_approntata').asfloat;
    end;
    result := quantita;

    vecchio_quantita := tabella.fieldbyname('tum_quantita_approntata_base').asfloat;
    if tabella_edit(tabella) then
    begin
      if not gestione then
      begin
        tabella.fieldbyname('quantita_approntata').asfloat := arrotonda
          (tabella.fieldbyname('quantita_approntata').asfloat + quantita, decimali_max_quantita);
        tabella.fieldbyname('numero_colli_approntato').asinteger := tabella.fieldbyname('numero_colli').asinteger;
        tabella.fieldbyname('numero_confezioni_approntato').asinteger := tabella.fieldbyname('numero_confezioni').asinteger;
      end;
      if tabella.fieldbyname('quantita_approntata').asfloat = 0 then
      begin
        tabella.fieldbyname('saldo_acconto_approntato').asstring := '';
        tabella.fieldbyname('evadere_approntato').asstring := '';
        tabella.fieldbyname('numero_colli_approntato').asinteger := 0;
        tabella.fieldbyname('numero_confezioni_approntato').asinteger := 0;
      end
      else
      begin
        if arrotonda(tabella.fieldbyname('quantita_approntata').asfloat, 4) >= quantita then
        begin
          tabella.fieldbyname('saldo_acconto_approntato').asstring := 'saldo';
          tabella.fieldbyname('evadere_approntato').asstring := 'si';
        end
        else
        begin
          tabella.fieldbyname('saldo_acconto_approntato').asstring := 'acconto';
          tabella.fieldbyname('evadere_approntato').asstring := 'no';
        end;
      end;
      tabella.post;
    end;
  end
  else
  begin
    if tabella.fieldbyname('quantita_approntata').asfloat = 0 then
    begin
      if tabella_edit(tabella) then
      begin
        tabella.fieldbyname('saldo_acconto_approntato').asstring := '';
        tabella.fieldbyname('evadere_approntato').asstring := '';
        tabella.fieldbyname('numero_colli_approntato').asinteger := 0;
        tabella.fieldbyname('numero_confezioni_approntato').asinteger := 0;
        tabella.post;
      end;
    end;
  end;
end;

procedure Tmenugg.controlla_giacenze_magazzino_modula_go(nome_tabella: string);
var
  riga: integer;
begin
  v_log.lines.add('cancella modula giacenze');

  query.close;
  query.sql.clear;
  query.sql.add('delete from modula_giacenze');
  query.execsql;

  query_ds.dataset := exp_giacenze;

  v_log.lines.add('seleziona exp giacenze');
  exp_giacenze.close;
  exp_giacenze.sql.clear;
  exp_giacenze.sql.add('select *');
  exp_giacenze.sql.add('FROM EXP_GIACENZE');
  exp_giacenze.sql.add('order by GIA_ARTICOLO');
  exp_giacenze.open;

  v_log.lines.add('articoli modula ' + inttostr(exp_giacenze.recordcount));

  while not exp_giacenze.eof do
  begin
    application.processmessages;

    modula_giacenze.close;
    modula_giacenze.parambyname('art_codice').asstring := exp_giacenze.fieldbyname('GIA_ARTICOLO').asstring;
    modula_giacenze.open;

    if modula_giacenze.eof then
    begin
      modula_giacenze.append;
      modula_giacenze.fieldbyname('art_codice').asstring := exp_giacenze.fieldbyname('GIA_ARTICOLO').asstring;
      modula_giacenze.fieldbyname('giacenza_modula').asfloat := exp_giacenze.fieldbyname('GIA_GIAC').asfloat;
      modula_giacenze.fieldbyname('giacenza_go').asfloat := 0;
      modula_giacenze.post;
    end;

    exp_giacenze.next;
  end;

  exp_giacenze.close;

  query_ds.dataset := mag;

  mag.close;
  mag.sql.clear;
  mag.sql.add('select * from mag');
  mag.sql.add('where');
  mag.sql.add('tma_codice=:tma_codice');
  mag.sql.add('order by art_codice');
  mag.parambyname('tma_codice').asstring := 'SEDE'; // modula.fieldbyname('tma_codice').asstring;
  mag.open;

  while not mag.eof do
  begin
    application.processmessages;

    modula_giacenze.close;
    modula_giacenze.parambyname('art_codice').asstring := mag.fieldbyname('art_codice').asstring;
    modula_giacenze.open;

    if not modula_giacenze.eof then
    begin
      modula_giacenze.edit;
      modula_giacenze.fieldbyname('giacenza_go').asfloat := mag.fieldbyname('esistenza').asfloat;
      modula_giacenze.fieldbyname('delta').asfloat := modula_giacenze.fieldbyname('giacenza_modula').asfloat - modula_giacenze.fieldbyname('giacenza_go').asfloat;
      modula_giacenze.fieldbyname('articolo_go').asstring := 'si';
      modula_giacenze.post;
    end;

    mag.next;
  end;

  mag.close;

  xlswrite.filename := '..\esporta\controllo_giacenze_modula_go.xls';

  xlsWrite.Sheets[0].AsString[0, 0] := 'Codice articolo';
  xlsWrite.Sheets[0].AsString[1, 0] := 'Descrizione articolo';
  xlsWrite.Sheets[0].AsString[2, 0] := 'giacenza modula';
  xlsWrite.Sheets[0].AsString[3, 0] := 'giacenza articolo';
  xlsWrite.Sheets[0].AsString[4, 0] := 'Differenza';
  xlsWrite.Sheets[0].AsString[5, 0] := 'articolo in go';
  riga := 0;

  query_ds.dataset := query;
  query.close;
  query.sql.clear;
  query.sql.add('select g.*, art.descrizione1 art_descrizione1');
  query.sql.add('from modula_giacenze g');
  query.sql.add('inner join art on art.codice = g.art_codice');
  query.sql.add('where g.articolo_go=''si'' ');
  query.sql.add('order by g.art_codice');
  query.open;

  while not query.eof do
  begin
    application.ProcessMessages;

    riga := riga + 1;
    xlsWrite.Sheets[0].AsString[0, riga] := query.fieldbyname('art_codice').asstring;
    xlsWrite.Sheets[0].AsString[1, riga] := query.fieldbyname('art_descrizione1').asstring;
    xlsWrite.Sheets[0].Asinteger[2, riga] := query.fieldbyname('giacenza_modula').asinteger;
    xlsWrite.Sheets[0].Asinteger[3, riga] := query.fieldbyname('giacenza_go').asinteger;
    xlsWrite.Sheets[0].Asinteger[4, riga] := query.fieldbyname('delta').asinteger;
    xlsWrite.Sheets[0].AsString[5, riga] := query.fieldbyname('articolo_go').asstring;
    query.next;
  end;
  query.close;

  xlsWrite.Write;

  // 27.06.2014 aggiunta cancellazione tabella
  exp_giacenze.close;
  exp_giacenze.sql.clear;
  exp_giacenze.sql.add('TRUNCATE TABLE EXP_GIACENZE');
  exp_giacenze.execsql;

end;

procedure tmenugg.aggiorna_modula_log(id: integer);
begin
  modula_log.close;
  modula_log.parambyname('id').asinteger := id;
  modula_log.open;

  modula_log.edit;
  modula_log.fieldbyname('data_ora_aggiornamento').asdatetime := now;
  modula_log.post;
end;

procedure tmenugg.assegna_query;
begin
  query.close;
  query.sql.clear;
  query.sql.add('select ');
  query.sql.add('id, ');
  query.sql.add('nome_tabella, ');
  query.sql.add('id_origine, ');
  query.sql.add('progressivo, ');
  query.sql.add('riga, ');
  query.sql.add('art_codice, ');
  query.sql.add('codice_barre, ');
  query.sql.add('kit, ');
  query.sql.add('ubicazioni, ');
  query.sql.add('modula, ');
  query.sql.add('tavn_codice, ');
  query.sql.add('quantita, ');
  query.sql.add('case when operazione =''U'' then ''A'' else operazione end operazione ');
  query.sql.add('from modula_log ');
  query.sql.add('where');
  query.sql.add('nome_tabella=:nome_tabella');
  query.sql.add('and  operazione=:tipo_operazione ');
  query.sql.add('and ( data_ora_aggiornamento is null ) ');
  query.sql.add('order by progressivo, riga ');

  query_ds.dataset := query;
end;

procedure tmenugg.cancella_modulo_log;
begin
  query.close;
  query.sql.clear;
  query.sql.add('delete from modula_log ');
  query.sql.add('where ');
  query.sql.add('data_ora_creazione <= date_sub(current_date, interval :giorni day) ');
  query.sql.add('limit 1000 ');
  query.parambyname('giorni').asinteger := modula.fieldbyname('giorni_log_storico').asinteger;
  query.execsql;
end;

procedure tmenugg.salva_log;
begin
  v_log.lines.SaveToFile(cartella_modula + '\' + formatdatetime('yyyy_mm_dd_hh_nn_ss', now) + '_modula_log.txt');
end;

procedure tmenugg.bottoni_setup(abilita: boolean);
begin
  v_parametri.enabled := abilita;
  v_sincronizza.enabled := abilita;

  v_articoli.checked := abilita;
  v_ordini_vendita.checked := abilita;
end;

procedure tmenugg.gestione_programmi_preferiti;
begin

end;

initialization

registerclass(tmenugg);

end.
