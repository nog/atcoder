N, M, K = gets.split.map(&:to_i)
MOD = 10**9+7

def calc_fact(n)
    @finv = []
    @inv  = []
    @fact = []
    @finv[0] = @finv[1] = @inv[0] = @inv[1] = @fact[0] = @fact[1] = 1
    i = 2
    bfinv = 1
    while(i<=n) do
        @fact << @fact[-1] * i % MOD
        @inv  << inv   = @inv[MOD % i] * (MOD - MOD / i) % MOD
        @finv << bfinv = bfinv * inv % MOD
        i+=1
    end
end

def nCk(n, k)
    return 0 if k < 0 || k > n
    return 1 if k == 0 || k == n
    @fact[n] * ((@finv[k] * @finv[n-k]) % MOD) % MOD
end
calc_fact(2*(10**6))

if N > M + K
    puts 0
else
    result = (nCk(N+M, N) - nCk(N+M, M + K + 1)) % MOD
    puts result
end