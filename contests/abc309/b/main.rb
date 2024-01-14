N = gets.to_i
A = []
N.times do 
    A.push gets.chomp.split('').map(&:to_i)
end
lpop = nil

# warn A.inspect
(N-1).times do |i|
    A[i].unshift(A[i+1].shift)
    pop = A[i].pop
    if lpop
        A[i].push(lpop)
    end
    lpop = pop
end
A[-1].push(lpop)

N.times do |i|
    puts A[i].join('')
end