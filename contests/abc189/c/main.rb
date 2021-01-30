N = gets.to_i
A = gets.split.map(&:to_i)

result = 0
0.upto(N-1) do |l|
    x = A[l]
    l.upto(N-1) do |r|
        a = A[r]
        x = a if a < x
        ans =  (r-l+1) * x
        if ans > result
            result = ans
        end
    end
end

puts result