N, M, K = gets.split.map(&:to_i)
MOD =998244353
result = 0

if N == 1
    result = K.pow(M, MOD)
elsif M==1
    result = K.pow(N, MOD)
else
    1.upto(K) do |amax|
        apat = 1
        if amax != 1
            apat = ( amax.pow(N, MOD) - (amax-1).pow(N, MOD)) % MOD
        end
        bpat = (K - amax+1).pow(M, MOD)
        result = (result + (apat * bpat)) % MOD
    end
end

puts result % MOD