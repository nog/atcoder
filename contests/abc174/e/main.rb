N, K = gets.split.map(&:to_i)
A = gets.split.map(&:to_i)
a = A.sort

n = N
max = a[-1]

res =  (1..max).bsearch do |d|
    c = 0
    failed = false
    a.each do |x|
        next if x <= d
        c += (x.to_f / d).floor
        if c > K
            failed = true
            break
        end
    end
    if failed
        false
    else
        true
    end
end
puts res