N = gets.to_i
T = gets.split.map(&:to_i)

r = -1

T.each do |t|
  r += 1
  t.times do |i|
    if r[i] == 1
      r += 2.pow(i)
    end
  end
  if r[t] == 0
    r += 2.pow(t)
  end
end

puts r