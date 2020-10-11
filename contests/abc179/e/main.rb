N, X, M = gets.split.map(&:to_i)

if N == 1
    puts X
    exit
end

puts X ** (2**N - 1) % M