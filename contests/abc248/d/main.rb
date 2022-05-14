N = gets.to_i
A = gets.split.map(&:to_i)
Q = gets.to_i

counts = Array.new(200001){ Array.new }
A.each.with_index do |a, i|
  counts[a].push(i)
end

queries = Array.new Q
results = Array.new Q
Q.times do |i|
  l, r, x = gets.split.map(&:to_i)
  l -= 1
  r -= 1
  cnts = counts[x]
  li = cnts.bsearch_index do |x|
    x >= l
  end
  li ||= cnts.size
  ri = cnts.bsearch_index do |x|
    x > r
  end
  ri ||= cnts.size
  puts ri - li
end