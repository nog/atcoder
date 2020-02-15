H, N = gets.split.map(&:to_i)
pair = Array.new(N)

max = 0
N.times do |i|
  x = gets.split.map(&:to_i)
  pair[i] = [*x, x[0].to_f / x[1]]
  if x[0] > max
    max = x[0]
  end
end
pair = pair.sort_by{|x| x[3]}
dp = Array.new(H+1)
dp[0] = 0
1.upto(H) do |i|
  # if i > 2 * max
  #   dp[i] = dp[i-pair[0][0]] + pair[0][1]
  #   next
  # end
  dp[i] = (i.to_f/pair[0][0]).ceil * pair[0][1]
  pair.each do |pa|
    if i <= pa[0]
      if dp[i] > pa[1]
        dp[i] = pa[1]
      end
    else
      b = dp[i-pa[0]] + pa[1]
      if b < dp[i]
        dp[i] = b
      end
    end
  end
end
puts dp[H]