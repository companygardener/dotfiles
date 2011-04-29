# numerical.awk

NR == 1 {
  for (i = 1; i <= NF; i++) {
    min[i] =  1000000
    max[i] = -1000000
    }
  }

!/^$/ {
  if (max_fields < NF) { max_fields = NF }
  for (i = 1; i <= NF; i++) {
    delta[i]  = $i - mean[i]
    mean[i]  += delta[i] / NR
    mean2[i] += delta[i] * ($i - mean[i])
    sum[i]   += $i
    count[i]++

    if ($i < min[i]) { min[i] = $i }
    if ($i > max[i]) { max[i] = $i }
    }
  }

END {
  printf("\n%8s | %17s | %17s | %17s | %17s | %17s \n", "field", "sum", "avg", "std", "min", "max")
  printf("---------+-------------------+-------------------+-------------------+-------------------+------------------\n")
  for (i = 1; i <= max_fields; i++) {
    printf("%8s | % 17.2f | % 17.2f | % 17.2f | % 17.2f | % 17.2f\n", sprintf("$%s", i), sum[i], mean[i], sqrt(mean2[i] / NR), min[i], max[i])
    }

  print "\n(Analyzed", count[1], "records)"
  }
