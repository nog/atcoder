n, m, q = gets.split.map(&:to_i)
abcd = Array.new(q)
q.times do |i|
  abcd[i] = gets.split.map(&:to_i)
end

result = 0
arlist = []
1.upto(n) do |j|
  (1..m).to_a.combination(j) do |bar|
    if j > 1
      (1..(n-1)).to_a.combination(j-1) do |car|
        ar = []
        i = 0
        k = 0
        bx = 0
        car.each_with_index do |x, index|
          ar += [bar[index]]*(x-bx)
          bx = x
        end
        ar += [bar.last] * (n - ar.size)
        arlist.push ar
      end
    else
      arlist.push [bar[0]]*n
    end
  end
end

arlist.each do |ar|
  point = 0
  abcd.each do |rule|
    if (ar[rule[1]-1] - ar[rule[0]-1]) == rule[2]
      point += rule[3]
    end
  end
  if point > result
    result = point
  end
end

puts result