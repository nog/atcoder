N = gets.to_i

list = []
N.times do
  x, y = gets.split.map(&:to_i)
  a = Rational(y-1,x)
  b = (x == 1) ? Float::INFINITY : Rational(y, x-1)
  # a = (y-1).to_f / x
  # b = (x == 1) ? Float::INFINITY : y.to_f / (x-1)
  list.push([a,b])
end

list.sort!

dp = Array.new N + 1
dp[0] = { 0 => 0 }

N.times do |i|
  bd = dp[i]
  d = bd.dup
  from, to = list[i]

  bd.keys.each do |i|
    uma = bd[i]
    if uma <= from
      cur = d[i+1]
      unless cur && cur < to
        d[i+1] = to
      end
    end
  end

  keys = d.keys
  if keys.size > 5
    keys.sort!
    d.delete(keys[0])
  end

  dp[i+1] = d
end

puts dp[-1].keys.max 