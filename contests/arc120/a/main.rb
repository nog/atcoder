N = gets.to_i
A = gets.split.map(&:to_i)

sum = 0
sumsum = 0
max = 0
N.times do |k|
    a = A[k]
    max = a if a > max
    sum += a
    warn "max:#{max} sum:#{sum} a:#{a}"
    puts ( sum  + (max * (k+1)) + sumsum)
    sumsum += sum
end