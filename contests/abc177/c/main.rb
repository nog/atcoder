N = gets.to_i
A = gets.split.map(&:to_i)
MOD = 10**9 + 7

sum = 0
A.each do |a|
    sum = (sum + a) % MOD
end

result = 0
A.each do |a|
    sum -= a
    if sum < 0
        sum = sum + MOD
    end
    result += a * sum
    result = result % MOD
end

puts result