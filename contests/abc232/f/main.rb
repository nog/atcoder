N, X, Y = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

a = A.dup
result = 0
N.times do |i|
  result += (a[i] - B[i]).abs * X
end

queue = [[a, 0]]

comb = (1..N).to_a.combination(2).to_a

while(ar, cost = queue.shift) do
  comb.each do |i,j|
    a = ar[i-1]
    b = ar[j-1]
    ar[i-1] = b
    ar[j-1] = a

    c = cost + Y
    N.times do |x|
      c += (ar[x] - B[x]).abs * X
    end
    if c <= result
      result = c
      queue.push([ar.dup, cost+Y])
    end
    ar[i-1] = a
    ar[j-1] = b    
  end
end

puts result