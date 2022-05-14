N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

list = A.map.with_index do |a, i|
  [a,-i]
end

list.sort!
l = nil

results = []
list.each do |a,_i|
  i = - _i
  if i < K
    if !l || l < i
      l = i
    end
  else
    results.push(i-l) if l
  end
end

if results.size > 0
  puts results.min
else
  puts -1
end