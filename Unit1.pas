unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TForm1 = class(TForm)
    ZConnection1: TZConnection;
    ZQuery1: TZQuery;
    ds1: TDataSource;
    dbgrd1: TDBGrid;
    lbl1: TLabel;
    lbl2: TLabel;
    edt1: TEdit;
    edt2: TEdit;
    lbl3: TLabel;
    lbl4: TLabel;
    edt3: TEdit;
    edt4: TEdit;
    lbl5: TLabel;
    edt5: TEdit;
    btn1: TButton;
    btn2: TButton;
    btn3: TButton;
    btn4: TButton;
    btn5: TButton;
    btn6: TButton;
    procedure btn2Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bersih;
    procedure dbgrd1CellClick(Column: TColumn); //CTRL + SHIFT + C
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  id: string;

implementation

{$R *.dfm}

procedure TForm1.btn2Click(Sender: TObject);
begin
if edt1.Text = '' then    // VALIDASI INPUTAN KOSONG
begin
 edt1.SetFocus;
 ShowMessage('Nama Kustomer wajib Diisi!');
end else
if edt2.Text ='' then
begin
   edt2.SetFocus;
 ShowMessage('Nama No Telepon wajib Diisi!');
end else
//if ZQuery1.Locate('nmkustomer',1) = edt1.text then //validasi inputan kemiripan
//begin
// ShowMessage('Nama yang diinputkan sudah digunakan');
//end else
begin
ZQuery1.SQL.Clear;   //kode simpan
ZQuery1.SQL.Add('insert into kustomer values(null,"'+edt1.Text+'","'+edt2.Text+'","'+edt3.Text+'","'+edt4.Text+'","'+edt5.Text+'")');
ZQuery1.ExecSQL ;

ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from kustomer');
ZQuery1.Open; 
bersih;
end;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
bersih;
end;

procedure TForm1.btn4Click(Sender: TObject);
begin
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add(' delete from kustomer where idkustomer= "'+id+'"');
ZQuery1. ExecSQL;
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from kustomer');
ZQuery1.Open;

end;

procedure TForm1.btn3Click(Sender: TObject);
begin
ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('Update kustomer set nmkustomer= "'+edt1.Text+'" where idkustomer="'+id+'"');
ZQuery1. ExecSQL;

ZQuery1.SQL.Clear;
ZQuery1.SQL.Add('select * from kustomer');
ZQuery1.Open;
ShowMessage('Data Berhasil Di Edit');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
bersih;
end;

procedure TForm1.bersih;
begin
edt1.Clear;
edt2.Clear;
edt3.Clear;
edt4.Clear;
edt5.Clear;
end;

procedure TForm1.dbgrd1CellClick(Column: TColumn);
begin
 id:= ZQuery1.Fields[0].AsString;
edt1.Text := ZQuery1.Fields[1].AsString;
edt2.Text := ZQuery1.Fields[2].AsString;
edt3.Text := ZQuery1.Fields[3].AsString;
edt4.Text := ZQuery1.Fields[4].AsString;
edt5.Text := ZQuery1.Fields[5].AsString;
end;

end.
