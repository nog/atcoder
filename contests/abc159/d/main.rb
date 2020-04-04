N = gets.to_i
A = gets.split.map(&:to_i)

hash = {}
A.each do |a|
  hash[a] ||= 0
  hash[a]+= 1
end

all = 0
hash.values.each do |v|
  if v >= 2
    all += v * (v - 1) / 2
  end
end
# puts all
# require 'pp'
# pp hash
# puts "--"
A.each do |a|
  ac = hash[a]
  if ac < 2
    puts all
    next
  end
  puts all - ac + 1
end