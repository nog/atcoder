T = gets.to_i
MOD = 998244353
T.times do
  n = gets.to_i
  s = gets.chomp.split('')
  list = s.map{|x| x.ord - 65 }
  h = n / 2
  result = 0
  x = n.odd? ? 1 : 0
  h.times do |st|
    result = result + (list[st] * 26.pow(h-1-st+x, MOD)) % MOD
  end
  if n.odd?
    result = result + list[h] % MOD
  end
  y = true 
  h.times{|i|
    l = list[h-1-i] 
    r = list[h+x+i]
    if l < r
      break
    elsif l > r
      y = false
      break
    end
  } 
  result += 1 if y
  puts result % MOD
end