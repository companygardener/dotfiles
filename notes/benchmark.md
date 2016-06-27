```ruby
Benchmark.ips do |x|
  x.config(time: 3, warmup: 1)

  x.report("block") { 1 + 1 }
  x.report("block-inline") { |n| n.times { 1 + 1 } }

  x.report("block-multiline") do |n|
    n.times do
      1 + 1
    end
  end

  x.report("block-while") do |times|
    i = 0
    while i < times
      1 + 1
      i += 1
    end
  end

  x.report("inline", "1 + 1")
  x.compare!
end
```
