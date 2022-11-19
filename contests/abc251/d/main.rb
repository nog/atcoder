W = gets.to_i

MAX = 10**6
# 1000000
list = []
1.upto(100) do |x|
  list.push(x)
  list.push(x * 100)
  list.push(x * 10000)
end

puts 300
puts list.join(' ')