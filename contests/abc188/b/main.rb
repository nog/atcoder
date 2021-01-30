N = gets.to_i
A = gets.split.map(&:to_i)
B = gets.split.map(&:to_i)

res = 0
N.times do |i|
    res += A[i] * B[i]
end

if res == 0
    puts 'Yes'
else
    puts 'No'
end