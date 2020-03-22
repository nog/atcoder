N = gets.to_i
dp = []
dp[0] = [['a']]
(N - 1).times do |i|
  arr = []
  dp[i].each do |a|
    (a.uniq.size + 1).times do |i|
      arr.push(a + [('a'.ord + i).chr])
    end
  end
  dp[i+1] = arr
end

dp[N-1].each do |arr|
  puts arr.join('')
end