N, L, W = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

result = 0
current = 0

A.push(L)

A.each do |a|
  if a > current
    d = a - current
    if d > 0
      c = d / W
      c += 1 if (d % W) > 0
      result += c
    end
  end
  current = a + W
end

puts result