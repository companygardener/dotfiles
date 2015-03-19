(
  SELECT usename
       , to_char(NOW() - xact_start,  'FMDD:HH24:MI:SS') AS xtime
       , to_char(NOW() - query_start, 'FMDD:HH24:MI:SS') AS qtime
       , query
       , pid
       , datname
       , application_name AS appname
       , client_addr      AS ip
       , client_hostname  AS hostname
       , client_port      AS port
       , state
       , (SELECT COUNT(*) FROM pg_locks WHERE pid = a.pid)                     AS locks
       , (SELECT COUNT(*) FROM pg_locks WHERE pid = a.pid AND granted = FALSE) AS waits
    
  FROM pg_stat_activity a
 WHERE query <> '<IDLE>'
 ORDER BY qtime DESC, xtime DESC
)
