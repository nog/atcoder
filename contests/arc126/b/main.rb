N, M = gets.split.map(&:to_i)
AB = Array.new(M)
M.times do |i|
  AB[i] = gets.split.map(&:to_i)
end
AB.sort_by!{|ab| ab[0] * 10**6 + ab[1] }

dp = []
dp[0] = [0, 0]

AB.each do |a,b|
  x = dp.size
  while((x -= 1) && x >= 0) do
    _a, _b = dp[x]
    next if a == _a
    next if b <= _b

    na, nb = (dp[x+1] || [10**6, 10**6])
    if b < nb
      dp[x+1] = [a,b]
      break
    end
  end
end

puts dp.size - 1