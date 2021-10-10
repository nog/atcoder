N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort
B = gets.split.map(&:to_i).sort

left_a = - 10**11
right_a = A.shift
A.push(10**11)
result = 10**11

B.each do |b|
  while b > right_a
    left_a = right_a
    right_a = A.shift
  end
  d1 = b - left_a
  d2 = right_a - b
  result = [result, d1, d2].min
end

puts result

