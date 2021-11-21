N = gets.to_i
S = gets.split.map(&:to_i)

a = 1
pat = {}

while true do
  b = 1
  while true do
    res = (4 * a * b) + (3 * a) + (3 * b)
    break if res > 1000
    pat[res] = true
    b += 1
  end
  break if b == 1
  a += 1
end
result = 0
S.each do |s|
  unless pat[s]
    result += 1
  end
end

puts result