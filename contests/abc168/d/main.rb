n, m = gets.split.map(&:to_i)
a = Array.new m
b = Array.new m 
hash = {}
m.times do |i|
  _a, _b = gets.split.map(&:to_i)
  a[i] = _a 
  b[i] = _b
  hash[_a] ||= []
  hash[_a].push(_b)
  hash[_b] ||= []
  hash[_b].push(_a)
end

queue = [1]

result = {1 => 0}
while q = queue.shift do
  hash[q].each do |x|
    unless result[x]
      result[x] = q
      queue.push x
    end
  end
end

if result.size  == n
  puts "Yes"
  2.upto(n) do |i|
    puts result[i]
  end
else
  puts "No"
end