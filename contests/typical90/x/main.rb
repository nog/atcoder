N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

k = 0
N.times do |i|
  k += (A[i] - B[i]).abs
end

if k > K
  puts "No"
elsif (K - k).odd?
  puts "No"
else
  puts 'Yes'
end