unit Unit1;

interface

uses
	Winapi.Windows,
	Winapi.Messages,
	System.SysUtils,
	System.Variants,
	System.Classes,
	Vcl.Graphics,
	Vcl.Controls,
	Vcl.Forms,
	Vcl.Dialogs,
	System.Threading,
	Vcl.StdCtrls,
	Vcl.ExtCtrls;

type
	TForm1 = class(TForm)
		Button_Um : TButton;
		Button_Dois : TButton;
		Edit_1 : TEdit;
		Edit_2 : TEdit;
		Button_Menos : TButton;
		Button_Mais : TButton;
		Edit_Resultado : TEdit;
		Label1 : TLabel;
		Timer1 : TTimer;
		procedure Button_UmClick(Sender : TObject);
		procedure Button_DoisClick(Sender : TObject);
		procedure Button_MenosClick(Sender : TObject);
		procedure Button_MaisClick(Sender : TObject);
		procedure Timer1Timer(Sender : TObject);
    procedure FormShow(Sender: TObject);
		private
			arIfuture : array [0 .. 2] of IFuture<String>;
		public
			{ Public declarations }
	end;

var
	Form1 : TForm1;

implementation

{$R *.dfm}


procedure TForm1.Button_MaisClick(Sender : TObject);
begin
	TTask.Run(
			procedure
		begin
			TThread.Synchronize(TThread.CurrentThread,
					procedure
				begin
					arIfuture[1] := TTask.Future<String>(
							function : String
						begin
							Sleep(10000);
							Result := Button_Mais.Caption;
						end);
				end);
		end);
end;

procedure TForm1.Button_MenosClick(Sender : TObject);
begin
	TTask.Run(
		procedure
		begin
			TThread.Synchronize(TThread.CurrentThread,
					procedure
				begin
					arIfuture[1] := TTask.Future<String>(
							function : String
						begin
							Sleep(10000);
							Result := Button_Menos.Caption;
						end);
				end);
		end);
end;

procedure TForm1.Button_UmClick(Sender : TObject);
begin
	TTask.Run(
		procedure
		begin
			TThread.Synchronize(TThread.CurrentThread,
					procedure
				begin
					arIfuture[0] := TTask.Future<String>(
							function : String
						begin
							Sleep(8000);
							Result := Button_Um.Caption;
						end);
				end);
		end);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
	Timer1.Enabled := True;
end;

procedure TForm1.Timer1Timer(Sender : TObject);
begin
	Timer1.Enabled := False;
	{ TODO : Tarefa da posição 0 do array }
	TTask.Run(
		procedure
		begin
			repeat
				Sleep(1000);
				TThread.Synchronize(TThread.CurrentThread,
						procedure
					begin
						if Assigned(arIfuture[0]) then
							if (arIfuture[0].Status = TTaskStatus.Completed) then
							begin
								Edit_1.Text := arIfuture[0].Value;
							end;
					end);
			until (Edit_1.Text <> EmptyStr);
		end);

	{ TODO : Tarefa da posição 2 do array }
	TTask.Run(
		procedure
		begin
			repeat
				Sleep(3000);
				TThread.Synchronize(TThread.CurrentThread,
						procedure
					begin
						if Assigned(arIfuture[2]) then
							if (arIfuture[2].Status = TTaskStatus.Completed) then
							begin
								Edit_2.Text := arIfuture[2].Value;
							end;
					end);
			until (Edit_2.Text <> EmptyStr);
		end);

	{ TODO : Tarefa da posição 1 do array = RESULTADO }
	TTask.Run(
		procedure
		begin
			repeat
				Sleep(3000);
				TThread.Synchronize(TThread.CurrentThread,
						procedure
					begin
						if Assigned(arIfuture[0]) and Assigned(arIfuture[1]) and Assigned(arIfuture[2]) then
							if (arIfuture[0].Status = TTaskStatus.Completed) and
								(arIfuture[1].Status = TTaskStatus.Completed) and
								(arIfuture[2].Status = TTaskStatus.Completed) then
							begin
								var
									val : Double;
								if arIfuture[1].Value = '-' then
									val := arIfuture[0].Value.ToDouble - arIfuture[2].Value.ToDouble
								else
									if arIfuture[1].Value = '+' then
									val := arIfuture[0].Value.ToDouble + arIfuture[2].Value.ToDouble;

								Edit_Resultado.Text := val.ToString;
							end;
					end);
			until (Edit_Resultado.Text <> EmptyStr);
		end);

end;

procedure TForm1.Button_DoisClick(Sender : TObject);
begin
	TTask.Run(
		procedure
		begin
			TThread.Synchronize(TThread.CurrentThread,
					procedure
				begin
					arIfuture[2] := TTask.Future<String>(
							function : String
						begin
							Sleep(7000);
							Result := Button_Dois.Caption;
						end);
				end);
		end);
end;

end.
