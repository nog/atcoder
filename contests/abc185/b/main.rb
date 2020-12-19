N, M, T = gets.split.map(&:to_i)
A = Array.new M 
B = Array.new M 
M.times do |i|
    A[i], B[i] = gets.split.map(&:to_i)
end

n = N
current = 0
M.times do |i|
    n -= A[i] - current
    if n <= 0
        puts 'No'
        exit
    end
    n += B[i] - A[i]
    if n > N
        n = N
    end
    current = B[i]
end

if n > T - current
    puts 'Yes'
else
    puts 'No'
end