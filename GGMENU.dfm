object MENUGG: TMENUGG
  Left = 12
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'GO - MODULA - SINCRONIZZAZIONE DATI '
  ClientHeight = 645
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesktopCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TRzPanel
    Left = 0
    Top = 0
    Width = 759
    Height = 146
    Align = alTop
    Enabled = False
    TabOrder = 0
    object Label1: TRzLabel
      Left = 5
      Top = 5
      Width = 22
      Height = 13
      Caption = 'ditta'
    end
    object Label2: TRzLabel
      Left = 135
      Top = 5
      Width = 53
      Height = 13
      Caption = 'descrizione'
    end
    object Label7: TRzLabel
      Left = 5
      Top = 50
      Width = 41
      Height = 13
      Caption = 'esercizio'
    end
    object Label8: TRzLabel
      Left = 135
      Top = 50
      Width = 48
      Height = 13
      Caption = 'data inizio'
    end
    object Label9: TRzLabel
      Left = 300
      Top = 50
      Width = 43
      Height = 13
      Caption = 'data fine'
    end
    object Label10: TRzLabel
      Left = 5
      Top = 95
      Width = 32
      Height = 13
      Caption = 'utente'
    end
    object Label11: TRzLabel
      Left = 135
      Top = 95
      Width = 53
      Height = 13
      Caption = 'descrizione'
    end
    object ComboEdit1: trzedit_go
      Left = 5
      Top = 20
      Width = 121
      Height = 21
      TabStop = False
      Text = 'ditta'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ReadOnlyColor = clBtnFace
      ReadOnlyColorOnFocus = True
      TabOrder = 0
    end
    object ComboEdit6: trzedit_go
      Left = 135
      Top = 20
      Width = 611
      Height = 21
      TabStop = False
      Text = 'descrizione ditta'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ReadOnlyColor = clBtnFace
      ReadOnlyColorOnFocus = True
      TabOrder = 1
    end
    object ComboEdit2: trzedit_go
      Left = 5
      Top = 65
      Width = 121
      Height = 21
      TabStop = False
      Text = 'esercizio'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ReadOnlyColor = clBtnFace
      ReadOnlyColorOnFocus = True
      TabOrder = 2
    end
    object ComboEdit4: trzedit_go
      Left = 132
      Top = 68
      Width = 121
      Height = 21
      TabStop = False
      Text = 'data inizio'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ReadOnlyColor = clBtnFace
      ReadOnlyColorOnFocus = True
      TabOrder = 3
    end
    object ComboEdit5: trzedit_go
      Left = 300
      Top = 65
      Width = 121
      Height = 21
      TabStop = False
      Text = 'data fine'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ReadOnlyColor = clBtnFace
      ReadOnlyColorOnFocus = True
      TabOrder = 4
    end
    object ComboEdit3: trzedit_go
      Left = 5
      Top = 111
      Width = 121
      Height = 21
      TabStop = False
      Text = 'utente'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ReadOnlyColor = clBtnFace
      ReadOnlyColorOnFocus = True
      TabOrder = 5
    end
    object ComboEdit7: trzedit_go
      Left = 135
      Top = 111
      Width = 611
      Height = 21
      TabStop = False
      Text = 'descrizione utente'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ReadOnlyColor = clBtnFace
      ReadOnlyColorOnFocus = True
      TabOrder = 6
    end
  end
  object GroupBox1: TGroupBox
    Left = 0
    Top = 146
    Width = 759
    Height = 135
    Align = alTop
    Caption = 'Host Go'
    TabOrder = 1
    object RzLabel1: TRzLabel
      Left = 12
      Top = 16
      Width = 47
      Height = 13
      Caption = 'hostname'
    end
    object RzLabel2: TRzLabel
      Left = 300
      Top = 16
      Width = 50
      Height = 13
      Caption = 'user name'
    end
    object RzLabel3: TRzLabel
      Left = 152
      Top = 16
      Width = 74
      Height = 13
      Caption = 'database name'
    end
    object v_hostname_go: trzedit_go
      Left = 12
      Top = 31
      Width = 121
      Height = 21
      TabStop = False
      Text = 'hostname_go'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ReadOnlyColor = clBtnFace
      ReadOnlyColorOnFocus = True
      TabOrder = 0
    end
    object v_databasename_go: trzedit_go
      Left = 152
      Top = 31
      Width = 121
      Height = 21
      TabStop = False
      Text = 'database_go'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ReadOnlyColor = clBtnFace
      ReadOnlyColorOnFocus = True
      TabOrder = 1
    end
    object v_username_go: trzedit_go
      Left = 300
      Top = 31
      Width = 91
      Height = 21
      TabStop = False
      Text = 'username_go'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      ReadOnlyColor = clBtnFace
      ReadOnlyColorOnFocus = True
      TabOrder = 2
    end
    object v_parametri: TButton
      Left = 640
      Top = 10
      Width = 116
      Height = 31
      Caption = '&Parametri Modula'
      DisabledImageIndex = 0
      Enabled = False
      TabOrder = 3
      OnClick = v_parametriClick
    end
    object v_log: TMemo
      Left = 2
      Top = 75
      Width = 755
      Height = 58
      TabStop = False
      Align = alBottom
      ReadOnly = True
      TabOrder = 4
    end
    object v_sincronizza: TButton
      Left = 640
      Top = 42
      Width = 116
      Height = 31
      Caption = '&Sincronizza dati'
      DisabledImageIndex = 0
      Enabled = False
      TabOrder = 5
      OnClick = v_sincronizzaClick
    end
    object v_articoli: TCheckBox
      Left = 415
      Top = 32
      Width = 66
      Height = 17
      Caption = 'articoli'
      TabOrder = 6
    end
    object v_ordini_vendita: TCheckBox
      Left = 515
      Top = 32
      Width = 97
      Height = 17
      Caption = 'ordini di vendita'
      TabOrder = 7
    end
    object v_tutti_articoli: TCheckBox
      Left = 415
      Top = 49
      Width = 66
      Height = 17
      Caption = 'attivi'
      TabOrder = 8
    end
  end
  object v_griglia: trzdbgrid_go
    Left = 0
    Top = 281
    Width = 759
    Height = 364
    Align = alClient
    DataSource = query_ds
    DrawingStyle = gdsClassic
    options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object tma: TMyQuery_go
    Connection = ARC.arcdit
    SQL.Strings = (
      'select *'
      'from nom'
      'where codice = :codice')
    Options.DefaultValues = True
    Options.TrimVarChar = True
    Left = 680
    Top = 205
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codice'
        Value = nil
      end>
  end
  object Timer1: TTimer
    Enabled = False
    OnTimer = Timer1Timer
    Left = 530
    Top = 225
  end
  object query: TMyQuery_go
    Connection = ARC.arcdit
    SQL.Strings = (
      'select *'
      'from art'
      'order by codice')
    Options.DefaultValues = True
    Options.TrimVarChar = True
    Left = 680
    Top = 310
  end
  object dbModula: TADOConnection
    CommandTimeout = 280
    ConnectionString = 
      'FILE NAME=C:\GestionaleOpen\go_8080\go_808\moduli_aggiuntivi\go_' +
      'modula\exe\MODULA.UDL;'
    LoginPrompt = False
    Provider = 
      'C:\GestionaleOpen\go_8080\go_808\moduli_aggiuntivi\go_modula\exe' +
      '\MODULA.UDL'
    Left = 525
    Top = 260
  end
  object adoquery: TADOQuery
    Connection = dbModula
    Parameters = <
      item
        Name = 'ART_OPERAZIONE'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'ART_ARTICOLO'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ART_DES'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'ART_UMI'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'ART_NOTE'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ART_ERRORE'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1000
        Value = Null
      end>
    SQL.Strings = (
      '')
    Left = 515
    Top = 320
  end
  object exp_movimenti: TADOQuery
    Connection = dbModula
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'tipo_operazione'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = 'SC'
      end
      item
        Name = 'ultimo_id'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = 0
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM EXP_MOVIMENTI'
      'WHERE'
      'MOV_HOSTCAUS=:tipo_operazione and'
      'MOV_ID >:ultimo_id'
      'order by 1')
    Left = 520
    Top = 430
  end
  object query_ds: TDataSource
    Left = 170
    Top = 335
  end
  object tabella: TMyQuery_go
    Connection = ARC.arcdit
    SQL.Strings = (
      'select *'
      'from ovr'
      'where '
      'ovr.progressivo=:progressivo and'
      'ovr.art_codice=:art_codice and'
      'ovr.quantita-ovr.quantita_evasa >0')
    Options.DefaultValues = True
    Options.TrimVarChar = True
    Left = 680
    Top = 425
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'progressivo'
        Value = nil
      end
      item
        DataType = ftUnknown
        Name = 'art_codice'
        Value = nil
      end>
  end
  object ovt: TMyQuery_go
    Connection = ARC.arcdit
    SQL.Strings = (
      'select *'
      'from ovt'
      'where '
      'ese_codice=:ese_codice and'
      'numero_documento=:numero_documento')
    Options.DefaultValues = True
    Options.TrimVarChar = True
    Left = 680
    Top = 365
    ParamData = <
      item
        DataType = ftString
        Name = 'ese_codice'
        Value = ' '
      end
      item
        DataType = ftInteger
        Name = 'numero_documento'
        Value = 0
      end>
  end
  object adocancella: TADOQuery
    Connection = dbModula
    Parameters = <
      item
        Name = 'ART_OPERAZIONE'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'ART_ARTICOLO'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ART_DES'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'ART_UMI'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'ART_SOTTOSCO'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 11
        Size = 19
        Value = Null
      end
      item
        Name = 'ART_PMU'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 4
        Precision = 11
        Size = 19
        Value = Null
      end
      item
        Name = 'ART_AREEABI'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'RT_TIPOGESTART'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'ART_FIFOP'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ART_FIFOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ART_NOTE'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ART_CLAMOV'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ART_GRUPPO'
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'ART_TIPOSTOCK'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'RT_ATTR1'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'ART_ATTR2'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'ART_ATTR3'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'ART_ATTR4'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'ART_ATTR5'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'ART_ATTR6'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'ART_ATTR7'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'RT_ATTR8'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'ART_FAMIGLIA'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 25
        Value = Null
      end
      item
        Name = 'ART_RUOLO'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 15
        Value = Null
      end
      item
        Name = 'ART_CATEGORIA1'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ART_CATEGORIA2'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ART_CATEGORIA3'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ART_CATEGORIA4'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'RT_CATEGORIA5'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ART_VITAUTILE'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ART_SCAD_DPRO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ART_TOLLP'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 11
        Size = 19
        Value = Null
      end
      item
        Name = 'ART_TOLLV'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 11
        Size = 19
        Value = Null
      end
      item
        Name = 'ART_TOLLI'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 11
        Size = 19
        Value = Null
      end
      item
        Name = 'ART_CREASCO_TIPO'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'RT_CREASCO_USAABISCO'
        DataType = ftBoolean
        NumericScale = 255
        Precision = 255
        Size = 2
        Value = Null
      end
      item
        Name = 'ART_CREASCO_DIMX'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ART_CREASCO_DIMY'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ART_CREASCO_DIMZ'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ART_CREASCO_LIM'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 11
        Size = 19
        Value = Null
      end
      item
        Name = 'ART_CREASCO_CAP'
        Attributes = [paSigned]
        DataType = ftBCD
        NumericScale = 3
        Precision = 11
        Size = 19
        Value = Null
      end
      item
        Name = 'ART_MAGAZZINO'
        Attributes = [paSigned]
        DataType = ftInteger
        Precision = 10
        Size = 4
        Value = Null
      end
      item
        Name = 'ART_ERRORE'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1000
        Value = Null
      end>
    SQL.Strings = (
      'insert into IMP_ARTICOLI ('
      'ART_OPERAZIONE,'
      'ART_ARTICOLO,'
      'ART_DES,'
      'ART_UMI,'
      'ART_SOTTOSCO,'
      'ART_PMU,'
      'ART_AREEABI,'
      'ART_TIPOGESTART,'
      'ART_FIFOP,'
      'ART_FIFOV,'
      'ART_NOTE,'
      'ART_CLAMOV,'
      'ART_GRUPPO,'
      'ART_TIPOSTOCK,'
      'ART_ATTR1,'
      'ART_ATTR2,'
      'ART_ATTR3,'
      'ART_ATTR4,'
      'ART_ATTR5,'
      'ART_ATTR6,'
      'ART_ATTR7,'
      'ART_ATTR8,'
      'ART_FAMIGLIA,'
      'ART_RUOLO,'
      'ART_CATEGORIA1,'
      'ART_CATEGORIA2,'
      'ART_CATEGORIA3,'
      'ART_CATEGORIA4,'
      'ART_CATEGORIA5,'
      'ART_VITAUTILE,'
      'ART_SCAD_DPRO,'
      'ART_TOLLP,'
      'ART_TOLLV,'
      'ART_TOLLI,'
      'ART_CREASCO_TIPO,'
      'ART_CREASCO_USAABISCO,'
      'ART_CREASCO_DIMX,'
      'ART_CREASCO_DIMY,'
      'ART_CREASCO_DIMZ,'
      'ART_CREASCO_LIM,'
      'ART_CREASCO_CAP,'
      'ART_MAGAZZINO,'
      'ART_ERRORE)'
      'values('
      ':ART_OPERAZIONE,'
      ':ART_ARTICOLO,'
      ':ART_DES,'
      ':ART_UMI,'
      ':ART_SOTTOSCO,'
      ':ART_PMU,'
      ':ART_AREEABI,'
      ':RT_TIPOGESTART,'
      ':ART_FIFOP,'
      ':ART_FIFOV,'
      ':ART_NOTE,'
      ':ART_CLAMOV,'
      ':ART_GRUPPO,'
      ':ART_TIPOSTOCK,'
      ':RT_ATTR1,'
      ':ART_ATTR2,'
      ':ART_ATTR3,'
      ':ART_ATTR4,'
      ':ART_ATTR5,'
      ':ART_ATTR6,'
      ':ART_ATTR7,'
      ':RT_ATTR8,'
      ':ART_FAMIGLIA,'
      ':ART_RUOLO,'
      ':ART_CATEGORIA1,'
      ':ART_CATEGORIA2,'
      ':ART_CATEGORIA3,'
      ':ART_CATEGORIA4,'
      ':RT_CATEGORIA5,'
      ':ART_VITAUTILE,'
      ':ART_SCAD_DPRO,'
      ':ART_TOLLP,'
      ':ART_TOLLV,'
      ':ART_TOLLI,'
      ':ART_CREASCO_TIPO,'
      ':RT_CREASCO_USAABISCO,'
      ':ART_CREASCO_DIMX,'
      ':ART_CREASCO_DIMY,'
      ':ART_CREASCO_DIMZ,'
      ':ART_CREASCO_LIM,'
      ':ART_CREASCO_CAP,'
      ':ART_MAGAZZINO,'
      ':ART_ERRORE)')
    Left = 440
    Top = 325
  end
  object exp_giacenze: TADOQuery
    Connection = dbModula
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'tipo_operazione'
        Size = -1
        Value = Null
      end
      item
        Name = 'ultimo_id'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SELECT *'
      'FROM EXP_MOVIMENTI'
      'WHERE'
      'MOV_HOSTCAU=:tipo_operazione and'
      'MOV_ID >:ultimo_id'
      'order by 1')
    Left = 520
    Top = 480
  end
  object modula_giacenze: TMyQuery_go
    Connection = ARC.arcdit
    SQL.Strings = (
      'select *'
      'from modula_giacenze'
      'where '
      'art_codice=:art_codice')
    Options.DefaultValues = True
    Options.TrimVarChar = True
    Left = 675
    Top = 480
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'art_codice'
        Value = nil
      end>
  end
  object mag: TMyQuery_go
    Connection = ARC.arcdit
    SQL.Strings = (
      'select *'
      'from ovt'
      'where '
      'ese_codice=:ese_codice and'
      'numero_documento=:numero_documento')
    Options.DefaultValues = True
    Options.TrimVarChar = True
    Left = 685
    Top = 265
    ParamData = <
      item
        DataType = ftString
        Name = 'ese_codice'
        Value = ' '
      end
      item
        DataType = ftInteger
        Name = 'numero_documento'
        Value = 0
      end>
  end
  object modula: TMyQuery_go
    Connection = ARC.arcdit
    SQL.Strings = (
      'select *'
      'from modula'
      'where codice=:codice')
    Debug = True
    Options.DefaultValues = True
    Options.TrimVarChar = True
    Left = 605
    Top = 255
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'codice'
        Value = nil
      end>
  end
  object modula_log: TMyQuery_go
    Connection = ARC.arcdit
    SQL.Strings = (
      'select * from modula_log'
      'where '
      'id=:id')
    Debug = True
    Options.DefaultValues = True
    Options.TrimVarChar = True
    Left = 605
    Top = 330
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'id'
        Value = nil
      end>
  end
  object adoquery_righe: TADOQuery
    Connection = dbModula
    Parameters = <
      item
        Name = 'ART_OPERAZIONE'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1
        Value = Null
      end
      item
        Name = 'ART_ARTICOLO'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ART_DES'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 100
        Value = Null
      end
      item
        Name = 'ART_UMI'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 5
        Value = Null
      end
      item
        Name = 'ART_NOTE'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 50
        Value = Null
      end
      item
        Name = 'ART_ERRORE'
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 1000
        Value = Null
      end>
    SQL.Strings = (
      '')
    Left = 520
    Top = 380
  end
  object exp_ubicazioni: TADOQuery
    Connection = dbModula
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'art_codice'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'select coalesce(count(*),0) nr '
      'from EXP_UBICAZIONI'
      'where '
      'UBI_ARTICOLO=:art_codice')
    Left = 520
    Top = 535
  end
end
