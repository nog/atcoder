N = gets.to_i

sums1 = Array.new N+1, 0
sums2 = Array.new N+1, 0
N.times do |i|
  c, ten = gets.split.map(&:to_i)
  if c == 1
    sums1[i+1] = sums1[i] + ten
    sums2[i+1] = sums2[i]
  elsif c == 2
    sums1[i+1] = sums1[i]
    sums2[i+1] = sums2[i] + ten
  else
    raise
  end
end

Q = gets.to_i
Q.times do |i|
  l, r = gets.split.map(&:to_i)
  res1 = sums1[r] - sums1[l-1]
  res2 = sums2[r] - sums2[l-1]
  puts "#{res1} #{res2}"
end