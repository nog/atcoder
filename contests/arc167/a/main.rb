N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort

dlist = []
M.times do |i|
    dlist.push(A.pop)
end

result = 0

while(A.size > 0) do
    a = A.pop
    b = dlist.pop
    result += (a+b) ** 2
end

dlist.each do |b|
    result += b**2
end

puts result