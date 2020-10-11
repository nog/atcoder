N, Q = gets.split.map(&:to_i)
S = [1] * N
MOD = 998244353
first = 0

pow10= Array.new N-1
pow10[0] = 1
1.upto(N-1) do |i|
    pow10[i] = pow10[i-1] * 10 % MOD
end
N.times do |i|
    first = (first + (1 * pow10[N-1-i])) % MOD
end

Q.times do |i|
    l, r, d = gets.split.map(&:to_i)
    l = l-1
    r = r-1
    l.upto(r) do |x|
        diff = d - S[x]
        first = (first + (diff * pow10[N-1-x])) % MOD
        S[x] = d
    end
    puts first
end