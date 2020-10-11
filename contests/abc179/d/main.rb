N, K = gets.split.map(&:to_i)
LR = Array.new K
K.times do |i|
    LR[i] = gets.split.map(&:to_i)
end
LRS = LR.sort_by{|x| x[0]}
MOD=998244353


dp = Array.new N+1
dpSum = Array.new N+1
dp[0] = 0
dp[1] = 1
dpSum[0] = 0
dpSum[1] = 1
2.upto(N) do |n|
    cnt = 0
    LRS.each do |lr|
        l = lr[0]
        break if l > n
        r = lr[1]
        if r > n - 1
            r = n - 1
        end
        if l == r
            cnt += dp[n-l]
        else
            cnt += dpSum[n-l] - dpSum[n-r-1]
        end
    end
    dp[n] = cnt % MOD
    dpSum[n] = (dpSum[n-1] + cnt) % MOD
end

puts dp[N] % MOD