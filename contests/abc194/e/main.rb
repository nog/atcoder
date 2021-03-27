N, M = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

hash = Hash.new 0
M.times do |i|
    a = A[i]
    hash[a] += 1
end

result = M
0.upto(M) do |i|
    if hash[i] == 0
        result = i
        break
    end
end

1.upto(N-M) do |i|
    num_out = A[i-1]
    num_in = A[i-1+M]

    hash[num_out] -= 1
    hash[num_in] += 1
    if num_out <= result && hash[num_out] == 0
        result = num_out
        # 0.upto(result-1) do |i|
        #     if hash[i] == 0
        #         result = i
        #         break
        #     end
        # end
    end
end

puts result