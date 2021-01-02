T = gets.to_i

T.times do |t|
    n, s, k = gets.split.map(&:to_i)
    if (n - s) % k == 0
        puts (n - s) / k
        next
    end
    if s % n.gcd(k) == 0
        puts -1
        next
    end
    res = 0
    diff = k * (n / k + 1) % n
    1.upto(100000) do |i|
        ue = n * i - s
        next if ue % k != 0
        res = ue / k
        break
    end
    puts res
end