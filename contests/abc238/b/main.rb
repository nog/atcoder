N = gets.to_i
A = gets.split.map(&:to_i)

cur = 0

hash = {
  0 => true
}

A.each do |a|
  cur = (cur + a ) % 360
  hash[cur] ||= true
end
hash.delete(0)
hash[360] = true
list = hash.keys.sort

cur = 0
result = 0
list.each do |a|
  r = a - cur
  result = r if r > result
  cur = a
end

puts result