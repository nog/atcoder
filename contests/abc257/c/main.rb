N = gets.to_i
S = gets.chomp
W = gets.split.map(&:to_i)

whash = {}
N.times do |i|
  w = W[i]
  s = S[i]
  whash[w] ||= {}
  whash[w][s] ||= 0
  whash[w][s] += 1
end

result = S.count('1')
r = result
whash.keys.sort.each do |w|
  h = whash[w]
  adults = h["1"] || 0
  childs = h["0"] || 0
  r = r + childs - adults
  # warn "w:#{w} r:#{r}"
  result = r if r > result
end

# warn whash.inspect

puts result