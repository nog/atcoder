N = gets.to_i
TKA = Array.new N+1
N.times do |i|
  TKA[i+1] = gets.split.map(&:to_i)
end

result = 0
needs = Array.new N+1, false

queue = [N]
while(q = queue.shift) do
  t, k, *a = TKA[q]
  result += t
  a.each do |_a|
    next if needs[_a]
    needs[_a] = true
    queue.push(_a)
  end
end

puts result