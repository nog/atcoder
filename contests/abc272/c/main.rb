N = gets.to_i
A = gets.split.map(&:to_i).sort.reverse
results = []
while(a = A.shift) do
  A.each do |b|
    if (a + b).even?
      results.push(a+b)
      break
    end
  end
  if results.size > 1
    puts results.max
    exit
  end
end

if results.size == 0
  puts -1
else
  puts results.max
end