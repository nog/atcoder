N = gets.to_i 
S = gets.chomp.split('')
MOD = 998244353

list = ["A", "B","C","D","E","F","G","H","I","J"]

dp = Array.new N+1
dp[0] = {}
dp[0]["X"] = 1

N.times do |i|
  s = S[i]
  d = dp[i]
  nd = d.dup
  d.keys.each do |k|
    if k[-1] == s
      if nd[s]
        nd[s] += 1
      else
        nd[s] = 1
      end
    elsif !k.include?(s)
      nd[k+s] = d[k]
    end
  end
  dp[i+1] = nd
end
warn dp.inspect
puts dp[N].values.sum