H, W = gets.split.map(&:to_i)
R, C = gets.split.map(&:to_i)

result = 4
if R == 1
  result -= 1
end
if C == 1
  result -= 1
end
if R == H
  result -= 1
end
if C == W
  result -= 1
end
puts result