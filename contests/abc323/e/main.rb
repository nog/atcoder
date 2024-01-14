N, X = gets.split.map(&:to_i)
T = gets.split.map(&:to_i)
MOD = 998244353

hash = {}
hash[0] = 1
result = 0

invx = N.pow(MOD-2, MOD)

(X+1).times do |x|
    next unless hash[x]
    h = hash[x]
    ne = h * invx % MOD
    T.each.with_index do |t, i|
        qq = x + t
        if qq > X
            if  i == 0
                result = result + ne % MOD
            end
        else
            if !hash[qq]
                hash[qq] ||= 0
            end
            hash[qq] += ne
        end
    end
end
puts result % MOD