N = gets.to_i

res = [0, 21.0]

2.upto(N) do |i|
  b = res[i-1].to_f / 6
  sum = 0.0
  1.upto(6) do |j|
    if b < j
      sum += j
    elsif
      sum += b
    end
  end
  res.push(sum)
end

puts res[-1] / 6