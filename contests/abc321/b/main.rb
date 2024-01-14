N, X = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

0.upto(100).each do |x|
    A.push(x)
    score = A.sum - A.max - A.min
    if score >= X
        puts x
        exit
    end

    A.pop
end

puts -1