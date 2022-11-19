N = gets.to_i

list = []
require 'prime'
counts = {}
result = 0
1.upto(N) do |n|
  list = Prime.prime_division(n)
  cur = 1
  list.each do |x,y|
    next if y.even?
    cur *= x
  end
  counts[cur] ||= 0
  result += 1 + (2 * counts[cur])
  counts[cur] += 1
end

puts result