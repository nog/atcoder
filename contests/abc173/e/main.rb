N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
MOD = 10**9 + 7

plus_a = []
minus_a = []
zero_count = 0
A.each do |a|
    if a == 0
        zero_count += 1
    elsif a > 0
        plus_a.push a
    else
        minus_a.push a
    end
end

plus_a = plus_a.sort.reverse
minus_a = minus_a.sort

if plus_a.size + minus_a.size < K
    puts 0
    exit
end

result = 1

if plus_a.size == 0
    if zero_count > 0
        puts 0
        exit
    end
    minus_a.reverse!
    K.times do |i|
        result = result * minus_a[i] % MOD
    end
    puts result
    exit
end

plus_list = []
minus_list = []
k = K
while k > 0 do
    if minus_a.size == 0
        plus_list.push plus_a.shift
    elsif plus_a.size == 0
        minus_list.push minus_a.shift
    elsif plus_a[0] + minus_a[0] > 0
        plus_list.push plus_a.shift
    else
        minus_list.push minus_a.shift
    end
    k -= 1
end
ex_minus_list = []
ex_plus_list = []
if minus_list.size % 2 != 0
    if plus_a.size == 0 && minus_a.size == 0
        puts 0
        exit
    elsif minus_a.size == 0 || plus_list.size == 0
        minus_list.pop
        plus_list.push plus_a.shift
    elsif plus_a.size == 0 || minus_list.size == 0
        plus_list.pop
        minus_list.push minus_a.shift
    else
        ex_minus_list = [minus_list.pop, minus_a[0]]
        ex_plus_list = [plus_list.pop, plus_a[0]]
    end
end

plus_list.each do |x|
    result = result * x % MOD
end

minus_list.each do |x|
    result = result * x % MOD
end

if ex_minus_list.size > 0
    pat_a = result * ex_minus_list[0] * ex_minus_list[1]
    pat_b = result * ex_plus_list[0] * ex_plus_list[1]
    if pat_a > pat_b
        puts pat_a % MOD
    else
        puts pat_b % MOD
    end
else
    puts result % MOD
end
