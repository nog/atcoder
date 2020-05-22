n = gets.to_i
a = gets.split.map(&:to_i)

sums = []
result = 0
list = (0..(n-1)).to_a

sorted_a = a.sort
# sorted_list = list.sort_by do |i|
#   a[i]
# end

minsum = sorted_a[0] + sorted_a[1]

(n-1).downto(0) do |i|
  if a[i] >= n
    list.delete_at(i)
  end
end

# list.combination(2) do |b,c|
#   diff = (b-c).abs
#   if diff == (a[b] + a[c])
#     result += 1
#   end
# end

# while m = sorted_list.shift do
#   sorted_list.each do |t|
#     diff = t - m
#     sum = a[m] + a[t]
#     if sum == diff
#       result += 1
#     end
#     if sum >= n
#       break
#     end
#   end
# end

while m = list.shift do
  list.reverse.each do |t|
    diff = t - m
    sum = a[m] + a[t]
    if sum == diff
      result += 1
    end
    if diff <= minsum
      break
    end
  end
end

puts result 