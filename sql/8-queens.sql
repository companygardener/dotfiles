WITH RECURSIVE

  positions(i) AS (
    VALUES(0)
    UNION SELECT ALL
    i + 1 FROM positions WHERE i < 63
    ),

  solutions(board, queens) AS (
    SELECT '----------------------------------------------------------------', cast(0 AS bigint)
      FROM positions

    UNION

    SELECT
      substr(board, 1, i) || '*' || substr(board, i + 2), queens + 1 AS queens

      FROM positions AS ps,
           solutions

    WHERE queens < 8
      AND substr(board, 1, i) != '*'
      AND NOT EXISTS (
        SELECT 1 FROM positions WHERE
          substr(board, i + 1, 1) = '*' AND
            (
                i % 8 = ps.i % 8
                OR cast(i / 8 AS INT) = cast(ps.i / 8 AS INT)
                OR cast(i / 8 AS INT) + (i % 8) = cast(ps.i / 8 AS INT) + (ps.i % 8)
                OR cast(i / 8 AS INT) - (i % 8) = cast(ps.i / 8 AS INT) - (ps.i % 8)
            )
        LIMIT 1
        )
  )


SELECT board, queens FROM solutions WHERE queens = 8;
