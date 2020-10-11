S = gets.to_i
MOD = 10**9+7

ar = [0,0,0,1]
sum = [0,0,0,1]
if S < 3
    puts 0
    exit
elsif S == 3
    puts 1
    exit
end

4.upto(S) do |i|
    ar[i] = (1 + sum[i-3]) % MOD
    sum[i] = (sum[i-1] + ar[i]) % MOD
end

puts ar[S]