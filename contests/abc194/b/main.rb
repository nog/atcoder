N = gets.to_i
A = Array.new N 
B = Array.new N
min_a_i = 0
min_b_i = 0
N.times do |i|
    a, b = gets.split.map(&:to_i)
    A[i], B[i] = a, b
    min_a_i = i if a < A[min_a_i]
    min_b_i = i if b < B[min_b_i]
end

if min_a_i != min_b_i
    puts A[min_a_i] > B[min_b_i] ? A[min_a_i] : B[min_b_i]
    exit
end

ab = A[min_a_i] + B[min_b_i]
sec_a = A.sort[1]
sec_b = B.sort[1]

if ab < sec_a && ab < sec_b
    puts ab
    exit
end


pat_a = A[min_a_i] > sec_b ? A[min_a_i] : sec_b
pat_b = B[min_b_i] > sec_a ? B[min_b_i] : sec_a
puts pat_a > pat_b ? pat_b : pat_a