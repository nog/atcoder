N, M = gets.split.map(&:to_i)
MOD =998244353

@cache = Hash.new{ Hash.new }

def f n, m
    @cache[n][m] ||= _f(n, m)
end

def _f n, m
    return 1 if n == 1
    return n if m == 1
    result = 1
    1 + f(n-1, m-1) + f(n-1, m-2)
end

puts f(N, M)