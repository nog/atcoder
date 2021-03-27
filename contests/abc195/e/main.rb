N = gets.to_i
S = gets.chomp
X = gets.chomp
#7, 14, 21, 28, 35, 42, 49, 56, 63
#1,2,3,4,5,6,7,8,9

@cache = Array.new(N+1){ Array.new(7) }
@p = Array.new(N+1)

def f(i, mod)
    return @cache[i][mod] if @cache[i][mod] != nil
    @cache[i][mod] = _f(i, mod)
end

def _f(i, mod)
    return mod == 0 if i == N

    if X[i] == 'T'
        return true if f(i+1, (mod + (S[i].to_i * @p[N-i-1])) % 7)
        return true if f(i+1, mod)
        return false
    else
        return false unless f(i+1, (mod + (S[i].to_i * @p[N-i-1]))% 7)
        return false unless f(i+1, mod)
        return true
    end
end

@p[0] = 1
1.upto(N) do |i|
    @p[i]  = (@p[i-1] * 10) % 7
end

result = f(0,0)
# warn @cache.inspect
# warn @p.inspect
puts result ? 'Takahashi' : 'Aoki'