N = gets.to_i
TXA = []
N.times do
  TXA.push(gets.split.map(&:to_i))
end

dp = Array.new(N+1)
# time, position, point
dp[0] = { 
  (0..0) => 0
}

bt = 0
N.times do |i|
  t, x, a = TXA[i]
  dt =  t - bt

  ndp = {}

  pos = (x..x)

  dp[i].each do |k, v|
    min = k.min - dt
    min = 0 if min < 0
    max = k.max + dt
    max = 5 if max > 5
    nr = (min..max)
    if !ndp[nr] || ndp[nr] < v
      ndp[nr] = v
    end

    if nr.include?(x)
      nv = v + a
      if !ndp[pos] || ndp[pos] < nv
        ndp[pos] = nv
      end
    end
  end
  dp[i+1] = ndp
  bt = t
end

puts dp[-1].values.max