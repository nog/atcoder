H, W = gets.split.map(&:to_i)

A = Array.new H 
min = 200
sum = 0
H.times do |i|
    a = gets.split.map(&:to_i)
    min = [min, a.min].min
    sum += a.sum
    A[i] = a
end

puts sum - (H * W * min)