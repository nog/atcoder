N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)

sum_list = Array.new(N + 1){ Array.new(N + 1){ Array.new(K+1)}}

MOD = 998244353

1.upto(K) do |x|
    result = 0
    1.upto(N-1) do |l|
        (l+1).upto(N) do |r|
            sum_list[l][r][1] ||= (A[l-1] + A[r-1]) % MOD
            sum_list[l][r][x] = (sum_list[l][r][x-1] * sum_list[l][r][1] ) % MOD if x > 1
            result = (result + sum_list[l][r][x]) % MOD
        end
    end

    puts result
end