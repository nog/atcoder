k, n = gets.split.map(&:to_i)
a = gets.split.map(&:to_i)

max = 0
sum = 0
1.upto(n-1) do |i|
  aa = a[i] - a[i-1]
  sum += aa
  max = aa if aa > max
end
aa = a[0] + k - a[-1]
max = aa if aa > max


puts k - max