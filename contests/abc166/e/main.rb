n = gets.to_i
a = gets.split.map(&:to_i)

# (i - j).abs =  a[i] + a[j]
# i - a[i] = j + a[j]
# or
# - i - a[i] = - j + a[j]
# i + a[i] = j - a[j]


diff = {}
sum = {}
result = 0
n.times do |i|
  d = (i+1) - a[i]
  s = (i+1) + a[i]
  if sum[d]
    result += sum[d]
  end
  diff[d] ||= 0
  diff[d] += 1
  sum[s] ||= 0
  sum[s] += 1

end

puts result