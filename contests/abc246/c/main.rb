N, K, X = gets.split.map(&:to_i)
A = gets.split.map(&:to_i).sort.reverse

result = 0
k = K
list = []
A.each do |a|
  c = a / X
  if c == 0 || k == 0
    list.push(a)
  else
    if c > k
      c = k
    end
    a -= c * X
    list.push(a) if a > 0
    k -= c
  end
end

list.sort!.reverse!
while(k > 0 && list.size > 0) do
  list.shift
  k -= 1
end

puts list.sum