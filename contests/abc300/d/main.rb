N = gets.to_i

require 'prime'
list = []
Prime.each(N**0.5) do |pri|
  list.push(pri)
end

lsize = list.size
res = 0
0.upto(lsize-3) do |i|
  a = list[i]
  (i+1).upto(lsize-2) do |j|
    b = list[j]
    x = (a**2) * b
    break if x * (b**2) > N
    (j+1).upto(lsize-1) do |k|
      c = list[k]
      xx = x * (c**2)
      if xx <= N
        res += 1
      else
        break
      end
    end
  end
end

puts rets