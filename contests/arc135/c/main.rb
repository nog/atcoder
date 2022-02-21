N = gets.to_i
A = gets.split.map(&:to_i)

result = A.sum
max = A.max
k = 0
while(2.pow(k+1)<=max) do
  k += 1
end

sums = Array.new k+1, 0
(k+1).times do |i|
  A.each do |a|
    sums[i] += 1 if a[i] == 1
  end
end
A.each do |a|
  r = 0
  (k+1).times do |i|
    cnt = (a[i] == 0) ? sums[i] : N - sums[i]
    r += 2.pow(i) * cnt
  end
  result = r if r > result
end

puts result