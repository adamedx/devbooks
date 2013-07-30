net use \\winbuilds\release\Longhorn_RTM\6001.18000.080118-1840\x86fre\symbols.pri\traceformat
del /q *
copy ..\tracelog.exe .
call ..\startntlmtrace.cmd
call ..\startkerbtrace.cmd
call ..\startkdctrace.cmd
