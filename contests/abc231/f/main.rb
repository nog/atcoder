N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)
hash = {}
N.times do |i|
  a, b = A[i], B[i]
  hash[a] ||= {}
  hash[a][b] ||= 0
  hash[a][b] += 1
end

result = 0

blist = []
hash.keys.sort!.reverse.each do |a|
  hash_a = hash[a]
  hash_a.keys.sort!.each do |b|
    cnt = hash_a[b]
    x = blist.bsearch_index{|_b| _b <= b } || blist.size
    blist.insert(x, *([b] * cnt))
    result += (blist.size - x ) * cnt
  end
end

puts result