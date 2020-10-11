N = gets.to_i
MOD = 10**9+7

if N == 1
    puts 0
    exit
end

def modpow x, n
    res = 1
    while n > 0 do
        if n.odd?
            res = (res * x) % MOD
        end
        x = (x * x) % MOD
        n /= 2
    end
    return res
end

res = modpow(10, N) + modpow(8,N) - ( 2 * modpow(9,N) )

puts res % MOD