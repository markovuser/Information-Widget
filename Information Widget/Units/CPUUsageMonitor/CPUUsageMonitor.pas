unit CPUUsageMonitor;

interface

uses
  Windows, SysUtils;

type
  TCPUUsageMonitor = class
  private
    FLastIdleTime: Int64;
    FLastKernelTime: Int64;
    FLastUserTime: Int64;
    FInitialized: Boolean;
    function GetFileTimeInt64(const FileTime: TFileTime): Int64;
  public
    constructor Create;
    function GetCPUUsage: Double;
  end;

implementation

constructor TCPUUsageMonitor.Create;
begin
  inherited;
  FInitialized := False;
  FLastIdleTime := 0;
  FLastKernelTime := 0;
  FLastUserTime := 0;
end;

function TCPUUsageMonitor.GetFileTimeInt64(const FileTime: TFileTime): Int64;
begin
  Result := (Int64(FileTime.dwHighDateTime) shl 32) + FileTime.dwLowDateTime;
end;

function TCPUUsageMonitor.GetCPUUsage: Double;
var
  IdleTime, KernelTime, UserTime: TFileTime;
  Idle, Kernel, User: Int64;
  TotalIdle, TotalKernel, TotalUser: Int64;
begin
  Result := 0.0;

  if not GetSystemTimes(IdleTime, KernelTime, UserTime) then
    Exit;

  // Конвертируем FILETIME в Int64
  Idle := GetFileTimeInt64(IdleTime);
  Kernel := GetFileTimeInt64(KernelTime);
  User := GetFileTimeInt64(UserTime);

  if FInitialized then
  begin
    // Вычисляем разницу с предыдущим замером
    TotalIdle := Idle - FLastIdleTime;
    TotalKernel := Kernel - FLastKernelTime;
    TotalUser := User - FLastUserTime;

    // Рассчитываем загрузку процессора
    if (TotalKernel + TotalUser) > 0 then
      Result := ((TotalKernel + TotalUser - TotalIdle) /
        (TotalKernel + TotalUser)) * 100;
  end;

  // Сохраняем текущие значения для следующего вызова
  FLastIdleTime := Idle;
  FLastKernelTime := Kernel;
  FLastUserTime := User;
  FInitialized := True;
end;

end.
