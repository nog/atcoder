N = gets.to_i
AT = Array.new N 

max = 10**9
middle = 0
min = -10**9
N.times do |i|
    a, t = AT[i] = gets.split.map(&:to_i)
    if t == 1
        middle += a 
        max += a
        min += a
    elsif t == 2
        max = a if a > max
        min = a if a > min
    elsif t == 3
        max = a if a < max
        min = a if a < min
    else
        raise
    end
end
Q = gets.to_i
X = gets.split.map(&:to_i)

Q.times do |q|
    x = X[q]
    res = x + middle
    if max < res
        puts max
    elsif min > res
        puts min
    else
        puts res
    end
end