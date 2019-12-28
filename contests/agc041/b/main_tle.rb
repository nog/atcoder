n, m, v, P = gets.chomp.split(' ').map(&:to_i)
a = gets.chomp.split(' ').map(&:to_i)
sorted = a.sort
line = sorted[-P] - m
if v-P <= 0
  puts a.find_all{|point| point >= line}.count
  exit
end

(P-1).times do |i|
  sorted[-1-i] += m
end

counts = {}
sorted.each do |x|
  counts[x] ||= 0
  counts[x]+= 1
end
nokori = m * (v - P + 1)
latest = 1
1.upto(a[-1]).each do |x|
  next unless counts[x]
  latest = x
  break if counts[x] >nokori
  nokori -= counts[x]
  counts[x+1] ||= 0
  counts[x+1] += counts[x]
  counts.delete(x)
end
p nokori
p counts
p latest
line = latest - m
# m.times do
#   (v -P+1).times do |i|
#     sorted[i] += 1
#   end
#   sorted.sort!
# end


# line =sorted.sort[-P] - m + (m * (v - P + 1)/ n - P).to_i
puts a.find_all{|point| point >= line}.count