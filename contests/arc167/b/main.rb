A, B = gets.split.map(&:to_i)
MOD = 998244353

if B == 0
    puts A == 0 ? 1 : 0
    exit
end

require 'prime'
factors = A.prime_division
facc = factors.inject(1){|a, x| a * ((x[1] * B)+ 1)}
warn "facc:#{facc}"
if facc.even? || B == 1
    puts B * ( facc / 2) % MOD
    exit
end

puts ((B * ( facc / 2)) + B / 2 ) % MOD