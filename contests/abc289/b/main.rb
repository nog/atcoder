N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

aa = []
while(n = A.shift) do
  c = n
  while(A[0] == c + 1) do
    c = A.shift
  end
  aa.push(n..c)
end

result = (1..N).to_a

aa.each do |r|
  result[(r.first-1)..(r.last)] =((r.first)..(r.last+1)).to_a.reverse
end

puts result.join(' ')