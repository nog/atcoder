N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
MAX = N

results = Array.new(M){ Hash.new }
A.each.with_index do |a, i|
  d = i + 1
  ad = a + d
  s = 0
  if ad < 0
    s = - ( a / d ) - 1
    a += (s * d)
  end
  s.upto(M-1) do |m|
    a += d
    break if a > MAX
    results[m][a] ||= true
  end
end

results.each do |res|
  0.upto(N+1) do |i|
    next if res[i]
    puts i
    break
  end
end