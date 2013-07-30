call ..\stopntlmtrace.cmd
call ..\stopkerbtrace.cmd
call ..\stopkdctrace.cmd
call ..\tracefmt.exe -p %_TRACE_PATH% -display ntlm.etl -o ntlm.txt
call ..\tracefmt.exe -p %_TRACE_PATH% -display kerb.etl -o kerb.txt
call ..\tracefmt.exe -p %_TRACE_PATH% -display kdc.etl -o kdc.txt
