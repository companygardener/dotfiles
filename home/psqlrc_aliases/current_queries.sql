(
  SELECT usename
       , xtime
       , qtime
       , (CASE WHEN LENGTH(query) < 87
               THEN query
               ELSE SUBSTR(query, 0, 87) || '...'
          END) AS query
       , pid
       , datname
       , appname
       , ip
       , hostname
       , port
       , state
       , locks
       , waits

  FROM :full_queries fq
)
