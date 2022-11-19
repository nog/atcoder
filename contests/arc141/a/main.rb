T = gets.to_i

@splits = {
  19 => [1],
  18 => [9,6,3,2,1],
  17 => [1],
  16 => [8,4,2,1],
  15 => [5,3,1],
  14 => [7,2,1],
  13 => [1],
  12 => [6,4,3,2,1],
  11 => [1],
  10 => [5,2,1],
  9 => [3,1],
  8 => [4,2,1],
  7 => [1],
  6 => [3,2,1],
  5 => [1],
  4 => [2,1],
  3 => [1],
  2 => [1]
}

def solve(n)
  len = n.to_s.length
  str = n.to_s
  results = []
  @splits[len].each do |s|
    x = str[0..(s-1)].to_i
    # warn "n:#{n} s:#{s} x:#{x}"
    res = (x.to_s * (len/s)).to_i
    if res > n
      res = ((x-1).to_s * (len/s)).to_i
      # warn "XXX x:#{x}"
    end
    results.push(res)
  end
  results.push ("9" * (len - 1)).to_i if len > 2
  return results.max
end

T.times do
  puts solve(gets.to_i)
end