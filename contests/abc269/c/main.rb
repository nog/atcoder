N = gets.to_i
cnt = 0
list = []
61.times do |i|
  if N[i] == 1
    cnt += 1
    list.push(i)
  end
end

list.reverse!

results = []
(2**cnt).times do |i|
  r = 0
  cnt.times do |j|
    if i[j] == 1
      r += 2 ** list[j]
    end
  end
  results.push(r)
end

results.sort.each do |r|
  puts r
end