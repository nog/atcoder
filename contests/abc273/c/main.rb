N = gets.to_i
A = gets.split.map(&:to_i)

acnts = {}
A.each do |a|
  acnts[a] ||= 0
  acnts[a] += 1
end

uniqa = acnts.keys.sort

N.times do |k|
  a = uniqa[-k-1]
  puts acnts[a] || 0
end