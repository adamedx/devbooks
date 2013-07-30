del /q *
copy ..\tracelog.exe .
call net start winrm
call ..\startntlmtrace.cmd
call winrm.cmd id -r:localhost
call ..\stopntlmtrace.cmd
call ..\startkerbtrace.cmd
call winrm.cmd id -r:localhost
call ..\stopkerbtrace.cmd
call ..\startkdctrace.cmd
call winrm.cmd id -r:localhost
call ..\stopkdctrace.cmd
call ..\tracefmt.exe -p \\winbuilds\release\Longhorn_RTM\6001.18000.080118-1840\x86fre\symbols.pri\traceformat -display ntlm.etl
call ..\tracefmt.exe -p \\winbuilds\release\Longhorn_RTM\6001.18000.080118-1840\x86fre\symbols.pri\traceformat -display kerb.etl
call ..\tracefmt.exe -p \\winbuilds\release\Longhorn_RTM\6001.18000.080118-1840\x86fre\symbols.pri\traceformat -display kdc.etl