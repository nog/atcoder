n, k = gets.chomp.split(' ').map(&:to_i)
list = gets.chomp.split(' ').map(&:to_i)
sum = 0
sum_list = list.map do |x|
  sum += x
end

result = 0
# (n - k +1).times do |i|
#   result += sum_list[i+k -1] - (i == 0 ? 0 : sum_list[i-1])
# end
k.times do |i|
  result += sum_list[-i-1] - ( i == 0 ? 0 : sum_list[i-1])
end
puts result